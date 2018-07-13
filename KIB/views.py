import sys,os
import datetime

from django.shortcuts import render
from django.http import HttpResponseRedirect, HttpResponse
from django.template import Template, Context
from django.template.context_processors import csrf
#from django.views import View
from django.views.generic import View
from django.core import serializers

###
from ProblemsApp.views import *
from StudentsApp.views import *
###
###

import json

# sympy
import sympy
from sympy.abc import x,y,z,a,b,c,f,t,k,n
from sympy import Eq, simplify, exp, cos, sin, Ne

# latex2sympy
sys.path.append('/Users/kvarela/sw/latex2sympy/')
sys.path.append('C:\\Users\\felipe\\Desktop\\Projects and studying\\KIB Platform') 
sys.path.append('C:\\Users\\felipe\\Desktop\\Projects and studying\\KIB Platform\\latex2sympy')

from latex2sympy.process_latex import process_sympy

def hello(request):
	return HttpResponse("Hello world")

def current_datetime(request):
	now = datetime.datetime.now()
	html = "<html><body>It is now %s.</body></html>" % now
	return HttpResponse(html)

#NOTE: Generic views is an option to call the DB form the template.

class SymbolConstructor:
	#TO DO: Define this automatically from the beginning of the problem.
	#Database with symbols based on the problems???
	def __init__(self,symbols):
		self.symbol = []
		for symbol in symbols:
			self.symbol.append(sympy.Symbol(symbol))

class TemplateProcess(View):
	def __init__(self,topic_input='EQ-LINE',p_name_input='Problem 13'):
		#This will be read from the URL.			
		self.topic_id_in = topic_input
		self.problem_name_in = p_name_input
		#Loading problem using the constructor to call the problem db. 
		self.prob_cons = ProblemConstructor(self.topic_id_in,self.problem_name_in)
		#This number is read from the count method. Here I just use the Problem db.
		self.num_steps = self.prob_cons.prob_in.number_of_steps
		
	#This function is the one that loads and fills the problems is incomplete as it does not fill the number of steps and problem text yet see opp13.html#  
	def get(self, request, *args, **kwargs):  
		
		#CHECK : What is a???
		steps_a=list(range(0,self.num_steps+1))
		exercise_title=self.problem_name_in	
			
		c={"exercise_title":exercise_title,"exercise_text":self.prob_cons.prob_in.text,"num_steps":self.num_steps, "steps_a":steps_a}
		return render(request, 'opp13.html',c)

class DataAjax(TemplateProcess):
	def __init__(self):
		TemplateProcess.__init__(self)
		#TO DO: All the input from the student will be saved into a .txt file. 
		#Read student answer
		self.student_cons = StudentConstructor('1')
		#student problem db.
		self.student_prob = StudentProblemCons(self.student_cons.student_cons,self.prob_cons.prob_in)

	#Method to process the ajax. step_ajax!!!
	#Why do we need this ajax?? The steps are send randomly!
	def get(self, request, *args, **kwargs):
		#NOTE: This is sending three numbers!!! I need the actual step!
		#The step number 4 is not even sended with the ajax. It does not enter this function anymore.
		step_number = json.loads(request.GET['step_number'])
		s_name='Step '+str(step_number)
		#getting the data from the steps database
		datax=StepConstructor(s_name,self.prob_cons.prob_in).data
		print("procesando el paso")
		return HttpResponse(datax, content_type='application/json')

## New class to send data to the app for the teacher's to fill in data
class DataTeacherFillSubject(View):
	def __init__(self,subject_id_in='All'):
		self.subject_cons = SubjectConstructor(subject_id_in)
		self.datax = []
	def get(self, request, *args, **kwargs):
		for i in range(len(self.subject_cons)):
			self.datax.append(self.subject_cons[i].subject_id)
		return HttpResponse(self.datax, content_type='application/json')

class DataTeacherFillTopic(DataTeacherFillSubject):
	def __init__(self,subject_id_in='All',topic_id_in='All'):
		DataTeacherFillSubject.__init__(self)
		self.topic_in = topic_id_in
		self.datax = []
	def get(self, request, *args, **kwargs):
		for i in range(len(self.subject_cons)):
			self.datax.append(TopicConstructor(topic_id_in = self.topic_in, subject_id_in=self.subject_cons[i].subject_id).topic_id)
		return HttpResponse(self.datax, content_type='application/json')

### Asign problem to other subject.

# ------- HERE -------

####

class DataProcess(DataAjax):
	def __init__(self):
		DataAjax.__init__(self)
		self.data = False

	#Process method. Here the student answer is processed.
	def post(self, request, *args, **kwargs):
		#Definition of the symbols to be used within sympy.
		symbols = ['theta','x_1','x_2','y_2','y_1']
		symbol_output = SymbolConstructor(symbols)
		
		#Read student answer
		step_number = json.loads(request.POST['step_number'])
		s_name='Step ' + str(step_number)
		print("\n \n entre aqui2  \n\n")
		#reading student answer and cleaning it.
		student_ans = CleanStudentAns(json.loads(request.POST['student_answer']))
		#getting the data from the steps database
		datae=StepConstructor(s_name,self.prob_cons.prob_in).step_base
		
		#creating the step_student db.
		step_student = StudentStepCons(self.student_prob.p_student,datae)
		
		#Compare student answer with db answer.
		for i in range(0,len(student_ans.data_st)):
			data_est=student_ans.data_st[i]
			for j in range(0,datae.number_of_substeps):
				sub_name = 'Substep ' + str(j+1)
				data_sol=SubstepConstructor(datae,sub_name)

				for s in ['\\left','\\right']:
					data_est_s=data_est.replace(s,'')
					data_sol_s=data_sol.substep_base.answer.replace(s,'')

				data_est_sympy=process_sympy(data_est_s)
				data_sol_sympy=process_sympy(data_sol_s)

				data_sol_sympy=str(data_sol_sympy).replace('{1}','1')
				data_sol_sympy=sympy.simplify(data_sol_sympy.replace('{2}','2'))

				data_est_sympy=str(data_est_sympy).replace('{1}','1')
				data_est_sympy=sympy.simplify(data_est_sympy.replace('{2}','2'))

				data_sim=sympy.simplify(data_est_sympy-data_sol_sympy)
				
				#TO DO: Change this so each substep of the student has to be OK.
				if data_sim == 0:
					self.data = True
					break

				if data_sim != 0:
					self.data = False
					i_temp = i + 1
		
			datax = json.dumps(self.data)
			
			return HttpResponse(datax, content_type='application/json');
		else:
			return HttpResponse("Lo estas llamando malito");


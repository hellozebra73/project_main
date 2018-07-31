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
#TO DO: NUEVA VERSION INCLUYE LATEX2SYMPY.
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
	def __init__(self,topic_input='EQ_LINE',p_id_input=1, numeral_in=1, problem_name_in = 'Problem 13'):
		#This will be read from the URL.			
		self.topic_id_in = topic_input
		self.problem_id = p_id_input
		self.numeral = numeral_in
		self.problem_name = problem_name_in
		#Loading problem using the constructor to call the problem db. 
		self.prob_cons = ProblemConstructor(self.topic_id_in,self.problem_id)
		self.prob_cons = self.prob_cons.ProblemExist()
		#This number is read from the count method. Here I just use the Problem db.
		self.num_numerals = self.prob_cons.number_of_numeral
		#Loading numeral using the constructor to call the problem db. 
		self.prob_numeral_cons = ProblemNumeralConstructor(problem_id_in = self.prob_cons, numeral_number_in = self.numeral)
		self.prob_numeral_cons = self.prob_numeral_cons.ProblemNumeralExist()
		#This number is read from the count method. Here I just use the numeral db.
		self.num_steps = self.prob_numeral_cons.number_of_steps
		
	#This function is the one that loads and fills the problems is incomplete as it does not fill the number of steps and problem text yet see opp13.html#  
	def get(self, request, *args, **kwargs):  
		
		#CHECK : What is a???
		#TO DO: # numerals
		steps_a=list(range(0,self.num_steps+1))
		exercise_title=self.problem_name	
			
		c={"exercise_title":exercise_title,"exercise_text":self.prob_cons.text,"num_steps":self.num_steps, "steps_a":steps_a}
		return render(request, 'opp13.html',c)

#####
class DataAjaxNumeral(TemplateProcess):
	def __init__(self):
		TemplateProcess.__init__(self)
		#TO DO: All the input from the student will be saved into a .txt file. 
		#Read student answer
		self.student_cons = StudentConstructor('1')
		self.student_cons = self.student_cons.StudentExist()
		#student problem db.
		self.student_prob = StudentProblemCons(self.student_cons,self.prob_cons)
		self.student_prob = self.student_prob.StudentProblemExist()
	#Method to process the ajax. step_ajax!!!
	#Why do we need this ajax?? The steps are send randomly!
	def get(self, request, *args, **kwargs):
		#NOTE: This is sending three numbers!!! I need the actual step!
		#The step number 4 is not even sended with the ajax. It does not enter this function anymore.
		numeral_number = 1 #json.loads(request.GET['numeral_number'])
		#getting the data from the steps database
		datax=ProblemNumeralConstructor(self.prob_cons,numeral_number_in = numeral_number)
		datax=datax.ProblemNumeralExist()
		return HttpResponse(datax, content_type='application/json')

#This is DataAjaxStep
class DataAjaxStep(TemplateProcess):
	def __init__(self):
		TemplateProcess.__init__(self)
		#TO DO: All the input from the student will be saved into a .txt file. 
		#Read student answer
		self.student_cons = StudentConstructor('1')
		self.student_cons = self.student_cons.StudentExist()
		#student problem db.
		self.student_prob = StudentProblemCons(self.student_cons,self.prob_cons)
		self.student_prob = self.student_prob.StudentProblemExist()
	#Method to process the ajax. step_ajax!!!
	#Why do we need this ajax?? The steps are send randomly!
	def get(self, request, *args, **kwargs):
		#NOTE: This is sending three numbers!!! I need the actual step!
		#The step number 4 is not even sended with the ajax. It does not enter this function anymore.
		numeral_number = 1 #json.loads(request.GET['numeral_number'])
		step_number = json.loads(request.GET['step_number'])
		#getting the data from the steps database
		datax=StepConstructor(s_number=step_number,prob_num_in=self.prob_numeral_cons)
		datax=datax.StepExist()
		return HttpResponse(datax, content_type='application/json')

class DataProcess(DataAjaxNumeral,DataAjaxStep):
	def __init__(self):
		DataAjaxNumeral.__init__(self)
		DataAjaxStep.__init__(self)
		self.data = False

	#Process method. Here the student answer is processed.
	def post(self, request, *args, **kwargs):
		#Definition of the symbols to be used within sympy.
		symbols = ['theta','x_1','x_2','y_2','y_1']
		symbol_output = SymbolConstructor(symbols)
		#Read student answer
		numeral_number = 1 #json.loads(request.GET['numeral_number'])

		option = 'Step by step' #json.loads(request.GET['option'])
		if option == 'Step by step':
			step_number = json.loads(request.POST['step_number'])
			s_name = 'Step ' + str(step_number)
			#reading student answer and cleaning it.
			student_ans = CleanStudentAns(json.loads(request.POST['student_answer']))
			#getting the data from the steps database
			datae = StepConstructor(s_number=step_number, prob_num_in=self.prob_numeral_cons)
			datae = datae.StepExist()
			#creating the step_student db.
			student_step_cons = StudentStepCons(self.student_prob, self.prob_numeral_cons, datae)

			#Compare student answer with db answer.
			for i in range(0,len(student_ans.data_st)):
				data_est=student_ans.data_st[i]
				for j in range(0,datae.number_of_substeps):
					data_sol=SubstepConstructor(step_id_in = datae, sub_number_in= j)
					for s in ['\\left','\\right']:
						data_est_s = data_est.replace(s,'')
						data_sol_s = data_sol.SubstepExist()
						data_sol_s = data_sol_s.answer.replace(s,'')

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

		elif option == 'All numeral':
			#number of steps per numeral.
			#just numeral by numeral.
			for i in range(self.num_numerals):
				#reading student answer and cleaning it.
				student_ans = CleanStudentAns(json.loads(request.POST['student_answer']))
				#getting the data from the steps database
				datae = StepConstructor(s_number = i, prob_num_in = self.prob_numeral_cons)
				datae = datae.StepExist()
				#creating the step_student db.
				student_step_cons = StudentStepCons(self.student_prob, self.prob_numeral_cons, datae)

				#Compare student answer with db answer.
				#TO DO: Review how the data is been added to the final answer.
				for i in range(0,len(student_ans.data_st)):
					data_est=student_ans.data_st[i]
					for j in range(0,datae.number_of_substeps):
						data_sol=SubstepConstructor(step_id_in = datae, sub_number_in= j)
						for s in ['\\left','\\right']:
							data_est_s = data_est.replace(s,'')
							data_sol_s = data_sol.SubstepExist()
							data_sol_s = data_sol_s.answer.replace(s,'')

						data_est_sympy = process_sympy(data_est_s)
						data_sol_sympy = process_sympy(data_sol_s)

						data_sol_sympy = str(data_sol_sympy).replace('{1}','1')
						data_sol_sympy = sympy.simplify(data_sol_sympy.replace('{2}','2'))

						data_est_sympy = str(data_est_sympy).replace('{1}','1')
						data_est_sympy = sympy.simplify(data_est_sympy.replace('{2}','2'))

						data_sim = sympy.simplify(data_est_sympy-data_sol_sympy)
						
						#TO DO: Change this so each substep of the student has to be OK.
						if data_sim == 0:
							self.data = True
							break

						if data_sim != 0:
							self.data = False
							i_temp = i + 1
				
					datax = json.dumps(self.data)
					
					return HttpResponse(datax, content_type = 'application/json');
				else:
					return HttpResponse("Lo estas llamando malito");


from django.shortcuts import render

# Create your views here.
# Students.

from django.http import HttpResponseRedirect
from django.http import HttpResponse
from django.template import Template, Context
from django.template.context_processors import csrf
#from django.views import View
from django.views.generic import View
from django.core import serializers

import json
import sys,os



class CleanStudentAns:
	def __init__(self,student_ans_in):
		self.data_st = []
		for i in range(len(student_ans_in)):
			student_ans_2 = student_ans_in[i].split('=')
			if len(student_ans_2) > 2:
				for i in range(1,len(student_ans_2)):
					self.data_st.append(student_ans_2[0] + '=' + student_ans_2[i])
			else:
				self.data_st=student_ans_in
				
class StudentConstructor:
	#Definition of the student id. Temporarily it is a surrogate key.
	#TO DO: Define this as a method. This must go on the login part. We could do it as a form meanwhile.
	#This might change to use the user name or something similar.
	def __init__(self,student_id_in):
		self.student_id = student_id_in
		try:
			self.student_cons = Student.objects.get(id=self.student_id)
		except:
			self.student_cons = 'None'
	#check if the user exists.	
	def StudentExist(self):
		if self.student_cons == 'None':
			return HttpResponse('The substep does not exist.')
		else:
			return self.student_cons

class StudentProblemCons:
	def __init__(self,st_id,prob_id):
		try:
			self.p_student = StudentProblem.objects.get(student_id = st_id, problem_id = prob_id)
			tries = self.p_student.succesful_attemps + 1
			StudentProblem.objects.filter(student_id = st_id,problem_id = prob_id).update(succesful_attemps=tries)
		except:
			StudentProblem.objects.create(
				student_id = st_id,
				problem_id = prob_id,
			)
			self.p_student = StudentProblem.objects.get(student_id = p_student_id,problem_id = prob_id)

class StudentStepCons:
	def __init__(self,p_st_id,numeral_id_in,step_id_in):
		try:
			self.step_st = StudentStep.objects.get(problem_student_id=p_st_id, numeral_id=numeral_id_in, step_id=step_id_in)
			tries = self.step_st.succesful_attemps + 1
			StudentStep.objects.filter(problem_student_id=p_st_id, numeral_id=numeral_id_in, step_id=step_id_in).update(succesful_attemps=tries)
		except:
			StudentNewStep.objects.create(
				problem_student_id=p_st_id,
				numeral_id=numeral_id_in,
				step_id=step_id_in,
			)
			self.step_st = StudentStep.objects.get(problem_student_id=p_st_id, numeral_id=numeral_id_in, step_id=step_id_in)


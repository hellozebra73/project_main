# Create your views here.
# Students.

from django.http import HttpResponse
from StudentsApp.models import *

# sympy
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
	def __init__(self, student_id_in = 'None'):
		try:
			self.student_cons = Student.objects.get(id=student_id_in)
		except:
			self.student_cons =  'None'
	#check if the user exists.	
	def StudentExist(self):
		if self.student_cons == 'None':
			return HttpResponse('The student does not exist.')
		else:
			return self.student_cons

class StudentProblemCons:
	def __init__(self, st_id = 'None', prob_id = 'None'):
		try:
			self.p_student = StudentProblem.objects.get(student_id = st_id, problem_id = prob_id)
			tries = self.p_student.succesful_attemps + 1
			StudentProblem.objects.filter(student_id = st_id,problem_id = prob_id).update(succesful_attemps=tries)
		except:
			StudentProblem.objects.create(
				student_id = st_id,
				problem_id = prob_id,
				succesful_attemps = 0,
			)
			self.p_student = StudentProblem.objects.get(student_id = st_id,problem_id = prob_id)
	def StudentProblemExist(self):
		if self.p_student == 'None':
			return HttpResponse('The substep does not exist.')
		else:
			return self.p_student


class StudentStepCons:
	def __init__(self,p_st_id = 'None', numeral_id_in = 'None' ,step_id_in = 'None'):
		try:
			self.step_st = StudentStep.objects.get(problem_student_id=p_st_id, numeral_id=numeral_id_in, step_id=step_id_in)
			tries = self.step_st.succesful_attemps + 1
			StudentStep.objects.filter(problem_student_id=p_st_id, numeral_id=numeral_id_in, step_id=step_id_in).update(succesful_attemps=tries)
		except:
			StudentStep.objects.create(
				problem_student_id=p_st_id,
				numeral_id=numeral_id_in,
				step_id=step_id_in,
			)
			self.step_st = StudentStep.objects.get(problem_student_id=p_st_id, numeral_id=numeral_id_in, step_id=step_id_in)
	def StudentStepConsExist(self):
		if self.step_st == 'None':
			return HttpResponse('The substep does not exist.')
		else:
			return self.step_st







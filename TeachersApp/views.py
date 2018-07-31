
import sys,os
from django.http import HttpResponseRedirect, HttpResponse
from TeachersApp.models import *

#Constructors to call each one of the databases.
class StudentConstructor:
	#Definition of the student id. Temporarily it is a surrogate key.
	#TO DO: Define this as a method. This must go on the login part. We could do it as a form meanwhile.
	#This might change to use the user name or something similar.
	def __init__(self, teacher_id_in = 'None'):
		try:
			self.teacher_cons = Teacher.objects.get(id=teacher_id_in)
		except:
			self.teacher_cons =  'None'
	#check if the user exists.	
	def StudentExist(self):
		if self.teacher_cons == 'None':
			return HttpResponse('The teacher does not exist.')
		else:
			return self.student_cons

class TeacherProblemCons:
	def __init__(self, t_id = 'None', prob_id = 'None'):
		self.teacher = Teacher.objects.get(teacher_id = t_id)
		try:
			self.p_teacher = TeacherProblem.objects.get(teacher_id = t_id, problem_id = prob_id)
			number_of_problems = self.teacher.number_input_problems + 1
			Teacher.objects.filter(teacher_id = t_id).update(number_input_problems=number_of_problems)
		except:
			TeacherProblem.objects.create(
				teacher_id = t_id,
				problem_id = prob_id,
			)
			self.p_teacher = TeacherProblem.objects.get(teacher_id = t_id, problem_id = prob_id)
			Teacher.objects.filter(teacher_id = t_id).update(number_input_problems=number_of_problems)
	def StudentProblemExist(self):
		if self.p_student == 'None':
			return HttpResponse('The teacher problem does not exist.')
		else:
			return self.p_teacher

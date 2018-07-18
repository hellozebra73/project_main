
import sys,os
from django.http import HttpResponseRedirect, HttpResponse
from ProblemsApp.models import *

#Constructors to call each one of the databases.
class ProblemConstructor:
    def __init__(self, topic_id_in='None', problem_id='None'): 
    	#Call to the db Problem.
    	try:
    		if topic_id_in != 'None' and problem_id == 'None':
    			self.prob_in = Problem.objects.filter(topic_id=topic_id_in)
    		elif topic_id_in == 'None' and problem_id != 'None':
    			self.prob_in = Problem.objects.filter(id=problem_id)
    		elif topic_id_in != 'None' and problem_id != 'None':
    			self.prob_in = Problem.objects.get(topic_id=topic_id_in, id=problem_id)
    	except:
    		self.prob_in = 'None'
    def ProblemExist(self):
    	if self.prob_in == 'None':
    		return HttpResponse('The problem does not exist.')
    	else:
    		return self.prob_in

class ProblemNumeralConstructor:
	#Here problem id is the object of the problem NOT just the id.
    def __init__(self, problem_id_in = 'None', numeral_number_in = 'None'): 
    	#Call to the db ProblemNumeral.
    	try:
    		if problem_id_in != 'None' and numeral_number_in == 'None':
    			self.prob_num_in = ProblemNumeral.objects.filter(problem_id=problem_id_in)
    		elif problem_id_in == 'None' and numeral_number_in != 'None':
    			self.prob_num_in = ProblemNumeral.objects.filter(numeral_number=numeral_number_in)
    		elif problem_id_in != 'None' and numeral_number_in != 'None':
    			self.prob_num_in = ProblemNumeral.objects.get(problem_id=problem_id_in, numeral_number=numeral_number_in)
    	except:
    		self.prob_num_in = 'None'
    def ProblemNumeralExist(self):
    	if self.prob_num_in == 'None':
    		return HttpResponse('The problem numeral does not exist.')
    	else:
    		return self.prob_num_in

class StepConstructor:
    def __init__(self, s_number = 'None', prob_num_in = 'None'):
    	try:
    		if s_number != 'None' and prob_num_in == 'None':
    			self.step_base = Step.objects.filter(step_number=s_number)
    		elif s_number == 'None' and prob_num_in != 'None':
    			self.step_base = Step.objects.filter(problem_num_id=prob_num_in)
    		elif s_number != 'None' and prob_num_in != 'None':
    			self.step_base = Step.objects.get(step_number=s_number, problem_num_id=prob_num_in)
    	except:
    		self.step_base = 'None'
    def StepExist(self):
    	if self.step_base == 'None':
    		return HttpResponse('The step does not exist.')
    	else:
    		return self.step_base

class SubstepConstructor:
    def __init__(self, step_id_in= 'None', sub_number_in= 'None'):
    	try:
    		if step_id_in != 'None' and sub_number_in == 'None':
    			self.substep_base = Substep.objects.filter(step_id=step_id_in)
    		elif step_id_in == 'None' and sub_number_in != 'None':
    			self.substep_base = Substep.objects.filter(substep_number=sub_number_in)
    		elif step_id_in != 'None' and sub_number_in != 'None':
    			self.substep_base = Substep.objects.get(step_id=step_id_in, substep_number=sub_number_in)
    	except:
    		self.substep_base = 'None'
    def SubstepExist(self):
    	if self.substep_base == 'None':
    		return HttpResponse('The substep does not exist.')
    	else:
    		return self.substep_base




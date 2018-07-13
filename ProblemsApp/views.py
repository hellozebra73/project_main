from django.shortcuts import render
from django.views.generic import View
from django.http import HttpResponseRedirect, HttpResponse
from django.template import Template, Context
from django.template.context_processors import csrf

import sys,os

from ProblemsApp.models import *

#TO DO:
#Add the read of the problem database and send the numeral as a letter.
#If there is no name for the step it will just take an automatic name --- 
#function? but then it will be like name name step3 name step5 ???

class ProblemConstructor:
    def __init__(self, topic_id_in, problem_name_in): 
    	#Call to the db Problem.
    	try:
    		self.prob_in = Problem.objects.get(topic_id=topic_id_in,problem_name=problem_name_in)
    	except:
    		self.prob_in = 'None'
    #check if the problem exists.
    def ProblemExist(self):
    	if self.prob_in == 'None':
    		return HttpResponse('The problem does not exist.')
    	else:
    		return self.prob_in

class ProblemNumeralConstructor:
    def __init__(self, problem_id_in, numeral_number_in): 
    	#Call to the db ProblemNumeral.
    	try:
    		self.prob_num_in = ProblemNumeral.objects.get(problem_id=problem_id_in,numeral_number=numeral_number_in)
    	except:
    		self.prob_num_in = 'None'
    #check if the problem exists.
    def ProblemExist(self):
    	if self.prob_num_in == 'None':
    		return HttpResponse('The problem numeral does not exist.')
    	else:
    		return self.prob_num_in

class StepConstructor:
    def __init__(self, s_number, prob_num_in):
    	try:
    		self.step_base=Step.objects.get(step_number=s_number,problem_num_id=prob_num_in)
    		#check this ... 
    		self.data=serializers.serialize("json", [self.step_base])
    	except:
    		self.step_base = 'None'
    #check if the step exists.
    def StepExist(self):
    	if self.step_base == 'None':
    		return HttpResponse('The step does not exist.')
    	else:
    		return self.step_base

class SubstepConstructor:
    def __init__(self, step_id_in, sub_number_in):
    	try:
    		self.substep_base=Substep.objects.get(step_id=step_id_in,substep_number=sub_number_in)
    	except:
    		self.substep_base = 'None'
    #check if the step exists.
    def SubstepExist(self):
    	if self.substep_base == 'None':
    		return HttpResponse('The substep does not exist.')
    	else:
    		return self.substep_base




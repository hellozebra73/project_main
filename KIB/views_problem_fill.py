import sys,os
import datetime

from django.shortcuts import render
from django.http import HttpResponseRedirect, HttpResponse
from django.template import Template, Context
from django.template.context_processors import csrf
#from django.views import View
from django.views.generic import View
from django.core import serializers

#sys.path.append('/Users/kvarela/Desktop/KIB_project/postgres/')
###
from SubjectsApp.models import *
from SubjectsApp.views import *
from ProblemsApp.models import *

#from ProblemsApp.views import *

###
import json

#Sends the teacher the list of subjects. 
class DataTeacherFill(View):
	def __init__(self, subject_id_in='All', topic_id_in='All'):
		self.subject_cons = SubjectConstructor(subject_id_in)
		self.topic_cons = TopicConstructor(topic_id_in,subject_id_in)
		self.data = []
		self.topic_id_in = topic_id_in
		self.subject_id_in = subject_id_in
	def test_get(self): #(request, *args, **kwargs):
		search_subject = True 
		search_topic = False 
		'''
		when put together with the template
		def get(request, *args, **kwargs):
			search_subject = json.loads(request.GET['subject_search'])
			search_topic = json.loads(request.GET['topic_search'])
		'''
		#This will just retrieve the list of subjects, the input should be True or False.
		if search_subject == True and search_topic == False:
			#Read the constructor and retrieve all the subjects
			self.subject_cons_info = self.subject_cons.SubjectExist()
			#List with ONLY the names of the subjects.
			for i in range(len(self.subject_cons_info)):
				self.data.append(self.subject_cons_info[i].subject_id)
				self.datax = json.dumps(self.data)
			return self.datax #HttpResponse(self.datax, content_type='application/json')

		#This will just retrieve the list of topics, the input should be True or False.
		#Here one can give the name of the subject the user chose before. 
		elif search_topic == True:
			#Read the constructor and retrieve all the topics
			self.topic_cons_info = self.topic_cons.TopicExist()
			#List with ONLY the names of the topics
			for i in range(len(self.topic_cons_info)):
				self.data.append(self.topic_cons_info[i].topic_id)
				self.datax = json.dumps(self.data)
			return HttpResponse(self.datax, content_type='application/json')

	def test_post(self):
		#Here the problem will be created, if it does not exist, if it does it will be updated.
		action = 'create' 
		problem_name_in = 'problem test'
		'''
		when put together with the template	
		def post(self, request, *args, **kwargs):
			#Here the problem will be created, if it does not exist, if it does it will be updated.
			action = json.loads(request.GET['subject_search'])
			problem_name_in = json.loads(request.GET['problem_name_in'])
		'''
		prob_id = Problem.objects.latest('id').id + 2
		if action == 'create':
			if problem_name_in == ' ':
				prob_name = topic_id + 'problem' + str(prob_id) 
			else: 
				prob_name = problem_name_in
			Problem.objects.create(
				topic_id = self.topic_id_in,
				problem_name = prob_name,
				text = 'test text 3', #json.loads(request.GET['text_problem']),
				template = 'dict', #json.loads(request.GET['template_problem']),
				number_of_numeral = 5 #json.loads(request.GET['total_numerals'])
			)
			self.prob_in = Problem.objects.get(topic_id=self.topic_id_in, id=prob_id)
		elif action == 'update':
			self.prob_in = Problem.objects.get(topic_id=self.topic_id_in, id=prob_id)
			problem_name = prob_name
			text_in = 'test text' #json.loads(request.GET['text_problem']),
			template_in = 'dict' #json.loads(request.GET['template_problem'])
			number_of_numeral_in = 5 #json.loads(request.GET['total_numerals'])
			try:
				Problem.objects.get(topic_id=self.topic_id_in, id=prob_id).update(problem_name = prob_name, text =text_in, template = template_in, number_of_numeral = number_of_numeral_in )
			except:
				return HttpResponse('The problem does not exist.')









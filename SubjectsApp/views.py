from django.shortcuts import render
from django.http import HttpResponse
from SubjectsApp.models import Subject, Topic

#Views SubjectsApp
class SubjectConstructor:
    def __init__(self, subject_id_in='All'): 
    	try:
    		if subject_id_in == 'All':
    			self.subject_in = Subject.objects.all()
    		else:
    			self.subject_in = Subject.objects.get(subject_id=subject_id_in)
    	except:
    		self.subject_in = 'None'
    #Check if the subject exist and return an array with django objects.
    def SubjectExist(self):
    	if self.subject_in == 'None':
    		return HttpResponse('The subject does not exist.')
    	else:
    		return self.subject_in

class TopicConstructor:
    def __init__(self, topic_id_in='All', subject_id_in='All'): 
    	
    	try:
    		if (topic_id_in == 'All' and subject_id_in == 'All'):
    			self.topic_in = Topic.objects.all()
    		#If subject_id_in is an object, it will retrieve all the topics related to that subject
    		elif (topic_id_in == 'All' and subject_id_in != 'All'):
    			self.topic_in = Topic.objects.filter(subject=subject_id_in)
    		#If topic_id_in is set, then it will retrieve the object of that topic, it will ignore the subject in the search.
    		else:
    			self.topic_in = Topic.objects.get(topic_id=topic_id_in)
    	except:
    		self.topic_in = 'None'
    #Check if the topic exist and return an array with django objects.
    def TopicExist(self):
    	if self.topic_in == 'None':
    		return HttpResponse('The topic does not exist.')
    	else:
    		return self.topic_in






from django.db import models
from LocationApp.models import *
from BooksApp.models import *

# Models - SubjectApp

class Subject(models.Model):
	# The subject code has to be predefined -- MIT??
	subject_id = models.SlugField(primary_key=True,verbose_name='Subject code')
	#What was the problem with the name?
	subject_name = models.CharField(max_length=500,verbose_name='Subject',null=True)
	#I think it is a good idea to have a short description of the subject - easy for the teacher 
	#to associate the problems with the subject if he know what it is about.
	description = models.TextField(blank=True,null=True)
	level=models.CharField(max_length=100,choices=(
		('Primary','Primary-school'),
		('Secondary','Secondary-school'),
		('SH','High-school'),
		('UG','Undergrad'),
		('Grad','Graduate')))
	#The subject can have different topics depending on the country. 
	#Maybe even school? - This would allow schools to personalised the app.
	country=models.ManyToManyField(Country)
	book=models.ManyToManyField(Book)
	chapter=models.ManyToManyField(Chapter)
	def __str__(self):
		return self.subject_name

class Topic(models.Model):
	#The topic ID has tp be predefined.
	topic_id=models.SlugField(primary_key=True,verbose_name='Topic ID')
	#Name, should be chosen from a list?
	topic_name=models.CharField(max_length=500,verbose_name='Topic name')
	description = models.TextField(blank=True)
	chapter=models.ManyToManyField(Chapter)
	subject=models.ManyToManyField(Subject)
	def __str__(self):
		#TO DO: return subject name -- through??
		return '%s: %s' % (self.topic_id, self.topic_name)

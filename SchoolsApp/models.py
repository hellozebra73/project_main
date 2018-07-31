from django.db import models
from LocationApp.models import *

#SchoolsApp models
class School(models.Model):
	school_id = models.SlugField(primary_key=True,verbose_name='School code') 
	school_name = models.CharField(max_length = 500,verbose_name='School',null=True)
	school_country = models.ForeignKey(Country,on_delete=models.CASCADE,primary_key=False)
	school_state = models.ForeignKey(State,on_delete=models.CASCADE,primary_key=False)
	school_city = models.ForeignKey(City,on_delete=models.CASCADE,primary_key=False)
	def __str__(self):
		return self.school_name

class College(models.Model):
	college_id = models.SlugField(primary_key=True,verbose_name='College code') 
	college_name = models.CharField(max_length = 500,verbose_name='College',null=True)
	college_country = models.ForeignKey(Country,on_delete=models.CASCADE,primary_key=False)
	college_state = models.ForeignKey(State,on_delete=models.CASCADE,primary_key=False)
	college_city = models.ForeignKey(City,on_delete=models.CASCADE,primary_key=False)
	def __str__(self):
		return self.college_name

class University(models.Model):
	university_id = models.SlugField(primary_key=True,verbose_name='University code') 
	university_name = models.CharField(max_length = 500,verbose_name='University',null=True)
	university_country = models.ForeignKey(Country,on_delete=models.CASCADE,primary_key=False)
	university_state = models.ForeignKey(State,on_delete=models.CASCADE,primary_key=False)
	university_city = models.ForeignKey(City,on_delete=models.CASCADE,primary_key=False)
	def __str__(self):
		return self.university_name

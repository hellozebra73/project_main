from django.db import models
from SubjectsApp.models import *
import datetime

# ProblemsApp models in here.
class Problem(models.Model):
	topic_id=models.ForeignKey(Topic,primary_key=False,on_delete=models.CASCADE,verbose_name='Topic ID')
	#If there is no problem name it will be given as topic id + problem + problem number
	problem_name=models.CharField(max_length=500,verbose_name='Problem name',blank=True)
	text=models.TextField(null=True)
	template=models.CharField(max_length=500, verbose_name='Problem Template', default={})
	#TO DO: Count the number of numerals automatically --- forms?
	number_of_numeral=models.PositiveIntegerField(default=1)
	#If the date is not given it will be taken automatically using a time stamp.
	#date_prob_creation=models.DateField(default='2000-01-01', blank=True)
	class Meta:
		unique_together = (('topic_id','id'),)
	def __str__(self):
		return '%s %s' % (self.topic_id, self.problem_name)

class ProblemNumeral(models.Model):
	problem_id=models.ForeignKey(Problem, primary_key=False, on_delete=models.CASCADE,verbose_name='Problem ID')
	numeral_name=models.CharField(max_length=500, verbose_name='Numeral name', default='a', blank=True)
	#NOTE: This will be changed to a numeral a, b, c .... and that will be send to the front.
	numeral_number=models.PositiveIntegerField(default=0)
	question=models.TextField()
	#TO DO: Count the number of steps automatically -- form?.
	number_of_steps=models.PositiveIntegerField(default=1) 
	class Meta:
		unique_together=(('problem_id','numeral_number'),)
	def __unicode__(self):
		return '%s %s' %(self.problem_id,self.numeral_number)

class Step(models.Model):
	problem_num_id=models.ForeignKey(ProblemNumeral, primary_key=False, on_delete=models.CASCADE, verbose_name='Problem Numeral ID')
	step_name=models.CharField(max_length=500, verbose_name='Step name', blank=True)
	step_number=models.PositiveIntegerField(default=0)
	explanation=models.TextField()
	video=models.CharField(max_length=500, null=True)
	instruction = models.TextField()
	#TO DO: Count autoatically the number of steps. Include counting method in forms?
	number_of_substeps=models.PositiveIntegerField(default=0)
	class Meta:
		unique_together=(('problem_num_id','step_number'),)
	def __unicode__(self):
		return '%s %s' %(self.problem_num_id.numeral_name,self.step_number)

class Substep(models.Model):
	step_id=models.ForeignKey(Step,primary_key=False, on_delete=models.CASCADE, verbose_name='Step ID')
	# TO DO: Delete this substep_name?
	substep_name=models.CharField(max_length=500,verbose_name='Substep name', blank=True)
	substep_number=models.PositiveIntegerField(default=1)
	answer=models.TextField()
	hint = models.TextField()
	class Meta:
		unique_together=(('step_id','substep_number'),)
	def __str__(self):
		return '%s %s' % (self.step_id,self.substep_number)

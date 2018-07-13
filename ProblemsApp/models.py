from django.db import models
from SubjectsApp.models import *

# ProblemsApp models in here.

## Add timestamp -- day and hour.
class Problem(models.Model):
	#Primary key of the prolem is automatic
	topic_id=models.ForeignKey(Topic,primary_key=False,on_delete=models.CASCADE,verbose_name='Topic ID')
	problem_name=models.CharField(max_length=500,verbose_name='Problem name',null=True)
	text=models.TextField()
	#template just is the dictionary that is sent form the front-end -- this has to be read from a JSON format.
	template=models.CharField(max_length=500,verbose_name='Problem Template',null=True)
	#TO DO: 
	#Count the number of numerals automatically.
	number_of_numeral=models.PositiveIntegerField(default=1,null=True)
	class Meta:
		unique_together = (('topic_id','problem_name'),)
	def __str__(self):
		return '%s %s' % (self.topic_id, self.problem_name)

# Add this nmeral only if ProblemNew has numeral --- how to add it in here?
# From views I can add this one and send it to Felipe, from Form I could do it also, but from here? 
# Can I read the database inside the other database directly?
# If I have zero numerals then the steps should belong directly to the problem, no?

class ProblemNumeral(models.Model):
	#Primary key of the prolem is automatic but with a unique_together
	problem_id=models.ForeignKey(Problem,primary_key=False,on_delete=models.CASCADE,verbose_name='Problem ID')
	#For now this will be numeral a, b, c ....
	numeral_name=models.CharField(max_length=500,verbose_name='Numeral name',null=True)
	#Change the number to a letter in the views.
	numeral_number=models.PositiveIntegerField(default=0,null=True)
	question=models.TextField()
	#Count the number of steps automatically.
	number_of_steps=models.PositiveIntegerField(default=1,null=True) 
	class Meta:
		unique_together=(('problem_id','numeral_number'),)
	def __unicode__(self):
		return '%s %s' %(self.problem_id,self.numeral_number)

class Step(models.Model):
	# Now this is associated to the problem numeral id, instead to the problem itself.
	problem_num_id=models.ForeignKey(ProblemNumeral,primary_key=False,on_delete=models.CASCADE,verbose_name='Problem Num ID')
	#This will be ... ?
	step_name=models.CharField(max_length=500,verbose_name='Step name',null=True)
	step_number=models.PositiveIntegerField(default=0,null=True)
	explanation=models.TextField()
	video=models.CharField(max_length=500,null=True)
	instruction = models.TextField()
	#TO DO: Count autoatically the number of steps. Include count method.
	number_of_substeps=models.PositiveIntegerField(default=0,null=True)
	class Meta:
		unique_together=(('problem_num_id','step_number'),)
	def __unicode__(self):
		return '%s %s' %(self.problem_num_id.numeral_name,self.step_number)

class Substep(models.Model):
	step_id=models.ForeignKey(Step,primary_key=False,on_delete=models.CASCADE,verbose_name='Step ID')
	#Delete the substep name?
	substep_name=models.CharField(max_length=500,verbose_name='Substep name',null=True)
	substep_number=models.PositiveIntegerField(default=0,null=True)
	answer=models.TextField(null=True)
	hint = models.TextField(null=True)
	class Meta:
		unique_together=(('step_id','substep_number'),)
	def __str__(self):
		return '%s %s' % (self.step_id,self.substep_number)

from django.db import models
from ProblemsApp.models import *
from SchoolsApp.models import *

#StudentsApp models
class Student(models.Model):
	#Student ID is automatic - maybe change this or add some patter related to school?
    student_name=models.CharField(max_length=100)
    number_solved_problems=models.IntegerField(default='0')
    country=models.ForeignKey(Country,primary_key=False,on_delete=models.CASCADE,verbose_name='Country name')
    school=models.ManyToManyField(School)
    def __str__(self):
        return self.student_name

## Add timestamp -- day and hour.
class StudentProblem(models.Model):
	student_id=models.ForeignKey(Student,primary_key=False,on_delete=models.CASCADE,verbose_name='Student ID')
	problem_id=models.ForeignKey(Problem,primary_key=False,on_delete=models.CASCADE,verbose_name='Problem ID')
	#TO DO: Change this with a ModelForm - make it increase from outside. 
	succesful_attemps=models.IntegerField(default='0')
	fail_attemps=models.IntegerField(default='0')
	#TO DO: The total number is calculated with a count method. Autofill.
	answer_file=models.CharField(max_length=100,verbose_name='answer_file', blank=True)
	class Meta:
		unique_together = (('student_id','problem_id'),)
	def __str__(self):
		return '%s %s' %(self.problem_id.problem_name, self.student_id.student_name)

class StudentStep(models.Model):
	problem_student_id = models.ForeignKey(StudentProblem, on_delete=models.CASCADE, primary_key=False)
	numeral_id = models.ForeignKey(ProblemNumeral, on_delete=models.CASCADE,primary_key=False)
	step_id = models.ForeignKey(Step, on_delete=models.CASCADE,primary_key=False)
	succesful_attemps=models.IntegerField(default='0')
	fail_attemps=models.IntegerField(default='0')
	#This is defined by the students input.
	number_of_substeps=models.IntegerField(default='0')
	class Meta:
		unique_together = (('problem_student_id','numeral_id','step_id'),)
	def __str__(self):
		return '%s %s' % (self.numeral_id,self.step_id.step_name)


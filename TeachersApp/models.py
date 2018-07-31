from django.db import models
from ProblemsApp.models import *
from SchoolsApp.models import *

#TeachersApp models
class Teacher(models.Model):
	#Student ID is automatic - maybe change this or add some patter related to school?
    teacher_name=models.CharField(max_length=100)
    number_input_problems=models.IntegerField(default='0')
    country=models.ForeignKey(Country,primary_key=False,on_delete=models.CASCADE,verbose_name='Country name')
    school=models.ManyToManyField(School)
    def __str__(self):
        return self.teacher_name

#Problems associated to each teacher.
class TeacherProblems(models.Model):
	teacher_id=models.ForeignKey(Teacher,primary_key=False,on_delete=models.CASCADE,verbose_name='Teacher ID')
	problem_id=models.ForeignKey(Problem,primary_key=False,on_delete=models.CASCADE,verbose_name='Problem ID')
	class Meta:
		unique_together = (('teacher_id','problem_id'),)
	def __str__(self):
		return '%s %s' %(self.problem_id.problem_name, self.teacher_id.teacher_name, self.problem_id.problem_status)



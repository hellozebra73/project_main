from django.contrib import admin
from .models import *

#StudentsApp models registration

class StudentAdmin(admin.ModelAdmin):
	list_display=('student_name','number_solved_problems')

class StudentProblemAdmin(admin.ModelAdmin):
	list_display=('student_id','problem_id')

class StudentStepAdmin(admin.ModelAdmin):
	list_display=('problem_student_id','step_id')

admin.site.register(Student,StudentAdmin)
admin.site.register(StudentProblem,StudentProblemAdmin)
admin.site.register(StudentStep,StudentStepAdmin)

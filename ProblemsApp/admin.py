from django.contrib import admin
from .models import *


#ProblemsApp models registration

class ProblemInLine(admin.TabularInline):
	model = Problem

class ProblemNumeralInLine(admin.TabularInline):
	model = ProblemNumeral

class StepInLine(admin.TabularInline):
	model= Step

class SubstepInLine(admin.TabularInline):
	model= Substep

class ProblemAdmin(admin.ModelAdmin):
	list_display=('topic_id','problem_name')
	inlines = [ProblemNumeralInLine,]

class ProblemNumeralAdmin(admin.ModelAdmin):
	list_display=('problem_id','numeral_number')
	inlines = [StepInLine,]

class StepAdmin(admin.ModelAdmin):
	list_display=('problem_num_id','step_number')
	inlines = [SubstepInLine,]

class SubstepAdmin(admin.ModelAdmin):
	list_display=('step_id','substep_number')

admin.site.register(Problem,ProblemAdmin)
admin.site.register(ProblemNumeral,ProblemNumeralAdmin)
admin.site.register(Step,StepAdmin)
admin.site.register(Substep,SubstepAdmin)
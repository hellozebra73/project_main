from django.contrib import admin
from .models import *

# Register your models here.
class SchoolAdmin(admin.ModelAdmin):
	list_display=('school_name',)

class CollegeAdmin(admin.ModelAdmin):
	list_display=('college_name',)

class UniversityAdmin(admin.ModelAdmin):
	list_display=('university_name',)

admin.site.register(School,SchoolAdmin)
admin.site.register(College,CollegeAdmin)
admin.site.register(University,UniversityAdmin)

from django.contrib import admin
from django.db import models
from .models import *

#SubjectApp models registration
class SubjectInLine(admin.TabularInline):
	model = Subject.book.through

class SubjectChapterInLine(admin.TabularInline):
	model = Subject.chapter.through

class TopicChapterInLine(admin.TabularInline):
	model = Topic.chapter.through

class TopicSubjectInLine(admin.TabularInline):
	model = Topic.subject.through

class TopicAdmin(admin.ModelAdmin):
	list_display=('topic_name',)
	#To DO: Validate to make sure it is unique
	#inlines = [ProblemInLine,]

class SubjectAdmin(admin.ModelAdmin):
	list_display=('subject_name','level')
	#To DO: Validate to make sure it is unique
	inlines = [TopicSubjectInLine,]

admin.site.register(Topic,TopicAdmin)
admin.site.register(Subject,SubjectAdmin)

from django.contrib import admin
from django.db import models
from .models import *

#BooksApp models registration.
class BookInLine(admin.TabularInline):
	model = Book

class BookAuthorInLine(admin.TabularInline):
	model = Book.authors.through

class ChapterInLine(admin.TabularInline):
	model = Chapter

#Check why the filter is not working
class BookAdmin(admin.ModelAdmin):
	list_display=('book_title',)
	filter_horizontal = ('authors',)
	inlines = [ChapterInLine,]

class ChapterInLine(admin.TabularInline):
	model = Chapter

class ChapterAdmin(admin.ModelAdmin):
	list_display=('book','chapter_name')
	#inlines = [SubjectChapterInLine,TopicChapterInLine]

class AuthorAdmin(admin.ModelAdmin):
	list_display=('first_name','last_name')
	inlines = [BookAuthorInLine,]

class PublisherAdmin(admin.ModelAdmin):
	list_display=('publisher_name',)
	inlines = [BookInLine,]

admin.site.register(Author,AuthorAdmin)
admin.site.register(Publisher,PublisherAdmin)
admin.site.register(Book,BookAdmin)
admin.site.register(Chapter,ChapterAdmin)

from django.db import models
from LocationApp.models import *

#Models for BooksApp

class Publisher(models.Model):
	publisher_name = models.CharField(max_length=100,null=True)
	address = models.CharField(max_length=100, verbose_name='Address',null=True)
	city = models.ManyToManyField(City)
	state_province = models.ManyToManyField(State)
	country = models.ManyToManyField(Country)
	website = models.URLField(blank=True)
	def __str__(self):
		return self.publisher_name

class Author(models.Model):
	first_name = models.CharField(max_length=100, verbose_name='First name',null=True)
	last_name = models.CharField(max_length=100, verbose_name='Last name',null=True)
	email = models.EmailField(blank=True)
	def __str__(self):
		return '%s %s' % (self.first_name, self.last_name)

class Book(models.Model):
	book_title = models.CharField(max_length=100,verbose_name='Book title',null=True)
	authors = models.ManyToManyField(Author)
	publisher = models.ForeignKey(Publisher,on_delete=models.CASCADE,primary_key=False)
	publication_date = models.DateField(blank=True)
	def __str__(self):
		return self.book_title

class Chapter(models.Model):
	chapter_number = models.PositiveIntegerField(default='0',null=True)
	chapter_name = models.CharField(max_length=100,verbose_name='Chapter name',null=True)
	book = models.ForeignKey(Book,on_delete=models.CASCADE,primary_key=False)
	def __unicode__(self):
		return '%s %s' % (self.book, self.chapter_name)


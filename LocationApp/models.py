from django.db import models

#Model definition: LocationApp

class Country(models.Model):
	# The country ID follows the international standard for country codes: i.e COL
	country_id = models.SlugField(primary_key=True,verbose_name='Country code') 
	country_name = models.CharField(max_length = 500,verbose_name='Country',null=True)
	def __str__(self):
		return self.country_name

class State(models.Model):
	# The state ID follows the international standard for country codes: i.e CUN
	state_id = models.SlugField(primary_key=True,verbose_name='State code') 
	state_name = models.CharField(max_length = 500,verbose_name='State',null=True)
	state_country = models.ForeignKey(Country,on_delete=models.CASCADE,primary_key=False)
	def __str__(self):
		return self.state_name

class City(models.Model):
	# The city ID follows the international standard for country codes: i.e BOG
	city_id = models.SlugField(primary_key=True,verbose_name='City code') 
	city_name = models.CharField(max_length = 500,verbose_name='City',null=True)
	#Unique together?
	city_country = models.ForeignKey(Country,on_delete=models.CASCADE,primary_key=False)
	city_state = models.ForeignKey(State,on_delete=models.CASCADE,primary_key=False)
	def __str__(self):
		return self.city_name


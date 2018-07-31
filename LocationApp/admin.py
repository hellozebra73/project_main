from django.contrib import admin
from django.db import models
from .models import *

#Registration of the models in the admin: LocationApp

class CountryAdmin(admin.ModelAdmin):
	list_display = ('country_name',)

class StateAdmin(admin.ModelAdmin):
	list_display = ('state_name',)

class CityAdmin(admin.ModelAdmin):
	list_display = ('city_name',)

admin.site.register(Country,CountryAdmin)
admin.site.register(State,StateAdmin)
admin.site.register(City,CityAdmin)
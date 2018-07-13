"""KIB URL Configuration

The `urlpatterns` list routes URLs to views. For more information please see:
    https://docs.djangoproject.com/en/2.0/topics/http/urls/
Examples:
Function views
    1. Add an import:  from my_app import views
    2. Add a URL to urlpatterns:  path('', views.home, name='home')
Class-based views
    1. Add an import:  from other_app.views import Home
    2. Add a URL to urlpatterns:  path('', Home.as_view(), name='home')
Including another URLconf
    1. Import the include() function: from django.urls import include, path
    2. Add a URL to urlpatterns:  path('blog/', include('blog.urls'))
"""
from django.contrib import admin
from django.urls import path, include, re_path


from . import views

urlpatterns = [
    path('admin/', admin.site.urls),
    path('hello/', views.hello),
    path('datetime/', views.current_datetime),
    path('process_steps/',views.DataAjax.as_view(), name = 'Step_ajax'),
    path('process/',views.DataProcess.as_view(), name = 'Data process'),
    path('opp13/',views.TemplateProcess.as_view(), name = 'Main page'),
]

# Generated by Django 2.0 on 2018-03-23 13:49

from django.db import migrations


class Migration(migrations.Migration):

    dependencies = [
        ('opp', '0041_step_problem_name'),
    ]

    operations = [
        migrations.RemoveField(
            model_name='step',
            name='problem_name',
        ),
    ]
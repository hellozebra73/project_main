# Generated by Django 2.0 on 2018-07-18 03:17

from django.db import migrations


class Migration(migrations.Migration):

    dependencies = [
        ('ProblemsApp', '0003_auto_20180718_0316'),
    ]

    operations = [
        migrations.RemoveField(
            model_name='problem',
            name='date_prob_creation',
        ),
    ]
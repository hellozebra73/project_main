# Generated by Django 2.0 on 2018-07-18 03:18

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('ProblemsApp', '0004_remove_problem_date_prob_creation'),
    ]

    operations = [
        migrations.AddField(
            model_name='problem',
            name='date_prob_creation',
            field=models.DateField(blank=True, default=''),
            preserve_default=False,
        ),
    ]

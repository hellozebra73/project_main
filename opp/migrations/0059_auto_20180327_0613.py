# Generated by Django 2.0 on 2018-03-27 06:13

from django.db import migrations


class Migration(migrations.Migration):

    dependencies = [
        ('opp', '0058_auto_20180327_0551'),
    ]

    operations = [
        migrations.RenameField(
            model_name='studentstep',
            old_name='step_student_id',
            new_name='step_id',
        ),
        migrations.AlterUniqueTogether(
            name='studentstep',
            unique_together={('problem_student_id', 'step_id')},
        ),
    ]

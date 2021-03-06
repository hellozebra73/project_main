# Generated by Django 2.0 on 2018-03-27 05:39

from django.db import migrations


class Migration(migrations.Migration):

    dependencies = [
        ('opp', '0054_auto_20180327_0536'),
    ]

    operations = [
        migrations.RemoveField(
            model_name='student',
            name='country',
        ),
        migrations.RemoveField(
            model_name='student',
            name='school',
        ),
        migrations.AlterUniqueTogether(
            name='studentproblem',
            unique_together=set(),
        ),
        migrations.RemoveField(
            model_name='studentproblem',
            name='problem_id',
        ),
        migrations.RemoveField(
            model_name='studentproblem',
            name='student_id',
        ),
        migrations.AlterUniqueTogether(
            name='studentstep',
            unique_together=set(),
        ),
        migrations.RemoveField(
            model_name='studentstep',
            name='problem_student_id',
        ),
        migrations.RemoveField(
            model_name='studentstep',
            name='step_student_id',
        ),
        migrations.AlterUniqueTogether(
            name='substep',
            unique_together=set(),
        ),
        migrations.RemoveField(
            model_name='substep',
            name='step_id',
        ),
        migrations.DeleteModel(
            name='School',
        ),
        migrations.DeleteModel(
            name='Student',
        ),
        migrations.DeleteModel(
            name='StudentProblem',
        ),
        migrations.DeleteModel(
            name='StudentStep',
        ),
        migrations.DeleteModel(
            name='Substep',
        ),
    ]

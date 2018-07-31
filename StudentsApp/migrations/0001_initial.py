# Generated by Django 2.0 on 2018-07-31 23:05

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    initial = True

    dependencies = [
        ('SchoolsApp', '0001_initial'),
        ('LocationApp', '0001_initial'),
        ('ProblemsApp', '0001_initial'),
    ]

    operations = [
        migrations.CreateModel(
            name='Student',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('student_name', models.CharField(max_length=100)),
                ('number_solved_problems', models.IntegerField(default='0')),
                ('country', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='LocationApp.Country', verbose_name='Country name')),
                ('school', models.ManyToManyField(to='SchoolsApp.School')),
            ],
        ),
        migrations.CreateModel(
            name='StudentProblem',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('succesful_attemps', models.IntegerField(default='0')),
                ('fail_attemps', models.IntegerField(default='0')),
                ('answer_file', models.CharField(blank=True, max_length=100, verbose_name='answer_file')),
                ('problem_id', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='ProblemsApp.Problem', verbose_name='Problem ID')),
                ('student_id', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='StudentsApp.Student', verbose_name='Student ID')),
            ],
        ),
        migrations.CreateModel(
            name='StudentStep',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('succesful_attemps', models.IntegerField(default='0')),
                ('fail_attemps', models.IntegerField(default='0')),
                ('number_of_substeps', models.IntegerField(default='0')),
                ('numeral_id', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='ProblemsApp.ProblemNumeral')),
                ('problem_student_id', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='StudentsApp.StudentProblem')),
                ('step_id', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='ProblemsApp.Step')),
            ],
        ),
        migrations.AlterUniqueTogether(
            name='studentstep',
            unique_together={('problem_student_id', 'numeral_id', 'step_id')},
        ),
        migrations.AlterUniqueTogether(
            name='studentproblem',
            unique_together={('student_id', 'problem_id')},
        ),
    ]

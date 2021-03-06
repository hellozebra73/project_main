# Generated by Django 2.0 on 2018-03-23 15:57

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    dependencies = [
        ('opp', '0045_auto_20180323_1549'),
    ]

    operations = [
        migrations.CreateModel(
            name='StudentProblem',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('number_of_tries', models.IntegerField(default='0')),
                ('problem_id', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='opp.Problem', verbose_name='Problem ID')),
                ('student_id', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='opp.Student', verbose_name='Topic ID')),
            ],
        ),
        migrations.AlterUniqueTogether(
            name='studentproblem',
            unique_together={('student_id', 'problem_id')},
        ),
    ]

# Generated by Django 2.0 on 2018-03-27 05:40

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    dependencies = [
        ('opp', '0055_auto_20180327_0539'),
    ]

    operations = [
        migrations.CreateModel(
            name='Substep',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('substep_name', models.CharField(max_length=500, verbose_name='Substep name')),
                ('answer', models.TextField()),
                ('hint', models.TextField()),
                ('step_id', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='opp.Step', verbose_name='Step ID')),
            ],
        ),
        migrations.AlterUniqueTogether(
            name='substep',
            unique_together={('step_id', 'substep_name')},
        ),
    ]

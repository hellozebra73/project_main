# Generated by Django 2.0 on 2018-03-15 02:48

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('opp', '0006_auto_20180315_0230'),
    ]

    operations = [
        migrations.RemoveField(
            model_name='subject',
            name='topic',
        ),
        migrations.AddField(
            model_name='topic',
            name='subject',
            field=models.ManyToManyField(to='opp.Subject'),
        ),
    ]
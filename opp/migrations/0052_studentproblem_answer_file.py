# Generated by Django 2.0 on 2018-03-26 02:17

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('opp', '0051_auto_20180326_0214'),
    ]

    operations = [
        migrations.AddField(
            model_name='studentproblem',
            name='answer_file',
            field=models.CharField(default=1, max_length=100, verbose_name='answer_file'),
            preserve_default=False,
        ),
    ]
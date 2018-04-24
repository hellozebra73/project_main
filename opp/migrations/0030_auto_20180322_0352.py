# Generated by Django 2.0 on 2018-03-22 03:52

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    dependencies = [
        ('opp', '0029_auto_20180322_0327'),
    ]

    operations = [
        migrations.RemoveField(
            model_name='membership',
            name='inviter',
        ),
        migrations.AlterField(
            model_name='group',
            name='members',
            field=models.ManyToManyField(through='opp.Membership', to='opp.Person'),
        ),
        migrations.RemoveField(
            model_name='membership',
            name='person',
        ),
        migrations.AddField(
            model_name='membership',
            name='person',
            field=models.ForeignKey(default=1, on_delete=django.db.models.deletion.CASCADE, to='opp.Person'),
            preserve_default=False,
        ),
    ]

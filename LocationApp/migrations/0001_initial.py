# Generated by Django 2.0 on 2018-07-13 02:00

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    initial = True

    dependencies = [
    ]

    operations = [
        migrations.CreateModel(
            name='City',
            fields=[
                ('city_id', models.SlugField(primary_key=True, serialize=False, verbose_name='City code')),
                ('city_name', models.CharField(max_length=500, null=True, verbose_name='City')),
            ],
        ),
        migrations.CreateModel(
            name='Country',
            fields=[
                ('country_id', models.SlugField(primary_key=True, serialize=False, verbose_name='Country code')),
                ('country_name', models.CharField(max_length=500, null=True, verbose_name='Country')),
            ],
        ),
        migrations.CreateModel(
            name='State',
            fields=[
                ('state_id', models.SlugField(primary_key=True, serialize=False, verbose_name='State code')),
                ('state_name', models.CharField(max_length=500, null=True, verbose_name='State')),
                ('state_country', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='LocationApp.Country')),
            ],
        ),
        migrations.AddField(
            model_name='city',
            name='city_country',
            field=models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='LocationApp.Country'),
        ),
        migrations.AddField(
            model_name='city',
            name='city_state',
            field=models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='LocationApp.State'),
        ),
    ]

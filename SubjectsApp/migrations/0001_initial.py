# Generated by Django 2.0 on 2018-07-13 02:36

from django.db import migrations, models


class Migration(migrations.Migration):

    initial = True

    dependencies = [
        ('BooksApp', '0001_initial'),
        ('LocationApp', '0001_initial'),
    ]

    operations = [
        migrations.CreateModel(
            name='Subject',
            fields=[
                ('subject_id', models.SlugField(primary_key=True, serialize=False, verbose_name='Subject code')),
                ('subject_name', models.CharField(max_length=500, null=True, verbose_name='Subject')),
                ('description', models.TextField(blank=True, null=True)),
                ('level', models.CharField(choices=[('Primary', 'Primary-school'), ('Secondary', 'Secondary-school'), ('SH', 'High-school'), ('UG', 'Undergrad'), ('Grad', 'Graduate')], max_length=100)),
                ('book', models.ManyToManyField(to='BooksApp.Book')),
                ('chapter', models.ManyToManyField(to='BooksApp.Chapter')),
                ('country', models.ManyToManyField(to='LocationApp.Country')),
            ],
        ),
        migrations.CreateModel(
            name='Topic',
            fields=[
                ('topic_id', models.SlugField(primary_key=True, serialize=False, verbose_name='Topic ID')),
                ('topic_name', models.CharField(max_length=500, verbose_name='Topic name')),
                ('description', models.TextField(blank=True)),
                ('chapter', models.ManyToManyField(to='BooksApp.Chapter')),
                ('subject', models.ManyToManyField(to='SubjectsApp.Subject')),
            ],
        ),
    ]

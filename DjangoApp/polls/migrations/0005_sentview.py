# Generated by Django 3.1.1 on 2021-03-03 12:47

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('polls', '0004_masentimentdim'),
    ]

    operations = [
        migrations.CreateModel(
            name='SentView',
            fields=[
                ('sentid', models.IntegerField(primary_key=True, serialize=False)),
                ('timestamp', models.CharField(blank=True, max_length=20, null=True)),
                ('comp_sentiment', models.DecimalField(blank=True, decimal_places=4, max_digits=5, null=True)),
            ],
            options={
                'db_table': 'sent_view',
                'managed': False,
            },
        ),
    ]
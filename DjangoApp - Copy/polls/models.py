import datetime
from django.utils import timezone
from django.db import models
from django.contrib.auth.models import User
from django.contrib.auth import get_user_model
from django.db.models.signals import post_save
from django.dispatch import receiver


class Profile(models.Model):
    user = models.OneToOneField(User, on_delete=models.CASCADE)
    created = models.DateTimeField(auto_now_add=True, editable=False)
    modified = models.DateTimeField(auto_now=True, editable=False)

    def __str__(self):
        return f"{self.user}"

# Signal


@receiver(post_save, sender=get_user_model())
def manage_user_profile(sender, instance, created, **kwargs):
    try:
        my_profile = instance.profile
        my_profile.save()
    except Profile.DoesNotExist:
        Profile.objects.create(user=instance)


class Question(models.Model):
    question_text = models.CharField(max_length=200)
    pub_date = models.DateTimeField('date published')

    def was_published_recently(self):
        return self.pub_date >= timezone.now() - datetime.timedelta(days=1)

    def __str__(self):
        return self.question_text


class Choice(models.Model):
    question = models.ForeignKey(Question, on_delete=models.CASCADE)
    choice_text = models.CharField(max_length=200)
    votes = models.IntegerField(default=0)

    def __str__(self):
        return self.choice_text


class ArticlesFact(models.Model):
    id = models.IntegerField(primary_key=True)
    dateid = models.ForeignKey('DateDim', models.DO_NOTHING, db_column='dateid', blank=True, null=True)
    timeid = models.ForeignKey('TimeDim', models.DO_NOTHING, db_column='timeid', blank=True, null=True)
    title = models.CharField(max_length=500, blank=True, null=True)
    url = models.CharField(max_length=100, blank=True, null=True)
    comp_sentiment = models.DecimalField(max_digits=5, decimal_places=4, blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'articles_fact'



class DateDim(models.Model):
    dateid = models.IntegerField(primary_key=True)
    full_date = models.CharField(max_length=20, blank=True, null=True)
    dd = models.IntegerField(blank=True, null=True)
    mm = models.IntegerField(blank=True, null=True)
    yy = models.IntegerField(blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'date_dim'


class SentimentFact(models.Model):
    id = models.IntegerField(primary_key=True)
    dateid = models.ForeignKey(DateDim, models.DO_NOTHING, db_column='dateid', blank=True, null=True)
    timeid = models.ForeignKey('TimeDim', models.DO_NOTHING, db_column='timeid', blank=True, null=True)
    trading_symbol = models.CharField(max_length=10, blank=True, null=True)
    comp_sentiment = models.DecimalField(max_digits=5, decimal_places=4, blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'sentiment_fact'


class TimeDim(models.Model):
    timeid = models.IntegerField(primary_key=True)
    time = models.CharField(max_length=2, blank=True, null=True)
    hour = models.IntegerField(blank=True, null=True)
    minute = models.IntegerField(blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'time_dim'


class MaSentimentDim(models.Model):
    dateid = models.ForeignKey('DateDim', models.DO_NOTHING, db_column='dateid', blank=True, null=True)
    timeid = models.ForeignKey('TimeDim', models.DO_NOTHING, db_column='timeid', blank=True, null=True)
    trading_symbol = models.CharField(max_length=10, blank=True, null=True)
    comp_sentiment = models.DecimalField(max_digits=5, decimal_places=4, blank=True, null=True)
    sma = models.DecimalField(max_digits=5, decimal_places=4, blank=True, null=True)
    ema = models.DecimalField(max_digits=5, decimal_places=4, blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'ma_sentiment_dim'


class SentView(models.Model):
    sentid = models.IntegerField(primary_key=True)
    timestamp = models.CharField(max_length=20, blank=True, null=True)
    comp_sentiment = models.DecimalField(max_digits=5, decimal_places=4, blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'sent_view'

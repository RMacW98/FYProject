from django.db import models
from django.contrib.auth.models import User
from django.urls import reverse
from django.utils import timezone


class Article(models.Model):
    title = models.CharField(max_length=550, blank=True)
    description = models.CharField(max_length=500, blank=True)
    pic = models.CharField(max_length=500, blank=True)
    url = models.CharField(max_length=500, blank=True)
    date_posted = models.DateTimeField(default=timezone.now)
    outlet = models.CharField(max_length=255, blank=True)

    def __str__(self):
        return self.description

    def get_absolute_url(self):
        return reverse('post-detail', kwargs={'pk': self.pk})


class Comments(models.Model):
    article = models.ForeignKey(Article, related_name='details', on_delete=models.CASCADE)
    username = models.ForeignKey(User, related_name='details', on_delete=models.CASCADE)
    comment = models.CharField(max_length=255)
    comment_date = models.DateTimeField(default=timezone.now)


class Like(models.Model):
    user = models.ForeignKey(User, related_name='likes', on_delete=models.CASCADE)
    article = models.ForeignKey(Article, related_name='likes', on_delete=models.CASCADE)

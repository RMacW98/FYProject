from django.contrib import admin

from .models import Question, Choice, SentimentFact, MaSentimentDim

admin.site.register(Question)
admin.site.register(Choice)
admin.site.register(SentimentFact)
admin.site.register(MaSentimentDim)
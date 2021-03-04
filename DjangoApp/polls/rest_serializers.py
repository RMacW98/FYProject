from django.contrib.auth.models import User, Group
from rest_framework import serializers
from .models import Choice, SentimentFact, MaSentimentDim, SentView


class UserSerializer(serializers.HyperlinkedModelSerializer):
    class Meta:
        model = User
        fields = ['url', 'username', 'email', 'groups']


class GroupSerializer(serializers.HyperlinkedModelSerializer):
    class Meta:
        model = Group
        fields = ['url', 'name']


class ChoiceSerializer(serializers.ModelSerializer):
    class Meta:
        model = Choice
        fields = '__all__'

class SentimentSerializer(serializers.ModelSerializer):
    class Meta:
        model = SentimentFact
        fields = '__all__'


class MASentimentSerializer(serializers.ModelSerializer):
    class Meta:
        model = MaSentimentDim
        fields = '__all__'


class SentViewSerializer(serializers.ModelSerializer):
    class Meta:
        model = SentView
        fields = '__all__'
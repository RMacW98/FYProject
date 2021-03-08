from django.contrib.auth.models import User, Group
from rest_framework import viewsets
from rest_framework import permissions
from . rest_serializers import UserSerializer, GroupSerializer, ChoiceSerializer, SentimentSerializer, MASentimentSerializer, SentViewSerializer
from . models import Choice, SentimentFact, MaSentimentDim, SentView


class UserViewSet(viewsets.ModelViewSet):
    """
    API endpoint that allows users to be viewed or edited.
    """
    queryset = User.objects.all().order_by('-date_joined')
    serializer_class = UserSerializer
    permission_classes = [permissions.IsAuthenticatedOrReadOnly, permissions.DjangoModelPermissionsOrAnonReadOnly]


class GroupViewSet(viewsets.ModelViewSet):
    """
    API endpoint that allows groups to be viewed or edited.
    """
    queryset = Group.objects.all()
    serializer_class = GroupSerializer
    permission_classes = [permissions.IsAuthenticatedOrReadOnly, permissions.DjangoModelPermissionsOrAnonReadOnly]


class ChoiceViewSet(viewsets.ModelViewSet):
    """
    API endpoint that allows groups to be viewed or edited.
    """
    queryset = Choice.objects.all()
    serializer_class = ChoiceSerializer
    permission_classes = [permissions.IsAuthenticatedOrReadOnly]

class SentimentViewSet(viewsets.ModelViewSet):
    """
    API endpoint that allows groups to be viewed or edited.
    """
    queryset = SentimentFact.objects.all()
    serializer_class = SentimentSerializer
    permission_classes = [permissions.IsAuthenticatedOrReadOnly]


class MASentimentViewSet(viewsets.ModelViewSet):
    """
    API endpoint that allows groups to be viewed or edited.
    """
    queryset = SentimentFact.objects.all()
    serializer_class = MASentimentSerializer
    permission_classes = [permissions.IsAuthenticatedOrReadOnly]


class CurrentSentimentViewSet(viewsets.ModelViewSet):
    """
    API endpoint that allows groups to be viewed or edited.
    """
    queryset = MaSentimentDim.objects.all().order_by('-id')[:1]
    serializer_class = MASentimentSerializer
    permission_classes = [permissions.IsAuthenticatedOrReadOnly]


class SentViewSet(viewsets.ModelViewSet):
    """
    API endpoint that allows groups to be viewed or edited.
    """
    queryset = SentView.objects.all().order_by('-sentid')
    serializer_class = SentViewSerializer
    permission_classes = [permissions.IsAuthenticatedOrReadOnly]
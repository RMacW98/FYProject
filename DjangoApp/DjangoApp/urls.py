from django.contrib import admin
from django.urls import path, include
from django.views.generic.base import TemplateView
from rest_framework import routers
from polls import rest_views
from rest_framework.schemas import get_schema_view

router = routers.DefaultRouter()
router.register(r'users', rest_views.UserViewSet)
router.register(r'choice', rest_views.ChoiceViewSet)
router.register(r'sentiment', rest_views.SentimentViewSet)
router.register(r'current_sentiment', rest_views.CurrentSentimentViewSet)
router.register(r'moving_average_sentiment', rest_views.MASentimentViewSet)
router.register(r'sentiment_view', rest_views.SentViewSet)

urlpatterns = [
    path('admin/', admin.site.urls),
    path('', include('polls.urls')),
    path('accounts/', include('accounts.urls')),
    path('accounts/', include('django.contrib.auth.urls')),
    path('', TemplateView.as_view(template_name='home.html'), name='home'),
    path('', include('pwa.urls')),
    path('rest/', include(router.urls)),
    path('api-auth/', include('rest_framework.urls', namespace='rest_framework')),
    path('swagger-ui/', TemplateView.as_view(
        template_name='swagger-ui.html',
        extra_context={'schema_url': 'openapi-schema'}
    ), name='swagger-ui'),
    path('openapi', get_schema_view(
            title="Your Project",
            description="API for all things …",
            version="1.0.0"
        ), name='openapi-schema'),
]

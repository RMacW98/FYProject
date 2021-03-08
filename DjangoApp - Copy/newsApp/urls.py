from django.urls import path
from . import views
from .views import ArticleListView

app_name = 'feed'
urlpatterns = [
    #path('', views.index, name='feed'),
    path('', ArticleListView.as_view(), name='home'),
    path('post/<int:pk>/', views.article_detail, name='article-detail'),
    path('like/', views.like, name='article-like'),
    path('search_posts/', views.search_articles, name='search_articles'),
]
from django.shortcuts import render
from newsapi import NewsApiClient
from django.shortcuts import get_object_or_404, render, redirect
from django.http import HttpResponseRedirect, HttpResponse, JsonResponse
from django.urls import reverse
from django.contrib import messages
from django.core.paginator import Paginator
from django.contrib.auth.models import User
from .forms import NewCommentForm
from django.views.generic import ListView, UpdateView, DeleteView
from django.contrib.auth.mixins import LoginRequiredMixin, UserPassesTestMixin
from .models import Comments, Like, Article
from django.contrib.auth.decorators import login_required
from django.views.decorators.http import require_POST
import json
# Create your views here.

mylist = ()


def index(request):
    newsapi = NewsApiClient(api_key='cc3f4e3191f149658f3922e9c47ec1ad')
    headlines = newsapi.get_top_headlines(q='bitcoin',
                                          category='business',
                                          language='en')
    articles = headlines['articles']
    desc = []
    news = []
    img = []
    url = []

    for i in range(len(articles)):
        article = articles[i]
        desc.append(article['description'])
        news.append(article['title'])
        img.append(article['urlToImage'])
        url.append(article['url'])
    mylist = zip(news, desc, img, url)

    return render(request, "feed/api_feed.html", context={"mylist": mylist})


class ArticleListView(ListView):
    model = Article
    template_name = 'feed/home.html'
    context_object_name = 'articles'
    ordering = ['-date_posted']
    paginate_by = 10

    def get_context_data(self, **kwargs):
        context = super(ArticleListView, self).get_context_data(**kwargs)
        if self.request.user.is_authenticated:
            liked = [i for i in Article.objects.all() if Like.objects.filter(user=self.request.user, article=i)]
            context['liked_article'] = liked
        return context


@login_required
def article_detail(request, pk):
    article = get_object_or_404(Article, pk=pk)
    user = request.user
    is_liked = Like.objects.filter(user=user, article=article)
    if request.method == 'POST':
        form = NewCommentForm(request.POST)
        if form.is_valid():
            data = form.save(commit=False)
            data.article = article
            data.username = user
            data.save()
            return redirect('feed:article-detail', pk=pk)
    else:
        form = NewCommentForm()
    return render(request, 'feed/article_detail.html', {'article':article, 'is_liked':is_liked, 'form':form})


@login_required
def search_articles(request):
    query = request.GET.get('p')
    object_list = Article.objects.filter(description=query)
    liked = [i for i in object_list if Like.objects.filter(user=request.user, article=i)]
    context ={
        'article': object_list,
        'liked_article': liked
    }
    return render(request, "feed/search_article.html", context)


@login_required
def like(request):
    article_id = request.GET.get("likeId", "")
    user = request.user
    article = Article.objects.get(pk=article_id)
    liked = False
    like = Like.objects.filter(user=user, article=article)
    if like:
        like.delete()
    else:
        liked = True
        Like.objects.create(user=user, article=article)
    resp = {
        'liked':liked
    }
    response = json.dumps(resp)
    return HttpResponse(response, content_type = "application/json")
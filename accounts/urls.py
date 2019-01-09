from django.conf.urls import url
from . import views
from django.conf import settings
from django.conf.urls.static import static
from django.views.static import serve

app_name = 'accounts'

urlpatterns = [
    url(r'^signup/$', views.signup_view, name="signup"),
    url(r'^login/$', views.login_view, name="login"),
    url(r'^logout/$', views.logout_view, name="logout"), 
    url(r'^profile/$', views.profile_view, name="profile"),
] 

urlpatterns += static(settings.MEDIA_URL, document_root=settings.MEDIA_ROOT)

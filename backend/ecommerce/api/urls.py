from django.urls import path
from .views import (
    category_list,
    subcategory_list,
    product_list
)


urlpatterns = [
    path('categories/', category_list),
    path('subcategories/<int:category_id>/', subcategory_list),
    path('products/<int:subcategory_id>/', product_list),
]
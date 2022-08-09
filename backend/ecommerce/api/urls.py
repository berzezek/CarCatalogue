from django.urls import path, include, re_path
from .views import (
    category_list,
    subcategory_list,
    product_list,
    product_images,
    product_all,
    product_all_for_search,

    category_field,
    products_field,
    products_field_get,
)


urlpatterns = [
    path('auth/', include('djoser.urls')),
    re_path(r'^auth/', include('djoser.urls.authtoken')),

    path('categories/', category_list),
    path('subcategories/<int:category_id>/', subcategory_list),
    path('products/<int:subcategory_id>/', product_list),
    path('products-all/', product_all),
    path('products-all-for-search/', product_all_for_search),
    path('images/<int:product_id>/', product_images),
    path('fields-add/<int:category_id>/', category_field),
    path('fields/<int:product_id>/', products_field_get),
    path('field-to-product/<int:product_id>/<int:field_id>/', products_field),
]
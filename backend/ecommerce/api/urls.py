from django.urls import path
from .views import (
    category_list,
    subcategory_list,
    product_list,
    product_images,

    category_field,
    products_field,
    products_field_get,
)


urlpatterns = [
    path('categories/', category_list),
    path('subcategories/<int:category_id>/', subcategory_list),
    path('products/<int:subcategory_id>/', product_list),
    path('images/<int:product_id>/', product_images),
    path('fields-add/<int:category_id>/', category_field),
    path('fields/<int:product_id>/', products_field_get),
    path('field-to-product/<int:product_id>/<int:field_id>/', products_field),
]
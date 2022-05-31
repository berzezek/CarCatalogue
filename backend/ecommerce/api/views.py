from nis import cat
from unicodedata import category
from ecommerce.models import Category, SubCategory, Product, CategoryField, ProductField, ProductImage, ProductPrice
from .serializers import CategorySerializer, SubCategorySerializer, ProductSerializer, CategoryFieldSerializer, ProductFieldSerializer, ProductImageSerializer, ProductPriceSerializer
from rest_framework.response import Response
from rest_framework import status
from django.views.decorators.csrf import csrf_exempt
from rest_framework.decorators import api_view


@api_view(['GET'])
@csrf_exempt
def category_list(request):
    categories = Category.objects.all()
    serializer = CategorySerializer(categories, many=True)
    return Response(serializer.data)

@api_view(['GET'])
@csrf_exempt
def subcategory_list(request, category_id=None):
    subcategories = SubCategory.objects.filter(category__id=category_id)
    serializer = SubCategorySerializer(subcategories, many=True)
    return Response(serializer.data)

@api_view(['GET'])
@csrf_exempt
def product_list(request, subcategory_id=None):
    products = Product.objects.filter(subcategory__id=subcategory_id)
    serializer = ProductSerializer(products, many=True)
    return Response(serializer.data)



from ecommerce.models import (
    Category, 
    SubCategory, 
    Product, 
    CategoryField, 
    ProductField, 
    ProductImage, 
    ProductPrice
)
from .serializers import (
    CategorySerializer, 
    SubCategorySerializer, 
    ProductSerializer, 
    CategoryFieldSerializer, 
    ProductFieldSerializer, 
    ProductImageSerializer, 
    ProductPriceSerializer,
    ProductSerializerRO
)
from rest_framework.response import Response
from rest_framework import status
from django.views.decorators.csrf import csrf_exempt
from rest_framework.decorators import api_view, permission_classes
from rest_framework.permissions import IsAuthenticatedOrReadOnly
from rest_framework.pagination import LimitOffsetPagination
from rest_framework.pagination import PageNumberPagination


@api_view(['GET', 'POST', 'PUT', 'DELETE'])
@csrf_exempt
@permission_classes([IsAuthenticatedOrReadOnly])
def category_list(request, id=None):
    if request.method == 'GET':
        category=Category.objects.all()
        serializer=CategorySerializer(category, many=True)
        return Response(serializer.data)
    elif request.method == 'POST':
        serializer = CategorySerializer(data=request.data)
        if serializer.is_valid():
            serializer.save()
            return Response(serializer.data, status=status.HTTP_201_CREATED)
        return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)
    elif request.method == 'PUT':
        try:
            category = Category.objects.get(id=id)
        except Category.DoesNotExist:
            return Response(status=status.HTTP_404_NOT_FOUND)
        serializer = CategorySerializer(category, data=request.data)
        if serializer.is_valid():
            serializer.save()
            return Response(serializer.data)
        return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)
    elif request.method == 'DELETE':
        try:
            category = Category.objects.get(id=id)
        except Category.DoesNotExist:
            return Response(status=status.HTTP_404_NOT_FOUND)
        category.delete()
        return Response(status=status.HTTP_204_NO_CONTENT)
        



@api_view(['GET', 'POST', 'PUT', 'DELETE'])
@csrf_exempt
@permission_classes([IsAuthenticatedOrReadOnly])
def subcategory_list(request, category_id=None, subcategory_id=None):
    try:
        category = Category.objects.get(id=category_id)
    except Category.DoesNotExist:
        return Response(status=status.HTTP_404_NOT_FOUND)
    if request.method == 'GET':
        subcategories = SubCategory.objects.filter(category_id=category_id)
        serializer = SubCategorySerializer(subcategories, many=True)
        return Response(serializer.data)
    elif request.method == 'POST':
        serializer = SubCategorySerializer(data=request.data)
        if serializer.is_valid():
            serializer.save(category=category)
            return Response(serializer.data, status=status.HTTP_201_CREATED)
        return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)
    elif request.method == 'PUT':
        try:
            subcategory = SubCategory.objects.get(id=subcategory_id)
        except SubCategory.DoesNotExist:
            return Response(status=status.HTTP_404_NOT_FOUND)
        serializer = SubCategorySerializer(subcategory, data=request.data)
        if serializer.is_valid():
            serializer.save()
            return Response(serializer.data)
        return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)
    elif request.method == 'DELETE':
        try:
            subcategory = SubCategory.objects.get(id=subcategory_id)
        except SubCategory.DoesNotExist:
            return Response(status=status.HTTP_404_NOT_FOUND)
        subcategory.delete()
        return Response(status=status.HTTP_204_NO_CONTENT)

@api_view(['GET', 'POST', 'PUT', 'DELETE'])
@csrf_exempt
@permission_classes([IsAuthenticatedOrReadOnly])
def product_list(request, subcategory_id=None, product_id=None):
    try:
        subcategory = SubCategory.objects.get(id=subcategory_id)
    except SubCategory.DoesNotExist:
        return Response(status=status.HTTP_404_NOT_FOUND)
    if request.method == 'GET':
        products = Product.objects.filter(subcategory_id=subcategory_id)
        serializer = ProductSerializer(products, many=True)
        return Response(serializer.data)
    elif request.method == 'POST':
        serializer = ProductSerializer(data=request.data)
        if serializer.is_valid():
            serializer.save(subcategory=subcategory)
            return Response(serializer.data, status=status.HTTP_201_CREATED)
        return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)
    elif request.method == 'PUT':
        try:
            product = Product.objects.get(id=product_id)
        except Product.DoesNotExist:
            return Response(status=status.HTTP_404_NOT_FOUND)
        serializer = ProductSerializer(product, data=request.data)
        if serializer.is_valid():
            serializer.save()
            return Response(serializer.data)
        return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)
    elif request.method == 'DELETE':
        try:
            product = Product.objects.get(id=product_id)
        except Product.DoesNotExist:
            return Response(status=status.HTTP_404_NOT_FOUND)
        product.delete()
        return Response(status=status.HTTP_204_NO_CONTENT)


@api_view(['GET', 'POST', 'PUT', 'DELETE'])
@csrf_exempt
@permission_classes([IsAuthenticatedOrReadOnly])
def product_images(request, product_id=None, image_id=None):
    if request.method == 'GET':
        images = ProductImage.objects.filter(product_id=product_id)
        serializer = ProductImageSerializer(images, many=True)
        return Response(serializer.data)
    elif request.method == 'POST':
        try: 
            product = Product.objects.get(id=product_id)
        except Product.DoesNotExist:
            return Response(status=status.HTTP_404_NOT_FOUND)
        serializer = ProductImageSerializer(data=request.data)
        if serializer.is_valid():
            serializer.save(product=product)
            return Response(serializer.data, status=status.HTTP_201_CREATED)
        return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)
    elif request.method == 'PUT':
        try:
            image = ProductImage.objects.get(id=image_id)
        except ProductImage.DoesNotExist:
            return Response(status=status.HTTP_404_NOT_FOUND)
        serializer = ProductImageSerializer(image, data=request.data)
        if serializer.is_valid():
            serializer.save()
            return Response(serializer.data)
        return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)
    elif request.method == 'DELETE':
        try:
            image = ProductImage.objects.get(id=image_id)
        except ProductImage.DoesNotExist:
            return Response(status=status.HTTP_404_NOT_FOUND)
        image.delete()
        return Response(status=status.HTTP_204_NO_CONTENT)


@api_view(['GET', 'POST', 'PUT', 'DELETE'])
@csrf_exempt
@permission_classes([IsAuthenticatedOrReadOnly])
def category_field(request, category_id=None, field_id=None):
    if request.method == 'GET':
        fields = CategoryField.objects.filter(category_id=category_id)
        serializer = CategoryFieldSerializer(fields, many=True)
        return Response(serializer.data)
    elif request.method == 'POST':
        try: 
            category = Category.objects.get(id=category_id)
        except Category.DoesNotExist:
            return Response(status=status.HTTP_404_NOT_FOUND)
        serializer = CategoryFieldSerializer(data=request.data)
        if serializer.is_valid():
            serializer.save(category=category)
            return Response(serializer.data, status=status.HTTP_201_CREATED)
        return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)
    elif request.method == 'PUT':
        try:
            field = CategoryField.objects.get(id=field_id)
        except CategoryField.DoesNotExist:
            return Response(status=status.HTTP_404_NOT_FOUND)
        serializer = CategoryFieldSerializer(field, data=request.data)
        if serializer.is_valid():
            serializer.save()
            return Response(serializer.data)
        return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)
    elif request.method == 'DELETE':
        try:
            field = CategoryField.objects.get(id=field_id)
        except CategoryField.DoesNotExist:
            return Response(status=status.HTTP_404_NOT_FOUND)
        field.delete()
        return Response(status=status.HTTP_204_NO_CONTENT)


@api_view(['GET'])
@csrf_exempt
@permission_classes([IsAuthenticatedOrReadOnly])
def products_field_get(request, product_id=None):
    try:
        product = Product.objects.get(id=product_id)
    except Product.DoesNotExist:
        return Response(status=status.HTTP_404_NOT_FOUND)
    fields = ProductField.objects.filter(product=product)
    serializer = ProductFieldSerializer(fields, many=True)
    return Response(serializer.data)


@api_view(['POST', 'PUT', 'DELETE'])
@csrf_exempt
@permission_classes([IsAuthenticatedOrReadOnly])
def products_field(request, product_id=None, field_id=None):
    try:
        product = Product.objects.get(id=product_id)
    except Product.DoesNotExist:
        return Response(status=status.HTTP_404_NOT_FOUND)
    try:
        category = CategoryField.objects.get(id=field_id)
    except CategoryField.DoesNotExist:
        return Response(status=status.HTTP_404_NOT_FOUND)
    if request.method == 'POST':
        serializer = ProductFieldSerializer(data=request.data)
        if serializer.is_valid():
            serializer.save(product=product, category_field=category)
            return Response(serializer.data, status=status.HTTP_201_CREATED)
        return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)
    elif request.method == 'PUT':
        try:
            field = ProductField.objects.get(id=field_id)
        except ProductField.DoesNotExist:
            return Response(status=status.HTTP_404_NOT_FOUND)
        serializer = ProductFieldSerializer(field, data=request.data)
        if serializer.is_valid():
            serializer.save()
            return Response(serializer.data)
        return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)
    elif request.method == 'DELETE':
        try:
            field = ProductField.objects.get(id=field_id)
        except ProductField.DoesNotExist:
            return Response(status=status.HTTP_404_NOT_FOUND)
        field.delete()
        return Response(status=status.HTTP_204_NO_CONTENT)

@api_view(['GET'])
@csrf_exempt
@permission_classes([IsAuthenticatedOrReadOnly])
def product_all(request):
    products = Product.objects.all().filter(is_available=True)
    paginator = PageNumberPagination()
    paginator.page_size = 6
    products_count = products.count()
    page_count = products.count() // paginator.page_size + 1
    result_page = paginator.paginate_queryset(products, request)
    serializer = ProductSerializerRO(result_page, many=True)
    return Response({
        'result': serializer.data,
        'page_count': page_count,
        'products_count': products_count
        })
        
@api_view(['GET'])
@csrf_exempt
def product_all_for_search(request):
    products = Product.objects.all().filter(is_available=True)
    serializer = ProductSerializerRO(products, many=True)
    return Response(serializer.data)
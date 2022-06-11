from ecommerce.models import Category, SubCategory, Product, CategoryField, ProductField, ProductImage, ProductPrice
from rest_framework import serializers


class CategorySerializer(serializers.ModelSerializer):
    class Meta:
        model = Category
        fields = (
            'id',
            "name",
            "description",
            "image",
            "get_thumbnail",
            "get_webp"
        )


class SubCategorySerializer(serializers.ModelSerializer):
    class Meta:
        model = SubCategory
        fields = '__all__'


class ProductSerializer(serializers.ModelSerializer):
    class Meta:
        model = Product
        fields = '__all__'


class CategoryFieldSerializer(serializers.ModelSerializer):
    # category=CategorySerializer(read_only=True)
    class Meta:
        model = CategoryField
        fields = (
            'id',
            'category',
            'name',
            'unit',
        )


class ProductFieldSerializer(serializers.ModelSerializer):
    category_field = CategoryFieldSerializer(read_only=True)
    class Meta:
        model = ProductField
        fields = (
            'id',
            'category_field',
            'value',
            'product'
        )


class ProductImageSerializer(serializers.ModelSerializer):
    class Meta:
        model = ProductImage
        fields = '__all__'


class ProductPriceSerializer(serializers.ModelSerializer):
    class Meta:
        model = ProductPrice
        fields = '__all__'
from django.db import models
from io import BytesIO
from PIL import Image, ImageFilter
from django.core.files import File
import datetime

# Create your models here.

class Category(models.Model):
    name = models.CharField(max_length=100)
    description = models.TextField(max_length=1000, blank=True, null=True)
    image = models.ImageField(upload_to='images/', default='images/default.jpg')
    thumbnail = models.ImageField(upload_to='images/', blank=True, null=True)
    webp = models.ImageField(upload_to='images/', blank=True, null=True)
    is_available = models.BooleanField(default=True)

    def get_image(self):
        if self.image:
            return f'{self.image.url}' 
        return null

    def get_thumbnail(self):
        if self.thumbnail:
            return f'{self.thumbnail.url}' 
        else:
            if self.image:
                self.thumbnail = self.make_thumbnail(self.image)
                self.save()
                return f'{self.thumbnail.url}' 
            else:
                return null

    def get_webp(self):
        if self.webp:
            return f'{self.thumbnail.url}' 
        else:
            if self.image:
                self.webp = self.convert_to_webp(self.image)
                self.save()
                return f'{self.webp.url}' 
            else:
                return null

    def make_thumbnail(self, image, size=(400, 300)):
        img = Image.open(image)
        img.convert('RGB')
        if img.size[1] / img.size[0] < 0.75:
            a = img.size[0] - img.size[1] / 0.75
            img = img.crop((a / 2, 0, img.size[0] - a / 2, img.size[1]))
        elif img.size[1] / img.size[0] > 0.75:
            b = img.size[1] - img.size[0] * 0.75 
            img = img.crop((0, b / 2, img.size[0], (img.size[1] - b / 2)))
        img.thumbnail(size)
        thumb_io = BytesIO()
        img.save(thumb_io, 'JPEG')
        thumb_file = File(thumb_io, name=image.name)
        return thumb_file

    def convert_to_webp(self, image, size=(400, 300)):
        img = Image.open(image).convert('RGB')
        img.thumbnail(size)
        thumb_io = BytesIO()
        img.save(thumb_io, 'WEBP', quality=50)
        webp_file = File(thumb_io, name=image.name.replace('.jpg', '.webp'))
        return webp_file

    def __str__(self):
        return self.name

class SubCategory(models.Model):
    name = models.CharField(max_length=100)
    description = models.TextField(max_length=1000, blank=True, null=True)
    image = models.ImageField(upload_to='images/')
    thumbnail = models.ImageField(upload_to='images/', blank=True, null=True)
    category = models.ForeignKey(Category, on_delete=models.CASCADE)

    def get_image(self):
        if self.image:
            return f'{self.image.url}' 
        return ''

    def get_thumbnail(self):
        if self.thumbnail:
            return f'{self.thumbnail.url}' 
        else:
            if self.image:
                self.thumbnail = self.make_thumbnail(self.image)
                self.save()
                return f'{self.thumbnail.url}' 
            else:
                return ''

    def make_thumbnail(self, image, size=(400, 300)):
        img = Image.open(image)
        img.convert('RGB')
        if img.size[1] / img.size[0] < 0.75:
            a = img.size[0] - img.size[1] / 0.75
            img = img.crop((a / 2, 0, img.size[0] - a / 2, img.size[1]))
        elif img.size[1] / img.size[0] > 0.75:
            b = img.size[1] - img.size[0] * 0.75 
            img = img.crop((0, b / 2, img.size[0], (img.size[1] - b / 2)))
        img.thumbnail(size)
        thumb_io = BytesIO()
        thumb_io = BytesIO()
        img.save(thumb_io, 'WEBP', quality=50)
        webp_file = File(thumb_io, name=image.name.replace('.jpg', '.webp'))
        
        return webp_file

    def __str__(self):
        return self.name

class Product(models.Model):
    name = models.CharField(max_length=100)
    description = models.TextField(max_length=1000, blank=True, null=True)
    price_in_USD = models.DecimalField(max_digits=10, decimal_places=2)
    subcategory = models.ForeignKey(SubCategory, on_delete=models.CASCADE)
    created_at = models.DateTimeField(auto_now_add=True)
    sold_at = models.DateField(blank=True, null=True)
    is_available = models.BooleanField(default=True)

    def __str__(self):
        return self.name


class CategoryField(models.Model):
    name = models.CharField(max_length=100)
    unit = models.CharField(max_length=100, default='pcs', blank=True, null=True)
    category = models.ForeignKey(Category, on_delete=models.CASCADE)

    def __str__(self):
        return self.name


class ProductField(models.Model):
    category_field = models.ForeignKey(CategoryField, on_delete=models.CASCADE)
    value = models.CharField(max_length=100)
    product = models.ForeignKey(Product, on_delete=models.CASCADE)

    def __str__(self):
        return f'{self.product} - {self.category_field} - {self.value}'

class ProductImage(models.Model):
    image = models.ImageField(upload_to='images/')
    thumbnail = models.ImageField(upload_to='images/', blank=True, null=True)
    product = models.ForeignKey(Product, on_delete=models.CASCADE)

    def get_image(self):
        if self.image:
            return f'{self.image.url}' 
        return ''

    def get_thumbnail(self):
        if self.thumbnail:
            return f'{self.thumbnail.url}' 
        else:
            if self.image:
                self.thumbnail = self.make_thumbnail(self.image)
                self.save()
                return f'{self.thumbnail.url}' 
            else:
                return ''

    def make_thumbnail(self, image, size=(400, 300)):
        img = Image.open(image)
        img.convert('RGB')
        if img.size[1] / img.size[0] < 0.75:
            a = img.size[0] - img.size[1] / 0.75
            img = img.crop((a / 2, 0, img.size[0] - a / 2, img.size[1]))
        elif img.size[1] / img.size[0] > 0.75:
            b = img.size[1] - img.size[0] * 0.75 
            img = img.crop((0, b / 2, img.size[0], (img.size[1] - b / 2)))
        img.thumbnail(size)
        thumb_io = BytesIO()
        img.save(thumb_io, 'WEBP', quality=50)
        webp_file = File(thumb_io, name=image.name.replace('.jpg', '.webp'))
        return webp_file

    def __str__(self):
        return f'{self.product.name} - {self.image.name}'


class ProductPrice(models.Model):

    currency = models.CharField(max_length=100)
    currency_rate = models.DecimalField(max_digits=10, decimal_places=2)
    product = models.OneToOneField(Product, on_delete=models.CASCADE)

    def product_price_in_another_currency(self):
        return self.currency_rate * self.product.price_in_USD

    def __str__(self):
        return f'{self.product} - {round(self.product_price_in_another_currency(), 2)}'


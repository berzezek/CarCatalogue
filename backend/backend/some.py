from PIL import Image
from io import BytesIO
from django.core.files import File


"""
make function to convert image to webp
if image resolution large then 300x400 crop them to 300x400
"""
def convert_to_webp(image):
    img = Image.open(image)
    img.convert('RGB')
    if img.size[0] > 300 or img.size[1] > 400:
        img = img.crop(((img.size[0] - 300) / 2, (img.size[1] - 400) / 2, 300, 400))
    thumb_io = BytesIO()
    img.save(thumb_io, 'WEBP', quality=10)
    webp_file = File(thumb_io, name=image.name.replace('.jpg', '.webp'))
    return webp_file
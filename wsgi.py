import os
import sys
 
try:
  sys.path.remove('/usr/lib/python3/dist-packages')
except:
  pass
 
sys.path.append('/home/c/cn73530/lcmotorskorea/public_html/backend/')
sys.path.append('/home/c/cn73530/lcmotorskorea/public_html/venv/lib/python3.6/site-packages/')
 
os.environ.setdefault('DJANGO_SETTINGS_MODULE', 'backend.settings')
 
from django.core.wsgi import get_wsgi_application
application = get_wsgi_application()

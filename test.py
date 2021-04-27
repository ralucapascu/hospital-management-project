from django.db import connection
from .models import *

def my_custom_sql(self):
    with connection.cursor() as cursor:
        cursor.execute("SELECT id_post FROM post", [self.id_post])
        row = cursor.fetchone()

    return row
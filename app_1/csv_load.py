import csv
import os
from app_1.models import Products

CSV_FILE_PATH=os.path.join("static","csv","inst.csv")

def import_products():
    with open(CSV_FILE_PATH, newline='', encoding='utf-8') as csvfile:
        reader=csv.DictReader(csvfile)
        for row in reader:
            Products.objects.create(
                name=row['name'],
                category=row['category'],
                price=row['price'],
                image_url=row['image_url'],
                description=row['description'],
                stock=row['stock'],
            )
        print("Products imported successfully!")

if __name__=="__main__":
    import_products()
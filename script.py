'''
Python Script to auto generate data into MySQL 


'''
import pymysql
import random as rand
import data
import sys

products = []
# username = input("Enter your MySQL username: ")
# password = input("Enter your MySQL password: ")

client = pymysql.connect(
    host="db-mysql-nyc1-26951-do-user-14685697-0.c.db.ondigitalocean.com",
    user="doadmin",
    password="AVNS_ZxAXLPDXSco1qchGFKp",
    database='seafood_service_v4',
    port=25060
)

cursor = client.cursor()


def seafood_exists(seafood_name):
    return seafood_name in products


def insert_product_row(cursor, p_name, category, sell_price, qty_in_stock, product_img, p_description):
    query = '''
            INSERT INTO product(p_name, category, sell_price, qty_in_stock, product_img, p_description)
            VALUES (%s, %s, %s, %s, %s, %s)
            '''

    values = (p_name, category, sell_price,
              qty_in_stock, product_img, p_description)
    cursor.execute(query, values)


def execute_insert_product_row():
    try:
        random_seafood = data.random_product()

        if seafood_exists(random_seafood):
            sys.exit()
        categories = ["Frozen", "Fresh", "Non-Refrigerated"]
        random_category = rand.choice(categories)
        random_price = rand.randint(8, 20)
        random_qty = rand.randint(1, 200)
        random_img = f"https://picsum.photos/200/300?random={rand.randint(1, 1000)}"
        random_desc = data.random_description(random_seafood)

        insert_product_row(cursor, random_seafood, random_category,
                           random_price, random_qty, random_img, random_desc)
        client.commit()
        print("Success")
    except Exception as error:
        client.rollback()
        print(f'Error: {error}')


def insert_customer_row(cursor, c_fname, c_lname, email, pwd, phone, street, apt, state, zipcode):
    query = '''
            INSERT INTO customer(c_fname, c_lname, email, pwd, phone, street, apt, state, zip)
            VALUES (%s, %s, %s, %s, %s, %s, %s, %s, %s)
            '''

    values = (c_fname, c_lname, email, pwd, phone, street, apt, state, zipcode)
    cursor.execute(query, values)


def execute_customer_row():
    try:
        random_fname = data.random_fname()
        random_lname = data.random_lname()
        random_email = data.email()
        random_pwd = data.random_pwd()
        random_phone = data.random_phone()
        random_street = data.random_street()
        random_apt = data.random_apt()
        random_state = data.random_state()
        random_zip = data.random_zip()

        insert_customer_row(cursor, random_fname, random_lname, random_email, random_pwd,
                            random_phone, random_street, random_apt, random_state, random_zip)
        client.commit()
        print("Success")
    except Exception as error:
        client.rollback()
        print(f'Error: {error}')


'''
    execute in whatever range for fresh data... 
    (product will not duplicate if in already)
'''
for i in range(100):
    print(f"Inserting: {i}")
    execute_customer_row()
    execute_insert_product_row()


cursor.close()
client.close()

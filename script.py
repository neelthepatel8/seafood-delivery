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


def insert_delivery_partner_row(cursor, first_name, last_name, phone):
    query = '''
            INSERT INTO delivery_partner(first_name, last_name, phone)
            VALUES (%s, %s, %s)
            '''

    values = (first_name, last_name, phone)
    cursor.execute(query, values)


def execute_insert_delivery_partner():
    try:
        first_name = data.random_fname()
        last_name = data.random_lname()
        phone = data.random_phone()

        insert_delivery_partner_row(cursor, first_name, last_name, phone)
        client.commit()
        print("Success")
    except Exception as error:
        client.rollback()
        print(f'Error: {error}')


def get_partner_without_zip(cursor):
    query = '''SELECT partner_id FROM delivery_partner WHERE partner_id NOT IN(SELECT partner_id FROM delivery_zone)
    '''
    cursor.execute(query)
    no_zip = cursor.fetchall()
    return no_zip


def insert_into_delivery_zone(cursor):
    partner_with_no_zip = get_partner_without_zip(cursor)

    if not partner_with_no_zip:
        print("NONE!!")
        return

    query = '''
        INSERT INTO delivery_zone(zipcode, partner_id)
        VALUES(%s, %s)
        ON DUPLICATE KEY UPDATE zipcode=VALUES(zipcode)
    '''

    for each in partner_with_no_zip:
        random_zip = data.random_zip()
        values = (random_zip, each[0])
        cursor.execute(query, values)


def execute_delivery_zone():
    try:
        insert_into_delivery_zone(cursor)
        client.commit()
        print("Success")
    except Exception as error:
        client.rollback()
        print(f'Error: {error}')


'''

    execute in whatever range for fresh data... 
    (product will not duplicate if in already)
'''
# for i in range(100):
#     print(f"{i}: ", end=" ")
# execute_customer_row()
# execute_insert_product_row()
# execute_insert_delivery_partner()
# execute_delivery_zone()
# execute_insert_delivery_partner()
execute_delivery_zone()


cursor.close()
client.close()

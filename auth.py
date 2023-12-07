# This file contains functions to authenticate to your local MySQL database using streamlit.secrets.
# Your MySQL credentials are stored in a local ".streamlit/secrets.toml" file,
# and is not shared with anyone else running the app.
# Other users running the app will need to enter their own credentials to connect to their local MySQL client.

import os
import streamlit as st
import pymysql
import isf_config as config

# Authenticate to your local MySQL database using streamlit.secrets


def authenticate(db_name: str, username: str, password: str) -> pymysql.connections.Connection:

    try:
        connection = pymysql.connect(
            host="db-mysql-nyc1-26951-do-user-14685697-0.c.db.ondigitalocean.com",
            user="doadmin",
            port=25060,
            password="AVNS_ZxAXLPDXSco1qchGFKp",
            database="seafood_service_v4",
            cursorclass=pymysql.cursors.Cursor,
            # cursorclass=pymysql.cursors.DictCursor,
            autocommit=True)

        print(">>> Connected to", db_name, "<<<")
        print("-----------------------------------------")
        return connection

    except pymysql.Error as e:
        code, msg = e.args

        print(f"Connection to {config.DB_NAME} failed. Please try again.")
        print(f"Error code: {code}, Error message: {msg}")
        print("-----------------------------------------")

        return connectDB(db_name, None, None)

# Save the credentials to a local ".streamlit/secrets.toml" file
# so user don't have to enter them again whenever the web app try to connect to the database and fetch data


def save_secret(username: str, password: str):
    if not os.path.exists(config.SECRET_DIR):
        os.makedirs(config.SECRET_DIR)

    with open(config.SECRET_FILE, 'w') as file:
        # Write your db auth to your local secrets.toml file
        file.write(f'db_username = "{username}"\ndb_password = "{password}"')

# Read the stored credentials from the secrets.toml file if it exists, otherwise return None


def read_secret() -> tuple:
    if os.path.isfile(config.SECRET_FILE):
        username = st.secrets["db_username"]
        password = st.secrets["db_password"]
        return username, password
    else:
        return None, None

# set up the connection to your local database and return the connection object


def connectDB(db_name) -> pymysql.connections.Connection:
    username, password = read_secret()  # None, None if secrets.toml doesn't exist
    # auth with given credentials, or ask for and save new credentials to local if None, None
    my_db = authenticate(db_name, username, password)
    return my_db

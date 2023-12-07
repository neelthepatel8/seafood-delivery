import random
from faker import Faker
# pip install Faker


def random_product():
    seafood_list = [
        'Shrimp', 'Salmon', 'Tuna', 'Lobster', 'Crab', 'Mussels', 'Oysters', 'Clams',
        'Squid', 'Octopus', 'Cod', 'Haddock', 'Halibut', 'Trout', 'Sardines', 'Anchovies',
        'Scallops', 'Caviar', 'Crayfish', 'Catfish', 'Barramundi', 'Mahi Mahi', 'Grouper',
        'Sole', 'Hake', 'Mackerel', 'Yellowtail', 'Perch', 'Carp', 'Snapper', 'Eel',
        'Mullet', 'Prawns', 'Sea Bass', 'Herring', 'Monkfish', 'Redfish', 'Tilefish',
        'Sablefish', 'Turbot', 'Swordfish', 'Bluefish', 'Pompano', 'Arctic Char', 'Opah',
        'Wahoo', 'Bream', 'Parrotfish', 'Wolffish', 'Triggerfish', 'Surimi', 'Rockfish',
        'Butterfish', 'Black Drum', 'Amberjack', 'Sheepshead', 'Yellowfin Goby', 'Hoki',
        'Pink Salmon', 'Whitefish', 'Cuttlefish', 'Geoduck', 'Conch', 'Abalone', 'Cockles',
        'Dungeness Crab', 'Soft-shell Crab', 'King Crab', 'Snow Crab', 'Blue Crab',
        'Stone Crab', 'Spider Crab', 'Mantis Shrimp', 'Sea Urchin', 'Sea Cucumber',
        'Geoduck', 'Abalone', 'Limpet', 'Barnacle', 'Sea Squirt', 'Sea Sponge'
    ]
    return random.choice(seafood_list)


fake = Faker()


def random_fname():
    first_name = [fake.first_name() for _ in range(100)]
    name = random.choice(first_name)
    return name


def random_lname():
    last_name = [fake.last_name() for _ in range(100)]
    name = random.choice(last_name)
    return name


def email():
    email = fake.email()
    return email


def random_pwd():
    pwd = fake.password(length=12, special_chars=True,
                        digits=True, upper_case=True, lower_case=True)
    return pwd


def random_phone():
    phone = ""
    for _ in range(10):
        phone += str(random.randint(0, 9))

    return phone


def random_street():
    street = fake.street_address()
    return street


def random_apt():
    apt = f"apt {random.randint(1,100)}"
    return apt


def random_state():
    city = fake.state()
    return city


def random_description(product_name):
    adjectives = ["fresh", "frozen", "delicate", "tasty", "premium",
                  "wild-caught", "sustainable", "organic", "flavorful", "juicy"]
    preparations = ["filet", "whole", "sliced", "diced",
                    "smoked", "grilled", "steamed", "roasted", "fried", "baked"]

    adjective = random.choice(adjectives)
    preparation = random.choice(preparations)

    description = f"A {adjective} {product_name} {preparation}, perfect for any seafood dish."
    return description


def random_zip():
    boston_zipcodes = [
        "02108", "02109", "02110",
        "02111", "02112", "02113",
        "02114", "02115", "02116", "02117"
    ]
    zipcode = random.choice(boston_zipcodes)
    return zipcode

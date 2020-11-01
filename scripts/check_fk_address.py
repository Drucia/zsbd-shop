import sys

file_to_change = sys.argv[1]

valid_inserts = set()

with open(file_to_change, 'r') as file:
    for line in file:
        splitted = line.split("VALUES (")[1].split(")")[0].split(",")
        amount_of_cities = 2000
        amount_of_countries = 55
        amount_of_districts = 265

        cityID = int(splitted[3])
        countryID = int(splitted[4])
        districtID = int(splitted[5])

        if (cityID <= amount_of_cities and countryID <= amount_of_countries and districtID <= amount_of_districts):
            valid_inserts.add(line)

with open(file_to_change + "_new.sql",'w') as output:
    for insert in valid_inserts:
        output.write(insert)
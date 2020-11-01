import sys

file_to_change = sys.argv[1]

unique_inserts = set()

with open(file_to_change, 'r') as file:
    for line in file:
        unique_inserts.add(line)
    
with open(file_to_change + "_unique.sql",'w') as output:
    for insert in unique_inserts:
        output.write(insert)
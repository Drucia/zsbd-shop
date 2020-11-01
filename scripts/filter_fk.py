import sys

file_to_change = sys.argv[1]
column_to_check = int(sys.argv[2])
max_value = int(sys.argv[3])

valid_inserts = set()

with open(file_to_change, 'r') as file:
    # allFile = file.read();
    # for line in allFile.split("[0-9]\);"): - for Review
    for line in file:
        splitted = line.split("VALUES (")[1].split(");")[0].split(",")
        # print(splitted)
        column = int(splitted[len(splitted) - column_to_check])

        if (column <= max_value):
            valid_inserts.add(line)

with open(file_to_change + "_" + str(column_to_check) + ".sql",'w') as output:
    for insert in valid_inserts:
        output.write(insert)
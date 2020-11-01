import sys

file_to_change = sys.argv[1]

valid_inserts = set()

with open(file_to_change, 'r') as file:
    for line in file:
        splitted = line.split("VALUES (")[1].split(");")[0].split(",")
        amount_of_colors = 17
        amount_of_console_producers = 37
        amount_of_monitor_producers = 40
        amount_of_game_genries = 13

        # constraints for monitors
        if ("MonitorProducerID" in line):
            monitor_producer_column = len(splitted)-3
            color_column = len(splitted)-2

            if (int(splitted[monitor_producer_column]) <= amount_of_monitor_producers):
                if (splitted[color_column] == "NULL" or (splitted[color_column] != "NULL" and int(splitted[color_column]) <= amount_of_colors)):
                    valid_inserts.add(line)

        # constraints for games
        if ("GameGenreID" in line):
            genre_column = len(splitted)-2

            if (int(splitted[genre_column]) <= amount_of_game_genries):
                valid_inserts.add(line)

        # constraints for consoles
        if ("ConsoleProducerID" in line):
            console_producer_column = len(splitted)-2
            color_column = len(splitted)-3

            if (int(splitted[console_producer_column]) <= amount_of_console_producers):
                if (splitted[color_column] == "NULL" or (splitted[color_column] != "NULL" and int(splitted[color_column]) <= amount_of_colors)):
                    valid_inserts.add(line)

with open(file_to_change + "_new.sql",'w') as output:
    for insert in valid_inserts:
        output.write(insert)
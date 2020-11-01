import csv
import os.path
import random


def get_random_lines():

    book_path = os.path.abspath(os.path.join(
        os.path.dirname(__file__), '..', 'books', 'books.txt'))

    result = ""
    with open(book_path) as f:
        lines = f.readlines()

        start_line = random.randint(0, len(lines))
        line_count = random.randint(3, 7)

        for i in range(line_count):
            result += lines[start_line + i]

        return result


def add_content():
    csv_path = os.path.abspath(os.path.join(
        os.path.dirname(__file__), '..', 'csv_to_generate', 'Review2.csv'))
    rows = []

    with open(csv_path, 'r') as f:
        reader = csv.reader(f)
        # skip website header
        _ = next(reader, None)
        _ = next(reader, None)
        _ = next(reader, None)

        headers = next(reader, None)

        book_path = os.path.abspath(os.path.join(
            os.path.dirname(__file__), '..', 'books', 'booksshort.txt'))

        result = ""
        # produktów 7k
        with open(book_path) as f2:
            lines = f2.readlines()
            for row in reader:
                start_line = random.randint(0, len(lines) - 100)
                line_count = random.randint(3, 7)
                for i in range(line_count):
                    result += lines[start_line + i]

                row[0] = result.replace('\n', ' ').replace('\r', '')
                result = ""
                rows.append(row)

    return rows, headers


with open('reviewV2.csv', 'w', newline='') as file:
    writer = csv.writer(file)
    row_list, headers = add_content()
    writer.writerow(headers)
    writer.writerows(row_list)
    print(headers)

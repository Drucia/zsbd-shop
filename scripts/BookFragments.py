import os.path
import random


def get_random_number_of_lines():

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


print(get_random_number_of_lines())

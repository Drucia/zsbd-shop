import csv
import os.path


def add_content():
    csv_path = os.path.abspath(os.path.join(
        os.path.dirname(__file__), '..', 'csv_to_generate', 'Client.csv'))
    rows = []

    with open(csv_path, 'r') as f:
        reader = csv.reader(f)
        # skip website header
        _ = next(reader, None)
        _ = next(reader, None)
        _ = next(reader, None)

        headers = next(reader, None)
        i = 1
        for row in reader:
            row[9] = i
            rows.append(row)
            i += 1

    return rows, headers


with open('client2.csv', 'w', newline='') as file:
    writer = csv.writer(file)
    row_list, headers = add_content()
    writer.writerow(headers)
    writer.writerows(row_list)
    print(headers)

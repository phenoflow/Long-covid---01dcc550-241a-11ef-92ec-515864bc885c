# oxford, 2024.

import sys, csv, re

codes_exclude = [{"code":"4897","system":"TADDS"},{"code":"4898","system":"TADDS"},{"code":"4899","system":"TADDS"}];

with open(sys.argv[1], 'r') as file_in, open('long-covid-potential-cases.csv', 'w', newline='') as file_out:
    csv_reader = csv.DictReader(file_in)
    csv_writer = csv.DictWriter(file_out, csv_reader.fieldnames + ["covid19-coronavirus---tadds-exclusion"])
    csv_writer.writeheader();
    codes_identified = 0;
    for row in csv_reader:
        newRow = row.copy();
        newRow["covid19-coronavirus---tadds-exclusion"] = "FALSE";
        for cell in row:
            # Iterate cell lists (e.g. codes)
            for item in re.findall(r'\(([^,]*)\,', row[cell]):
                if(item in list(map(lambda code: code['code'], codes_exclude))):
                    newRow["covid19-coronavirus---tadds-exclusion"] = "TRUE";        
        csv_writer.writerow(newRow);

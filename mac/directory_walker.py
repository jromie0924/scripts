import os
import csv

directories = []
FILE_NAME = "directories.csv"

def walk(d):
  for root, dirs, _ in os.walk(d):
    for name in sorted(dirs):
      directories.append(os.path.join(root, name))
  with open(FILE_NAME, "w") as f:
    writer = csv.writer(f)
    for dir in sorted(directories):
      writer.writerow([dir])




if __name__ == "__main__":
  walk(".")
  #print(f"Finished - output written to ./{FILE_NAME}")
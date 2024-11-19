import rayexec
import timeit
import sys

query = sys.stdin.read()
print(query)

con = rayexec.connect()

with open("log.txt", "a") as log:
    for try_num in range(3):
        start = timeit.default_timer()
        print(con.query(query))
        end = timeit.default_timer()
        time = end - start
        print(time)
        log.write(f"{time}\n")

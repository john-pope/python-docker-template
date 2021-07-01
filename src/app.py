import os

DB_USER = os.environ.get("SOME_SERVICE_USER")
DB_PASSWORD = os.environ.get("SOME_SERVICE_PASSWORD")

def main():
    print(DB_USER, DB_PASSWORD)

if __name__ == "__main__":
    main()

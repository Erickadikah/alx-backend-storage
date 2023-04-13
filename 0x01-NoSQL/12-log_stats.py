#!/usr/bin/env python3
"""Checking the status of Nginx logs stored in MongoDB"""

from pymongo import MongoClient

if __name__ == '__main__':
    client = MongoClient("mongodb://127.0.0.1:27017")
    nginx = client.logs.nginx

    log = nginx.count_documents({})
    get = nginx.count_documents({"method": "GET"})
    post = nginx.count_documents({"method": "POST"})
    put = nginx.count_documents({"method": "PUT"})
    patch = nginx.count_documents({"method": "PATCH"})
    delete = nginx.count_documents({"method": "DELETE"})
    status_check = nginx.count_documents(
        {"$and": [{"method": "GET"}, {"path": "/status"}]})

    print(f"Total number of logs: {log}")
    print(f"Number of GET requests: {get}")
    print(f"Number of POST requests: {post}")
    print(f"Number of PUT requests: {put}")
    print(f"Number of PATCH requests: {patch}")
    print(f"Number of DELETE requests: {delete}")
    print(f"Number of successful GET requests to /status endpoint: {status_check}")



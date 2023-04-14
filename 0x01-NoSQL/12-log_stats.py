#!/usr/bin/env python3
"""Checking the status of Nginx logs stored in MongoDB
    Database: logs
    Collection: nginx
    method = ["GET", "POST", "PUT", "PATCH", "DELETE"]
"""

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

    print('''{} logs
    Methods:
            method GET: {}
            method POST:{}
            method PUT : {}
            method PATCH: {}
            method DELETE:{}
    {} status check'''
          .format(log, get, post, put, patch, delete, status_check)
          )

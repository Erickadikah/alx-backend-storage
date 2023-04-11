#!/usr/bin/env python3

def insert_school(mongo_collection, **kwargs):
    document = kwargs
    result = mongo_collection.insert_one(document)
    return result.inserted_id

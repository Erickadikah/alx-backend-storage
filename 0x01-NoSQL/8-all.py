#!/usr/bin/env python3
"""function that list all documents in a collection
"""


def list_all(mongo_collection):
    """returns all the  documents in a collection"""
    return mongo_collection.find()

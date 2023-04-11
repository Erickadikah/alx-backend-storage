#!/usr/bin/env python3
"""function to change all topics of school document based on name
"""

def update_topics(mongo_collection, name, topics):
    """this function will will change all topics of all school document based on name
    """
    result = mongo_collection.update_many({"name": name}, {"$set": {"topics" : topics}})
    return result.modified_count

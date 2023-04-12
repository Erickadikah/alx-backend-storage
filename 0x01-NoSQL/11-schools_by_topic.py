#!/usr/bin/env python3
"""function to return list of school having specific topic"""


def schools_by_topic(mongo_collection, topic):
    """takes in topic as an argument"""
    result = mongo_collection.find({"topic": topic})
    return result

#!/usr/bin/env python3
"""this class stores an instance of the reddis
    client as private variable named _reddis
    using redis.Redis() we flush instance of redis
"""

import redis
import uuid
from typing import Union


class Cache:
    def __init__(self):
        """store method to take data as argument and return sring
        """
        self._redis = redis.Redis()
        self._redis.flushdb()

    def store(self, data: Union[str, bytes, int, float]) -> str:
        """anotation to return a string
            in a rndom key and returns key
        """
        key = str(uuid.uuid4())
        self._redis.set(key, data)
        return key

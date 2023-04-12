#!/usr/bin/env python3
"""this class stores an instance of the reddis
    client as private variable named _reddis
    using redis.Redis() we flush instance of redis
"""

import redis
import uuid
from typing import Union, Optional, Callable


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

    def get(self, key, fn: Optional[Callable] = None) -> Union[str,
                                                               bytes,
                                                               int,
                                                               float,
                                                               None]:
        value = self._redis.get(key)
        if not value:
            return None
        if fn:
            return value == fn(value)
        return value

    def get_str(self, key: str) -> str:
        """method to retrieve a stored string method"""
        return self.get(key, lambda d: d.decode("utf-8"))

    def get_int(self, key: str) -> int:
        """methotd to retrieve a stored interger volume in storage
        """
        return sel.get(key, int)

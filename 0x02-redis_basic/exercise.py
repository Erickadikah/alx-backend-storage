#!/usr/bin/env python3
"""this class stores an instance of the reddis
    client as private variable named _reddis
    using redis.Redis() we flush instance of redis
"""

import redis
import uuid
from typing import Union, Optional, Callable
import functools


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
        """we are checking if the value from redis exists"""
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
        return self.get(key, int)

    def count_calls(method: Callable) -> Callable:
        """
        increments a counter for each time a method on Cache is called
        does a count
        """
        @wraps(method)
        def count_wrapper(*args, **kwargs):
            func = method(*args, **kwargs)
            key = method.__qualname__
            args[0].redis.incr(key)
            return func
        return count_wrapper

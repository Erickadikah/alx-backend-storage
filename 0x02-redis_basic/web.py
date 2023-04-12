#!/usr/bin/env python3
"""
Implementation of an expiring web cache and tracker
"""

import requests
import redis
from functools import wraps

r = redis.Redis()


def count_access(method):
    """
    Decorator to get count for each access to the page
    count:{} tracks how many times url was accessed
    """
    @wraps(method)
    def wrapper(url):
        html_content = method(url)
        key = "count:{}".format(url)
        r.incr(key)
        cached_key = "cached:{}".format(url)
        cached_response = r.get(cached_key)
        if cached_response:
            return cached_response.decode('utf-8')
        r.setex(cached_key, 10, html_content)
        return html_content
    return wrapper


@count_access
def get_page(url: str) -> str:
    """
    Returns the response from a request on the url
    expires after 10sec
    """
    req = requests.get(url)
    return req.text

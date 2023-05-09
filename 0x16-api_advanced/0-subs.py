#!/usr/bin/python3
"""query the Reddit API and returns the number of subscribers"""

import requests


def number_of_subscribers(subreddit):
    """query the Reddit API and returns the number of subscribers"""
    headers = {'User-Agent': 'Mozilla/5.0 (Linux; Android 12; SM-S906N\
               Build/QP1A.190711.020; wv) AppleWebKit/537.36 (KHTML,\
               like Gecko) Version/4.0 Chrome/80.0.3987.119 Mobile\
               Safari/537.36'}
    data = requests.get(
        'https://www.reddit.com/r/{}/about.json'.format(subreddit),
        headers=headers).json()
    return data['data']['subscribers']

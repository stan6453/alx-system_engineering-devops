#!/usr/bin/python3
""" recursive function that queries the Reddit API and
returns a list containing the titles of all hot articles
for a given subreddit. """

import requests


def recurse(subreddit, hot_list=[]):
    """ recursive function that queries the Reddit API and
    returns a list containing the titles of all hot articles
    for a given subreddit. """

    headers = {'User-Agent': 'Mozilla/5.0 (Linux; Android 12; SM-S906N\
               Build/QP1A.190711.020; wv) AppleWebKit/537.36 (KHTML,\
               like Gecko) Version/4.0 Chrome/80.0.3987.119 Mobile\
               Safari/537.36'}
    try:
        data = requests.get(
            'https://www.reddit.com/r/{}/hot/.json?limit=10'.format(subreddit),
            headers=headers, allow_redirects=False).json()
        [print(post['data']['title']) for post in data['data']["children"]]
    except Exception:
        print('None')

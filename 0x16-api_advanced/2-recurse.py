#!/usr/bin/python3
""" recursive function that queries the Reddit API and
returns a list containing the titles of all hot articles
for a given subreddit. """

import requests


def recurse(subreddit, hot_list=[], after='', count=0):
    """ recursive function that queries the Reddit API and
    returns a list containing the titles of all hot articles
    for a given subreddit. """

    headers = {'User-Agent': 'Mozilla/5.0 (Linux; Android 12; SM-S906N\
               Build/QP1A.190711.020; wv) AppleWebKit/537.36 (KHTML,\
               like Gecko) Version/4.0 Chrome/80.0.3987.119 Mobile\
               Safari/537.36'
               }
    parameters = {
        'after': after,
        'count': count,
        'limit': 100
    }
    try:
        data = requests.get(
            'https://www.reddit.com/r/{}/hot/.json'.format(subreddit),
            headers=headers, params=parameters, allow_redirects=False).json()
        hot_list.extend([post['data']['title']
                        for post in data['data']["children"]])
        # print('aftre', data['data']['after'])
        # print('count', count+data['data']['dist'])
        # print('dist', data['data']['dist'])
        if data['data']['after']:
            return recurse(subreddit, hot_list,
                           after=data['data']['after'],
                           count=count+data['data']['dist'])
        else:
            return hot_list
    except Exception:
        return None

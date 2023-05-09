#!/usr/bin/python3
"""queries the Reddit API, parses the title of all hot articles,
and prints a sorted count of given keywords"""

import re
import requests


def count_words(subreddit, word_list, word_dict={},
                after='', count=0, not_first=0):
    """queries the Reddit API, parses the title of all hot articles,
    and prints a sorted count of given keywords"""

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
        [filter_word(word_list, word_dict, post['data']['title'])
         for post in data['data']["children"]]

        if data['data']['after']:
            count_words(subreddit, word_list, word_dict,
                        after=data['data']['after'],
                        count=count+data['data']['dist'], not_first=1)
            if not_first == 0:
                for key, value in sorted(word_dict.items(),
                                         key=lambda val: (-val[1], val[0])):
                    print('{}:'.format(key), value)
    except Exception:
        return None


def filter_word(word_list, word_dict, string):
    """filter words count number of words and all it to total in word_dict"""
    word_list = [word.lower() for word in word_list]

    for word in word_list:
        reg_string = r'\b{}\b'.format(word)
        word_count = len(re.findall(reg_string, string, flags=re.IGNORECASE))
        if word_count > 0:
            if word_dict.get(word, None) is None:
                word_dict[word] = word_count
            else:
                word_dict[word] = word_dict[word] + word_count

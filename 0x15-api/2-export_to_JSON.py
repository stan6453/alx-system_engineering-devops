#!/usr/bin/python3
"""query an API endpoint"""

import json
from sys import argv
import requests

employee_id = argv[1]
user = requests.get(
    'https://jsonplaceholder.typicode.com/users/{}'.format(employee_id)).json()
all_todos = requests.get('https://jsonplaceholder.typicode.com/todos').json()
user_todos = [todo for todo in all_todos if user['id'] == todo['userId']]

user_dict = {}
user_dict[user['id']] = []

for todo in user_todos:
    todo['username'] = user['username']
    todo['task'] = todo['title']
    del todo['userId']
    del todo['id']
    del todo['title']
    user_dict[user['id']].append(todo)

with open('{}.json'.format(user['id']), 'w') as file:
    json.dump(user_dict,file)

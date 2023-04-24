#!/usr/bin/python3
"""query an API endpoint"""

import json
from sys import argv
import requests

employee_id = argv[1]
users = requests.get(
    'https://jsonplaceholder.typicode.com/users/').json()
all_todos = requests.get('https://jsonplaceholder.typicode.com/todos').json()

users_dict = {}












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

with open('USER_ID.json', 'w') as file:
    json.dump(user_dict,file)

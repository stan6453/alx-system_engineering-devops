#!/usr/bin/python3
"""query an API endpoint"""

import requests
from sys import argv

employee_id = argv[1]
user = requests.get(
    'https://jsonplaceholder.typicode.com/users/{}'.format(employee_id)).json()
all_todos = requests.get('https://jsonplaceholder.typicode.com/todos').json()
user_todos = [todo for todo in all_todos if user['id'] == todo['userId']]

number_of_tasks = 0
for todo in user_todos:
    number_of_tasks += 1

number_of_task_done = 0
for todo in user_todos:
    if todo['completed'] == True:
        number_of_task_done += 1

with open('USER_ID.csv', 'w') as f:
    """f.write('"USER_ID","USERNAME","TASK_COMPLETED_STATUS","TASK_TITLE"\n')"""
    for todo in user_todos:
        f.write('"{}","{}","{}","{}"\n'
                .format(user['id'], user['username'], todo['completed'], todo['title']))

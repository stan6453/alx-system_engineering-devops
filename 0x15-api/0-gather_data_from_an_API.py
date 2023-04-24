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

print('Employee {} is done with tasks({}/{}):'
      .format(user['name'], number_of_task_done, number_of_tasks)
      )
for todo in user_todos:
    if todo['completed'] == True:
        print('\t {}'.format(todo['title']))
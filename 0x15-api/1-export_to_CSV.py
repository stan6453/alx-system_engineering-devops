#!/usr/bin/python3
"""query an API endpoint"""

import requests
from sys import argv

if __name__ == "__main__":
    employee_id = argv[1]
    user = requests.get(
        'https://jsonplaceholder.typicode.com/users/{}'
        .format(employee_id)).json()
    all_todos = requests.get(
        'https://jsonplaceholder.typicode.com/todos').json()
    user_todos = [todo for todo in all_todos if user['id'] == todo['userId']]

    with open(str(user['id']) + '.csv', 'w') as f:
        for index, todo in enumerate(user_todos):
            if index == len(user_todos)-1:
                f.write('"{}","{}","{}","{}"'.format(
                    user['id'], user['username'],
                    todo['completed'], todo['title']
                ))
            else:
                f.write('"{}","{}","{}","{}"\n'.format(
                    user['id'], user['username'],
                    todo['completed'], todo['title']
                ))

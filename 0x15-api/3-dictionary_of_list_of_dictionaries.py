#!/usr/bin/python3
"""query an API endpoint"""

import json
import requests

if __name__ == "__main__":
    users = requests.get(
        'https://jsonplaceholder.typicode.com/users').json()
    all_todos = requests.get(
        'https://jsonplaceholder.typicode.com/todos').json()

    users_dict = {}

    for user in users:
        user_id = user['id']
        for todo in all_todos:
            todo = todo.copy()
            if user_id == todo['userId']:
                if str(user_id) in users_dict:
                    todo['username'] = user['username']
                    todo['task'] = todo['title']
                    del todo['userId']
                    del todo['id']
                    del todo['title']
                    users_dict[str(user_id)].append(todo)
                else:
                    users_dict[str(user_id)] = []
                    todo['username'] = user['username']
                    todo['task'] = todo['title']
                    del todo['userId']
                    del todo['id']
                    del todo['title']
                    users_dict[str(user_id)].append(todo)

    with open('todo_all_employees.json', 'w') as file:
        json.dump(users_dict, file)

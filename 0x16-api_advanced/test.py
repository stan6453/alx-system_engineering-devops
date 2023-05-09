#!/usr/bin/python3

# import re
# string = r'\b{}\b'.format('cat')
# print(len(re.findall(string, 'string cat catm mancat cat', flags=re.IGNORECASE)))


word_dict={
    'ruby' : 13,
    'python': 26,
    'zavi':26,
    'java' : 26,
    'galpa':14
}

for key,value in sorted(word_dict.items(), key=lambda val: (-val[1], val[0])):
    print(key,':', value)
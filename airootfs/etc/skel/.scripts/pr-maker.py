#!/usr/bin/env python
repo = "Server"
upstream = "https://github.com/frc1678/server-2020/"
text = input("PR name & number: ")
new = text.split('#')
print(f'{repo} PR#{new[1].rstrip()} `{new[0].rstrip().lstrip()}` {upstream}pull/{new[1]}')

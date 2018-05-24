# Introduction
How to push code to github.com without enter username and password

## Issue
Every time you push code to github.com, it prompts to enter the
username and password, which is very annoying.

## Solution
From stackoverflow.com, many answers are like this:
```
$ git config credential.helper store
$ git push https://github.com/<username>/<reponame>.git
Username for 'https://github.com': <USERNAME>
Password for 'https://USERNAME@github.com': <PASSWORD>
```

After that, you need not enter them any more. 
But I found if I config the `credential.helper` with `--global` it will work for other repositories as well.

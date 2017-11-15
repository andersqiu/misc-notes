#!/usr/bin/env python

import sys
import os


ALIYUN_PIP_CONFIG = \
'''[global] 
index-url = http://mirrors.aliyun.com/pypi/simple/ 

[install] 
trusted-host=mirrors.aliyun.com 
'''

def add_pip_config_file():
    '''Add Aliyun mirrros for the pip configuration.
    '''
    pip_dir = os.path.join(os.path.expanduser('~'), '.pip')
    pip_name = 'pip.conf'
    platform = sys.platform;
    if platform == 'win32':
        pip_name = 'pip.ini'
    
    pip_file = os.path.join(pip_dir, pip_name)
    
    if not os.path.exists(pip_dir):
        os.mkdir(pip_dir)

    if not os.path.exists(pip_file):
        with open(pip_file, 'w') as fp:
            fp.write(ALIYUN_PIP_CONFIG)


if __name__ == '__main__':
    add_pip_config_file()

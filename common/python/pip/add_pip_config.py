#!/usr/bin/env python

import sys
import os


ALIYUN_PIP_CONFIG = \
'''[global] 
index-url = https://mirrors.aliyun.com/pypi/simple/ 

[install] 
trusted-host=mirrors.aliyun.com 
'''

def add_pip_config_file():
    '''Add Aliyun mirrros for the pip configuration.
    '''
    pip_dirname = '.pip'
    pip_name = 'pip.conf'
    platform = sys.platform
    if platform == 'win32':
        pip_dirname = 'pip'
        pip_name = 'pip.ini'

    # For Windows and macOS, the pip configuration file is at ~/.pip
    # For Linux platform, the pip configration file should be /etc
    # to take effect systematically.
    if platform in ('win32', 'darwin'):
        pip_dir = os.path.join(os.path.expanduser('~'), pip_dirname)
    else:
        pip_dir = os.getcwd()
    pip_file = os.path.join(pip_dir, pip_name)
    
    if not os.path.exists(pip_dir):
        print('Generating directory %s...' % pip_dir)
        os.mkdir(pip_dir)
        print('Directory %s generated.' % pip_dir)
    else:
        print('Pip configuration directory %s found.' % pip_dir)

    if not os.path.exists(pip_file):
        print('Generating pip configuration file %s...' % pip_file)
        with open(pip_file, 'w') as fp:
            fp.write(ALIYUN_PIP_CONFIG)
        print('Pip configuration file %s generated.' % pip_file)
    else:
        print('Pip configuration file %s found, skip generating it.' % 
		pip_file)


if __name__ == '__main__':
    add_pip_config_file()
    print('Done.')

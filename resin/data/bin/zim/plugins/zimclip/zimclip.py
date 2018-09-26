#!/usr/bin/python
'''
Script to enable communications between Web Browser and Zim.

See <https://github.com/mdn/webextensions-examples/blob/master/native-messaging/app/ping_pong.py>
for message related methods.

'''
import os
import sys
import json
import struct
import subprocess

CFG_PATH = os.path.join(os.path.dirname(os.path.realpath(__file__)), 'config.json')

def call_zim(cmd_line):
    '''
    Call quicknote zim plugin
    @param cmd_line: Command line (str[]) to execute
    '''
    stdout = subprocess.PIPE
    stderr = subprocess.PIPE
    proc = subprocess.Popen(cmd_line, cwd=None, stdout=stdout, stderr=stderr)

def get_command_line(args):
    '''
    Build command line to call quicknote plugin
    @param args: Data sent (str[]) by web ext
    '''
    cfg_file = open(CFG_PATH, 'r')
    config = json.loads(cfg_file.read())
    cfg_file.close()
    cmd_line = [
        config['path'],
        '--plugin',
        'quicknote',
        'encoding=url',
        'namespace=' + config[args.pop()]
    ]
    return cmd_line + args

def get_message():
    '''
    Read web ext message
    @returns str[]
    '''
    raw_length = sys.stdin.read(4)
    if len(raw_length) == 0:
        return None
    length = struct.unpack('@I', raw_length)[0]
    message = sys.stdin.read(length)
    return json.loads(message)

def encode_message(message):
    '''
    Message encoding
    '''
    encoded = json.dumps(message)
    length = struct.pack('@I', len(encoded))
    return {'length': length, 'content': encoded}

def send_message(encoded):
    '''
    Send an encoded message to stdout.
    '''
    sys.stdout.write(encoded['length'])
    sys.stdout.write(encoded['content'])
    sys.stdout.flush()

def run():
    '''
    Receive request from web extension and try to run zim command line.
    '''
    message = get_message()
    if message is None:
        send_message(encode_message({'error': 'Unable to read message'}))
    else:
        cmd = get_command_line(message)
        if cmd is None:
            send_message(encode_message({'error': 'Unable to create command line'}))
        else:
            call_zim(cmd)

# run
run()

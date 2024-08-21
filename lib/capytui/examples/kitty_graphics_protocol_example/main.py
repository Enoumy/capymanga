#!/usr/bin/python

import sys
from base64 import standard_b64encode


def serialize(**cmd):
    payload = cmd.pop('payload', None)
    cmd = ','.join(f'{k}={v}' for k, v in cmd.items())
    out = []
    out.append(b'\033_G')
    out.append(cmd.encode('ascii'))
    if payload:
        out.append(b';')
        out.append(payload)
    out.append(b'\033\\')
    return b''.join(out)


def write_chunked(**cmd):
    data = standard_b64encode(cmd.pop('data'))
    while data:
        chunk, data = data[:4096], data[4096:]
        more = 1 if data else 0
        sys.stdout.buffer.write(serialize(payload=chunk, m=more, **cmd))
        sys.stdout.flush()
        cmd.clear()


def main():
    with open(sys.argv[-1], 'rb') as f:
        write_chunked(a='T', f=100, data=f.read())


if __name__ == '__main__':
    main()

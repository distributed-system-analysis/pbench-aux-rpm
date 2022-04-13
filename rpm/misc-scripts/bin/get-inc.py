#! /usr/bin/env python
from __future__ import print_function

import sys

seqno = int(open(sys.argv[1]).read()) + 1
with open(sys.argv[1], "w") as f:
    f.write(str(seqno))
    f.write('\n')
print(seqno)

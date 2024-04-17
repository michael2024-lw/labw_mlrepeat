# Licensed under the Apache License: http://www.apache.org/licenses/LICENSE-2.0
# For details: https://gitlab.com/mlrep/mldev/-/blob/master/NOTICE.md

import sys


def sample_function(ok=True):
    return ok


class TestClass:

    @staticmethod
    def static():
        pass

    def __init__(self):
        pass

if __name__ == "__main__":
    print(sys.argv[0])
#!/bin/sh
set -o verbose
python setup.py build 
python setup.py install --home=$HOME
PYTHONPATH=$PYTHONPATH:~/lib/python
python -m timeit -s 'import fastrand' 'fastrand.pcg32bounded(1001)'
python -m timeit -s 'import random' 'random.random()'
python -m timeit -s 'import random' 'random.randint(0,1000)'
python -m timeit -s 'import random' 'int(random.random() * 1001)'

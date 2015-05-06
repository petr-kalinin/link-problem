#!/bin/sh
rm -rf *.o *.so app
g++ -shared -fPIC bar.cpp -o libbar.so || exit 1
g++ -shared -fPIC foo.cpp -o libfoo.so || exit 1
g++ -fPIC -lfoo -L. app.cpp -o app || exit 1  # this does not work: ./libfoo.so: undefined reference to `bar()'
g++ -fPIC -lfoo -lbar -L. app.cpp -o app || exit 1  # this works


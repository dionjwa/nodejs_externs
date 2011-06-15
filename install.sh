#! /usr/bin/env sh
../hydrax/bin/createhaxelib.py haxelib.xml
haxelib test nodejs_externs.zip
rm nodejs_externs.zip
haxelib dev nodejs_externs /Users/dion/storage/projects/nodejs_externs


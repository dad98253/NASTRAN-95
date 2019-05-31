#!/bin/bash
for f in *.out; do cat "$f" | /home/dad/workspace/fixnastranoutput/Release/fixnastranoutput -k > "${f%.out}.inp.out.striped"; done
for f in *.out.striped; do cat "$f" | sha1sum > "${f%.out.striped}.demo.sha1"; done



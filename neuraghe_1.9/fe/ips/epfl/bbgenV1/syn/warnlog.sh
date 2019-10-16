#!/bin/bash
egrep -i "warning|error" synt.log | \
egrep -v "UID-109|TFCHK-|Inconsistent Data|Reference Library Inconsistent|CMD-036|UID-95|UID-1329|TLUP-|UPF-087|UID-1008|VO-4|OPT-1342|PWR-893|OPT-1404|UCN-4|CTL model|error_info" > warns.log

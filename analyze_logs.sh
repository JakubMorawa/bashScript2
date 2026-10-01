# Put the following in analyze_logs.sh:
#!/usr/bin/env bash
echo "Application errors"
grep -i "ERROR" logs/application.log
echo "System errors"
grep -i "ERROR" logs/system.log



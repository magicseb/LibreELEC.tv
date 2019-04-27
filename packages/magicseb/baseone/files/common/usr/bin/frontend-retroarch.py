#!/usr/bin/python
import subprocess
subprocess.call("systemd-run /usr/bin/retroarch.start", shell=True)

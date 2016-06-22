#!/bin/bash
echo $(date | awk '{print $2" "$3" "$6}')

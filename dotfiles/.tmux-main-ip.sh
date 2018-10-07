#!/bin/bash
ip -br a show dev ens33 | sed 's/  */ /g' | cut -d' ' -f3 | cut -d'/' -f1
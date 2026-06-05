#!/bin/bash
git checkout --end-of-options main --
git pull --progress -v --no-rebase --tags --prune -- "origin"

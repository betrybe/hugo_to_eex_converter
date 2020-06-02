#!/bin/bash

set -x
pwd
ls -lah
ls -lah /app
ls -lah /github/workspace
mix hugo_to_eex.convert
mix hugo_to_eex.copy_images

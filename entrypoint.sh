#!/bin/bash

set -x
cd /app
mix hugo_to_eex.convert
mix hugo_to_eex.copy_images

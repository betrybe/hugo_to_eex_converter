#!/bin/bash

set -x
mix hugo_to_eex.convert
mix hugo_to_eex.copy_images

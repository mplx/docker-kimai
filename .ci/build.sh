#!/bin/bash

[ -n "$TEMP_IMAGE" ] || TEMP_IMAGE="mplx/kimai"

docker build --tag $TEMP_IMAGE .

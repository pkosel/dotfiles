#!/bin/bash

base="/home/philipp/Documents/ebooks"

input="$base/input"
organized="$base/organized"
uncertain="$base/uncertain"

docker run --rm -v "$input":/input -v "$organized":/organized -v "$uncertain":/uncertain ebooktools/scripts:latest \
  organize-ebooks.sh -owi -o=/organized -ofu=/uncertain /input


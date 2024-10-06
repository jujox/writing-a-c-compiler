#!/bin/bash -x

set -eu

function preprocess_source {
    input_src_file=$1
    output_preprocessed_file=$2
    gcc -E $input_src_file -o $output_preprocessed_file
}

function compile {
    preprocessed_src_file=$1
    gcc -S -O -fno-asynchronous-unwind-tables -fcf-protection=none $preprocessed_src_file
}

function assemble {
    assembly_file_src=$1
    output_file=$2
    gcc $assembly_file_src -o $output_file
}

# Simple compile driver

if [ $# -ne 1 ]; then
    echo "Syntax: $0 <input_src_file>"
    exit 1
fi

INPUT_C_FILE=$1
OUTPUT_PREPROCESSED_FILE="$(echo $INPUT_C_FILE | sed "s/\.c$//").i"
OUTPUT_ASSEMBLY_FILE="$(echo $INPUT_C_FILE | sed "s/\.c$//").s"
OUTPUT_BINARY_FILE="$(echo $INPUT_C_FILE | sed "s/\.c$//")"

preprocess_source $INPUT_C_FILE $OUTPUT_PREPROCESSED_FILE
compile $OUTPUT_PREPROCESSED_FILE
assemble $OUTPUT_ASSEMBLY_FILE $OUTPUT_BINARY_FILE


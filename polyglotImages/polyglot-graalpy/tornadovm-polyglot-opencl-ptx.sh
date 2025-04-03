#!/usr/bin/env bash

if [[ "$1" == "--console" ]]; then
    docker run -it -p 8080:8080 --rm --runtime=nvidia --gpus all -v "$PWD":/data beehivelab/tornadovm-polyglot-graalpy-23.1.0-opencl-cuda-container:tango-v1.1.0
elif [[ "$1" == "--help" ]] || [[ "$1" == "--h" ]]; then
    echo "Please run:"
    echo "  ./tornadovm-polyglot-nvidia.sh --console		to launch the built image in which GraalPy interoperates with TornadoVM, or"
    echo "  ./tornadovm-polyglot-nvidia.sh <command>		to launch the built image or execute a Python program that interoperates with TornadoVM, or"
    echo "  ./tornadovm-polyglot-nvidia.sh --help		to print help message"
else
    docker run -it -p 8080:8080 --rm --runtime=nvidia --gpus all -v "$PWD":/data beehivelab/tornadovm-polyglot-graalpy-23.1.0-opencl-cuda-container:tango-v1.1.0 "$@"
fi

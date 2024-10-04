#!/usr/bin/env bash

if [[ "$1" == "--console" ]]; then
    docker run -it --device /dev/dri:/dev/dri -p 8080:8080 --rm --gpus all -v "$PWD":/data beehivelab/tornadovm-polyglot-graalpy-23.1.0-oneapi-intel-container:tango-v1.0.8
elif [[ "$1" == "--help" ]] || [[ "$1" == "--h" ]]; then
    echo "Please run:"
    echo "  ./tornadovm-polyglot-intel.sh --console		to launch the built image in which GraalPy interoperates with TornadoVM, or"
    echo "  ./tornadovm-polyglot-intel.sh <command>		to launch the built image or execute a Python program that interoperates with TornadoVM, or"
    echo "  ./tornadovm-polyglot-intel.sh --help		to print help message"
else
    docker run -it --device /dev/dri:/dev/dri -p 8080:8080 --rm --gpus all -v "$PWD":/data beehivelab/tornadovm-polyglot-graalpy-23.1.0-oneapi-intel-container:tango-v1.0.8 "$@"
fi

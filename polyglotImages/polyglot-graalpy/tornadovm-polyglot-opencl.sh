#!/usr/bin/env bash

if [[ "$1" == "--console" ]]; then
    #docker run -i -p 8080:8080 --rm --runtime=nvidia --gpus all -v "$PWD":/data beehivelab/tornadovm-polyglot-graalpy-23.1.0-opencl-container:tango-v1.1.1-final
    docker run -i -p 8080:8080 --rm --runtime=nvidia --gpus all -v "$PWD":/data -v ${TORNADO_INFERENCE_DIR}:/app -w /app beehivelab/tornadovm-polyglot-graalpy-23.1.0-opencl-container:tango-v1.1.1-final
elif [[ "$1" == "--help" ]] || [[ "$1" == "--h" ]]; then
    echo "Please run:"
    echo "  ./tornadovm-polyglot-nvidia.sh --console		to launch the built image in which GraalPy interoperates with TornadoVM, or"
    echo "  ./tornadovm-polyglot-nvidia.sh <command>		to launch the built image or execute a Python program that interoperates with TornadoVM, or"
    echo "  ./tornadovm-polyglot-nvidia.sh --help		to print help message"
else
    docker run -i -p 8080:8080 --rm --runtime=nvidia --gpus all -v "$PWD":/data -v ${TORNADO_INFERENCE_DIR}:/app -w /app beehivelab/tornadovm-polyglot-graalpy-23.1.0-opencl-container:tango-v1.1.1-final "$@"
fi

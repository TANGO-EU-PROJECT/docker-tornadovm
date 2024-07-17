#!/bin/bash

if [ $# -eq 0 ]; then
	echo "------------------------------------"
        echo "Please run:"
        echo "  dynamic_intelligent_execution_intel.sh --test			for running unit-tests."
        echo "  dynamic_intelligent_execution_intel.sh --test_integration	for running integration test."
	echo "  dynamic_intelligent_execution_intel.sh <python>		to run a Python program with polyglot runtime on GPU."
        echo "  dynamic_intelligent_execution_intel.sh --help			to print help message."
elif [ "$1" == "--test" ]; then
        echo "-----------------------------------------"
        echo "Testing the TANGO Dynamic Intelligent Execution..."
	$TORNADO_DOCKER_SCRIPT/polyglotImages/polyglot-graalpy/tornadovm-polyglot-intel.sh tornado-test -V uk.ac.manchester.tornado.unittests.profiler.TestProfiler
elif [ "$1" == "--test_integration" ]; then
	echo "Testing the integration of Java/Python for GPUs..."
	$TORNADO_DOCKER_SCRIPT/polyglotImages/polyglot-graalpy/tornadovm-polyglot-intel.sh tornado --truffle python example/polyglot-examples/kmeans.py
elif [ "$1" == "--help" ]; then
	echo "------------------------------------"
        echo "Please run:"
        echo "  dynamic_intelligent_execution_intel.sh --test                   for running unit-tests."
        echo "  dynamic_intelligent_execution_intel.sh --test_integration       for running integration test."
        echo "  dynamic_intelligent_execution_intel.sh <python>         to run a Python program with polyglot runtime on GPU."
        echo "  dynamic_intelligent_execution_intel.sh --help                   to print help message."
else
	echo "Running the TANGO Dynamic Intelligent Execution..."
        $TORNADO_DOCKER_SCRIPT/polyglotImages/polyglot-graalpy/tornadovm-polyglot-intel.sh tornado --truffle python $1
fi

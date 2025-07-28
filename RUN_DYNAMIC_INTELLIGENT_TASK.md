# TANGO Dynamic Intelligent Execution

To run the TANGO Dynamic Intelligent Execution you need to do the following:

## 1. Pull the latest docker image
```bash
docker pull beehivelab/tornadovm-polyglot-graalpy-23.1.0-oneapi-intel-container:tango-v1.0.8
docker pull beehivelab/tornadovm-polyglot-graalpy-23.1.0-nvidia-opencl-container:tango-v1.0.8
```

## 2. Clone the repository with the running scripts
```bash
git clone https://github.com/TANGO-EU-PROJECT/docker-tornadovm
cd docker-tornadovm
git checkout test/cicd
export TORNADO_DOCKER_SCRIPT="<path>/docker-tornadovm"
export TORNADO_INFERENCE_DIR="<path>/dynamic-intelligent-scheduler"
```

```bash
git clone 
cd 
export TORNADO_INFERENCE_DIR="<path>/dynamic-intelligent-scheduler"
```

## 3. Run TornadoVM profiler unit-tests
- If you have OpenCL (CPU/GPU) devices on your system, use the following script:
```bash
${TORNADO_DOCKER_SCRIPT}/dynamic_intelligent_execution.sh --test
```

## 4. Run test for the integration of Java/Python for offloading Java code on GPU
- If you have OpenCL Intel (CPU/GPU) devices on your system, use the following script:
```bash
${TORNADO_DOCKER_SCRIPT}/dynamic_intelligent_execution.sh --test_integration
```

## 5. Run a Python program and accelerate a computation using the TornadoVM API automatically on the most energy efficient device:

For example, run a [histogram.py](https://github.com/TANGO-EU-PROJECT/docker-tornadovm/blob/test/cicd/example/polyglot-examples/histogram.py) program that launches a [kernel](https://github.com/TANGO-EU-PROJECT/TornadoVM/blob/ab2d3fee20cdd80a95c35cd1e10695be1da28699/tornado-examples/src/main/java/uk/ac/manchester/tornado/examples/kernelcontext/reductions/Histogram.java#L86C5-L93C6) expressed via the TornadoVM API.
```bash
${TORNADO_DOCKER_SCRIPT}/dynamic_intelligent_execution.sh histogram.py

```

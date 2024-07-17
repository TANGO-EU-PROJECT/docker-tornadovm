# TANGO Dynamic Intelligent Execution

To run the TANGO Dynamic Intelligent Execution you need to do the following:

## 1. Pull the latest docker image
```bash
docker pull beehivelab/tornadovm-polyglot-graalpy-23.1.0-oneapi-intel-container:tango
```

## 2. Clone the repository with the running scripts
```bash
git clone https://github.com/TANGO-EU-PROJECT/docker-tornadovm
cd docker-tornadovm
git checkout test/cicd
export TORNADO_DOCKER_SCRIPT="<path>/docker-tornadovm"
```

## 3. Run TornadoVM profiler unit-tests
- If you have Intel (CPU/GPU) devices on your system, use the following script:
```bash
${TORNADO_DOCKER_SCRIPT}/dynamic-intelligent-execution-intel.sh --test
```

- If you have NVIDIA GPU devices on your system, use the following script:
```bash
${TORNADO_DOCKER_SCRIPT}/dynamic-intelligent-execution-nvidia.sh --test
```

## 4. Run test for the integration of Java/Python for offloading Java code on GPU
- If you have Intel (CPU/GPU) devices on your system, use the following script:
```bash
${TORNADO_DOCKER_SCRIPT}/dynamic-intelligent-execution-intel.sh --test_integration
```

- If you have NVIDIA GPU devices on your system, use the following script:
```bash
${TORNADO_DOCKER_SCRIPT}/dynamic-intelligent-execution-nvidia.sh --test_integration
```

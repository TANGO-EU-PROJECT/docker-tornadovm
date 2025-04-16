#
# Copyright (c) 2025, APT Group, Department of Computer Science,
# The University of Manchester.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#    http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#
#

#!/usr/bin/python

import java
import time

histogram = java.type("uk.ac.manchester.tornado.examples.kernelcontext.reductions.Histogram")

# Set numPoints, numOfBins
inputData = [2 for _ in range(67108864)]
histogram.setBlockSize(256)
histogram.setInputs(inputData, 4)
resultJava = histogram.runWithJava()
resultGPU = histogram.runWithGPU()

# Function to compare two matrices
def validate_arrays(resultJava, resultGPU):
    javaArray = resultJava.toHeapArray()
    gpuArray = resultGPU.toHeapArray()

    if len(javaArray) != len(gpuArray):
        print("[TornadoVM_EDAE_I002]................ [FAIL]: Arrays have different dimensions")
        return

    for i in range(len(javaArray)):
        if javaArray[i] != gpuArray[i]:
            print(f"[TornadoVM_EDAE_I002]................ [FAIL]: Arrays differ at ({i})")
            print(f"javaArray[{i}]: {javaArray[i]}")
            print(f"gpuArray[{i}]: {gpuArray[i]}")
            return

    print("[TornadoVM_EDAE_I002]................ [PASS]: Arrays are identical")

# Accessing the results from Java methods and comparing them
validate_arrays(resultJava, resultGPU)


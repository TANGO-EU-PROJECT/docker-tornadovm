#
# Copyright (c) 2024, APT Group, Department of Computer Science,
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

kmeans = java.type("uk.ac.manchester.tornado.examples.compute.KMeans")

print("Hello World from Python!")

# Set numPoints, numClusters
kmeans.setInputs(1048576, 3)
resultJava = kmeans.runWithJava()
resultGPU = kmeans.runWithGPU()

# Function to compare two matrices
def validate_matrices(matrix1, matrix2):
    rows1 = matrix1.getNumRows()
    cols1 = matrix1.getNumColumns()
    rows2 = matrix2.getNumRows()
    cols2 = matrix2.getNumColumns()

    if rows1 != rows2 or cols1 != cols2:
        print("[TornadoVM_EDAE_I001]................ [FAIL]: Matrices have different dimensions")
        return

    for i in range(rows1):
        for j in range(cols1):
            if matrix1.get(i, j) != matrix2.get(i, j):
                print(f"[TornadoVM_EDAE_I001]................ [FAIL]: Matrices differ at ({i}, {j})")
                return

    print("[TornadoVM_EDAE_I001]................ [PASS]: Matrices are identical")

# Accessing the results from Java methods and comparing them
validate_matrices(resultJava, resultGPU)


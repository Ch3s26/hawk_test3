# HAWK256 sign on Cortex-M4
This repository complements the master's thesis "Optimizing the post-quantum signature scheme HAWK for Cortex-M4" and includes all necessary resources to replicate the results. The thesis can be found in `thesis.pdf`.  

If you have any questions or would like to discuss topics related to this project, feel free to contact me via email at `chrisb26oe@t-online.de`.

## Repository Structure

This repository is organized as follows:

- `ext/`: Required files (related to Keccak) from other repositories (https://gitlab.com/formosa-dilithium/dilithium-arm/ (on the branch: benchmark) and https://github.com/formosa-crypto/libjade/ (at commit: 94608b8)).
- `hawk256/m4/`: Directory that can be integrated into pqm4 to run our optimized code directly, without the need for compilation or modifications.
- `Makefile`: Makefile for generating assembly code.
- `README.md`: This file, providing repository details and instructions.
- `arithmetic.jazz`: Optimized Jasmin implementation of the Hawk-256 signing routine.
- `arrays.jinc`: Tables required by our implementation.

## Setup Procedure

In the following, we assume that Jasmin and pqm4 are already installed.

For installation instructions regarding Jasmin, refer to: https://github.com/jasmin-lang/jasmin/wiki/Installation-instructions.
At the time of writing this thesis, the newest Jasmin version with commit hash fbe992f33df12a3605aeffdadaeaf6675a3dcccd works with our code.

For installation instructions regarding pqm4, refer to: https://github.com/mupq/pqm4.

To acquire the source code and generate the assembly for the optimized sign routine, follow the steps below:

```bash
# Obtain the source code
git clone https://github.com/Ch3s26/hawk-cortex-m4-jasmin
# Change to new directory
cd hawk-cortex-m4-jasmin
# Adjust the path to "jasminc" in the Makefile of this repository to match your installation of Jasmin.
# Build the code (this may take a couple of minutes)
make
```

Once all steps have been completed, an assembly file called arithmetic.s will be generated.
The steps needed to get our optimized version of the Hawk-256 signing routine running in pqm4 are described in Section 5.1 of `thesis.pdf`.

To avoid the need for manual compilation or modifications to run the optimized version in pqm4, the hawk256/m4 directory from our repository can be used as it contains our compiled file as well as needed modifications. This directory can be copied into the crypto_sign folder within pqm4 for direct use.

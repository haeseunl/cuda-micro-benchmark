# Build the program
program: $(TARGET)


# Build other stuff, like PTX dumps of .cu files
otherstuff: $(PTX_OUTPUTS)

export CUDA_INSTALL_PATH







# CUDA Runtime and Driver API bindings for Odin

Bindings generated from Linux, may not work out of the box with Windows.

You might have to pass the extra linker args to Odin to find the CUDA libraries.

For example:
```bash
odin build . -extra-linker-flags:-L/usr/local/cuda-12.3/lib64/
```

See: 
- [Odin](https://github.com/odin-lang/Odin)
- [NVIDIA® CUDA®](https://docs.nvidia.com/cuda/)


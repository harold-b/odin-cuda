package cu

import "base:intrinsics"
import "base:runtime"
import cffi "core:c"

when ODIN_OS == .Linux {
    foreign import lib {
        "system:cuda",
    }
}
when ODIN_OS == .Windows {
    foreign import lib {
        "system:cuda.lib",
    }
}



foreign lib {
}
@(default_calling_convention="c")
foreign lib {
    @(require_results)
    @(link_name="cuGetErrorString")
    GetErrorString :: proc(error: result, pStr: ^cstring) -> result ---

    @(require_results)
    @(link_name="cuGetErrorName")
    GetErrorName :: proc(error: result, pStr: ^cstring) -> result ---

    @(require_results)
    @(link_name="cuInit")
    Init :: proc(Flags: cffi.uint) -> result ---

    @(require_results)
    @(link_name="cuDriverGetVersion")
    DriverGetVersion :: proc(driverVersion: ^cffi.int) -> result ---

    @(require_results)
    @(link_name="cuDeviceGet")
    DeviceGet :: proc(device: ^cffi.int, ordinal: cffi.int) -> result ---

    @(require_results)
    @(link_name="cuDeviceGetCount")
    DeviceGetCount :: proc(count: ^cffi.int) -> result ---

    @(require_results)
    @(link_name="cuDeviceGetName")
    DeviceGetName :: proc(name: cstring, len: cffi.int, dev: device) -> result ---

    @(require_results)
    @(link_name="cuDeviceGetUuid")
    DeviceGetUuid :: proc(uuid: ^uuid_st, dev: device) -> result ---

    @(require_results)
    @(link_name="cuDeviceGetUuid_v2")
    DeviceGetUuid_v2 :: proc(uuid: ^uuid_st, dev: device) -> result ---

    @(require_results)
    @(link_name="cuDeviceGetLuid")
    DeviceGetLuid :: proc(luid: cstring, deviceNodeMask: ^cffi.uint, dev: device) -> result ---

    @(require_results)
    @(link_name="cuDeviceTotalMem_v2")
    DeviceTotalMem_v2 :: proc(bytes: ^cffi.ulong, dev: device) -> result ---

    @(require_results)
    @(link_name="cuDeviceGetTexture1DLinearMaxWidth")
    DeviceGetTexture1DLinearMaxWidth :: proc(maxWidthInElements: ^cffi.ulong, format: array_format, numChannels: cffi.uint, dev: device) -> result ---

    @(require_results)
    @(link_name="cuDeviceGetAttribute")
    DeviceGetAttribute :: proc(pi: ^cffi.int, attrib: device_attribute, dev: device) -> result ---

    @(require_results)
    @(link_name="cuDeviceGetNvSciSyncAttributes")
    DeviceGetNvSciSyncAttributes :: proc(nvSciSyncAttrList: rawptr, dev: device, flags: cffi.int) -> result ---

    @(require_results)
    @(link_name="cuDeviceSetMemPool")
    DeviceSetMemPool :: proc(dev: device, pool: memoryPool) -> result ---

    @(require_results)
    @(link_name="cuDeviceGetMemPool")
    DeviceGetMemPool :: proc(pool: ^^memPoolHandle_st, dev: device) -> result ---

    @(require_results)
    @(link_name="cuDeviceGetDefaultMemPool")
    DeviceGetDefaultMemPool :: proc(pool_out: ^^memPoolHandle_st, dev: device) -> result ---

    @(require_results)
    @(link_name="cuDeviceGetExecAffinitySupport")
    DeviceGetExecAffinitySupport :: proc(pi: ^cffi.int, type: execAffinityType, dev: device) -> result ---

    @(require_results)
    @(link_name="cuFlushGPUDirectRDMAWrites")
    FlushGPUDirectRDMAWrites :: proc(target: flushGPUDirectRDMAWritesTarget, scope: flushGPUDirectRDMAWritesScope) -> result ---

    @(require_results)
    @(link_name="cuDeviceGetProperties")
    DeviceGetProperties :: proc(prop: ^devprop_st, dev: device) -> result ---

    @(require_results)
    @(link_name="cuDeviceComputeCapability")
    DeviceComputeCapability :: proc(major: ^cffi.int, minor: ^cffi.int, dev: device) -> result ---

    @(require_results)
    @(link_name="cuDevicePrimaryCtxRetain")
    DevicePrimaryCtxRetain :: proc(pctx: ^^ctx_st, dev: device) -> result ---

    @(require_results)
    @(link_name="cuDevicePrimaryCtxRelease_v2")
    DevicePrimaryCtxRelease_v2 :: proc(dev: device) -> result ---

    @(require_results)
    @(link_name="cuDevicePrimaryCtxSetFlags_v2")
    DevicePrimaryCtxSetFlags_v2 :: proc(dev: device, flags: cffi.uint) -> result ---

    @(require_results)
    @(link_name="cuDevicePrimaryCtxGetState")
    DevicePrimaryCtxGetState :: proc(dev: device, flags: ^cffi.uint, active: ^cffi.int) -> result ---

    @(require_results)
    @(link_name="cuDevicePrimaryCtxReset_v2")
    DevicePrimaryCtxReset_v2 :: proc(dev: device) -> result ---

    @(require_results)
    @(link_name="cuCtxCreate_v2")
    CtxCreate_v2 :: proc(pctx: ^^ctx_st, flags: cffi.uint, dev: device) -> result ---

    @(require_results)
    @(link_name="cuCtxCreate_v3")
    CtxCreate_v3 :: proc(pctx: ^^ctx_st, paramsArray: ^execAffinityParam_st, numParams: cffi.int, flags: cffi.uint, dev: device) -> result ---

    @(require_results)
    @(link_name="cuCtxDestroy_v2")
    CtxDestroy_v2 :: proc(ctx: context_t) -> result ---

    @(require_results)
    @(link_name="cuCtxPushCurrent_v2")
    CtxPushCurrent_v2 :: proc(ctx: context_t) -> result ---

    @(require_results)
    @(link_name="cuCtxPopCurrent_v2")
    CtxPopCurrent_v2 :: proc(pctx: ^^ctx_st) -> result ---

    @(require_results)
    @(link_name="cuCtxSetCurrent")
    CtxSetCurrent :: proc(ctx: context_t) -> result ---

    @(require_results)
    @(link_name="cuCtxGetCurrent")
    CtxGetCurrent :: proc(pctx: ^^ctx_st) -> result ---

    @(require_results)
    @(link_name="cuCtxGetDevice")
    CtxGetDevice :: proc(device: ^cffi.int) -> result ---

    @(require_results)
    @(link_name="cuCtxGetFlags")
    CtxGetFlags :: proc(flags: ^cffi.uint) -> result ---

    @(require_results)
    @(link_name="cuCtxSetFlags")
    CtxSetFlags :: proc(flags: cffi.uint) -> result ---

    @(require_results)
    @(link_name="cuCtxGetId")
    CtxGetId :: proc(ctx: context_t, ctxId: ^cffi.ulonglong) -> result ---

    @(require_results)
    @(link_name="cuCtxSynchronize")
    CtxSynchronize :: proc() -> result ---

    @(require_results)
    @(link_name="cuCtxSetLimit")
    CtxSetLimit :: proc(limit: limit, value: cffi.uint) -> result ---

    @(require_results)
    @(link_name="cuCtxGetLimit")
    CtxGetLimit :: proc(pvalue: ^cffi.ulong, limit: limit) -> result ---

    @(require_results)
    @(link_name="cuCtxGetCacheConfig")
    CtxGetCacheConfig :: proc(pconfig: ^func_cache) -> result ---

    @(require_results)
    @(link_name="cuCtxSetCacheConfig")
    CtxSetCacheConfig :: proc(config: func_cache) -> result ---

    @(require_results)
    @(link_name="cuCtxGetSharedMemConfig")
    CtxGetSharedMemConfig :: proc(pConfig: ^sharedconfig) -> result ---

    @(require_results)
    @(link_name="cuCtxSetSharedMemConfig")
    CtxSetSharedMemConfig :: proc(config: sharedconfig) -> result ---

    @(require_results)
    @(link_name="cuCtxGetApiVersion")
    CtxGetApiVersion :: proc(ctx: context_t, version: ^cffi.uint) -> result ---

    @(require_results)
    @(link_name="cuCtxGetStreamPriorityRange")
    CtxGetStreamPriorityRange :: proc(leastPriority: ^cffi.int, greatestPriority: ^cffi.int) -> result ---

    @(require_results)
    @(link_name="cuCtxResetPersistingL2Cache")
    CtxResetPersistingL2Cache :: proc() -> result ---

    @(require_results)
    @(link_name="cuCtxGetExecAffinity")
    CtxGetExecAffinity :: proc(pExecAffinity: ^execAffinityParam_st, type: execAffinityType) -> result ---

    @(require_results)
    @(link_name="cuCtxAttach")
    CtxAttach :: proc(pctx: ^^ctx_st, flags: cffi.uint) -> result ---

    @(require_results)
    @(link_name="cuCtxDetach")
    CtxDetach :: proc(ctx: context_t) -> result ---

    @(require_results)
    @(link_name="cuModuleLoad")
    ModuleLoad :: proc(module: ^^mod_st, fname: cstring) -> result ---

    @(require_results)
    @(link_name="cuModuleLoadData")
    ModuleLoadData :: proc(module: ^^mod_st, image: rawptr) -> result ---

    @(require_results)
    @(link_name="cuModuleLoadDataEx")
    ModuleLoadDataEx :: proc(module: ^^mod_st, image: rawptr, numOptions: cffi.uint, options: ^jit_option, optionValues: ^rawptr) -> result ---

    @(require_results)
    @(link_name="cuModuleLoadFatBinary")
    ModuleLoadFatBinary :: proc(module: ^^mod_st, fatCubin: rawptr) -> result ---

    @(require_results)
    @(link_name="cuModuleUnload")
    ModuleUnload :: proc(hmod: module) -> result ---

    @(require_results)
    @(link_name="cuModuleGetLoadingMode")
    ModuleGetLoadingMode :: proc(mode: ^moduleLoadingMode) -> result ---

    @(require_results)
    @(link_name="cuModuleGetFunction")
    ModuleGetFunction :: proc(hfunc: ^^func_st, hmod: module, name: cstring) -> result ---

    @(require_results)
    @(link_name="cuModuleGetGlobal_v2")
    ModuleGetGlobal_v2 :: proc(dptr: ^cffi.ulonglong, bytes: ^cffi.ulong, hmod: module, name: cstring) -> result ---

    @(require_results)
    @(link_name="cuLinkCreate_v2")
    LinkCreate_v2 :: proc(numOptions: cffi.uint, options: ^jit_option, optionValues: ^rawptr, stateOut: ^^linkState_st) -> result ---

    @(require_results)
    @(link_name="cuLinkAddData_v2")
    LinkAddData_v2 :: proc(state: linkState, type: jitInputType, data: rawptr, size: cffi.uint, name: cstring, numOptions: cffi.uint, options: ^jit_option, optionValues: ^rawptr) -> result ---

    @(require_results)
    @(link_name="cuLinkAddFile_v2")
    LinkAddFile_v2 :: proc(state: linkState, type: jitInputType, path: cstring, numOptions: cffi.uint, options: ^jit_option, optionValues: ^rawptr) -> result ---

    @(require_results)
    @(link_name="cuLinkComplete")
    LinkComplete :: proc(state: linkState, cubinOut: ^rawptr, sizeOut: ^cffi.ulong) -> result ---

    @(require_results)
    @(link_name="cuLinkDestroy")
    LinkDestroy :: proc(state: linkState) -> result ---

    @(require_results)
    @(link_name="cuModuleGetTexRef")
    ModuleGetTexRef :: proc(pTexRef: ^^texref_st, hmod: module, name: cstring) -> result ---

    @(require_results)
    @(link_name="cuModuleGetSurfRef")
    ModuleGetSurfRef :: proc(pSurfRef: ^^surfref_st, hmod: module, name: cstring) -> result ---

    @(require_results)
    @(link_name="cuLibraryLoadData")
    LibraryLoadData :: proc(library: ^^lib_st, code: rawptr, jitOptions: ^jit_option, jitOptionsValues: ^rawptr, numJitOptions: cffi.uint, libraryOptions: ^libraryOption, libraryOptionValues: ^rawptr, numLibraryOptions: cffi.uint) -> result ---

    @(require_results)
    @(link_name="cuLibraryLoadFromFile")
    LibraryLoadFromFile :: proc(library: ^^lib_st, fileName: cstring, jitOptions: ^jit_option, jitOptionsValues: ^rawptr, numJitOptions: cffi.uint, libraryOptions: ^libraryOption, libraryOptionValues: ^rawptr, numLibraryOptions: cffi.uint) -> result ---

    @(require_results)
    @(link_name="cuLibraryUnload")
    LibraryUnload :: proc(library: library) -> result ---

    @(require_results)
    @(link_name="cuLibraryGetKernel")
    LibraryGetKernel :: proc(pKernel: ^^kern_st, library: library, name: cstring) -> result ---

    @(require_results)
    @(link_name="cuLibraryGetModule")
    LibraryGetModule :: proc(pMod: ^^mod_st, library: library) -> result ---

    @(require_results)
    @(link_name="cuKernelGetFunction")
    KernelGetFunction :: proc(pFunc: ^^func_st, kernel: kernel) -> result ---

    @(require_results)
    @(link_name="cuLibraryGetGlobal")
    LibraryGetGlobal :: proc(dptr: ^cffi.ulonglong, bytes: ^cffi.ulong, library: library, name: cstring) -> result ---

    @(require_results)
    @(link_name="cuLibraryGetManaged")
    LibraryGetManaged :: proc(dptr: ^cffi.ulonglong, bytes: ^cffi.ulong, library: library, name: cstring) -> result ---

    @(require_results)
    @(link_name="cuLibraryGetUnifiedFunction")
    LibraryGetUnifiedFunction :: proc(fptr: ^rawptr, library: library, symbol: cstring) -> result ---

    @(require_results)
    @(link_name="cuKernelGetAttribute")
    KernelGetAttribute :: proc(pi: ^cffi.int, attrib: function_attribute, kernel: kernel, dev: device) -> result ---

    @(require_results)
    @(link_name="cuKernelSetAttribute")
    KernelSetAttribute :: proc(attrib: function_attribute, val: cffi.int, kernel: kernel, dev: device) -> result ---

    @(require_results)
    @(link_name="cuKernelSetCacheConfig")
    KernelSetCacheConfig :: proc(kernel: kernel, config: func_cache, dev: device) -> result ---

    @(require_results)
    @(link_name="cuKernelGetName")
    KernelGetName :: proc(name: ^cstring, hfunc: kernel) -> result ---

    @(require_results)
    @(link_name="cuMemGetInfo_v2")
    MemGetInfo_v2 :: proc(free: ^cffi.ulong, total: ^cffi.ulong) -> result ---

    @(require_results)
    @(link_name="cuMemAlloc_v2")
    MemAlloc_v2 :: proc(dptr: ^cffi.ulonglong, bytesize: cffi.uint) -> result ---

    @(require_results)
    @(link_name="cuMemAllocPitch_v2")
    MemAllocPitch_v2 :: proc(dptr: ^cffi.ulonglong, pPitch: ^cffi.ulong, WidthInBytes: cffi.uint, Height: cffi.uint, ElementSizeBytes: cffi.uint) -> result ---

    @(require_results)
    @(link_name="cuMemFree_v2")
    MemFree_v2 :: proc(dptr: deviceptr) -> result ---

    @(require_results)
    @(link_name="cuMemGetAddressRange_v2")
    MemGetAddressRange_v2 :: proc(pbase: ^cffi.ulonglong, psize: ^cffi.ulong, dptr: deviceptr) -> result ---

    @(require_results)
    @(link_name="cuMemAllocHost_v2")
    MemAllocHost_v2 :: proc(pp: ^rawptr, bytesize: cffi.uint) -> result ---

    @(require_results)
    @(link_name="cuMemFreeHost")
    MemFreeHost :: proc(p: rawptr) -> result ---

    @(require_results)
    @(link_name="cuMemHostAlloc")
    MemHostAlloc :: proc(pp: ^rawptr, bytesize: cffi.uint, Flags: cffi.uint) -> result ---

    @(require_results)
    @(link_name="cuMemHostGetDevicePointer_v2")
    MemHostGetDevicePointer_v2 :: proc(pdptr: ^cffi.ulonglong, p: rawptr, Flags: cffi.uint) -> result ---

    @(require_results)
    @(link_name="cuMemHostGetFlags")
    MemHostGetFlags :: proc(pFlags: ^cffi.uint, p: rawptr) -> result ---

    @(require_results)
    @(link_name="cuMemAllocManaged")
    MemAllocManaged :: proc(dptr: ^cffi.ulonglong, bytesize: cffi.uint, flags: cffi.uint) -> result ---

    @(require_results)
    @(link_name="cuDeviceGetByPCIBusId")
    DeviceGetByPCIBusId :: proc(dev: ^cffi.int, pciBusId: cstring) -> result ---

    @(require_results)
    @(link_name="cuDeviceGetPCIBusId")
    DeviceGetPCIBusId :: proc(pciBusId: cstring, len: cffi.int, dev: device) -> result ---

    @(require_results)
    @(link_name="cuIpcGetEventHandle")
    IpcGetEventHandle :: proc(pHandle: ^ipcEventHandle_st, event: event) -> result ---

    @(require_results)
    @(link_name="cuIpcOpenEventHandle")
    IpcOpenEventHandle :: proc(phEvent: ^^event_st, handle: ipcEventHandle) -> result ---

    @(require_results)
    @(link_name="cuIpcGetMemHandle")
    IpcGetMemHandle :: proc(pHandle: ^ipcMemHandle_st, dptr: deviceptr) -> result ---

    @(require_results)
    @(link_name="cuIpcOpenMemHandle_v2")
    IpcOpenMemHandle_v2 :: proc(pdptr: ^cffi.ulonglong, handle: ipcMemHandle, Flags: cffi.uint) -> result ---

    @(require_results)
    @(link_name="cuIpcCloseMemHandle")
    IpcCloseMemHandle :: proc(dptr: deviceptr) -> result ---

    @(require_results)
    @(link_name="cuMemHostRegister_v2")
    MemHostRegister_v2 :: proc(p: rawptr, bytesize: cffi.uint, Flags: cffi.uint) -> result ---

    @(require_results)
    @(link_name="cuMemHostUnregister")
    MemHostUnregister :: proc(p: rawptr) -> result ---

    @(require_results)
    @(link_name="cuMemcpy")
    Memcpy :: proc(dst: deviceptr, src: deviceptr, ByteCount: cffi.uint) -> result ---

    @(require_results)
    @(link_name="cuMemcpyPeer")
    MemcpyPeer :: proc(dstDevice: deviceptr, dstContext: context_t, srcDevice: deviceptr, srcContext: context_t, ByteCount: cffi.uint) -> result ---

    @(require_results)
    @(link_name="cuMemcpyHtoD_v2")
    MemcpyHtoD_v2 :: proc(dstDevice: deviceptr, srcHost: rawptr, ByteCount: cffi.uint) -> result ---

    @(require_results)
    @(link_name="cuMemcpyDtoH_v2")
    MemcpyDtoH_v2 :: proc(dstHost: rawptr, srcDevice: deviceptr, ByteCount: cffi.uint) -> result ---

    @(require_results)
    @(link_name="cuMemcpyDtoD_v2")
    MemcpyDtoD_v2 :: proc(dstDevice: deviceptr, srcDevice: deviceptr, ByteCount: cffi.uint) -> result ---

    @(require_results)
    @(link_name="cuMemcpyDtoA_v2")
    MemcpyDtoA_v2 :: proc(dstArray: array, dstOffset: cffi.uint, srcDevice: deviceptr, ByteCount: cffi.uint) -> result ---

    @(require_results)
    @(link_name="cuMemcpyAtoD_v2")
    MemcpyAtoD_v2 :: proc(dstDevice: deviceptr, srcArray: array, srcOffset: cffi.uint, ByteCount: cffi.uint) -> result ---

    @(require_results)
    @(link_name="cuMemcpyHtoA_v2")
    MemcpyHtoA_v2 :: proc(dstArray: array, dstOffset: cffi.uint, srcHost: rawptr, ByteCount: cffi.uint) -> result ---

    @(require_results)
    @(link_name="cuMemcpyAtoH_v2")
    MemcpyAtoH_v2 :: proc(dstHost: rawptr, srcArray: array, srcOffset: cffi.uint, ByteCount: cffi.uint) -> result ---

    @(require_results)
    @(link_name="cuMemcpyAtoA_v2")
    MemcpyAtoA_v2 :: proc(dstArray: array, dstOffset: cffi.uint, srcArray: array, srcOffset: cffi.uint, ByteCount: cffi.uint) -> result ---

    @(require_results)
    @(link_name="cuMemcpy2D_v2")
    Memcpy2D_v2 :: proc(pCopy: ^MEMCPY2D_st) -> result ---

    @(require_results)
    @(link_name="cuMemcpy2DUnaligned_v2")
    Memcpy2DUnaligned_v2 :: proc(pCopy: ^MEMCPY2D_st) -> result ---

    @(require_results)
    @(link_name="cuMemcpy3D_v2")
    Memcpy3D_v2 :: proc(pCopy: ^MEMCPY3D_st) -> result ---

    @(require_results)
    @(link_name="cuMemcpy3DPeer")
    Memcpy3DPeer :: proc(pCopy: ^MEMCPY3D_PEER_st) -> result ---

    @(require_results)
    @(link_name="cuMemcpyAsync")
    MemcpyAsync :: proc(dst: deviceptr, src: deviceptr, ByteCount: cffi.uint, hStream: stream) -> result ---

    @(require_results)
    @(link_name="cuMemcpyPeerAsync")
    MemcpyPeerAsync :: proc(dstDevice: deviceptr, dstContext: context_t, srcDevice: deviceptr, srcContext: context_t, ByteCount: cffi.uint, hStream: stream) -> result ---

    @(require_results)
    @(link_name="cuMemcpyHtoDAsync_v2")
    MemcpyHtoDAsync_v2 :: proc(dstDevice: deviceptr, srcHost: rawptr, ByteCount: cffi.uint, hStream: stream) -> result ---

    @(require_results)
    @(link_name="cuMemcpyDtoHAsync_v2")
    MemcpyDtoHAsync_v2 :: proc(dstHost: rawptr, srcDevice: deviceptr, ByteCount: cffi.uint, hStream: stream) -> result ---

    @(require_results)
    @(link_name="cuMemcpyDtoDAsync_v2")
    MemcpyDtoDAsync_v2 :: proc(dstDevice: deviceptr, srcDevice: deviceptr, ByteCount: cffi.uint, hStream: stream) -> result ---

    @(require_results)
    @(link_name="cuMemcpyHtoAAsync_v2")
    MemcpyHtoAAsync_v2 :: proc(dstArray: array, dstOffset: cffi.uint, srcHost: rawptr, ByteCount: cffi.uint, hStream: stream) -> result ---

    @(require_results)
    @(link_name="cuMemcpyAtoHAsync_v2")
    MemcpyAtoHAsync_v2 :: proc(dstHost: rawptr, srcArray: array, srcOffset: cffi.uint, ByteCount: cffi.uint, hStream: stream) -> result ---

    @(require_results)
    @(link_name="cuMemcpy2DAsync_v2")
    Memcpy2DAsync_v2 :: proc(pCopy: ^MEMCPY2D_st, hStream: stream) -> result ---

    @(require_results)
    @(link_name="cuMemcpy3DAsync_v2")
    Memcpy3DAsync_v2 :: proc(pCopy: ^MEMCPY3D_st, hStream: stream) -> result ---

    @(require_results)
    @(link_name="cuMemcpy3DPeerAsync")
    Memcpy3DPeerAsync :: proc(pCopy: ^MEMCPY3D_PEER_st, hStream: stream) -> result ---

    @(require_results)
    @(link_name="cuMemsetD8_v2")
    MemsetD8_v2 :: proc(dstDevice: deviceptr, uc: cffi.uchar, N: cffi.uint) -> result ---

    @(require_results)
    @(link_name="cuMemsetD16_v2")
    MemsetD16_v2 :: proc(dstDevice: deviceptr, us: cffi.ushort, N: cffi.uint) -> result ---

    @(require_results)
    @(link_name="cuMemsetD32_v2")
    MemsetD32_v2 :: proc(dstDevice: deviceptr, ui: cffi.uint, N: cffi.uint) -> result ---

    @(require_results)
    @(link_name="cuMemsetD2D8_v2")
    MemsetD2D8_v2 :: proc(dstDevice: deviceptr, dstPitch: cffi.uint, uc: cffi.uchar, Width: cffi.uint, Height: cffi.uint) -> result ---

    @(require_results)
    @(link_name="cuMemsetD2D16_v2")
    MemsetD2D16_v2 :: proc(dstDevice: deviceptr, dstPitch: cffi.uint, us: cffi.ushort, Width: cffi.uint, Height: cffi.uint) -> result ---

    @(require_results)
    @(link_name="cuMemsetD2D32_v2")
    MemsetD2D32_v2 :: proc(dstDevice: deviceptr, dstPitch: cffi.uint, ui: cffi.uint, Width: cffi.uint, Height: cffi.uint) -> result ---

    @(require_results)
    @(link_name="cuMemsetD8Async")
    MemsetD8Async :: proc(dstDevice: deviceptr, uc: cffi.uchar, N: cffi.uint, hStream: stream) -> result ---

    @(require_results)
    @(link_name="cuMemsetD16Async")
    MemsetD16Async :: proc(dstDevice: deviceptr, us: cffi.ushort, N: cffi.uint, hStream: stream) -> result ---

    @(require_results)
    @(link_name="cuMemsetD32Async")
    MemsetD32Async :: proc(dstDevice: deviceptr, ui: cffi.uint, N: cffi.uint, hStream: stream) -> result ---

    @(require_results)
    @(link_name="cuMemsetD2D8Async")
    MemsetD2D8Async :: proc(dstDevice: deviceptr, dstPitch: cffi.uint, uc: cffi.uchar, Width: cffi.uint, Height: cffi.uint, hStream: stream) -> result ---

    @(require_results)
    @(link_name="cuMemsetD2D16Async")
    MemsetD2D16Async :: proc(dstDevice: deviceptr, dstPitch: cffi.uint, us: cffi.ushort, Width: cffi.uint, Height: cffi.uint, hStream: stream) -> result ---

    @(require_results)
    @(link_name="cuMemsetD2D32Async")
    MemsetD2D32Async :: proc(dstDevice: deviceptr, dstPitch: cffi.uint, ui: cffi.uint, Width: cffi.uint, Height: cffi.uint, hStream: stream) -> result ---

    @(require_results)
    @(link_name="cuArrayCreate_v2")
    ArrayCreate_v2 :: proc(pHandle: ^^array_st, pAllocateArray: ^ARRAY_DESCRIPTOR_st) -> result ---

    @(require_results)
    @(link_name="cuArrayGetDescriptor_v2")
    ArrayGetDescriptor_v2 :: proc(pArrayDescriptor: ^ARRAY_DESCRIPTOR_st, hArray: array) -> result ---

    @(require_results)
    @(link_name="cuArrayGetSparseProperties")
    ArrayGetSparseProperties :: proc(sparseProperties: ^ARRAY_SPARSE_PROPERTIES_st, array: array) -> result ---

    @(require_results)
    @(link_name="cuMipmappedArrayGetSparseProperties")
    MipmappedArrayGetSparseProperties :: proc(sparseProperties: ^ARRAY_SPARSE_PROPERTIES_st, mipmap: mipmappedArray) -> result ---

    @(require_results)
    @(link_name="cuArrayGetMemoryRequirements")
    ArrayGetMemoryRequirements :: proc(memoryRequirements: ^ARRAY_MEMORY_REQUIREMENTS_st, array: array, device: device) -> result ---

    @(require_results)
    @(link_name="cuMipmappedArrayGetMemoryRequirements")
    MipmappedArrayGetMemoryRequirements :: proc(memoryRequirements: ^ARRAY_MEMORY_REQUIREMENTS_st, mipmap: mipmappedArray, device: device) -> result ---

    @(require_results)
    @(link_name="cuArrayGetPlane")
    ArrayGetPlane :: proc(pPlaneArray: ^^array_st, hArray: array, planeIdx: cffi.uint) -> result ---

    @(require_results)
    @(link_name="cuArrayDestroy")
    ArrayDestroy :: proc(hArray: array) -> result ---

    @(require_results)
    @(link_name="cuArray3DCreate_v2")
    Array3DCreate_v2 :: proc(pHandle: ^^array_st, pAllocateArray: ^ARRAY3D_DESCRIPTOR_st) -> result ---

    @(require_results)
    @(link_name="cuArray3DGetDescriptor_v2")
    Array3DGetDescriptor_v2 :: proc(pArrayDescriptor: ^ARRAY3D_DESCRIPTOR_st, hArray: array) -> result ---

    @(require_results)
    @(link_name="cuMipmappedArrayCreate")
    MipmappedArrayCreate :: proc(pHandle: ^^mipmappedArray_st, pMipmappedArrayDesc: ^ARRAY3D_DESCRIPTOR_st, numMipmapLevels: cffi.uint) -> result ---

    @(require_results)
    @(link_name="cuMipmappedArrayGetLevel")
    MipmappedArrayGetLevel :: proc(pLevelArray: ^^array_st, hMipmappedArray: mipmappedArray, level: cffi.uint) -> result ---

    @(require_results)
    @(link_name="cuMipmappedArrayDestroy")
    MipmappedArrayDestroy :: proc(hMipmappedArray: mipmappedArray) -> result ---

    @(require_results)
    @(link_name="cuMemGetHandleForAddressRange")
    MemGetHandleForAddressRange :: proc(handle: rawptr, dptr: deviceptr, size: cffi.uint, handleType: memRangeHandleType, flags: cffi.ulonglong) -> result ---

    @(require_results)
    @(link_name="cuMemAddressReserve")
    MemAddressReserve :: proc(ptr: ^cffi.ulonglong, size: cffi.uint, alignment: cffi.uint, addr: deviceptr, flags: cffi.ulonglong) -> result ---

    @(require_results)
    @(link_name="cuMemAddressFree")
    MemAddressFree :: proc(ptr: deviceptr, size: cffi.uint) -> result ---

    @(require_results)
    @(link_name="cuMemCreate")
    MemCreate :: proc(handle: ^cffi.ulonglong, size: cffi.uint, prop: ^memAllocationProp_st, flags: cffi.ulonglong) -> result ---

    @(require_results)
    @(link_name="cuMemRelease")
    MemRelease :: proc(handle: memGenericAllocationHandle) -> result ---

    @(require_results)
    @(link_name="cuMemMap")
    MemMap :: proc(ptr: deviceptr, size: cffi.uint, offset: cffi.uint, handle: memGenericAllocationHandle, flags: cffi.ulonglong) -> result ---

    @(require_results)
    @(link_name="cuMemMapArrayAsync")
    MemMapArrayAsync :: proc(mapInfoList: ^arrayMapInfo_st, count: cffi.uint, hStream: stream) -> result ---

    @(require_results)
    @(link_name="cuMemUnmap")
    MemUnmap :: proc(ptr: deviceptr, size: cffi.uint) -> result ---

    @(require_results)
    @(link_name="cuMemSetAccess")
    MemSetAccess :: proc(ptr: deviceptr, size: cffi.uint, desc: ^memAccessDesc_st, count: cffi.uint) -> result ---

    @(require_results)
    @(link_name="cuMemGetAccess")
    MemGetAccess :: proc(flags: ^cffi.ulonglong, location: ^memLocation_st, ptr: deviceptr) -> result ---

    @(require_results)
    @(link_name="cuMemExportToShareableHandle")
    MemExportToShareableHandle :: proc(shareableHandle: rawptr, handle: memGenericAllocationHandle, handleType: memAllocationHandleType, flags: cffi.ulonglong) -> result ---

    @(require_results)
    @(link_name="cuMemImportFromShareableHandle")
    MemImportFromShareableHandle :: proc(handle: ^cffi.ulonglong, osHandle: rawptr, shHandleType: memAllocationHandleType) -> result ---

    @(require_results)
    @(link_name="cuMemGetAllocationGranularity")
    MemGetAllocationGranularity :: proc(granularity: ^cffi.ulong, prop: ^memAllocationProp_st, option: memAllocationGranularity_flags) -> result ---

    @(require_results)
    @(link_name="cuMemGetAllocationPropertiesFromHandle")
    MemGetAllocationPropertiesFromHandle :: proc(prop: ^memAllocationProp_st, handle: memGenericAllocationHandle) -> result ---

    @(require_results)
    @(link_name="cuMemRetainAllocationHandle")
    MemRetainAllocationHandle :: proc(handle: ^cffi.ulonglong, addr: rawptr) -> result ---

    @(require_results)
    @(link_name="cuMemFreeAsync")
    MemFreeAsync :: proc(dptr: deviceptr, hStream: stream) -> result ---

    @(require_results)
    @(link_name="cuMemAllocAsync")
    MemAllocAsync :: proc(dptr: ^cffi.ulonglong, bytesize: cffi.uint, hStream: stream) -> result ---

    @(require_results)
    @(link_name="cuMemPoolTrimTo")
    MemPoolTrimTo :: proc(pool: memoryPool, minBytesToKeep: cffi.uint) -> result ---

    @(require_results)
    @(link_name="cuMemPoolSetAttribute")
    MemPoolSetAttribute :: proc(pool: memoryPool, attr: memPool_attribute, value: rawptr) -> result ---

    @(require_results)
    @(link_name="cuMemPoolGetAttribute")
    MemPoolGetAttribute :: proc(pool: memoryPool, attr: memPool_attribute, value: rawptr) -> result ---

    @(require_results)
    @(link_name="cuMemPoolSetAccess")
    MemPoolSetAccess :: proc(pool: memoryPool, _map: ^memAccessDesc_st, count: cffi.uint) -> result ---

    @(require_results)
    @(link_name="cuMemPoolGetAccess")
    MemPoolGetAccess :: proc(flags: ^memAccess_flags, memPool: memoryPool, location: ^memLocation_st) -> result ---

    @(require_results)
    @(link_name="cuMemPoolCreate")
    MemPoolCreate :: proc(pool: ^^memPoolHandle_st, poolProps: ^memPoolProps_st) -> result ---

    @(require_results)
    @(link_name="cuMemPoolDestroy")
    MemPoolDestroy :: proc(pool: memoryPool) -> result ---

    @(require_results)
    @(link_name="cuMemAllocFromPoolAsync")
    MemAllocFromPoolAsync :: proc(dptr: ^cffi.ulonglong, bytesize: cffi.uint, pool: memoryPool, hStream: stream) -> result ---

    @(require_results)
    @(link_name="cuMemPoolExportToShareableHandle")
    MemPoolExportToShareableHandle :: proc(handle_out: rawptr, pool: memoryPool, handleType: memAllocationHandleType, flags: cffi.ulonglong) -> result ---

    @(require_results)
    @(link_name="cuMemPoolImportFromShareableHandle")
    MemPoolImportFromShareableHandle :: proc(pool_out: ^^memPoolHandle_st, handle: rawptr, handleType: memAllocationHandleType, flags: cffi.ulonglong) -> result ---

    @(require_results)
    @(link_name="cuMemPoolExportPointer")
    MemPoolExportPointer :: proc(shareData_out: ^memPoolPtrExportData_st, ptr: deviceptr) -> result ---

    @(require_results)
    @(link_name="cuMemPoolImportPointer")
    MemPoolImportPointer :: proc(ptr_out: ^cffi.ulonglong, pool: memoryPool, shareData: ^memPoolPtrExportData_st) -> result ---

    @(require_results)
    @(link_name="cuMulticastCreate")
    MulticastCreate :: proc(mcHandle: ^cffi.ulonglong, prop: ^multicastObjectProp_st) -> result ---

    @(require_results)
    @(link_name="cuMulticastAddDevice")
    MulticastAddDevice :: proc(mcHandle: memGenericAllocationHandle, dev: device) -> result ---

    @(require_results)
    @(link_name="cuMulticastBindMem")
    MulticastBindMem :: proc(mcHandle: memGenericAllocationHandle, mcOffset: cffi.uint, memHandle: memGenericAllocationHandle, memOffset: cffi.uint, size: cffi.uint, flags: cffi.ulonglong) -> result ---

    @(require_results)
    @(link_name="cuMulticastBindAddr")
    MulticastBindAddr :: proc(mcHandle: memGenericAllocationHandle, mcOffset: cffi.uint, memptr: deviceptr, size: cffi.uint, flags: cffi.ulonglong) -> result ---

    @(require_results)
    @(link_name="cuMulticastUnbind")
    MulticastUnbind :: proc(mcHandle: memGenericAllocationHandle, dev: device, mcOffset: cffi.uint, size: cffi.uint) -> result ---

    @(require_results)
    @(link_name="cuMulticastGetGranularity")
    MulticastGetGranularity :: proc(granularity: ^cffi.ulong, prop: ^multicastObjectProp_st, option: multicastGranularity_flags) -> result ---

    @(require_results)
    @(link_name="cuPointerGetAttribute")
    PointerGetAttribute :: proc(data: rawptr, attribute: pointer_attribute, ptr: deviceptr) -> result ---

    @(require_results)
    @(link_name="cuMemPrefetchAsync")
    MemPrefetchAsync :: proc(devPtr: deviceptr, count: cffi.uint, dstDevice: device, hStream: stream) -> result ---

    @(require_results)
    @(link_name="cuMemPrefetchAsync_v2")
    MemPrefetchAsync_v2 :: proc(devPtr: deviceptr, count: cffi.uint, location: memLocation, flags: cffi.uint, hStream: stream) -> result ---

    @(require_results)
    @(link_name="cuMemAdvise")
    MemAdvise :: proc(devPtr: deviceptr, count: cffi.uint, advice: mem_advise, device: device) -> result ---

    @(require_results)
    @(link_name="cuMemAdvise_v2")
    MemAdvise_v2 :: proc(devPtr: deviceptr, count: cffi.uint, advice: mem_advise, location: memLocation) -> result ---

    @(require_results)
    @(link_name="cuMemRangeGetAttribute")
    MemRangeGetAttribute :: proc(data: rawptr, dataSize: cffi.uint, attribute: mem_range_attribute, devPtr: deviceptr, count: cffi.uint) -> result ---

    @(require_results)
    @(link_name="cuMemRangeGetAttributes")
    MemRangeGetAttributes :: proc(data: ^rawptr, dataSizes: ^cffi.ulong, attributes: ^mem_range_attribute, numAttributes: cffi.uint, devPtr: deviceptr, count: cffi.uint) -> result ---

    @(require_results)
    @(link_name="cuPointerSetAttribute")
    PointerSetAttribute :: proc(value: rawptr, attribute: pointer_attribute, ptr: deviceptr) -> result ---

    @(require_results)
    @(link_name="cuPointerGetAttributes")
    PointerGetAttributes :: proc(numAttributes: cffi.uint, attributes: ^pointer_attribute, data: ^rawptr, ptr: deviceptr) -> result ---

    @(require_results)
    @(link_name="cuStreamCreate")
    StreamCreate :: proc(phStream: ^^stream_st, Flags: cffi.uint) -> result ---

    @(require_results)
    @(link_name="cuStreamCreateWithPriority")
    StreamCreateWithPriority :: proc(phStream: ^^stream_st, flags: cffi.uint, priority: cffi.int) -> result ---

    @(require_results)
    @(link_name="cuStreamGetPriority")
    StreamGetPriority :: proc(hStream: stream, priority: ^cffi.int) -> result ---

    @(require_results)
    @(link_name="cuStreamGetFlags")
    StreamGetFlags :: proc(hStream: stream, flags: ^cffi.uint) -> result ---

    @(require_results)
    @(link_name="cuStreamGetId")
    StreamGetId :: proc(hStream: stream, streamId: ^cffi.ulonglong) -> result ---

    @(require_results)
    @(link_name="cuStreamGetCtx")
    StreamGetCtx :: proc(hStream: stream, pctx: ^^ctx_st) -> result ---

    @(require_results)
    @(link_name="cuStreamWaitEvent")
    StreamWaitEvent :: proc(hStream: stream, hEvent: event, Flags: cffi.uint) -> result ---

    @(require_results)
    @(link_name="cuStreamAddCallback")
    StreamAddCallback :: proc(hStream: stream, callback: streamCallback, userData: rawptr, flags: cffi.uint) -> result ---

    @(require_results)
    @(link_name="cuStreamBeginCapture_v2")
    StreamBeginCapture_v2 :: proc(hStream: stream, mode: streamCaptureMode) -> result ---

    @(require_results)
    @(link_name="cuStreamBeginCaptureToGraph")
    StreamBeginCaptureToGraph :: proc(hStream: stream, hGraph: graph, dependencies: ^^graphNode_st, dependencyData: ^graphEdgeData_st, numDependencies: cffi.uint, mode: streamCaptureMode) -> result ---

    @(require_results)
    @(link_name="cuThreadExchangeStreamCaptureMode")
    ThreadExchangeStreamCaptureMode :: proc(mode: ^streamCaptureMode) -> result ---

    @(require_results)
    @(link_name="cuStreamEndCapture")
    StreamEndCapture :: proc(hStream: stream, phGraph: ^^graph_st) -> result ---

    @(require_results)
    @(link_name="cuStreamIsCapturing")
    StreamIsCapturing :: proc(hStream: stream, captureStatus: ^streamCaptureStatus) -> result ---

    @(require_results)
    @(link_name="cuStreamGetCaptureInfo_v2")
    StreamGetCaptureInfo_v2 :: proc(hStream: stream, captureStatus_out: ^streamCaptureStatus, id_out: ^cffi.ulonglong, graph_out: ^^graph_st, dependencies_out: ^^^graphNode_st, numDependencies_out: ^cffi.ulong) -> result ---

    @(require_results)
    @(link_name="cuStreamGetCaptureInfo_v3")
    StreamGetCaptureInfo_v3 :: proc(hStream: stream, captureStatus_out: ^streamCaptureStatus, id_out: ^cffi.ulonglong, graph_out: ^^graph_st, dependencies_out: ^^^graphNode_st, edgeData_out: ^^graphEdgeData_st, numDependencies_out: ^cffi.ulong) -> result ---

    @(require_results)
    @(link_name="cuStreamUpdateCaptureDependencies")
    StreamUpdateCaptureDependencies :: proc(hStream: stream, dependencies: ^^graphNode_st, numDependencies: cffi.uint, flags: cffi.uint) -> result ---

    @(require_results)
    @(link_name="cuStreamUpdateCaptureDependencies_v2")
    StreamUpdateCaptureDependencies_v2 :: proc(hStream: stream, dependencies: ^^graphNode_st, dependencyData: ^graphEdgeData_st, numDependencies: cffi.uint, flags: cffi.uint) -> result ---

    @(require_results)
    @(link_name="cuStreamAttachMemAsync")
    StreamAttachMemAsync :: proc(hStream: stream, dptr: deviceptr, length: cffi.uint, flags: cffi.uint) -> result ---

    @(require_results)
    @(link_name="cuStreamQuery")
    StreamQuery :: proc(hStream: stream) -> result ---

    @(require_results)
    @(link_name="cuStreamSynchronize")
    StreamSynchronize :: proc(hStream: stream) -> result ---

    @(require_results)
    @(link_name="cuStreamDestroy_v2")
    StreamDestroy_v2 :: proc(hStream: stream) -> result ---

    @(require_results)
    @(link_name="cuStreamCopyAttributes")
    StreamCopyAttributes :: proc(dst: stream, src: stream) -> result ---

    @(require_results)
    @(link_name="cuStreamGetAttribute")
    StreamGetAttribute :: proc(hStream: stream, attr: streamAttrID, value_out: ^launchAttributeValue_union) -> result ---

    @(require_results)
    @(link_name="cuStreamSetAttribute")
    StreamSetAttribute :: proc(hStream: stream, attr: streamAttrID, value: ^launchAttributeValue_union) -> result ---

    @(require_results)
    @(link_name="cuEventCreate")
    EventCreate :: proc(phEvent: ^^event_st, Flags: cffi.uint) -> result ---

    @(require_results)
    @(link_name="cuEventRecord")
    EventRecord :: proc(hEvent: event, hStream: stream) -> result ---

    @(require_results)
    @(link_name="cuEventRecordWithFlags")
    EventRecordWithFlags :: proc(hEvent: event, hStream: stream, flags: cffi.uint) -> result ---

    @(require_results)
    @(link_name="cuEventQuery")
    EventQuery :: proc(hEvent: event) -> result ---

    @(require_results)
    @(link_name="cuEventSynchronize")
    EventSynchronize :: proc(hEvent: event) -> result ---

    @(require_results)
    @(link_name="cuEventDestroy_v2")
    EventDestroy_v2 :: proc(hEvent: event) -> result ---

    @(require_results)
    @(link_name="cuEventElapsedTime")
    EventElapsedTime :: proc(pMilliseconds: ^cffi.float, hStart: event, hEnd: event) -> result ---

    @(require_results)
    @(link_name="cuImportExternalMemory")
    ImportExternalMemory :: proc(extMem_out: ^^extMemory_st, memHandleDesc: ^EXTERNAL_MEMORY_HANDLE_DESC_st) -> result ---

    @(require_results)
    @(link_name="cuExternalMemoryGetMappedBuffer")
    ExternalMemoryGetMappedBuffer :: proc(devPtr: ^cffi.ulonglong, extMem: externalMemory, bufferDesc: ^EXTERNAL_MEMORY_BUFFER_DESC_st) -> result ---

    @(require_results)
    @(link_name="cuExternalMemoryGetMappedMipmappedArray")
    ExternalMemoryGetMappedMipmappedArray :: proc(mipmap: ^^mipmappedArray_st, extMem: externalMemory, mipmapDesc: ^EXTERNAL_MEMORY_MIPMAPPED_ARRAY_DESC_st) -> result ---

    @(require_results)
    @(link_name="cuDestroyExternalMemory")
    DestroyExternalMemory :: proc(extMem: externalMemory) -> result ---

    @(require_results)
    @(link_name="cuImportExternalSemaphore")
    ImportExternalSemaphore :: proc(extSem_out: ^^extSemaphore_st, semHandleDesc: ^EXTERNAL_SEMAPHORE_HANDLE_DESC_st) -> result ---

    @(require_results)
    @(link_name="cuSignalExternalSemaphoresAsync")
    SignalExternalSemaphoresAsync :: proc(extSemArray: ^^extSemaphore_st, paramsArray: ^EXTERNAL_SEMAPHORE_SIGNAL_PARAMS_st, numExtSems: cffi.uint, stream: stream) -> result ---

    @(require_results)
    @(link_name="cuWaitExternalSemaphoresAsync")
    WaitExternalSemaphoresAsync :: proc(extSemArray: ^^extSemaphore_st, paramsArray: ^EXTERNAL_SEMAPHORE_WAIT_PARAMS_st, numExtSems: cffi.uint, stream: stream) -> result ---

    @(require_results)
    @(link_name="cuDestroyExternalSemaphore")
    DestroyExternalSemaphore :: proc(extSem: externalSemaphore) -> result ---

    @(require_results)
    @(link_name="cuStreamWaitValue32_v2")
    StreamWaitValue32_v2 :: proc(stream: stream, addr: deviceptr, value: cuuint32_t, flags: cffi.uint) -> result ---

    @(require_results)
    @(link_name="cuStreamWaitValue64_v2")
    StreamWaitValue64_v2 :: proc(stream: stream, addr: deviceptr, value: cuuint64_t, flags: cffi.uint) -> result ---

    @(require_results)
    @(link_name="cuStreamWriteValue32_v2")
    StreamWriteValue32_v2 :: proc(stream: stream, addr: deviceptr, value: cuuint32_t, flags: cffi.uint) -> result ---

    @(require_results)
    @(link_name="cuStreamWriteValue64_v2")
    StreamWriteValue64_v2 :: proc(stream: stream, addr: deviceptr, value: cuuint64_t, flags: cffi.uint) -> result ---

    @(require_results)
    @(link_name="cuStreamBatchMemOp_v2")
    StreamBatchMemOp_v2 :: proc(stream: stream, count: cffi.uint, paramArray: ^streamBatchMemOpParams_union, flags: cffi.uint) -> result ---

    @(require_results)
    @(link_name="cuFuncGetAttribute")
    FuncGetAttribute :: proc(pi: ^cffi.int, attrib: function_attribute, hfunc: function) -> result ---

    @(require_results)
    @(link_name="cuFuncSetAttribute")
    FuncSetAttribute :: proc(hfunc: function, attrib: function_attribute, value: cffi.int) -> result ---

    @(require_results)
    @(link_name="cuFuncSetCacheConfig")
    FuncSetCacheConfig :: proc(hfunc: function, config: func_cache) -> result ---

    @(require_results)
    @(link_name="cuFuncSetSharedMemConfig")
    FuncSetSharedMemConfig :: proc(hfunc: function, config: sharedconfig) -> result ---

    @(require_results)
    @(link_name="cuFuncGetModule")
    FuncGetModule :: proc(hmod: ^^mod_st, hfunc: function) -> result ---

    @(require_results)
    @(link_name="cuFuncGetName")
    FuncGetName :: proc(name: ^cstring, hfunc: function) -> result ---

    @(require_results)
    @(link_name="cuLaunchKernel")
    LaunchKernel :: proc(f: function, gridDimX: cffi.uint, gridDimY: cffi.uint, gridDimZ: cffi.uint, blockDimX: cffi.uint, blockDimY: cffi.uint, blockDimZ: cffi.uint, sharedMemBytes: cffi.uint, hStream: stream, kernelParams: ^rawptr, extra: ^rawptr) -> result ---

    @(require_results)
    @(link_name="cuLaunchKernelEx")
    LaunchKernelEx :: proc(config: ^launchConfig_st, f: function, kernelParams: ^rawptr, extra: ^rawptr) -> result ---

    @(require_results)
    @(link_name="cuLaunchCooperativeKernel")
    LaunchCooperativeKernel :: proc(f: function, gridDimX: cffi.uint, gridDimY: cffi.uint, gridDimZ: cffi.uint, blockDimX: cffi.uint, blockDimY: cffi.uint, blockDimZ: cffi.uint, sharedMemBytes: cffi.uint, hStream: stream, kernelParams: ^rawptr) -> result ---

    @(require_results)
    @(link_name="cuLaunchCooperativeKernelMultiDevice")
    LaunchCooperativeKernelMultiDevice :: proc(launchParamsList: ^LAUNCH_PARAMS_st, numDevices: cffi.uint, flags: cffi.uint) -> result ---

    @(require_results)
    @(link_name="cuLaunchHostFunc")
    LaunchHostFunc :: proc(hStream: stream, fn: hostFn, userData: rawptr) -> result ---

    @(require_results)
    @(link_name="cuFuncSetBlockShape")
    FuncSetBlockShape :: proc(hfunc: function, x: cffi.int, y: cffi.int, z: cffi.int) -> result ---

    @(require_results)
    @(link_name="cuFuncSetSharedSize")
    FuncSetSharedSize :: proc(hfunc: function, bytes: cffi.uint) -> result ---

    @(require_results)
    @(link_name="cuParamSetSize")
    ParamSetSize :: proc(hfunc: function, numbytes: cffi.uint) -> result ---

    @(require_results)
    @(link_name="cuParamSeti")
    ParamSeti :: proc(hfunc: function, offset: cffi.int, value: cffi.uint) -> result ---

    @(require_results)
    @(link_name="cuParamSetf")
    ParamSetf :: proc(hfunc: function, offset: cffi.int, value: cffi.float) -> result ---

    @(require_results)
    @(link_name="cuParamSetv")
    ParamSetv :: proc(hfunc: function, offset: cffi.int, ptr: rawptr, numbytes: cffi.uint) -> result ---

    @(require_results)
    @(link_name="cuLaunch")
    Launch :: proc(f: function) -> result ---

    @(require_results)
    @(link_name="cuLaunchGrid")
    LaunchGrid :: proc(f: function, grid_width: cffi.int, grid_height: cffi.int) -> result ---

    @(require_results)
    @(link_name="cuLaunchGridAsync")
    LaunchGridAsync :: proc(f: function, grid_width: cffi.int, grid_height: cffi.int, hStream: stream) -> result ---

    @(require_results)
    @(link_name="cuParamSetTexRef")
    ParamSetTexRef :: proc(hfunc: function, texunit: cffi.int, hTexRef: texref) -> result ---

    @(require_results)
    @(link_name="cuGraphCreate")
    GraphCreate :: proc(phGraph: ^^graph_st, flags: cffi.uint) -> result ---

    @(require_results)
    @(link_name="cuGraphAddKernelNode_v2")
    GraphAddKernelNode_v2 :: proc(phGraphNode: ^^graphNode_st, hGraph: graph, dependencies: ^^graphNode_st, numDependencies: cffi.uint, nodeParams: ^KERNEL_NODE_PARAMS_v2_st) -> result ---

    @(require_results)
    @(link_name="cuGraphKernelNodeGetParams_v2")
    GraphKernelNodeGetParams_v2 :: proc(hNode: graphNode, nodeParams: ^KERNEL_NODE_PARAMS_v2_st) -> result ---

    @(require_results)
    @(link_name="cuGraphKernelNodeSetParams_v2")
    GraphKernelNodeSetParams_v2 :: proc(hNode: graphNode, nodeParams: ^KERNEL_NODE_PARAMS_v2_st) -> result ---

    @(require_results)
    @(link_name="cuGraphAddMemcpyNode")
    GraphAddMemcpyNode :: proc(phGraphNode: ^^graphNode_st, hGraph: graph, dependencies: ^^graphNode_st, numDependencies: cffi.uint, copyParams: ^MEMCPY3D_st, ctx: context_t) -> result ---

    @(require_results)
    @(link_name="cuGraphMemcpyNodeGetParams")
    GraphMemcpyNodeGetParams :: proc(hNode: graphNode, nodeParams: ^MEMCPY3D_st) -> result ---

    @(require_results)
    @(link_name="cuGraphMemcpyNodeSetParams")
    GraphMemcpyNodeSetParams :: proc(hNode: graphNode, nodeParams: ^MEMCPY3D_st) -> result ---

    @(require_results)
    @(link_name="cuGraphAddMemsetNode")
    GraphAddMemsetNode :: proc(phGraphNode: ^^graphNode_st, hGraph: graph, dependencies: ^^graphNode_st, numDependencies: cffi.uint, memsetParams: ^MEMSET_NODE_PARAMS_st, ctx: context_t) -> result ---

    @(require_results)
    @(link_name="cuGraphMemsetNodeGetParams")
    GraphMemsetNodeGetParams :: proc(hNode: graphNode, nodeParams: ^MEMSET_NODE_PARAMS_st) -> result ---

    @(require_results)
    @(link_name="cuGraphMemsetNodeSetParams")
    GraphMemsetNodeSetParams :: proc(hNode: graphNode, nodeParams: ^MEMSET_NODE_PARAMS_st) -> result ---

    @(require_results)
    @(link_name="cuGraphAddHostNode")
    GraphAddHostNode :: proc(phGraphNode: ^^graphNode_st, hGraph: graph, dependencies: ^^graphNode_st, numDependencies: cffi.uint, nodeParams: ^HOST_NODE_PARAMS_st) -> result ---

    @(require_results)
    @(link_name="cuGraphHostNodeGetParams")
    GraphHostNodeGetParams :: proc(hNode: graphNode, nodeParams: ^HOST_NODE_PARAMS_st) -> result ---

    @(require_results)
    @(link_name="cuGraphHostNodeSetParams")
    GraphHostNodeSetParams :: proc(hNode: graphNode, nodeParams: ^HOST_NODE_PARAMS_st) -> result ---

    @(require_results)
    @(link_name="cuGraphAddChildGraphNode")
    GraphAddChildGraphNode :: proc(phGraphNode: ^^graphNode_st, hGraph: graph, dependencies: ^^graphNode_st, numDependencies: cffi.uint, childGraph: graph) -> result ---

    @(require_results)
    @(link_name="cuGraphChildGraphNodeGetGraph")
    GraphChildGraphNodeGetGraph :: proc(hNode: graphNode, phGraph: ^^graph_st) -> result ---

    @(require_results)
    @(link_name="cuGraphAddEmptyNode")
    GraphAddEmptyNode :: proc(phGraphNode: ^^graphNode_st, hGraph: graph, dependencies: ^^graphNode_st, numDependencies: cffi.uint) -> result ---

    @(require_results)
    @(link_name="cuGraphAddEventRecordNode")
    GraphAddEventRecordNode :: proc(phGraphNode: ^^graphNode_st, hGraph: graph, dependencies: ^^graphNode_st, numDependencies: cffi.uint, event: event) -> result ---

    @(require_results)
    @(link_name="cuGraphEventRecordNodeGetEvent")
    GraphEventRecordNodeGetEvent :: proc(hNode: graphNode, event_out: ^^event_st) -> result ---

    @(require_results)
    @(link_name="cuGraphEventRecordNodeSetEvent")
    GraphEventRecordNodeSetEvent :: proc(hNode: graphNode, event: event) -> result ---

    @(require_results)
    @(link_name="cuGraphAddEventWaitNode")
    GraphAddEventWaitNode :: proc(phGraphNode: ^^graphNode_st, hGraph: graph, dependencies: ^^graphNode_st, numDependencies: cffi.uint, event: event) -> result ---

    @(require_results)
    @(link_name="cuGraphEventWaitNodeGetEvent")
    GraphEventWaitNodeGetEvent :: proc(hNode: graphNode, event_out: ^^event_st) -> result ---

    @(require_results)
    @(link_name="cuGraphEventWaitNodeSetEvent")
    GraphEventWaitNodeSetEvent :: proc(hNode: graphNode, event: event) -> result ---

    @(require_results)
    @(link_name="cuGraphAddExternalSemaphoresSignalNode")
    GraphAddExternalSemaphoresSignalNode :: proc(phGraphNode: ^^graphNode_st, hGraph: graph, dependencies: ^^graphNode_st, numDependencies: cffi.uint, nodeParams: ^EXT_SEM_SIGNAL_NODE_PARAMS_st) -> result ---

    @(require_results)
    @(link_name="cuGraphExternalSemaphoresSignalNodeGetParams")
    GraphExternalSemaphoresSignalNodeGetParams :: proc(hNode: graphNode, params_out: ^EXT_SEM_SIGNAL_NODE_PARAMS_st) -> result ---

    @(require_results)
    @(link_name="cuGraphExternalSemaphoresSignalNodeSetParams")
    GraphExternalSemaphoresSignalNodeSetParams :: proc(hNode: graphNode, nodeParams: ^EXT_SEM_SIGNAL_NODE_PARAMS_st) -> result ---

    @(require_results)
    @(link_name="cuGraphAddExternalSemaphoresWaitNode")
    GraphAddExternalSemaphoresWaitNode :: proc(phGraphNode: ^^graphNode_st, hGraph: graph, dependencies: ^^graphNode_st, numDependencies: cffi.uint, nodeParams: ^EXT_SEM_WAIT_NODE_PARAMS_st) -> result ---

    @(require_results)
    @(link_name="cuGraphExternalSemaphoresWaitNodeGetParams")
    GraphExternalSemaphoresWaitNodeGetParams :: proc(hNode: graphNode, params_out: ^EXT_SEM_WAIT_NODE_PARAMS_st) -> result ---

    @(require_results)
    @(link_name="cuGraphExternalSemaphoresWaitNodeSetParams")
    GraphExternalSemaphoresWaitNodeSetParams :: proc(hNode: graphNode, nodeParams: ^EXT_SEM_WAIT_NODE_PARAMS_st) -> result ---

    @(require_results)
    @(link_name="cuGraphAddBatchMemOpNode")
    GraphAddBatchMemOpNode :: proc(phGraphNode: ^^graphNode_st, hGraph: graph, dependencies: ^^graphNode_st, numDependencies: cffi.uint, nodeParams: ^BATCH_MEM_OP_NODE_PARAMS_v1_st) -> result ---

    @(require_results)
    @(link_name="cuGraphBatchMemOpNodeGetParams")
    GraphBatchMemOpNodeGetParams :: proc(hNode: graphNode, nodeParams_out: ^BATCH_MEM_OP_NODE_PARAMS_v1_st) -> result ---

    @(require_results)
    @(link_name="cuGraphBatchMemOpNodeSetParams")
    GraphBatchMemOpNodeSetParams :: proc(hNode: graphNode, nodeParams: ^BATCH_MEM_OP_NODE_PARAMS_v1_st) -> result ---

    @(require_results)
    @(link_name="cuGraphExecBatchMemOpNodeSetParams")
    GraphExecBatchMemOpNodeSetParams :: proc(hGraphExec: graphExec, hNode: graphNode, nodeParams: ^BATCH_MEM_OP_NODE_PARAMS_v1_st) -> result ---

    @(require_results)
    @(link_name="cuGraphAddMemAllocNode")
    GraphAddMemAllocNode :: proc(phGraphNode: ^^graphNode_st, hGraph: graph, dependencies: ^^graphNode_st, numDependencies: cffi.uint, nodeParams: ^MEM_ALLOC_NODE_PARAMS_v1_st) -> result ---

    @(require_results)
    @(link_name="cuGraphMemAllocNodeGetParams")
    GraphMemAllocNodeGetParams :: proc(hNode: graphNode, params_out: ^MEM_ALLOC_NODE_PARAMS_v1_st) -> result ---

    @(require_results)
    @(link_name="cuGraphAddMemFreeNode")
    GraphAddMemFreeNode :: proc(phGraphNode: ^^graphNode_st, hGraph: graph, dependencies: ^^graphNode_st, numDependencies: cffi.uint, dptr: deviceptr) -> result ---

    @(require_results)
    @(link_name="cuGraphMemFreeNodeGetParams")
    GraphMemFreeNodeGetParams :: proc(hNode: graphNode, dptr_out: ^cffi.ulonglong) -> result ---

    @(require_results)
    @(link_name="cuDeviceGraphMemTrim")
    DeviceGraphMemTrim :: proc(device: device) -> result ---

    @(require_results)
    @(link_name="cuDeviceGetGraphMemAttribute")
    DeviceGetGraphMemAttribute :: proc(device: device, attr: graphMem_attribute, value: rawptr) -> result ---

    @(require_results)
    @(link_name="cuDeviceSetGraphMemAttribute")
    DeviceSetGraphMemAttribute :: proc(device: device, attr: graphMem_attribute, value: rawptr) -> result ---

    @(require_results)
    @(link_name="cuGraphClone")
    GraphClone :: proc(phGraphClone: ^^graph_st, originalGraph: graph) -> result ---

    @(require_results)
    @(link_name="cuGraphNodeFindInClone")
    GraphNodeFindInClone :: proc(phNode: ^^graphNode_st, hOriginalNode: graphNode, hClonedGraph: graph) -> result ---

    @(require_results)
    @(link_name="cuGraphNodeGetType")
    GraphNodeGetType :: proc(hNode: graphNode, type: ^graphNodeType) -> result ---

    @(require_results)
    @(link_name="cuGraphGetNodes")
    GraphGetNodes :: proc(hGraph: graph, nodes: ^^graphNode_st, numNodes: ^cffi.ulong) -> result ---

    @(require_results)
    @(link_name="cuGraphGetRootNodes")
    GraphGetRootNodes :: proc(hGraph: graph, rootNodes: ^^graphNode_st, numRootNodes: ^cffi.ulong) -> result ---

    @(require_results)
    @(link_name="cuGraphGetEdges")
    GraphGetEdges :: proc(hGraph: graph, from: ^^graphNode_st, to: ^^graphNode_st, numEdges: ^cffi.ulong) -> result ---

    @(require_results)
    @(link_name="cuGraphGetEdges_v2")
    GraphGetEdges_v2 :: proc(hGraph: graph, from: ^^graphNode_st, to: ^^graphNode_st, edgeData: ^graphEdgeData_st, numEdges: ^cffi.ulong) -> result ---

    @(require_results)
    @(link_name="cuGraphNodeGetDependencies")
    GraphNodeGetDependencies :: proc(hNode: graphNode, dependencies: ^^graphNode_st, numDependencies: ^cffi.ulong) -> result ---

    @(require_results)
    @(link_name="cuGraphNodeGetDependencies_v2")
    GraphNodeGetDependencies_v2 :: proc(hNode: graphNode, dependencies: ^^graphNode_st, edgeData: ^graphEdgeData_st, numDependencies: ^cffi.ulong) -> result ---

    @(require_results)
    @(link_name="cuGraphNodeGetDependentNodes")
    GraphNodeGetDependentNodes :: proc(hNode: graphNode, dependentNodes: ^^graphNode_st, numDependentNodes: ^cffi.ulong) -> result ---

    @(require_results)
    @(link_name="cuGraphNodeGetDependentNodes_v2")
    GraphNodeGetDependentNodes_v2 :: proc(hNode: graphNode, dependentNodes: ^^graphNode_st, edgeData: ^graphEdgeData_st, numDependentNodes: ^cffi.ulong) -> result ---

    @(require_results)
    @(link_name="cuGraphAddDependencies")
    GraphAddDependencies :: proc(hGraph: graph, from: ^^graphNode_st, to: ^^graphNode_st, numDependencies: cffi.uint) -> result ---

    @(require_results)
    @(link_name="cuGraphAddDependencies_v2")
    GraphAddDependencies_v2 :: proc(hGraph: graph, from: ^^graphNode_st, to: ^^graphNode_st, edgeData: ^graphEdgeData_st, numDependencies: cffi.uint) -> result ---

    @(require_results)
    @(link_name="cuGraphRemoveDependencies")
    GraphRemoveDependencies :: proc(hGraph: graph, from: ^^graphNode_st, to: ^^graphNode_st, numDependencies: cffi.uint) -> result ---

    @(require_results)
    @(link_name="cuGraphRemoveDependencies_v2")
    GraphRemoveDependencies_v2 :: proc(hGraph: graph, from: ^^graphNode_st, to: ^^graphNode_st, edgeData: ^graphEdgeData_st, numDependencies: cffi.uint) -> result ---

    @(require_results)
    @(link_name="cuGraphDestroyNode")
    GraphDestroyNode :: proc(hNode: graphNode) -> result ---

    @(require_results)
    @(link_name="cuGraphInstantiateWithFlags")
    GraphInstantiateWithFlags :: proc(phGraphExec: ^^graphExec_st, hGraph: graph, flags: cffi.ulonglong) -> result ---

    @(require_results)
    @(link_name="cuGraphInstantiateWithParams")
    GraphInstantiateWithParams :: proc(phGraphExec: ^^graphExec_st, hGraph: graph, instantiateParams: ^GRAPH_INSTANTIATE_PARAMS_st) -> result ---

    @(require_results)
    @(link_name="cuGraphExecGetFlags")
    GraphExecGetFlags :: proc(hGraphExec: graphExec, flags: ^cffi.ulonglong) -> result ---

    @(require_results)
    @(link_name="cuGraphExecKernelNodeSetParams_v2")
    GraphExecKernelNodeSetParams_v2 :: proc(hGraphExec: graphExec, hNode: graphNode, nodeParams: ^KERNEL_NODE_PARAMS_v2_st) -> result ---

    @(require_results)
    @(link_name="cuGraphExecMemcpyNodeSetParams")
    GraphExecMemcpyNodeSetParams :: proc(hGraphExec: graphExec, hNode: graphNode, copyParams: ^MEMCPY3D_st, ctx: context_t) -> result ---

    @(require_results)
    @(link_name="cuGraphExecMemsetNodeSetParams")
    GraphExecMemsetNodeSetParams :: proc(hGraphExec: graphExec, hNode: graphNode, memsetParams: ^MEMSET_NODE_PARAMS_st, ctx: context_t) -> result ---

    @(require_results)
    @(link_name="cuGraphExecHostNodeSetParams")
    GraphExecHostNodeSetParams :: proc(hGraphExec: graphExec, hNode: graphNode, nodeParams: ^HOST_NODE_PARAMS_st) -> result ---

    @(require_results)
    @(link_name="cuGraphExecChildGraphNodeSetParams")
    GraphExecChildGraphNodeSetParams :: proc(hGraphExec: graphExec, hNode: graphNode, childGraph: graph) -> result ---

    @(require_results)
    @(link_name="cuGraphExecEventRecordNodeSetEvent")
    GraphExecEventRecordNodeSetEvent :: proc(hGraphExec: graphExec, hNode: graphNode, event: event) -> result ---

    @(require_results)
    @(link_name="cuGraphExecEventWaitNodeSetEvent")
    GraphExecEventWaitNodeSetEvent :: proc(hGraphExec: graphExec, hNode: graphNode, event: event) -> result ---

    @(require_results)
    @(link_name="cuGraphExecExternalSemaphoresSignalNodeSetParams")
    GraphExecExternalSemaphoresSignalNodeSetParams :: proc(hGraphExec: graphExec, hNode: graphNode, nodeParams: ^EXT_SEM_SIGNAL_NODE_PARAMS_st) -> result ---

    @(require_results)
    @(link_name="cuGraphExecExternalSemaphoresWaitNodeSetParams")
    GraphExecExternalSemaphoresWaitNodeSetParams :: proc(hGraphExec: graphExec, hNode: graphNode, nodeParams: ^EXT_SEM_WAIT_NODE_PARAMS_st) -> result ---

    @(require_results)
    @(link_name="cuGraphNodeSetEnabled")
    GraphNodeSetEnabled :: proc(hGraphExec: graphExec, hNode: graphNode, isEnabled: cffi.uint) -> result ---

    @(require_results)
    @(link_name="cuGraphNodeGetEnabled")
    GraphNodeGetEnabled :: proc(hGraphExec: graphExec, hNode: graphNode, isEnabled: ^cffi.uint) -> result ---

    @(require_results)
    @(link_name="cuGraphUpload")
    GraphUpload :: proc(hGraphExec: graphExec, hStream: stream) -> result ---

    @(require_results)
    @(link_name="cuGraphLaunch")
    GraphLaunch :: proc(hGraphExec: graphExec, hStream: stream) -> result ---

    @(require_results)
    @(link_name="cuGraphExecDestroy")
    GraphExecDestroy :: proc(hGraphExec: graphExec) -> result ---

    @(require_results)
    @(link_name="cuGraphDestroy")
    GraphDestroy :: proc(hGraph: graph) -> result ---

    @(require_results)
    @(link_name="cuGraphExecUpdate_v2")
    GraphExecUpdate_v2 :: proc(hGraphExec: graphExec, hGraph: graph, resultInfo: ^graphExecUpdateResultInfo_st) -> result ---

    @(require_results)
    @(link_name="cuGraphKernelNodeCopyAttributes")
    GraphKernelNodeCopyAttributes :: proc(dst: graphNode, src: graphNode) -> result ---

    @(require_results)
    @(link_name="cuGraphKernelNodeGetAttribute")
    GraphKernelNodeGetAttribute :: proc(hNode: graphNode, attr: kernelNodeAttrID, value_out: ^launchAttributeValue_union) -> result ---

    @(require_results)
    @(link_name="cuGraphKernelNodeSetAttribute")
    GraphKernelNodeSetAttribute :: proc(hNode: graphNode, attr: kernelNodeAttrID, value: ^launchAttributeValue_union) -> result ---

    @(require_results)
    @(link_name="cuGraphDebugDotPrint")
    GraphDebugDotPrint :: proc(hGraph: graph, path: cstring, flags: cffi.uint) -> result ---

    @(require_results)
    @(link_name="cuUserObjectCreate")
    UserObjectCreate :: proc(object_out: ^^userObject_st, ptr: rawptr, destroy: hostFn, initialRefcount: cffi.uint, flags: cffi.uint) -> result ---

    @(require_results)
    @(link_name="cuUserObjectRetain")
    UserObjectRetain :: proc(object: userObject, count: cffi.uint) -> result ---

    @(require_results)
    @(link_name="cuUserObjectRelease")
    UserObjectRelease :: proc(object: userObject, count: cffi.uint) -> result ---

    @(require_results)
    @(link_name="cuGraphRetainUserObject")
    GraphRetainUserObject :: proc(graph: graph, object: userObject, count: cffi.uint, flags: cffi.uint) -> result ---

    @(require_results)
    @(link_name="cuGraphReleaseUserObject")
    GraphReleaseUserObject :: proc(graph: graph, object: userObject, count: cffi.uint) -> result ---

    @(require_results)
    @(link_name="cuGraphAddNode")
    GraphAddNode :: proc(phGraphNode: ^^graphNode_st, hGraph: graph, dependencies: ^^graphNode_st, numDependencies: cffi.uint, nodeParams: ^graphNodeParams_st) -> result ---

    @(require_results)
    @(link_name="cuGraphAddNode_v2")
    GraphAddNode_v2 :: proc(phGraphNode: ^^graphNode_st, hGraph: graph, dependencies: ^^graphNode_st, dependencyData: ^graphEdgeData_st, numDependencies: cffi.uint, nodeParams: ^graphNodeParams_st) -> result ---

    @(require_results)
    @(link_name="cuGraphNodeSetParams")
    GraphNodeSetParams :: proc(hNode: graphNode, nodeParams: ^graphNodeParams_st) -> result ---

    @(require_results)
    @(link_name="cuGraphExecNodeSetParams")
    GraphExecNodeSetParams :: proc(hGraphExec: graphExec, hNode: graphNode, nodeParams: ^graphNodeParams_st) -> result ---

    @(require_results)
    @(link_name="cuGraphConditionalHandleCreate")
    GraphConditionalHandleCreate :: proc(pHandle_out: ^cffi.ulonglong, hGraph: graph, ctx: context_t, defaultLaunchValue: cffi.uint, flags: cffi.uint) -> result ---

    @(require_results)
    @(link_name="cuOccupancyMaxActiveBlocksPerMultiprocessor")
    OccupancyMaxActiveBlocksPerMultiprocessor :: proc(numBlocks: ^cffi.int, func: function, blockSize: cffi.int, dynamicSMemSize: cffi.uint) -> result ---

    @(require_results)
    @(link_name="cuOccupancyMaxActiveBlocksPerMultiprocessorWithFlags")
    OccupancyMaxActiveBlocksPerMultiprocessorWithFlags :: proc(numBlocks: ^cffi.int, func: function, blockSize: cffi.int, dynamicSMemSize: cffi.uint, flags: cffi.uint) -> result ---

    @(require_results)
    @(link_name="cuOccupancyMaxPotentialBlockSize")
    OccupancyMaxPotentialBlockSize :: proc(minGridSize: ^cffi.int, blockSize: ^cffi.int, func: function, blockSizeToDynamicSMemSize: occupancyB2DSize, dynamicSMemSize: cffi.uint, blockSizeLimit: cffi.int) -> result ---

    @(require_results)
    @(link_name="cuOccupancyMaxPotentialBlockSizeWithFlags")
    OccupancyMaxPotentialBlockSizeWithFlags :: proc(minGridSize: ^cffi.int, blockSize: ^cffi.int, func: function, blockSizeToDynamicSMemSize: occupancyB2DSize, dynamicSMemSize: cffi.uint, blockSizeLimit: cffi.int, flags: cffi.uint) -> result ---

    @(require_results)
    @(link_name="cuOccupancyAvailableDynamicSMemPerBlock")
    OccupancyAvailableDynamicSMemPerBlock :: proc(dynamicSmemSize: ^cffi.ulong, func: function, numBlocks: cffi.int, blockSize: cffi.int) -> result ---

    @(require_results)
    @(link_name="cuOccupancyMaxPotentialClusterSize")
    OccupancyMaxPotentialClusterSize :: proc(clusterSize: ^cffi.int, func: function, config: ^launchConfig_st) -> result ---

    @(require_results)
    @(link_name="cuOccupancyMaxActiveClusters")
    OccupancyMaxActiveClusters :: proc(numClusters: ^cffi.int, func: function, config: ^launchConfig_st) -> result ---

    @(require_results)
    @(link_name="cuTexRefSetArray")
    TexRefSetArray :: proc(hTexRef: texref, hArray: array, Flags: cffi.uint) -> result ---

    @(require_results)
    @(link_name="cuTexRefSetMipmappedArray")
    TexRefSetMipmappedArray :: proc(hTexRef: texref, hMipmappedArray: mipmappedArray, Flags: cffi.uint) -> result ---

    @(require_results)
    @(link_name="cuTexRefSetAddress_v2")
    TexRefSetAddress_v2 :: proc(ByteOffset: ^cffi.ulong, hTexRef: texref, dptr: deviceptr, bytes: cffi.uint) -> result ---

    @(require_results)
    @(link_name="cuTexRefSetAddress2D_v3")
    TexRefSetAddress2D_v3 :: proc(hTexRef: texref, desc: ^ARRAY_DESCRIPTOR_st, dptr: deviceptr, Pitch: cffi.uint) -> result ---

    @(require_results)
    @(link_name="cuTexRefSetFormat")
    TexRefSetFormat :: proc(hTexRef: texref, fmt: array_format, NumPackedComponents: cffi.int) -> result ---

    @(require_results)
    @(link_name="cuTexRefSetAddressMode")
    TexRefSetAddressMode :: proc(hTexRef: texref, dim: cffi.int, am: address_mode) -> result ---

    @(require_results)
    @(link_name="cuTexRefSetFilterMode")
    TexRefSetFilterMode :: proc(hTexRef: texref, fm: filter_mode) -> result ---

    @(require_results)
    @(link_name="cuTexRefSetMipmapFilterMode")
    TexRefSetMipmapFilterMode :: proc(hTexRef: texref, fm: filter_mode) -> result ---

    @(require_results)
    @(link_name="cuTexRefSetMipmapLevelBias")
    TexRefSetMipmapLevelBias :: proc(hTexRef: texref, bias: cffi.float) -> result ---

    @(require_results)
    @(link_name="cuTexRefSetMipmapLevelClamp")
    TexRefSetMipmapLevelClamp :: proc(hTexRef: texref, minMipmapLevelClamp: cffi.float, maxMipmapLevelClamp: cffi.float) -> result ---

    @(require_results)
    @(link_name="cuTexRefSetMaxAnisotropy")
    TexRefSetMaxAnisotropy :: proc(hTexRef: texref, maxAniso: cffi.uint) -> result ---

    @(require_results)
    @(link_name="cuTexRefSetBorderColor")
    TexRefSetBorderColor :: proc(hTexRef: texref, pBorderColor: ^cffi.float) -> result ---

    @(require_results)
    @(link_name="cuTexRefSetFlags")
    TexRefSetFlags :: proc(hTexRef: texref, Flags: cffi.uint) -> result ---

    @(require_results)
    @(link_name="cuTexRefGetAddress_v2")
    TexRefGetAddress_v2 :: proc(pdptr: ^cffi.ulonglong, hTexRef: texref) -> result ---

    @(require_results)
    @(link_name="cuTexRefGetArray")
    TexRefGetArray :: proc(phArray: ^^array_st, hTexRef: texref) -> result ---

    @(require_results)
    @(link_name="cuTexRefGetMipmappedArray")
    TexRefGetMipmappedArray :: proc(phMipmappedArray: ^^mipmappedArray_st, hTexRef: texref) -> result ---

    @(require_results)
    @(link_name="cuTexRefGetAddressMode")
    TexRefGetAddressMode :: proc(pam: ^address_mode, hTexRef: texref, dim: cffi.int) -> result ---

    @(require_results)
    @(link_name="cuTexRefGetFilterMode")
    TexRefGetFilterMode :: proc(pfm: ^filter_mode, hTexRef: texref) -> result ---

    @(require_results)
    @(link_name="cuTexRefGetFormat")
    TexRefGetFormat :: proc(pFormat: ^array_format, pNumChannels: ^cffi.int, hTexRef: texref) -> result ---

    @(require_results)
    @(link_name="cuTexRefGetMipmapFilterMode")
    TexRefGetMipmapFilterMode :: proc(pfm: ^filter_mode, hTexRef: texref) -> result ---

    @(require_results)
    @(link_name="cuTexRefGetMipmapLevelBias")
    TexRefGetMipmapLevelBias :: proc(pbias: ^cffi.float, hTexRef: texref) -> result ---

    @(require_results)
    @(link_name="cuTexRefGetMipmapLevelClamp")
    TexRefGetMipmapLevelClamp :: proc(pminMipmapLevelClamp: ^cffi.float, pmaxMipmapLevelClamp: ^cffi.float, hTexRef: texref) -> result ---

    @(require_results)
    @(link_name="cuTexRefGetMaxAnisotropy")
    TexRefGetMaxAnisotropy :: proc(pmaxAniso: ^cffi.int, hTexRef: texref) -> result ---

    @(require_results)
    @(link_name="cuTexRefGetBorderColor")
    TexRefGetBorderColor :: proc(pBorderColor: ^cffi.float, hTexRef: texref) -> result ---

    @(require_results)
    @(link_name="cuTexRefGetFlags")
    TexRefGetFlags :: proc(pFlags: ^cffi.uint, hTexRef: texref) -> result ---

    @(require_results)
    @(link_name="cuTexRefCreate")
    TexRefCreate :: proc(pTexRef: ^^texref_st) -> result ---

    @(require_results)
    @(link_name="cuTexRefDestroy")
    TexRefDestroy :: proc(hTexRef: texref) -> result ---

    @(require_results)
    @(link_name="cuSurfRefSetArray")
    SurfRefSetArray :: proc(hSurfRef: surfref, hArray: array, Flags: cffi.uint) -> result ---

    @(require_results)
    @(link_name="cuSurfRefGetArray")
    SurfRefGetArray :: proc(phArray: ^^array_st, hSurfRef: surfref) -> result ---

    @(require_results)
    @(link_name="cuTexObjectCreate")
    TexObjectCreate :: proc(pTexObject: ^cffi.ulonglong, pResDesc: ^RESOURCE_DESC_st, pTexDesc: ^TEXTURE_DESC_st, pResViewDesc: ^RESOURCE_VIEW_DESC_st) -> result ---

    @(require_results)
    @(link_name="cuTexObjectDestroy")
    TexObjectDestroy :: proc(texObject: texObject) -> result ---

    @(require_results)
    @(link_name="cuTexObjectGetResourceDesc")
    TexObjectGetResourceDesc :: proc(pResDesc: ^RESOURCE_DESC_st, texObject: texObject) -> result ---

    @(require_results)
    @(link_name="cuTexObjectGetTextureDesc")
    TexObjectGetTextureDesc :: proc(pTexDesc: ^TEXTURE_DESC_st, texObject: texObject) -> result ---

    @(require_results)
    @(link_name="cuTexObjectGetResourceViewDesc")
    TexObjectGetResourceViewDesc :: proc(pResViewDesc: ^RESOURCE_VIEW_DESC_st, texObject: texObject) -> result ---

    @(require_results)
    @(link_name="cuSurfObjectCreate")
    SurfObjectCreate :: proc(pSurfObject: ^cffi.ulonglong, pResDesc: ^RESOURCE_DESC_st) -> result ---

    @(require_results)
    @(link_name="cuSurfObjectDestroy")
    SurfObjectDestroy :: proc(surfObject: surfObject) -> result ---

    @(require_results)
    @(link_name="cuSurfObjectGetResourceDesc")
    SurfObjectGetResourceDesc :: proc(pResDesc: ^RESOURCE_DESC_st, surfObject: surfObject) -> result ---

    @(require_results)
    @(link_name="cuTensorMapEncodeTiled")
    TensorMapEncodeTiled :: proc(tensorMap: ^tensorMap_st, tensorDataType: tensorMapDataType, tensorRank: cuuint32_t, globalAddress: rawptr, globalDim: ^cffi.ulonglong, globalStrides: ^cffi.ulonglong, boxDim: ^cffi.uint, elementStrides: ^cffi.uint, interleave: tensorMapInterleave, swizzle: tensorMapSwizzle, l2Promotion: tensorMapL2promotion, oobFill: tensorMapFloatOOBfill) -> result ---

    @(require_results)
    @(link_name="cuTensorMapEncodeIm2col")
    TensorMapEncodeIm2col :: proc(tensorMap: ^tensorMap_st, tensorDataType: tensorMapDataType, tensorRank: cuuint32_t, globalAddress: rawptr, globalDim: ^cffi.ulonglong, globalStrides: ^cffi.ulonglong, pixelBoxLowerCorner: ^cffi.int, pixelBoxUpperCorner: ^cffi.int, channelsPerPixel: cuuint32_t, pixelsPerColumn: cuuint32_t, elementStrides: ^cffi.uint, interleave: tensorMapInterleave, swizzle: tensorMapSwizzle, l2Promotion: tensorMapL2promotion, oobFill: tensorMapFloatOOBfill) -> result ---

    @(require_results)
    @(link_name="cuTensorMapReplaceAddress")
    TensorMapReplaceAddress :: proc(tensorMap: ^tensorMap_st, globalAddress: rawptr) -> result ---

    @(require_results)
    @(link_name="cuDeviceCanAccessPeer")
    DeviceCanAccessPeer :: proc(canAccessPeer: ^cffi.int, dev: device, peerDev: device) -> result ---

    @(require_results)
    @(link_name="cuCtxEnablePeerAccess")
    CtxEnablePeerAccess :: proc(peerContext: context_t, Flags: cffi.uint) -> result ---

    @(require_results)
    @(link_name="cuCtxDisablePeerAccess")
    CtxDisablePeerAccess :: proc(peerContext: context_t) -> result ---

    @(require_results)
    @(link_name="cuDeviceGetP2PAttribute")
    DeviceGetP2PAttribute :: proc(value: ^cffi.int, attrib: device_P2PAttribute, srcDevice: device, dstDevice: device) -> result ---

    @(require_results)
    @(link_name="cuGraphicsUnregisterResource")
    GraphicsUnregisterResource :: proc(resource: graphicsResource) -> result ---

    @(require_results)
    @(link_name="cuGraphicsSubResourceGetMappedArray")
    GraphicsSubResourceGetMappedArray :: proc(pArray: ^^array_st, resource: graphicsResource, arrayIndex: cffi.uint, mipLevel: cffi.uint) -> result ---

    @(require_results)
    @(link_name="cuGraphicsResourceGetMappedMipmappedArray")
    GraphicsResourceGetMappedMipmappedArray :: proc(pMipmappedArray: ^^mipmappedArray_st, resource: graphicsResource) -> result ---

    @(require_results)
    @(link_name="cuGraphicsResourceGetMappedPointer_v2")
    GraphicsResourceGetMappedPointer_v2 :: proc(pDevPtr: ^cffi.ulonglong, pSize: ^cffi.ulong, resource: graphicsResource) -> result ---

    @(require_results)
    @(link_name="cuGraphicsResourceSetMapFlags_v2")
    GraphicsResourceSetMapFlags_v2 :: proc(resource: graphicsResource, flags: cffi.uint) -> result ---

    @(require_results)
    @(link_name="cuGraphicsMapResources")
    GraphicsMapResources :: proc(count: cffi.uint, resources: ^^graphicsResource_st, hStream: stream) -> result ---

    @(require_results)
    @(link_name="cuGraphicsUnmapResources")
    GraphicsUnmapResources :: proc(count: cffi.uint, resources: ^^graphicsResource_st, hStream: stream) -> result ---

    @(require_results)
    @(link_name="cuGetProcAddress_v2")
    GetProcAddress_v2 :: proc(symbol: cstring, pfn: ^rawptr, cudaVersion: cffi.int, flags: cuuint64_t, symbolStatus: ^driverProcAddressQueryResult) -> result ---

    @(require_results)
    @(link_name="cuCoredumpGetAttribute")
    CoredumpGetAttribute :: proc(attrib: coredumpSettings, value: rawptr, size: ^cffi.ulong) -> result ---

    @(require_results)
    @(link_name="cuCoredumpGetAttributeGlobal")
    CoredumpGetAttributeGlobal :: proc(attrib: coredumpSettings, value: rawptr, size: ^cffi.ulong) -> result ---

    @(require_results)
    @(link_name="cuCoredumpSetAttribute")
    CoredumpSetAttribute :: proc(attrib: coredumpSettings, value: rawptr, size: ^cffi.ulong) -> result ---

    @(require_results)
    @(link_name="cuCoredumpSetAttributeGlobal")
    CoredumpSetAttributeGlobal :: proc(attrib: coredumpSettings, value: rawptr, size: ^cffi.ulong) -> result ---

    @(require_results)
    @(link_name="cuGetExportTable")
    GetExportTable :: proc(ppExportTable: ^rawptr, pExportTableId: ^uuid_st) -> result ---

}

/// cuuint32_t
cuuint32_t :: distinct cffi.uint

/// cuuint64_t
cuuint64_t :: distinct cffi.ulonglong

/// CUdeviceptr_v2
deviceptr_v2 :: distinct cffi.ulonglong

/// CUdeviceptr
deviceptr :: distinct cffi.ulonglong

/// CUdevice_v1
device_v1 :: distinct cffi.int

/// CUdevice
device :: distinct cffi.int

/// CUcontext
context_t :: distinct ^ctx_st

/// CUmodule
module :: distinct ^mod_st

/// CUfunction
function :: distinct ^func_st

/// CUlibrary
library :: distinct ^lib_st

/// CUkernel
kernel :: distinct ^kern_st

/// CUarray
array :: distinct ^array_st

/// CUmipmappedArray
mipmappedArray :: distinct ^mipmappedArray_st

/// CUtexref
texref :: distinct ^texref_st

/// CUsurfref
surfref :: distinct ^surfref_st

/// CUevent
event :: distinct ^event_st

/// CUstream
stream :: distinct ^stream_st

/// CUgraphicsResource
graphicsResource :: distinct ^graphicsResource_st

/// CUtexObject_v1
texObject_v1 :: distinct cffi.ulonglong

/// CUtexObject
texObject :: distinct cffi.ulonglong

/// CUsurfObject_v1
surfObject_v1 :: distinct cffi.ulonglong

/// CUsurfObject
surfObject :: distinct cffi.ulonglong

/// CUexternalMemory
externalMemory :: distinct ^extMemory_st

/// CUexternalSemaphore
externalSemaphore :: distinct ^extSemaphore_st

/// CUgraph
graph :: distinct ^graph_st

/// CUgraphNode
graphNode :: distinct ^graphNode_st

/// CUgraphExec
graphExec :: distinct ^graphExec_st

/// CUmemoryPool
memoryPool :: distinct ^memPoolHandle_st

/// CUuserObject
userObject :: distinct ^userObject_st

/// CUgraphConditionalHandle
graphConditionalHandle :: distinct cffi.ulonglong

/// CUuuid
uuid :: distinct uuid_st

/// CUmemFabricHandle_v1
memFabricHandle_v1 :: distinct memFabricHandle_st

/// CUmemFabricHandle
memFabricHandle :: distinct memFabricHandle_st

/// CUipcEventHandle_v1
ipcEventHandle_v1 :: distinct ipcEventHandle_st

/// CUipcEventHandle
ipcEventHandle :: distinct ipcEventHandle_st

/// CUipcMemHandle_v1
ipcMemHandle_v1 :: distinct ipcMemHandle_st

/// CUipcMemHandle
ipcMemHandle :: distinct ipcMemHandle_st

/// CUstreamBatchMemOpParams_v1
streamBatchMemOpParams_v1 :: distinct streamBatchMemOpParams_union

/// CUstreamBatchMemOpParams
streamBatchMemOpParams :: distinct streamBatchMemOpParams_union

/// CUDA_BATCH_MEM_OP_NODE_PARAMS_v1
BATCH_MEM_OP_NODE_PARAMS_v1 :: distinct BATCH_MEM_OP_NODE_PARAMS_v1_st

/// CUDA_BATCH_MEM_OP_NODE_PARAMS
BATCH_MEM_OP_NODE_PARAMS :: distinct BATCH_MEM_OP_NODE_PARAMS_v1_st

/// CUDA_BATCH_MEM_OP_NODE_PARAMS_v2
BATCH_MEM_OP_NODE_PARAMS_v2 :: distinct BATCH_MEM_OP_NODE_PARAMS_v2_st

/// CUdevprop_v1
devprop_v1 :: distinct devprop_st

/// CUdevprop
devprop :: distinct devprop_st

/// CUlinkState
linkState :: distinct ^linkState_st

/// CUhostFn
hostFn :: distinct proc "c" (userData: rawptr)

/// CUaccessPolicyWindow_v1
accessPolicyWindow_v1 :: distinct accessPolicyWindow_st

/// CUaccessPolicyWindow
accessPolicyWindow :: distinct accessPolicyWindow_st

/// CUDA_KERNEL_NODE_PARAMS_v1
KERNEL_NODE_PARAMS_v1 :: distinct KERNEL_NODE_PARAMS_st

/// CUDA_KERNEL_NODE_PARAMS_v2
KERNEL_NODE_PARAMS_v2 :: distinct KERNEL_NODE_PARAMS_v2_st

/// CUDA_KERNEL_NODE_PARAMS
KERNEL_NODE_PARAMS :: distinct KERNEL_NODE_PARAMS_v2_st

/// CUDA_KERNEL_NODE_PARAMS_v3
KERNEL_NODE_PARAMS_v3 :: distinct KERNEL_NODE_PARAMS_v3_st

/// CUDA_MEMSET_NODE_PARAMS_v1
MEMSET_NODE_PARAMS_v1 :: distinct MEMSET_NODE_PARAMS_st

/// CUDA_MEMSET_NODE_PARAMS
MEMSET_NODE_PARAMS :: distinct MEMSET_NODE_PARAMS_st

/// CUDA_MEMSET_NODE_PARAMS_v2
MEMSET_NODE_PARAMS_v2 :: distinct MEMSET_NODE_PARAMS_v2_st

/// CUDA_HOST_NODE_PARAMS_v1
HOST_NODE_PARAMS_v1 :: distinct HOST_NODE_PARAMS_st

/// CUDA_HOST_NODE_PARAMS
HOST_NODE_PARAMS :: distinct HOST_NODE_PARAMS_st

/// CUDA_HOST_NODE_PARAMS_v2
HOST_NODE_PARAMS_v2 :: distinct HOST_NODE_PARAMS_v2_st

/// CUgraphEdgeData
graphEdgeData :: distinct graphEdgeData_st

/// CUDA_GRAPH_INSTANTIATE_PARAMS
GRAPH_INSTANTIATE_PARAMS :: distinct GRAPH_INSTANTIATE_PARAMS_st

/// CUlaunchMemSyncDomainMap
launchMemSyncDomainMap :: distinct launchMemSyncDomainMap_st

/// CUlaunchAttributeValue
launchAttributeValue :: distinct launchAttributeValue_union

/// CUlaunchAttribute
launchAttribute :: distinct launchAttribute_st

/// CUlaunchConfig
launchConfig :: distinct launchConfig_st

/// CUkernelNodeAttrID
kernelNodeAttrID :: distinct launchAttributeID

/// CUkernelNodeAttrValue_v1
kernelNodeAttrValue_v1 :: distinct launchAttributeValue_union

/// CUkernelNodeAttrValue
kernelNodeAttrValue :: distinct launchAttributeValue_union

/// CUstreamAttrID
streamAttrID :: distinct launchAttributeID

/// CUstreamAttrValue_v1
streamAttrValue_v1 :: distinct launchAttributeValue_union

/// CUstreamAttrValue
streamAttrValue :: distinct launchAttributeValue_union

/// CUexecAffinitySmCount_v1
execAffinitySmCount_v1 :: distinct execAffinitySmCount_st

/// CUexecAffinitySmCount
execAffinitySmCount :: distinct execAffinitySmCount_st

/// CUexecAffinityParam_v1
execAffinityParam_v1 :: distinct execAffinityParam_st

/// CUexecAffinityParam
execAffinityParam :: distinct execAffinityParam_st

/// CUlibraryHostUniversalFunctionAndDataTable
libraryHostUniversalFunctionAndDataTable :: distinct libraryHostUniversalFunctionAndDataTable_st

/// CUstreamCallback
streamCallback :: distinct proc "c" (hStream: ^stream_st, status: result, userData: rawptr)

/// CUoccupancyB2DSize
occupancyB2DSize :: distinct proc "c" (blockSize: cffi.int) -> cffi.ulong

/// CUDA_MEMCPY2D_v2
MEMCPY2D_v2 :: distinct MEMCPY2D_st

/// CUDA_MEMCPY2D
MEMCPY2D :: distinct MEMCPY2D_st

/// CUDA_MEMCPY3D_v2
MEMCPY3D_v2 :: distinct MEMCPY3D_st

/// CUDA_MEMCPY3D
MEMCPY3D :: distinct MEMCPY3D_st

/// CUDA_MEMCPY3D_PEER_v1
MEMCPY3D_PEER_v1 :: distinct MEMCPY3D_PEER_st

/// CUDA_MEMCPY3D_PEER
MEMCPY3D_PEER :: distinct MEMCPY3D_PEER_st

/// CUDA_MEMCPY_NODE_PARAMS
MEMCPY_NODE_PARAMS :: distinct MEMCPY_NODE_PARAMS_st

/// CUDA_ARRAY_DESCRIPTOR_v2
ARRAY_DESCRIPTOR_v2 :: distinct ARRAY_DESCRIPTOR_st

/// CUDA_ARRAY_DESCRIPTOR
ARRAY_DESCRIPTOR :: distinct ARRAY_DESCRIPTOR_st

/// CUDA_ARRAY3D_DESCRIPTOR_v2
ARRAY3D_DESCRIPTOR_v2 :: distinct ARRAY3D_DESCRIPTOR_st

/// CUDA_ARRAY3D_DESCRIPTOR
ARRAY3D_DESCRIPTOR :: distinct ARRAY3D_DESCRIPTOR_st

/// CUDA_ARRAY_SPARSE_PROPERTIES_v1
ARRAY_SPARSE_PROPERTIES_v1 :: distinct ARRAY_SPARSE_PROPERTIES_st

/// CUDA_ARRAY_SPARSE_PROPERTIES
ARRAY_SPARSE_PROPERTIES :: distinct ARRAY_SPARSE_PROPERTIES_st

/// CUDA_ARRAY_MEMORY_REQUIREMENTS_v1
ARRAY_MEMORY_REQUIREMENTS_v1 :: distinct ARRAY_MEMORY_REQUIREMENTS_st

/// CUDA_ARRAY_MEMORY_REQUIREMENTS
ARRAY_MEMORY_REQUIREMENTS :: distinct ARRAY_MEMORY_REQUIREMENTS_st

/// CUDA_RESOURCE_DESC_v1
RESOURCE_DESC_v1 :: distinct RESOURCE_DESC_st

/// CUDA_RESOURCE_DESC
RESOURCE_DESC :: distinct RESOURCE_DESC_st

/// CUDA_TEXTURE_DESC_v1
TEXTURE_DESC_v1 :: distinct TEXTURE_DESC_st

/// CUDA_TEXTURE_DESC
TEXTURE_DESC :: distinct TEXTURE_DESC_st

/// CUDA_RESOURCE_VIEW_DESC_v1
RESOURCE_VIEW_DESC_v1 :: distinct RESOURCE_VIEW_DESC_st

/// CUDA_RESOURCE_VIEW_DESC
RESOURCE_VIEW_DESC :: distinct RESOURCE_VIEW_DESC_st

/// CUtensorMap
tensorMap :: distinct tensorMap_st

/// CUDA_POINTER_ATTRIBUTE_P2P_TOKENS_v1
POINTER_ATTRIBUTE_P2P_TOKENS_v1 :: distinct POINTER_ATTRIBUTE_P2P_TOKENS_st

/// CUDA_POINTER_ATTRIBUTE_P2P_TOKENS
POINTER_ATTRIBUTE_P2P_TOKENS :: distinct POINTER_ATTRIBUTE_P2P_TOKENS_st

/// CUDA_LAUNCH_PARAMS_v1
LAUNCH_PARAMS_v1 :: distinct LAUNCH_PARAMS_st

/// CUDA_LAUNCH_PARAMS
LAUNCH_PARAMS :: distinct LAUNCH_PARAMS_st

/// CUDA_EXTERNAL_MEMORY_HANDLE_DESC_v1
EXTERNAL_MEMORY_HANDLE_DESC_v1 :: distinct EXTERNAL_MEMORY_HANDLE_DESC_st

/// CUDA_EXTERNAL_MEMORY_HANDLE_DESC
EXTERNAL_MEMORY_HANDLE_DESC :: distinct EXTERNAL_MEMORY_HANDLE_DESC_st

/// CUDA_EXTERNAL_MEMORY_BUFFER_DESC_v1
EXTERNAL_MEMORY_BUFFER_DESC_v1 :: distinct EXTERNAL_MEMORY_BUFFER_DESC_st

/// CUDA_EXTERNAL_MEMORY_BUFFER_DESC
EXTERNAL_MEMORY_BUFFER_DESC :: distinct EXTERNAL_MEMORY_BUFFER_DESC_st

/// CUDA_EXTERNAL_MEMORY_MIPMAPPED_ARRAY_DESC_v1
EXTERNAL_MEMORY_MIPMAPPED_ARRAY_DESC_v1 :: distinct EXTERNAL_MEMORY_MIPMAPPED_ARRAY_DESC_st

/// CUDA_EXTERNAL_MEMORY_MIPMAPPED_ARRAY_DESC
EXTERNAL_MEMORY_MIPMAPPED_ARRAY_DESC :: distinct EXTERNAL_MEMORY_MIPMAPPED_ARRAY_DESC_st

/// CUDA_EXTERNAL_SEMAPHORE_HANDLE_DESC_v1
EXTERNAL_SEMAPHORE_HANDLE_DESC_v1 :: distinct EXTERNAL_SEMAPHORE_HANDLE_DESC_st

/// CUDA_EXTERNAL_SEMAPHORE_HANDLE_DESC
EXTERNAL_SEMAPHORE_HANDLE_DESC :: distinct EXTERNAL_SEMAPHORE_HANDLE_DESC_st

/// CUDA_EXTERNAL_SEMAPHORE_SIGNAL_PARAMS_v1
EXTERNAL_SEMAPHORE_SIGNAL_PARAMS_v1 :: distinct EXTERNAL_SEMAPHORE_SIGNAL_PARAMS_st

/// CUDA_EXTERNAL_SEMAPHORE_SIGNAL_PARAMS
EXTERNAL_SEMAPHORE_SIGNAL_PARAMS :: distinct EXTERNAL_SEMAPHORE_SIGNAL_PARAMS_st

/// CUDA_EXTERNAL_SEMAPHORE_WAIT_PARAMS_v1
EXTERNAL_SEMAPHORE_WAIT_PARAMS_v1 :: distinct EXTERNAL_SEMAPHORE_WAIT_PARAMS_st

/// CUDA_EXTERNAL_SEMAPHORE_WAIT_PARAMS
EXTERNAL_SEMAPHORE_WAIT_PARAMS :: distinct EXTERNAL_SEMAPHORE_WAIT_PARAMS_st

/// CUDA_EXT_SEM_SIGNAL_NODE_PARAMS_v1
EXT_SEM_SIGNAL_NODE_PARAMS_v1 :: distinct EXT_SEM_SIGNAL_NODE_PARAMS_st

/// CUDA_EXT_SEM_SIGNAL_NODE_PARAMS
EXT_SEM_SIGNAL_NODE_PARAMS :: distinct EXT_SEM_SIGNAL_NODE_PARAMS_st

/// CUDA_EXT_SEM_SIGNAL_NODE_PARAMS_v2
EXT_SEM_SIGNAL_NODE_PARAMS_v2 :: distinct EXT_SEM_SIGNAL_NODE_PARAMS_v2_st

/// CUDA_EXT_SEM_WAIT_NODE_PARAMS_v1
EXT_SEM_WAIT_NODE_PARAMS_v1 :: distinct EXT_SEM_WAIT_NODE_PARAMS_st

/// CUDA_EXT_SEM_WAIT_NODE_PARAMS
EXT_SEM_WAIT_NODE_PARAMS :: distinct EXT_SEM_WAIT_NODE_PARAMS_st

/// CUDA_EXT_SEM_WAIT_NODE_PARAMS_v2
EXT_SEM_WAIT_NODE_PARAMS_v2 :: distinct EXT_SEM_WAIT_NODE_PARAMS_v2_st

/// CUmemGenericAllocationHandle_v1
memGenericAllocationHandle_v1 :: distinct cffi.ulonglong

/// CUmemGenericAllocationHandle
memGenericAllocationHandle :: distinct cffi.ulonglong

/// CUarrayMapInfo_v1
arrayMapInfo_v1 :: distinct arrayMapInfo_st

/// CUarrayMapInfo
arrayMapInfo :: distinct arrayMapInfo_st

/// CUmemLocation_v1
memLocation_v1 :: distinct memLocation_st

/// CUmemLocation
memLocation :: distinct memLocation_st

/// CUmemAllocationProp_v1
memAllocationProp_v1 :: distinct memAllocationProp_st

/// CUmemAllocationProp
memAllocationProp :: distinct memAllocationProp_st

/// CUmulticastObjectProp_v1
multicastObjectProp_v1 :: distinct multicastObjectProp_st

/// CUmulticastObjectProp
multicastObjectProp :: distinct multicastObjectProp_st

/// CUmemAccessDesc_v1
memAccessDesc_v1 :: distinct memAccessDesc_st

/// CUmemAccessDesc
memAccessDesc :: distinct memAccessDesc_st

/// CUgraphExecUpdateResultInfo_v1
graphExecUpdateResultInfo_v1 :: distinct graphExecUpdateResultInfo_st

/// CUgraphExecUpdateResultInfo
graphExecUpdateResultInfo :: distinct graphExecUpdateResultInfo_st

/// CUmemPoolProps_v1
memPoolProps_v1 :: distinct memPoolProps_st

/// CUmemPoolProps
memPoolProps :: distinct memPoolProps_st

/// CUmemPoolPtrExportData_v1
memPoolPtrExportData_v1 :: distinct memPoolPtrExportData_st

/// CUmemPoolPtrExportData
memPoolPtrExportData :: distinct memPoolPtrExportData_st

/// CUDA_MEM_ALLOC_NODE_PARAMS_v1
MEM_ALLOC_NODE_PARAMS_v1 :: distinct MEM_ALLOC_NODE_PARAMS_v1_st

/// CUDA_MEM_ALLOC_NODE_PARAMS
MEM_ALLOC_NODE_PARAMS :: distinct MEM_ALLOC_NODE_PARAMS_v1_st

/// CUDA_MEM_ALLOC_NODE_PARAMS_v2
MEM_ALLOC_NODE_PARAMS_v2 :: distinct MEM_ALLOC_NODE_PARAMS_v2_st

/// CUDA_MEM_FREE_NODE_PARAMS
MEM_FREE_NODE_PARAMS :: distinct MEM_FREE_NODE_PARAMS_st

/// CUDA_CHILD_GRAPH_NODE_PARAMS
CHILD_GRAPH_NODE_PARAMS :: distinct CHILD_GRAPH_NODE_PARAMS_st

/// CUDA_EVENT_RECORD_NODE_PARAMS
EVENT_RECORD_NODE_PARAMS :: distinct EVENT_RECORD_NODE_PARAMS_st

/// CUDA_EVENT_WAIT_NODE_PARAMS
EVENT_WAIT_NODE_PARAMS :: distinct EVENT_WAIT_NODE_PARAMS_st

/// CUgraphNodeParams
graphNodeParams :: distinct graphNodeParams_st

/// CUipcMem_flags
ipcMem_flags :: enum cffi.uint {
    IPC_MEM_LAZY_ENABLE_PEER_ACCESS = 1,
}

/// CUmemAttach_flags
memAttach_flags :: enum cffi.uint {
    MEM_ATTACH_GLOBAL = 1,
    MEM_ATTACH_HOST = 2,
    MEM_ATTACH_SINGLE = 4,
}

/// CUctx_flags
ctx_flags :: enum cffi.uint {
    TX_SCHED_AUTO = 0,
    TX_SCHED_SPIN = 1,
    TX_SCHED_YIELD = 2,
    TX_SCHED_BLOCKING_SYNC = 4,
    TX_BLOCKING_SYNC = 4,
    TX_SCHED_MASK = 7,
    TX_MAP_HOST = 8,
    TX_LMEM_RESIZE_TO_MAX = 16,
    TX_COREDUMP_ENABLE = 32,
    TX_USER_COREDUMP_ENABLE = 64,
    TX_SYNC_MEMOPS = 128,
    TX_FLAGS_MASK = 255,
}

/// CUevent_sched_flags
event_sched_flags :: enum cffi.uint {
    EVENT_SCHED_AUTO = 0,
    EVENT_SCHED_SPIN = 1,
    EVENT_SCHED_YIELD = 2,
    EVENT_SCHED_BLOCKING_SYNC = 4,
}

/// cl_event_flags
cl_event_flags :: enum cffi.uint {
    NVCL_EVENT_SCHED_AUTO = 0,
    NVCL_EVENT_SCHED_SPIN = 1,
    NVCL_EVENT_SCHED_YIELD = 2,
    NVCL_EVENT_SCHED_BLOCKING_SYNC = 4,
}

/// cl_context_flags
cl_context_flags :: enum cffi.uint {
    NVCL_CTX_SCHED_AUTO = 0,
    NVCL_CTX_SCHED_SPIN = 1,
    NVCL_CTX_SCHED_YIELD = 2,
    NVCL_CTX_SCHED_BLOCKING_SYNC = 4,
}

/// CUstream_flags
stream_flags :: enum cffi.uint {
    STREAM_DEFAULT = 0,
    STREAM_NON_BLOCKING = 1,
}

/// CUevent_flags
event_flags :: enum cffi.uint {
    EVENT_DEFAULT = 0,
    EVENT_BLOCKING_SYNC = 1,
    EVENT_DISABLE_TIMING = 2,
    EVENT_INTERPROCESS = 4,
}

/// CUevent_record_flags
event_record_flags :: enum cffi.uint {
    EVENT_RECORD_DEFAULT = 0,
    EVENT_RECORD_EXTERNAL = 1,
}

/// CUevent_wait_flags
event_wait_flags :: enum cffi.uint {
    EVENT_WAIT_DEFAULT = 0,
    EVENT_WAIT_EXTERNAL = 1,
}

/// CUstreamWaitValue_flags
streamWaitValue_flags :: enum cffi.uint {
    STREAM_WAIT_VALUE_GEQ = 0,
    STREAM_WAIT_VALUE_EQ = 1,
    STREAM_WAIT_VALUE_AND = 2,
    STREAM_WAIT_VALUE_NOR = 3,
    STREAM_WAIT_VALUE_FLUSH = 1073741824,
}

/// CUstreamWriteValue_flags
streamWriteValue_flags :: enum cffi.uint {
    STREAM_WRITE_VALUE_DEFAULT = 0,
    STREAM_WRITE_VALUE_NO_MEMORY_BARRIER = 1,
}

/// CUstreamBatchMemOpType
streamBatchMemOpType :: enum cffi.uint {
    STREAM_MEM_OP_WAIT_VALUE_32 = 1,
    STREAM_MEM_OP_WRITE_VALUE_32 = 2,
    STREAM_MEM_OP_WAIT_VALUE_64 = 4,
    STREAM_MEM_OP_WRITE_VALUE_64 = 5,
    STREAM_MEM_OP_BARRIER = 6,
    STREAM_MEM_OP_FLUSH_REMOTE_WRITES = 3,
}

/// CUstreamMemoryBarrier_flags
streamMemoryBarrier_flags :: enum cffi.uint {
    STREAM_MEMORY_BARRIER_TYPE_SYS = 0,
    STREAM_MEMORY_BARRIER_TYPE_GPU = 1,
}

/// CUoccupancy_flags
occupancy_flags :: enum cffi.uint {
    OCCUPANCY_DEFAULT = 0,
    OCCUPANCY_DISABLE_CACHING_OVERRIDE = 1,
}

/// CUstreamUpdateCaptureDependencies_flags
streamUpdateCaptureDependencies_flags :: enum cffi.uint {
    STREAM_ADD_CAPTURE_DEPENDENCIES = 0,
    STREAM_SET_CAPTURE_DEPENDENCIES = 1,
}

/// CUarray_format
array_format :: enum cffi.uint {
    AD_FORMAT_UNSIGNED_INT8 = 1,
    AD_FORMAT_UNSIGNED_INT16 = 2,
    AD_FORMAT_UNSIGNED_INT32 = 3,
    AD_FORMAT_SIGNED_INT8 = 8,
    AD_FORMAT_SIGNED_INT16 = 9,
    AD_FORMAT_SIGNED_INT32 = 10,
    AD_FORMAT_HALF = 16,
    AD_FORMAT_FLOAT = 32,
    AD_FORMAT_NV12 = 176,
    AD_FORMAT_UNORM_INT8X1 = 192,
    AD_FORMAT_UNORM_INT8X2 = 193,
    AD_FORMAT_UNORM_INT8X4 = 194,
    AD_FORMAT_UNORM_INT16X1 = 195,
    AD_FORMAT_UNORM_INT16X2 = 196,
    AD_FORMAT_UNORM_INT16X4 = 197,
    AD_FORMAT_SNORM_INT8X1 = 198,
    AD_FORMAT_SNORM_INT8X2 = 199,
    AD_FORMAT_SNORM_INT8X4 = 200,
    AD_FORMAT_SNORM_INT16X1 = 201,
    AD_FORMAT_SNORM_INT16X2 = 202,
    AD_FORMAT_SNORM_INT16X4 = 203,
    AD_FORMAT_BC1_UNORM = 145,
    AD_FORMAT_BC1_UNORM_SRGB = 146,
    AD_FORMAT_BC2_UNORM = 147,
    AD_FORMAT_BC2_UNORM_SRGB = 148,
    AD_FORMAT_BC3_UNORM = 149,
    AD_FORMAT_BC3_UNORM_SRGB = 150,
    AD_FORMAT_BC4_UNORM = 151,
    AD_FORMAT_BC4_SNORM = 152,
    AD_FORMAT_BC5_UNORM = 153,
    AD_FORMAT_BC5_SNORM = 154,
    AD_FORMAT_BC6H_UF16 = 155,
    AD_FORMAT_BC6H_SF16 = 156,
    AD_FORMAT_BC7_UNORM = 157,
    AD_FORMAT_BC7_UNORM_SRGB = 158,
}

/// CUaddress_mode
address_mode :: enum cffi.uint {
    TR_ADDRESS_MODE_WRAP = 0,
    TR_ADDRESS_MODE_CLAMP = 1,
    TR_ADDRESS_MODE_MIRROR = 2,
    TR_ADDRESS_MODE_BORDER = 3,
}

/// CUfilter_mode
filter_mode :: enum cffi.uint {
    TR_FILTER_MODE_POINT = 0,
    TR_FILTER_MODE_LINEAR = 1,
}

/// CUdevice_attribute
device_attribute :: enum cffi.uint {
    DEVICE_ATTRIBUTE_MAX_THREADS_PER_BLOCK = 1,
    DEVICE_ATTRIBUTE_MAX_BLOCK_DIM_X = 2,
    DEVICE_ATTRIBUTE_MAX_BLOCK_DIM_Y = 3,
    DEVICE_ATTRIBUTE_MAX_BLOCK_DIM_Z = 4,
    DEVICE_ATTRIBUTE_MAX_GRID_DIM_X = 5,
    DEVICE_ATTRIBUTE_MAX_GRID_DIM_Y = 6,
    DEVICE_ATTRIBUTE_MAX_GRID_DIM_Z = 7,
    DEVICE_ATTRIBUTE_MAX_SHARED_MEMORY_PER_BLOCK = 8,
    DEVICE_ATTRIBUTE_SHARED_MEMORY_PER_BLOCK = 8,
    DEVICE_ATTRIBUTE_TOTAL_CONSTANT_MEMORY = 9,
    DEVICE_ATTRIBUTE_WARP_SIZE = 10,
    DEVICE_ATTRIBUTE_MAX_PITCH = 11,
    DEVICE_ATTRIBUTE_MAX_REGISTERS_PER_BLOCK = 12,
    DEVICE_ATTRIBUTE_REGISTERS_PER_BLOCK = 12,
    DEVICE_ATTRIBUTE_CLOCK_RATE = 13,
    DEVICE_ATTRIBUTE_TEXTURE_ALIGNMENT = 14,
    DEVICE_ATTRIBUTE_GPU_OVERLAP = 15,
    DEVICE_ATTRIBUTE_MULTIPROCESSOR_COUNT = 16,
    DEVICE_ATTRIBUTE_KERNEL_EXEC_TIMEOUT = 17,
    DEVICE_ATTRIBUTE_INTEGRATED = 18,
    DEVICE_ATTRIBUTE_CAN_MAP_HOST_MEMORY = 19,
    DEVICE_ATTRIBUTE_COMPUTE_MODE = 20,
    DEVICE_ATTRIBUTE_MAXIMUM_TEXTURE1D_WIDTH = 21,
    DEVICE_ATTRIBUTE_MAXIMUM_TEXTURE2D_WIDTH = 22,
    DEVICE_ATTRIBUTE_MAXIMUM_TEXTURE2D_HEIGHT = 23,
    DEVICE_ATTRIBUTE_MAXIMUM_TEXTURE3D_WIDTH = 24,
    DEVICE_ATTRIBUTE_MAXIMUM_TEXTURE3D_HEIGHT = 25,
    DEVICE_ATTRIBUTE_MAXIMUM_TEXTURE3D_DEPTH = 26,
    DEVICE_ATTRIBUTE_MAXIMUM_TEXTURE2D_LAYERED_WIDTH = 27,
    DEVICE_ATTRIBUTE_MAXIMUM_TEXTURE2D_LAYERED_HEIGHT = 28,
    DEVICE_ATTRIBUTE_MAXIMUM_TEXTURE2D_LAYERED_LAYERS = 29,
    DEVICE_ATTRIBUTE_MAXIMUM_TEXTURE2D_ARRAY_WIDTH = 27,
    DEVICE_ATTRIBUTE_MAXIMUM_TEXTURE2D_ARRAY_HEIGHT = 28,
    DEVICE_ATTRIBUTE_MAXIMUM_TEXTURE2D_ARRAY_NUMSLICES = 29,
    DEVICE_ATTRIBUTE_SURFACE_ALIGNMENT = 30,
    DEVICE_ATTRIBUTE_CONCURRENT_KERNELS = 31,
    DEVICE_ATTRIBUTE_ECC_ENABLED = 32,
    DEVICE_ATTRIBUTE_PCI_BUS_ID = 33,
    DEVICE_ATTRIBUTE_PCI_DEVICE_ID = 34,
    DEVICE_ATTRIBUTE_TCC_DRIVER = 35,
    DEVICE_ATTRIBUTE_MEMORY_CLOCK_RATE = 36,
    DEVICE_ATTRIBUTE_GLOBAL_MEMORY_BUS_WIDTH = 37,
    DEVICE_ATTRIBUTE_L2_CACHE_SIZE = 38,
    DEVICE_ATTRIBUTE_MAX_THREADS_PER_MULTIPROCESSOR = 39,
    DEVICE_ATTRIBUTE_ASYNC_ENGINE_COUNT = 40,
    DEVICE_ATTRIBUTE_UNIFIED_ADDRESSING = 41,
    DEVICE_ATTRIBUTE_MAXIMUM_TEXTURE1D_LAYERED_WIDTH = 42,
    DEVICE_ATTRIBUTE_MAXIMUM_TEXTURE1D_LAYERED_LAYERS = 43,
    DEVICE_ATTRIBUTE_CAN_TEX2D_GATHER = 44,
    DEVICE_ATTRIBUTE_MAXIMUM_TEXTURE2D_GATHER_WIDTH = 45,
    DEVICE_ATTRIBUTE_MAXIMUM_TEXTURE2D_GATHER_HEIGHT = 46,
    DEVICE_ATTRIBUTE_MAXIMUM_TEXTURE3D_WIDTH_ALTERNATE = 47,
    DEVICE_ATTRIBUTE_MAXIMUM_TEXTURE3D_HEIGHT_ALTERNATE = 48,
    DEVICE_ATTRIBUTE_MAXIMUM_TEXTURE3D_DEPTH_ALTERNATE = 49,
    DEVICE_ATTRIBUTE_PCI_DOMAIN_ID = 50,
    DEVICE_ATTRIBUTE_TEXTURE_PITCH_ALIGNMENT = 51,
    DEVICE_ATTRIBUTE_MAXIMUM_TEXTURECUBEMAP_WIDTH = 52,
    DEVICE_ATTRIBUTE_MAXIMUM_TEXTURECUBEMAP_LAYERED_WIDTH = 53,
    DEVICE_ATTRIBUTE_MAXIMUM_TEXTURECUBEMAP_LAYERED_LAYERS = 54,
    DEVICE_ATTRIBUTE_MAXIMUM_SURFACE1D_WIDTH = 55,
    DEVICE_ATTRIBUTE_MAXIMUM_SURFACE2D_WIDTH = 56,
    DEVICE_ATTRIBUTE_MAXIMUM_SURFACE2D_HEIGHT = 57,
    DEVICE_ATTRIBUTE_MAXIMUM_SURFACE3D_WIDTH = 58,
    DEVICE_ATTRIBUTE_MAXIMUM_SURFACE3D_HEIGHT = 59,
    DEVICE_ATTRIBUTE_MAXIMUM_SURFACE3D_DEPTH = 60,
    DEVICE_ATTRIBUTE_MAXIMUM_SURFACE1D_LAYERED_WIDTH = 61,
    DEVICE_ATTRIBUTE_MAXIMUM_SURFACE1D_LAYERED_LAYERS = 62,
    DEVICE_ATTRIBUTE_MAXIMUM_SURFACE2D_LAYERED_WIDTH = 63,
    DEVICE_ATTRIBUTE_MAXIMUM_SURFACE2D_LAYERED_HEIGHT = 64,
    DEVICE_ATTRIBUTE_MAXIMUM_SURFACE2D_LAYERED_LAYERS = 65,
    DEVICE_ATTRIBUTE_MAXIMUM_SURFACECUBEMAP_WIDTH = 66,
    DEVICE_ATTRIBUTE_MAXIMUM_SURFACECUBEMAP_LAYERED_WIDTH = 67,
    DEVICE_ATTRIBUTE_MAXIMUM_SURFACECUBEMAP_LAYERED_LAYERS = 68,
    DEVICE_ATTRIBUTE_MAXIMUM_TEXTURE1D_LINEAR_WIDTH = 69,
    DEVICE_ATTRIBUTE_MAXIMUM_TEXTURE2D_LINEAR_WIDTH = 70,
    DEVICE_ATTRIBUTE_MAXIMUM_TEXTURE2D_LINEAR_HEIGHT = 71,
    DEVICE_ATTRIBUTE_MAXIMUM_TEXTURE2D_LINEAR_PITCH = 72,
    DEVICE_ATTRIBUTE_MAXIMUM_TEXTURE2D_MIPMAPPED_WIDTH = 73,
    DEVICE_ATTRIBUTE_MAXIMUM_TEXTURE2D_MIPMAPPED_HEIGHT = 74,
    DEVICE_ATTRIBUTE_COMPUTE_CAPABILITY_MAJOR = 75,
    DEVICE_ATTRIBUTE_COMPUTE_CAPABILITY_MINOR = 76,
    DEVICE_ATTRIBUTE_MAXIMUM_TEXTURE1D_MIPMAPPED_WIDTH = 77,
    DEVICE_ATTRIBUTE_STREAM_PRIORITIES_SUPPORTED = 78,
    DEVICE_ATTRIBUTE_GLOBAL_L1_CACHE_SUPPORTED = 79,
    DEVICE_ATTRIBUTE_LOCAL_L1_CACHE_SUPPORTED = 80,
    DEVICE_ATTRIBUTE_MAX_SHARED_MEMORY_PER_MULTIPROCESSOR = 81,
    DEVICE_ATTRIBUTE_MAX_REGISTERS_PER_MULTIPROCESSOR = 82,
    DEVICE_ATTRIBUTE_MANAGED_MEMORY = 83,
    DEVICE_ATTRIBUTE_MULTI_GPU_BOARD = 84,
    DEVICE_ATTRIBUTE_MULTI_GPU_BOARD_GROUP_ID = 85,
    DEVICE_ATTRIBUTE_HOST_NATIVE_ATOMIC_SUPPORTED = 86,
    DEVICE_ATTRIBUTE_SINGLE_TO_DOUBLE_PRECISION_PERF_RATIO = 87,
    DEVICE_ATTRIBUTE_PAGEABLE_MEMORY_ACCESS = 88,
    DEVICE_ATTRIBUTE_CONCURRENT_MANAGED_ACCESS = 89,
    DEVICE_ATTRIBUTE_COMPUTE_PREEMPTION_SUPPORTED = 90,
    DEVICE_ATTRIBUTE_CAN_USE_HOST_POINTER_FOR_REGISTERED_MEM = 91,
    DEVICE_ATTRIBUTE_CAN_USE_STREAM_MEM_OPS_V1 = 92,
    DEVICE_ATTRIBUTE_CAN_USE_64_BIT_STREAM_MEM_OPS_V1 = 93,
    DEVICE_ATTRIBUTE_CAN_USE_STREAM_WAIT_VALUE_NOR_V1 = 94,
    DEVICE_ATTRIBUTE_COOPERATIVE_LAUNCH = 95,
    DEVICE_ATTRIBUTE_COOPERATIVE_MULTI_DEVICE_LAUNCH = 96,
    DEVICE_ATTRIBUTE_MAX_SHARED_MEMORY_PER_BLOCK_OPTIN = 97,
    DEVICE_ATTRIBUTE_CAN_FLUSH_REMOTE_WRITES = 98,
    DEVICE_ATTRIBUTE_HOST_REGISTER_SUPPORTED = 99,
    DEVICE_ATTRIBUTE_PAGEABLE_MEMORY_ACCESS_USES_HOST_PAGE_TABLES = 100,
    DEVICE_ATTRIBUTE_DIRECT_MANAGED_MEM_ACCESS_FROM_HOST = 101,
    DEVICE_ATTRIBUTE_VIRTUAL_ADDRESS_MANAGEMENT_SUPPORTED = 102,
    DEVICE_ATTRIBUTE_VIRTUAL_MEMORY_MANAGEMENT_SUPPORTED = 102,
    DEVICE_ATTRIBUTE_HANDLE_TYPE_POSIX_FILE_DESCRIPTOR_SUPPORTED = 103,
    DEVICE_ATTRIBUTE_HANDLE_TYPE_WIN32_HANDLE_SUPPORTED = 104,
    DEVICE_ATTRIBUTE_HANDLE_TYPE_WIN32_KMT_HANDLE_SUPPORTED = 105,
    DEVICE_ATTRIBUTE_MAX_BLOCKS_PER_MULTIPROCESSOR = 106,
    DEVICE_ATTRIBUTE_GENERIC_COMPRESSION_SUPPORTED = 107,
    DEVICE_ATTRIBUTE_MAX_PERSISTING_L2_CACHE_SIZE = 108,
    DEVICE_ATTRIBUTE_MAX_ACCESS_POLICY_WINDOW_SIZE = 109,
    DEVICE_ATTRIBUTE_GPU_DIRECT_RDMA_WITH_CUDA_VMM_SUPPORTED = 110,
    DEVICE_ATTRIBUTE_RESERVED_SHARED_MEMORY_PER_BLOCK = 111,
    DEVICE_ATTRIBUTE_SPARSE_CUDA_ARRAY_SUPPORTED = 112,
    DEVICE_ATTRIBUTE_READ_ONLY_HOST_REGISTER_SUPPORTED = 113,
    DEVICE_ATTRIBUTE_TIMELINE_SEMAPHORE_INTEROP_SUPPORTED = 114,
    DEVICE_ATTRIBUTE_MEMORY_POOLS_SUPPORTED = 115,
    DEVICE_ATTRIBUTE_GPU_DIRECT_RDMA_SUPPORTED = 116,
    DEVICE_ATTRIBUTE_GPU_DIRECT_RDMA_FLUSH_WRITES_OPTIONS = 117,
    DEVICE_ATTRIBUTE_GPU_DIRECT_RDMA_WRITES_ORDERING = 118,
    DEVICE_ATTRIBUTE_MEMPOOL_SUPPORTED_HANDLE_TYPES = 119,
    DEVICE_ATTRIBUTE_CLUSTER_LAUNCH = 120,
    DEVICE_ATTRIBUTE_DEFERRED_MAPPING_CUDA_ARRAY_SUPPORTED = 121,
    DEVICE_ATTRIBUTE_CAN_USE_64_BIT_STREAM_MEM_OPS = 122,
    DEVICE_ATTRIBUTE_CAN_USE_STREAM_WAIT_VALUE_NOR = 123,
    DEVICE_ATTRIBUTE_DMA_BUF_SUPPORTED = 124,
    DEVICE_ATTRIBUTE_IPC_EVENT_SUPPORTED = 125,
    DEVICE_ATTRIBUTE_MEM_SYNC_DOMAIN_COUNT = 126,
    DEVICE_ATTRIBUTE_TENSOR_MAP_ACCESS_SUPPORTED = 127,
    DEVICE_ATTRIBUTE_HANDLE_TYPE_FABRIC_SUPPORTED = 128,
    DEVICE_ATTRIBUTE_UNIFIED_FUNCTION_POINTERS = 129,
    DEVICE_ATTRIBUTE_NUMA_CONFIG = 130,
    DEVICE_ATTRIBUTE_NUMA_ID = 131,
    DEVICE_ATTRIBUTE_MULTICAST_SUPPORTED = 132,
    DEVICE_ATTRIBUTE_MPS_ENABLED = 133,
    DEVICE_ATTRIBUTE_HOST_NUMA_ID = 134,
    DEVICE_ATTRIBUTE_MAX = 135,
}

/// CUpointer_attribute
pointer_attribute :: enum cffi.uint {
    POINTER_ATTRIBUTE_CONTEXT = 1,
    POINTER_ATTRIBUTE_MEMORY_TYPE = 2,
    POINTER_ATTRIBUTE_DEVICE_POINTER = 3,
    POINTER_ATTRIBUTE_HOST_POINTER = 4,
    POINTER_ATTRIBUTE_P2P_TOKENS = 5,
    POINTER_ATTRIBUTE_SYNC_MEMOPS = 6,
    POINTER_ATTRIBUTE_BUFFER_ID = 7,
    POINTER_ATTRIBUTE_IS_MANAGED = 8,
    POINTER_ATTRIBUTE_DEVICE_ORDINAL = 9,
    POINTER_ATTRIBUTE_IS_LEGACY_CUDA_IPC_CAPABLE = 10,
    POINTER_ATTRIBUTE_RANGE_START_ADDR = 11,
    POINTER_ATTRIBUTE_RANGE_SIZE = 12,
    POINTER_ATTRIBUTE_MAPPED = 13,
    POINTER_ATTRIBUTE_ALLOWED_HANDLE_TYPES = 14,
    POINTER_ATTRIBUTE_IS_GPU_DIRECT_RDMA_CAPABLE = 15,
    POINTER_ATTRIBUTE_ACCESS_FLAGS = 16,
    POINTER_ATTRIBUTE_MEMPOOL_HANDLE = 17,
    POINTER_ATTRIBUTE_MAPPING_SIZE = 18,
    POINTER_ATTRIBUTE_MAPPING_BASE_ADDR = 19,
    POINTER_ATTRIBUTE_MEMORY_BLOCK_ID = 20,
}

/// CUfunction_attribute
function_attribute :: enum cffi.uint {
    FUNC_ATTRIBUTE_MAX_THREADS_PER_BLOCK = 0,
    FUNC_ATTRIBUTE_SHARED_SIZE_BYTES = 1,
    FUNC_ATTRIBUTE_CONST_SIZE_BYTES = 2,
    FUNC_ATTRIBUTE_LOCAL_SIZE_BYTES = 3,
    FUNC_ATTRIBUTE_NUM_REGS = 4,
    FUNC_ATTRIBUTE_PTX_VERSION = 5,
    FUNC_ATTRIBUTE_BINARY_VERSION = 6,
    FUNC_ATTRIBUTE_CACHE_MODE_CA = 7,
    FUNC_ATTRIBUTE_MAX_DYNAMIC_SHARED_SIZE_BYTES = 8,
    FUNC_ATTRIBUTE_PREFERRED_SHARED_MEMORY_CARVEOUT = 9,
    FUNC_ATTRIBUTE_CLUSTER_SIZE_MUST_BE_SET = 10,
    FUNC_ATTRIBUTE_REQUIRED_CLUSTER_WIDTH = 11,
    FUNC_ATTRIBUTE_REQUIRED_CLUSTER_HEIGHT = 12,
    FUNC_ATTRIBUTE_REQUIRED_CLUSTER_DEPTH = 13,
    FUNC_ATTRIBUTE_NON_PORTABLE_CLUSTER_SIZE_ALLOWED = 14,
    FUNC_ATTRIBUTE_CLUSTER_SCHEDULING_POLICY_PREFERENCE = 15,
    FUNC_ATTRIBUTE_MAX = 16,
}

/// CUfunc_cache
func_cache :: enum cffi.uint {
    FUNC_CACHE_PREFER_NONE = 0,
    FUNC_CACHE_PREFER_SHARED = 1,
    FUNC_CACHE_PREFER_L1 = 2,
    FUNC_CACHE_PREFER_EQUAL = 3,
}

/// CUsharedconfig
sharedconfig :: enum cffi.uint {
    SHARED_MEM_CONFIG_DEFAULT_BANK_SIZE = 0,
    SHARED_MEM_CONFIG_FOUR_BYTE_BANK_SIZE = 1,
    SHARED_MEM_CONFIG_EIGHT_BYTE_BANK_SIZE = 2,
}

/// CUshared_carveout
shared_carveout :: enum cffi.int {
    SHAREDMEM_CARVEOUT_DEFAULT = -1,
    SHAREDMEM_CARVEOUT_MAX_SHARED = 100,
    SHAREDMEM_CARVEOUT_MAX_L1 = 0,
}

/// CUmemorytype
memorytype :: enum cffi.uint {
    MEMORYTYPE_HOST = 1,
    MEMORYTYPE_DEVICE = 2,
    MEMORYTYPE_ARRAY = 3,
    MEMORYTYPE_UNIFIED = 4,
}

/// CUcomputemode
computemode :: enum cffi.uint {
    OMPUTEMODE_DEFAULT = 0,
    OMPUTEMODE_PROHIBITED = 2,
    OMPUTEMODE_EXCLUSIVE_PROCESS = 3,
}

/// CUmem_advise
mem_advise :: enum cffi.uint {
    MEM_ADVISE_SET_READ_MOSTLY = 1,
    MEM_ADVISE_UNSET_READ_MOSTLY = 2,
    MEM_ADVISE_SET_PREFERRED_LOCATION = 3,
    MEM_ADVISE_UNSET_PREFERRED_LOCATION = 4,
    MEM_ADVISE_SET_ACCESSED_BY = 5,
    MEM_ADVISE_UNSET_ACCESSED_BY = 6,
}

/// CUmem_range_attribute
mem_range_attribute :: enum cffi.uint {
    MEM_RANGE_ATTRIBUTE_READ_MOSTLY = 1,
    MEM_RANGE_ATTRIBUTE_PREFERRED_LOCATION = 2,
    MEM_RANGE_ATTRIBUTE_ACCESSED_BY = 3,
    MEM_RANGE_ATTRIBUTE_LAST_PREFETCH_LOCATION = 4,
    MEM_RANGE_ATTRIBUTE_PREFERRED_LOCATION_TYPE = 5,
    MEM_RANGE_ATTRIBUTE_PREFERRED_LOCATION_ID = 6,
    MEM_RANGE_ATTRIBUTE_LAST_PREFETCH_LOCATION_TYPE = 7,
    MEM_RANGE_ATTRIBUTE_LAST_PREFETCH_LOCATION_ID = 8,
}

/// CUjit_option
jit_option :: enum cffi.uint {
    JIT_MAX_REGISTERS = 0,
    JIT_THREADS_PER_BLOCK = 1,
    JIT_WALL_TIME = 2,
    JIT_INFO_LOG_BUFFER = 3,
    JIT_INFO_LOG_BUFFER_SIZE_BYTES = 4,
    JIT_ERROR_LOG_BUFFER = 5,
    JIT_ERROR_LOG_BUFFER_SIZE_BYTES = 6,
    JIT_OPTIMIZATION_LEVEL = 7,
    JIT_TARGET_FROM_CUCONTEXT = 8,
    JIT_TARGET = 9,
    JIT_FALLBACK_STRATEGY = 10,
    JIT_GENERATE_DEBUG_INFO = 11,
    JIT_LOG_VERBOSE = 12,
    JIT_GENERATE_LINE_INFO = 13,
    JIT_CACHE_MODE = 14,
    JIT_NEW_SM3X_OPT = 15,
    JIT_FAST_COMPILE = 16,
    JIT_GLOBAL_SYMBOL_NAMES = 17,
    JIT_GLOBAL_SYMBOL_ADDRESSES = 18,
    JIT_GLOBAL_SYMBOL_COUNT = 19,
    JIT_LTO = 20,
    JIT_FTZ = 21,
    JIT_PREC_DIV = 22,
    JIT_PREC_SQRT = 23,
    JIT_FMA = 24,
    JIT_REFERENCED_KERNEL_NAMES = 25,
    JIT_REFERENCED_KERNEL_COUNT = 26,
    JIT_REFERENCED_VARIABLE_NAMES = 27,
    JIT_REFERENCED_VARIABLE_COUNT = 28,
    JIT_OPTIMIZE_UNUSED_DEVICE_VARIABLES = 29,
    JIT_POSITION_INDEPENDENT_CODE = 30,
    JIT_MIN_CTA_PER_SM = 31,
    JIT_NUM_OPTIONS = 32,
}

/// CUjit_target
jit_target :: enum cffi.uint {
    TARGET_COMPUTE_30 = 30,
    TARGET_COMPUTE_32 = 32,
    TARGET_COMPUTE_35 = 35,
    TARGET_COMPUTE_37 = 37,
    TARGET_COMPUTE_50 = 50,
    TARGET_COMPUTE_52 = 52,
    TARGET_COMPUTE_53 = 53,
    TARGET_COMPUTE_60 = 60,
    TARGET_COMPUTE_61 = 61,
    TARGET_COMPUTE_62 = 62,
    TARGET_COMPUTE_70 = 70,
    TARGET_COMPUTE_72 = 72,
    TARGET_COMPUTE_75 = 75,
    TARGET_COMPUTE_80 = 80,
    TARGET_COMPUTE_86 = 86,
    TARGET_COMPUTE_87 = 87,
    TARGET_COMPUTE_89 = 89,
    TARGET_COMPUTE_90 = 90,
    TARGET_COMPUTE_90A = 65626,
}

/// CUjit_fallback
jit_fallback :: enum cffi.uint {
    PREFER_PTX = 0,
    PREFER_BINARY = 1,
}

/// CUjit_cacheMode
jit_cacheMode :: enum cffi.uint {
    JIT_CACHE_OPTION_NONE = 0,
    JIT_CACHE_OPTION_CG = 1,
    JIT_CACHE_OPTION_CA = 2,
}

/// CUjitInputType
jitInputType :: enum cffi.uint {
    JIT_INPUT_CUBIN = 0,
    JIT_INPUT_PTX = 1,
    JIT_INPUT_FATBINARY = 2,
    JIT_INPUT_OBJECT = 3,
    JIT_INPUT_LIBRARY = 4,
    JIT_INPUT_NVVM = 5,
    JIT_NUM_INPUT_TYPES = 6,
}

/// CUgraphicsRegisterFlags
graphicsRegisterFlags :: enum cffi.uint {
    GRAPHICS_REGISTER_FLAGS_NONE = 0,
    GRAPHICS_REGISTER_FLAGS_READ_ONLY = 0,
    GRAPHICS_REGISTER_FLAGS_WRITE_DISCARD = 1,
    GRAPHICS_REGISTER_FLAGS_SURFACE_LDST = 2,
    GRAPHICS_REGISTER_FLAGS_TEXTURE_GATHER = 3,
}
graphicsRegisterFlagsSet :: bit_set[graphicsRegisterFlags; cffi.uint]

/// CUgraphicsMapResourceFlags
graphicsMapResourceFlags :: enum cffi.uint {
    GRAPHICS_MAP_RESOURCE_FLAGS_NONE = 0,
    GRAPHICS_MAP_RESOURCE_FLAGS_READ_ONLY = 0,
    GRAPHICS_MAP_RESOURCE_FLAGS_WRITE_DISCARD = 1,
}
graphicsMapResourceFlagsSet :: bit_set[graphicsMapResourceFlags; cffi.uint]

/// CUarray_cubemap_face
array_cubemap_face :: enum cffi.uint {
    UBEMAP_FACE_POSITIVE_X = 0,
    UBEMAP_FACE_NEGATIVE_X = 1,
    UBEMAP_FACE_POSITIVE_Y = 2,
    UBEMAP_FACE_NEGATIVE_Y = 3,
    UBEMAP_FACE_POSITIVE_Z = 4,
    UBEMAP_FACE_NEGATIVE_Z = 5,
}

/// CUlimit
limit :: enum cffi.uint {
    LIMIT_STACK_SIZE = 0,
    LIMIT_PRINTF_FIFO_SIZE = 1,
    LIMIT_MALLOC_HEAP_SIZE = 2,
    LIMIT_DEV_RUNTIME_SYNC_DEPTH = 3,
    LIMIT_DEV_RUNTIME_PENDING_LAUNCH_COUNT = 4,
    LIMIT_MAX_L2_FETCH_GRANULARITY = 5,
    LIMIT_PERSISTING_L2_CACHE_SIZE = 6,
    LIMIT_MAX = 7,
}

/// CUresourcetype
resourcetype :: enum cffi.uint {
    RESOURCE_TYPE_ARRAY = 0,
    RESOURCE_TYPE_MIPMAPPED_ARRAY = 1,
    RESOURCE_TYPE_LINEAR = 2,
    RESOURCE_TYPE_PITCH2D = 3,
}

/// CUaccessProperty
accessProperty :: enum cffi.uint {
    ACCESS_PROPERTY_NORMAL = 0,
    ACCESS_PROPERTY_STREAMING = 1,
    ACCESS_PROPERTY_PERSISTING = 2,
}

/// CUgraphConditionalNodeType
graphConditionalNodeType :: enum cffi.uint {
    GRAPH_COND_TYPE_IF = 0,
    GRAPH_COND_TYPE_WHILE = 1,
}

/// CUgraphNodeType
graphNodeType :: enum cffi.uint {
    GRAPH_NODE_TYPE_KERNEL = 0,
    GRAPH_NODE_TYPE_MEMCPY = 1,
    GRAPH_NODE_TYPE_MEMSET = 2,
    GRAPH_NODE_TYPE_HOST = 3,
    GRAPH_NODE_TYPE_GRAPH = 4,
    GRAPH_NODE_TYPE_EMPTY = 5,
    GRAPH_NODE_TYPE_WAIT_EVENT = 6,
    GRAPH_NODE_TYPE_EVENT_RECORD = 7,
    GRAPH_NODE_TYPE_EXT_SEMAS_SIGNAL = 8,
    GRAPH_NODE_TYPE_EXT_SEMAS_WAIT = 9,
    GRAPH_NODE_TYPE_MEM_ALLOC = 10,
    GRAPH_NODE_TYPE_MEM_FREE = 11,
    GRAPH_NODE_TYPE_BATCH_MEM_OP = 12,
    GRAPH_NODE_TYPE_CONDITIONAL = 13,
}

/// CUgraphDependencyType
graphDependencyType :: enum cffi.uint {
    GRAPH_DEPENDENCY_TYPE_DEFAULT = 0,
    GRAPH_DEPENDENCY_TYPE_PROGRAMMATIC = 1,
}

/// CUgraphInstantiateResult
graphInstantiateResult :: enum cffi.uint {
    GRAPH_INSTANTIATE_SUCCESS = 0,
    GRAPH_INSTANTIATE_ERROR = 1,
    GRAPH_INSTANTIATE_INVALID_STRUCTURE = 2,
    GRAPH_INSTANTIATE_NODE_OPERATION_NOT_SUPPORTED = 3,
    GRAPH_INSTANTIATE_MULTIPLE_CTXS_NOT_SUPPORTED = 4,
}

/// CUsynchronizationPolicy
synchronizationPolicy :: enum cffi.uint {
    SYNC_POLICY_AUTO = 1,
    SYNC_POLICY_SPIN = 2,
    SYNC_POLICY_YIELD = 3,
    SYNC_POLICY_BLOCKING_SYNC = 4,
}

/// CUclusterSchedulingPolicy
clusterSchedulingPolicy :: enum cffi.uint {
    LUSTER_SCHEDULING_POLICY_DEFAULT = 0,
    LUSTER_SCHEDULING_POLICY_SPREAD = 1,
    LUSTER_SCHEDULING_POLICY_LOAD_BALANCING = 2,
}

/// CUlaunchMemSyncDomain
launchMemSyncDomain :: enum cffi.uint {
    LAUNCH_MEM_SYNC_DOMAIN_DEFAULT = 0,
    LAUNCH_MEM_SYNC_DOMAIN_REMOTE = 1,
}

/// CUlaunchAttributeID
launchAttributeID :: enum cffi.uint {
    LAUNCH_ATTRIBUTE_IGNORE = 0,
    LAUNCH_ATTRIBUTE_ACCESS_POLICY_WINDOW = 1,
    LAUNCH_ATTRIBUTE_COOPERATIVE = 2,
    LAUNCH_ATTRIBUTE_SYNCHRONIZATION_POLICY = 3,
    LAUNCH_ATTRIBUTE_CLUSTER_DIMENSION = 4,
    LAUNCH_ATTRIBUTE_CLUSTER_SCHEDULING_POLICY_PREFERENCE = 5,
    LAUNCH_ATTRIBUTE_PROGRAMMATIC_STREAM_SERIALIZATION = 6,
    LAUNCH_ATTRIBUTE_PROGRAMMATIC_EVENT = 7,
    LAUNCH_ATTRIBUTE_PRIORITY = 8,
    LAUNCH_ATTRIBUTE_MEM_SYNC_DOMAIN_MAP = 9,
    LAUNCH_ATTRIBUTE_MEM_SYNC_DOMAIN = 10,
    LAUNCH_ATTRIBUTE_LAUNCH_COMPLETION_EVENT = 12,
}

/// CUstreamCaptureStatus
streamCaptureStatus :: enum cffi.uint {
    STREAM_CAPTURE_STATUS_NONE = 0,
    STREAM_CAPTURE_STATUS_ACTIVE = 1,
    STREAM_CAPTURE_STATUS_INVALIDATED = 2,
}

/// CUstreamCaptureMode
streamCaptureMode :: enum cffi.uint {
    STREAM_CAPTURE_MODE_GLOBAL = 0,
    STREAM_CAPTURE_MODE_THREAD_LOCAL = 1,
    STREAM_CAPTURE_MODE_RELAXED = 2,
}

/// CUdriverProcAddress_flags
driverProcAddress_flags :: enum cffi.uint {
    GET_PROC_ADDRESS_DEFAULT = 0,
    GET_PROC_ADDRESS_LEGACY_STREAM = 1,
    GET_PROC_ADDRESS_PER_THREAD_DEFAULT_STREAM = 2,
}

/// CUdriverProcAddressQueryResult
driverProcAddressQueryResult :: enum cffi.uint {
    GET_PROC_ADDRESS_SUCCESS = 0,
    GET_PROC_ADDRESS_SYMBOL_NOT_FOUND = 1,
    GET_PROC_ADDRESS_VERSION_NOT_SUFFICIENT = 2,
}

/// CUexecAffinityType
execAffinityType :: enum cffi.uint {
    EXEC_AFFINITY_TYPE_SM_COUNT = 0,
    EXEC_AFFINITY_TYPE_MAX = 1,
}

/// CUlibraryOption
libraryOption :: enum cffi.uint {
    LIBRARY_HOST_UNIVERSAL_FUNCTION_AND_DATA_TABLE = 0,
    LIBRARY_BINARY_IS_PRESERVED = 1,
    LIBRARY_NUM_OPTIONS = 2,
}

/// CUresult
result :: enum cffi.uint {
    SUCCESS = 0,
    ERROR_INVALID_VALUE = 1,
    ERROR_OUT_OF_MEMORY = 2,
    ERROR_NOT_INITIALIZED = 3,
    ERROR_DEINITIALIZED = 4,
    ERROR_PROFILER_DISABLED = 5,
    ERROR_PROFILER_NOT_INITIALIZED = 6,
    ERROR_PROFILER_ALREADY_STARTED = 7,
    ERROR_PROFILER_ALREADY_STOPPED = 8,
    ERROR_STUB_LIBRARY = 34,
    ERROR_DEVICE_UNAVAILABLE = 46,
    ERROR_NO_DEVICE = 100,
    ERROR_INVALID_DEVICE = 101,
    ERROR_DEVICE_NOT_LICENSED = 102,
    ERROR_INVALID_IMAGE = 200,
    ERROR_INVALID_CONTEXT = 201,
    ERROR_CONTEXT_ALREADY_CURRENT = 202,
    ERROR_MAP_FAILED = 205,
    ERROR_UNMAP_FAILED = 206,
    ERROR_ARRAY_IS_MAPPED = 207,
    ERROR_ALREADY_MAPPED = 208,
    ERROR_NO_BINARY_FOR_GPU = 209,
    ERROR_ALREADY_ACQUIRED = 210,
    ERROR_NOT_MAPPED = 211,
    ERROR_NOT_MAPPED_AS_ARRAY = 212,
    ERROR_NOT_MAPPED_AS_POINTER = 213,
    ERROR_ECC_UNCORRECTABLE = 214,
    ERROR_UNSUPPORTED_LIMIT = 215,
    ERROR_CONTEXT_ALREADY_IN_USE = 216,
    ERROR_PEER_ACCESS_UNSUPPORTED = 217,
    ERROR_INVALID_PTX = 218,
    ERROR_INVALID_GRAPHICS_CONTEXT = 219,
    ERROR_NVLINK_UNCORRECTABLE = 220,
    ERROR_JIT_COMPILER_NOT_FOUND = 221,
    ERROR_UNSUPPORTED_PTX_VERSION = 222,
    ERROR_JIT_COMPILATION_DISABLED = 223,
    ERROR_UNSUPPORTED_EXEC_AFFINITY = 224,
    ERROR_UNSUPPORTED_DEVSIDE_SYNC = 225,
    ERROR_INVALID_SOURCE = 300,
    ERROR_FILE_NOT_FOUND = 301,
    ERROR_SHARED_OBJECT_SYMBOL_NOT_FOUND = 302,
    ERROR_SHARED_OBJECT_INIT_FAILED = 303,
    ERROR_OPERATING_SYSTEM = 304,
    ERROR_INVALID_HANDLE = 400,
    ERROR_ILLEGAL_STATE = 401,
    ERROR_LOSSY_QUERY = 402,
    ERROR_NOT_FOUND = 500,
    ERROR_NOT_READY = 600,
    ERROR_ILLEGAL_ADDRESS = 700,
    ERROR_LAUNCH_OUT_OF_RESOURCES = 701,
    ERROR_LAUNCH_TIMEOUT = 702,
    ERROR_LAUNCH_INCOMPATIBLE_TEXTURING = 703,
    ERROR_PEER_ACCESS_ALREADY_ENABLED = 704,
    ERROR_PEER_ACCESS_NOT_ENABLED = 705,
    ERROR_PRIMARY_CONTEXT_ACTIVE = 708,
    ERROR_CONTEXT_IS_DESTROYED = 709,
    ERROR_ASSERT = 710,
    ERROR_TOO_MANY_PEERS = 711,
    ERROR_HOST_MEMORY_ALREADY_REGISTERED = 712,
    ERROR_HOST_MEMORY_NOT_REGISTERED = 713,
    ERROR_HARDWARE_STACK_ERROR = 714,
    ERROR_ILLEGAL_INSTRUCTION = 715,
    ERROR_MISALIGNED_ADDRESS = 716,
    ERROR_INVALID_ADDRESS_SPACE = 717,
    ERROR_INVALID_PC = 718,
    ERROR_LAUNCH_FAILED = 719,
    ERROR_COOPERATIVE_LAUNCH_TOO_LARGE = 720,
    ERROR_NOT_PERMITTED = 800,
    ERROR_NOT_SUPPORTED = 801,
    ERROR_SYSTEM_NOT_READY = 802,
    ERROR_SYSTEM_DRIVER_MISMATCH = 803,
    ERROR_COMPAT_NOT_SUPPORTED_ON_DEVICE = 804,
    ERROR_MPS_CONNECTION_FAILED = 805,
    ERROR_MPS_RPC_FAILURE = 806,
    ERROR_MPS_SERVER_NOT_READY = 807,
    ERROR_MPS_MAX_CLIENTS_REACHED = 808,
    ERROR_MPS_MAX_CONNECTIONS_REACHED = 809,
    ERROR_MPS_CLIENT_TERMINATED = 810,
    ERROR_CDP_NOT_SUPPORTED = 811,
    ERROR_CDP_VERSION_MISMATCH = 812,
    ERROR_STREAM_CAPTURE_UNSUPPORTED = 900,
    ERROR_STREAM_CAPTURE_INVALIDATED = 901,
    ERROR_STREAM_CAPTURE_MERGE = 902,
    ERROR_STREAM_CAPTURE_UNMATCHED = 903,
    ERROR_STREAM_CAPTURE_UNJOINED = 904,
    ERROR_STREAM_CAPTURE_ISOLATION = 905,
    ERROR_STREAM_CAPTURE_IMPLICIT = 906,
    ERROR_CAPTURED_EVENT = 907,
    ERROR_STREAM_CAPTURE_WRONG_THREAD = 908,
    ERROR_TIMEOUT = 909,
    ERROR_GRAPH_EXEC_UPDATE_FAILURE = 910,
    ERROR_EXTERNAL_DEVICE = 911,
    ERROR_INVALID_CLUSTER_SIZE = 912,
    ERROR_UNKNOWN = 999,
}

/// CUdevice_P2PAttribute
device_P2PAttribute :: enum cffi.uint {
    DEVICE_P2P_ATTRIBUTE_PERFORMANCE_RANK = 1,
    DEVICE_P2P_ATTRIBUTE_ACCESS_SUPPORTED = 2,
    DEVICE_P2P_ATTRIBUTE_NATIVE_ATOMIC_SUPPORTED = 3,
    DEVICE_P2P_ATTRIBUTE_ACCESS_ACCESS_SUPPORTED = 4,
    DEVICE_P2P_ATTRIBUTE_CUDA_ARRAY_ACCESS_SUPPORTED = 4,
}

/// CUresourceViewFormat
resourceViewFormat :: enum cffi.uint {
    RES_VIEW_FORMAT_NONE = 0,
    RES_VIEW_FORMAT_UINT_1X8 = 1,
    RES_VIEW_FORMAT_UINT_2X8 = 2,
    RES_VIEW_FORMAT_UINT_4X8 = 3,
    RES_VIEW_FORMAT_SINT_1X8 = 4,
    RES_VIEW_FORMAT_SINT_2X8 = 5,
    RES_VIEW_FORMAT_SINT_4X8 = 6,
    RES_VIEW_FORMAT_UINT_1X16 = 7,
    RES_VIEW_FORMAT_UINT_2X16 = 8,
    RES_VIEW_FORMAT_UINT_4X16 = 9,
    RES_VIEW_FORMAT_SINT_1X16 = 10,
    RES_VIEW_FORMAT_SINT_2X16 = 11,
    RES_VIEW_FORMAT_SINT_4X16 = 12,
    RES_VIEW_FORMAT_UINT_1X32 = 13,
    RES_VIEW_FORMAT_UINT_2X32 = 14,
    RES_VIEW_FORMAT_UINT_4X32 = 15,
    RES_VIEW_FORMAT_SINT_1X32 = 16,
    RES_VIEW_FORMAT_SINT_2X32 = 17,
    RES_VIEW_FORMAT_SINT_4X32 = 18,
    RES_VIEW_FORMAT_FLOAT_1X16 = 19,
    RES_VIEW_FORMAT_FLOAT_2X16 = 20,
    RES_VIEW_FORMAT_FLOAT_4X16 = 21,
    RES_VIEW_FORMAT_FLOAT_1X32 = 22,
    RES_VIEW_FORMAT_FLOAT_2X32 = 23,
    RES_VIEW_FORMAT_FLOAT_4X32 = 24,
    RES_VIEW_FORMAT_UNSIGNED_BC1 = 25,
    RES_VIEW_FORMAT_UNSIGNED_BC2 = 26,
    RES_VIEW_FORMAT_UNSIGNED_BC3 = 27,
    RES_VIEW_FORMAT_UNSIGNED_BC4 = 28,
    RES_VIEW_FORMAT_SIGNED_BC4 = 29,
    RES_VIEW_FORMAT_UNSIGNED_BC5 = 30,
    RES_VIEW_FORMAT_SIGNED_BC5 = 31,
    RES_VIEW_FORMAT_UNSIGNED_BC6H = 32,
    RES_VIEW_FORMAT_SIGNED_BC6H = 33,
    RES_VIEW_FORMAT_UNSIGNED_BC7 = 34,
}

/// CUtensorMapDataType
tensorMapDataType :: enum cffi.uint {
    TENSOR_MAP_DATA_TYPE_UINT8 = 0,
    TENSOR_MAP_DATA_TYPE_UINT16 = 1,
    TENSOR_MAP_DATA_TYPE_UINT32 = 2,
    TENSOR_MAP_DATA_TYPE_INT32 = 3,
    TENSOR_MAP_DATA_TYPE_UINT64 = 4,
    TENSOR_MAP_DATA_TYPE_INT64 = 5,
    TENSOR_MAP_DATA_TYPE_FLOAT16 = 6,
    TENSOR_MAP_DATA_TYPE_FLOAT32 = 7,
    TENSOR_MAP_DATA_TYPE_FLOAT64 = 8,
    TENSOR_MAP_DATA_TYPE_BFLOAT16 = 9,
    TENSOR_MAP_DATA_TYPE_FLOAT32_FTZ = 10,
    TENSOR_MAP_DATA_TYPE_TFLOAT32 = 11,
    TENSOR_MAP_DATA_TYPE_TFLOAT32_FTZ = 12,
}

/// CUtensorMapInterleave
tensorMapInterleave :: enum cffi.uint {
    TENSOR_MAP_INTERLEAVE_NONE = 0,
    TENSOR_MAP_INTERLEAVE_16B = 1,
    TENSOR_MAP_INTERLEAVE_32B = 2,
}

/// CUtensorMapSwizzle
tensorMapSwizzle :: enum cffi.uint {
    TENSOR_MAP_SWIZZLE_NONE = 0,
    TENSOR_MAP_SWIZZLE_32B = 1,
    TENSOR_MAP_SWIZZLE_64B = 2,
    TENSOR_MAP_SWIZZLE_128B = 3,
}

/// CUtensorMapL2promotion
tensorMapL2promotion :: enum cffi.uint {
    TENSOR_MAP_L2_PROMOTION_NONE = 0,
    TENSOR_MAP_L2_PROMOTION_L2_64B = 1,
    TENSOR_MAP_L2_PROMOTION_L2_128B = 2,
    TENSOR_MAP_L2_PROMOTION_L2_256B = 3,
}

/// CUtensorMapFloatOOBfill
tensorMapFloatOOBfill :: enum cffi.uint {
    TENSOR_MAP_FLOAT_OOB_FILL_NONE = 0,
    TENSOR_MAP_FLOAT_OOB_FILL_NAN_REQUEST_ZERO_FMA = 1,
}

/// CUDA_POINTER_ATTRIBUTE_ACCESS_FLAGS
POINTER_ATTRIBUTE_ACCESS_FLAGS :: enum cffi.uint {
    FLAG_NONE = 0,
    FLAG_READ = 1,
    FLAG_READWRITE = 3,
}

/// CUexternalMemoryHandleType
externalMemoryHandleType :: enum cffi.uint {
    EXTERNAL_MEMORY_HANDLE_TYPE_OPAQUE_FD = 1,
    EXTERNAL_MEMORY_HANDLE_TYPE_OPAQUE_WIN32 = 2,
    EXTERNAL_MEMORY_HANDLE_TYPE_OPAQUE_WIN32_KMT = 3,
    EXTERNAL_MEMORY_HANDLE_TYPE_D3D12_HEAP = 4,
    EXTERNAL_MEMORY_HANDLE_TYPE_D3D12_RESOURCE = 5,
    EXTERNAL_MEMORY_HANDLE_TYPE_D3D11_RESOURCE = 6,
    EXTERNAL_MEMORY_HANDLE_TYPE_D3D11_RESOURCE_KMT = 7,
    EXTERNAL_MEMORY_HANDLE_TYPE_NVSCIBUF = 8,
}

/// CUexternalSemaphoreHandleType
externalSemaphoreHandleType :: enum cffi.uint {
    EXTERNAL_SEMAPHORE_HANDLE_TYPE_OPAQUE_FD = 1,
    EXTERNAL_SEMAPHORE_HANDLE_TYPE_OPAQUE_WIN32 = 2,
    EXTERNAL_SEMAPHORE_HANDLE_TYPE_OPAQUE_WIN32_KMT = 3,
    EXTERNAL_SEMAPHORE_HANDLE_TYPE_D3D12_FENCE = 4,
    EXTERNAL_SEMAPHORE_HANDLE_TYPE_D3D11_FENCE = 5,
    EXTERNAL_SEMAPHORE_HANDLE_TYPE_NVSCISYNC = 6,
    EXTERNAL_SEMAPHORE_HANDLE_TYPE_D3D11_KEYED_MUTEX = 7,
    EXTERNAL_SEMAPHORE_HANDLE_TYPE_D3D11_KEYED_MUTEX_KMT = 8,
    EXTERNAL_SEMAPHORE_HANDLE_TYPE_TIMELINE_SEMAPHORE_FD = 9,
    EXTERNAL_SEMAPHORE_HANDLE_TYPE_TIMELINE_SEMAPHORE_WIN32 = 10,
}

/// CUmemAllocationHandleType
memAllocationHandleType :: enum cffi.uint {
    MEM_HANDLE_TYPE_NONE = 0,
    MEM_HANDLE_TYPE_POSIX_FILE_DESCRIPTOR = 1,
    MEM_HANDLE_TYPE_WIN32 = 2,
    MEM_HANDLE_TYPE_WIN32_KMT = 4,
    MEM_HANDLE_TYPE_FABRIC = 8,
    MEM_HANDLE_TYPE_MAX = 2147483647,
}

/// CUmemAccess_flags
memAccess_flags :: enum cffi.uint {
    MEM_ACCESS_FLAGS_PROT_NONE = 0,
    MEM_ACCESS_FLAGS_PROT_READ = 1,
    MEM_ACCESS_FLAGS_PROT_READWRITE = 3,
    MEM_ACCESS_FLAGS_PROT_MAX = 2147483647,
}

/// CUmemLocationType
memLocationType :: enum cffi.uint {
    MEM_LOCATION_TYPE_INVALID = 0,
    MEM_LOCATION_TYPE_DEVICE = 1,
    MEM_LOCATION_TYPE_HOST = 2,
    MEM_LOCATION_TYPE_HOST_NUMA = 3,
    MEM_LOCATION_TYPE_HOST_NUMA_CURRENT = 4,
    MEM_LOCATION_TYPE_MAX = 2147483647,
}

/// CUmemAllocationType
memAllocationType :: enum cffi.uint {
    MEM_ALLOCATION_TYPE_INVALID = 0,
    MEM_ALLOCATION_TYPE_PINNED = 1,
    MEM_ALLOCATION_TYPE_MAX = 2147483647,
}

/// CUmemAllocationGranularity_flags
memAllocationGranularity_flags :: enum cffi.uint {
    MEM_ALLOC_GRANULARITY_MINIMUM = 0,
    MEM_ALLOC_GRANULARITY_RECOMMENDED = 1,
}

/// CUmemRangeHandleType
memRangeHandleType :: enum cffi.uint {
    MEM_RANGE_HANDLE_TYPE_DMA_BUF_FD = 1,
    MEM_RANGE_HANDLE_TYPE_MAX = 2147483647,
}

/// CUarraySparseSubresourceType
arraySparseSubresourceType :: enum cffi.uint {
    ARRAY_SPARSE_SUBRESOURCE_TYPE_SPARSE_LEVEL = 0,
    ARRAY_SPARSE_SUBRESOURCE_TYPE_MIPTAIL = 1,
}

/// CUmemOperationType
memOperationType :: enum cffi.uint {
    MEM_OPERATION_TYPE_MAP = 1,
    MEM_OPERATION_TYPE_UNMAP = 2,
}

/// CUmemHandleType
memHandleType :: enum cffi.uint {
    MEM_HANDLE_TYPE_GENERIC = 0,
}

/// CUmemAllocationCompType
memAllocationCompType :: enum cffi.uint {
    MEM_ALLOCATION_COMP_NONE = 0,
    MEM_ALLOCATION_COMP_GENERIC = 1,
}

/// CUmulticastGranularity_flags
multicastGranularity_flags :: enum cffi.uint {
    MULTICAST_GRANULARITY_MINIMUM = 0,
    MULTICAST_GRANULARITY_RECOMMENDED = 1,
}

/// CUgraphExecUpdateResult
graphExecUpdateResult :: enum cffi.uint {
    GRAPH_EXEC_UPDATE_SUCCESS = 0,
    GRAPH_EXEC_UPDATE_ERROR = 1,
    GRAPH_EXEC_UPDATE_ERROR_TOPOLOGY_CHANGED = 2,
    GRAPH_EXEC_UPDATE_ERROR_NODE_TYPE_CHANGED = 3,
    GRAPH_EXEC_UPDATE_ERROR_FUNCTION_CHANGED = 4,
    GRAPH_EXEC_UPDATE_ERROR_PARAMETERS_CHANGED = 5,
    GRAPH_EXEC_UPDATE_ERROR_NOT_SUPPORTED = 6,
    GRAPH_EXEC_UPDATE_ERROR_UNSUPPORTED_FUNCTION_CHANGE = 7,
    GRAPH_EXEC_UPDATE_ERROR_ATTRIBUTES_CHANGED = 8,
}

/// CUmemPool_attribute
memPool_attribute :: enum cffi.uint {
    MEMPOOL_ATTR_REUSE_FOLLOW_EVENT_DEPENDENCIES = 1,
    MEMPOOL_ATTR_REUSE_ALLOW_OPPORTUNISTIC = 2,
    MEMPOOL_ATTR_REUSE_ALLOW_INTERNAL_DEPENDENCIES = 3,
    MEMPOOL_ATTR_RELEASE_THRESHOLD = 4,
    MEMPOOL_ATTR_RESERVED_MEM_CURRENT = 5,
    MEMPOOL_ATTR_RESERVED_MEM_HIGH = 6,
    MEMPOOL_ATTR_USED_MEM_CURRENT = 7,
    MEMPOOL_ATTR_USED_MEM_HIGH = 8,
}

/// CUgraphMem_attribute
graphMem_attribute :: enum cffi.uint {
    GRAPH_MEM_ATTR_USED_MEM_CURRENT = 0,
    GRAPH_MEM_ATTR_USED_MEM_HIGH = 1,
    GRAPH_MEM_ATTR_RESERVED_MEM_CURRENT = 2,
    GRAPH_MEM_ATTR_RESERVED_MEM_HIGH = 3,
}

/// CUflushGPUDirectRDMAWritesOptions
flushGPUDirectRDMAWritesOptions :: enum cffi.uint {
    FLUSH_GPU_DIRECT_RDMA_WRITES_OPTION_HOST = 1,
    FLUSH_GPU_DIRECT_RDMA_WRITES_OPTION_MEMOPS = 2,
}

/// CUGPUDirectRDMAWritesOrdering
GPUDirectRDMAWritesOrdering :: enum cffi.uint {
    GPU_DIRECT_RDMA_WRITES_ORDERING_NONE = 0,
    GPU_DIRECT_RDMA_WRITES_ORDERING_OWNER = 100,
    GPU_DIRECT_RDMA_WRITES_ORDERING_ALL_DEVICES = 200,
}

/// CUflushGPUDirectRDMAWritesScope
flushGPUDirectRDMAWritesScope :: enum cffi.uint {
    FLUSH_GPU_DIRECT_RDMA_WRITES_TO_OWNER = 100,
    FLUSH_GPU_DIRECT_RDMA_WRITES_TO_ALL_DEVICES = 200,
}

/// CUflushGPUDirectRDMAWritesTarget
flushGPUDirectRDMAWritesTarget :: enum cffi.uint {
    FLUSH_GPU_DIRECT_RDMA_WRITES_TARGET_CURRENT_CTX = 0,
}

/// CUgraphDebugDot_flags
graphDebugDot_flags :: enum cffi.uint {
    GRAPH_DEBUG_DOT_FLAGS_VERBOSE = 1,
    GRAPH_DEBUG_DOT_FLAGS_RUNTIME_TYPES = 2,
    GRAPH_DEBUG_DOT_FLAGS_KERNEL_NODE_PARAMS = 4,
    GRAPH_DEBUG_DOT_FLAGS_MEMCPY_NODE_PARAMS = 8,
    GRAPH_DEBUG_DOT_FLAGS_MEMSET_NODE_PARAMS = 16,
    GRAPH_DEBUG_DOT_FLAGS_HOST_NODE_PARAMS = 32,
    GRAPH_DEBUG_DOT_FLAGS_EVENT_NODE_PARAMS = 64,
    GRAPH_DEBUG_DOT_FLAGS_EXT_SEMAS_SIGNAL_NODE_PARAMS = 128,
    GRAPH_DEBUG_DOT_FLAGS_EXT_SEMAS_WAIT_NODE_PARAMS = 256,
    GRAPH_DEBUG_DOT_FLAGS_KERNEL_NODE_ATTRIBUTES = 512,
    GRAPH_DEBUG_DOT_FLAGS_HANDLES = 1024,
    GRAPH_DEBUG_DOT_FLAGS_MEM_ALLOC_NODE_PARAMS = 2048,
    GRAPH_DEBUG_DOT_FLAGS_MEM_FREE_NODE_PARAMS = 4096,
    GRAPH_DEBUG_DOT_FLAGS_BATCH_MEM_OP_NODE_PARAMS = 8192,
    GRAPH_DEBUG_DOT_FLAGS_EXTRA_TOPO_INFO = 16384,
    GRAPH_DEBUG_DOT_FLAGS_CONDITIONAL_NODE_PARAMS = 32768,
}

/// CUuserObject_flags
userObject_flags :: enum cffi.uint {
    USER_OBJECT_NO_DESTRUCTOR_SYNC = 1,
}

/// CUuserObjectRetain_flags
userObjectRetain_flags :: enum cffi.uint {
    GRAPH_USER_OBJECT_MOVE = 1,
}

/// CUgraphInstantiate_flags
graphInstantiate_flags :: enum cffi.uint {
    GRAPH_INSTANTIATE_FLAG_AUTO_FREE_ON_LAUNCH = 1,
    GRAPH_INSTANTIATE_FLAG_UPLOAD = 2,
    GRAPH_INSTANTIATE_FLAG_DEVICE_LAUNCH = 4,
    GRAPH_INSTANTIATE_FLAG_USE_NODE_PRIORITY = 8,
}

/// CUdeviceNumaConfig
deviceNumaConfig :: enum cffi.uint {
    DEVICE_NUMA_CONFIG_NONE = 0,
    DEVICE_NUMA_CONFIG_NUMA_NODE = 1,
}

/// CUmoduleLoadingMode
moduleLoadingMode :: enum cffi.uint {
    MODULE_EAGER_LOADING = 1,
    MODULE_LAZY_LOADING = 2,
}

/// CUcoredumpSettings
coredumpSettings :: enum cffi.uint {
    OREDUMP_ENABLE_ON_EXCEPTION = 1,
    OREDUMP_TRIGGER_HOST = 2,
    OREDUMP_LIGHTWEIGHT = 3,
    OREDUMP_ENABLE_USER_TRIGGER = 4,
    OREDUMP_FILE = 5,
    OREDUMP_PIPE = 6,
    OREDUMP_MAX = 7,
}

/// CUctx_st
ctx_st :: struct {}

/// CUmod_st
mod_st :: struct {}

/// CUfunc_st
func_st :: struct {}

/// CUlib_st
lib_st :: struct {}

/// CUkern_st
kern_st :: struct {}

/// CUarray_st
array_st :: struct {}

/// CUmipmappedArray_st
mipmappedArray_st :: struct {}

/// CUtexref_st
texref_st :: struct {}

/// CUsurfref_st
surfref_st :: struct {}

/// CUevent_st
event_st :: struct {}

/// CUstream_st
stream_st :: struct {}

/// CUgraphicsResource_st
graphicsResource_st :: struct {}

/// CUextMemory_st
extMemory_st :: struct {}

/// CUextSemaphore_st
extSemaphore_st :: struct {}

/// CUgraph_st
graph_st :: struct {}

/// CUgraphNode_st
graphNode_st :: struct {}

/// CUgraphExec_st
graphExec_st :: struct {}

/// CUmemPoolHandle_st
memPoolHandle_st :: struct {}

/// CUuserObject_st
userObject_st :: struct {}

/// CUuuid_st
uuid_st :: struct  {
    bytes : [16]cffi.char,
}

/// CUmemFabricHandle_st
memFabricHandle_st :: struct  {
    data : [64]cffi.uchar,
}

/// CUipcEventHandle_st
ipcEventHandle_st :: struct  {
    reserved : [64]cffi.char,
}

/// CUipcMemHandle_st
ipcMemHandle_st :: struct  {
    reserved : [64]cffi.char,
}

/// CUstreamBatchMemOpParams_union::CUstreamMemOpWaitValueParams_st
streamMemOpWaitValueParams_st :: struct #align (8) {
    operation : streamBatchMemOpType,
    address : cffi.ulonglong,
    value : cffi.uint,
    value64 : cffi.ulonglong,
    flags : cffi.uint,
    alias : cffi.ulonglong,
}

/// CUstreamBatchMemOpParams_union::CUstreamMemOpWriteValueParams_st
streamMemOpWriteValueParams_st :: struct #align (8) {
    operation : streamBatchMemOpType,
    address : cffi.ulonglong,
    value : cffi.uint,
    value64 : cffi.ulonglong,
    flags : cffi.uint,
    alias : cffi.ulonglong,
}

/// CUstreamBatchMemOpParams_union::CUstreamMemOpFlushRemoteWritesParams_st
streamMemOpFlushRemoteWritesParams_st :: struct #align (4) {
    operation : streamBatchMemOpType,
    flags : cffi.uint,
}

/// CUstreamBatchMemOpParams_union::CUstreamMemOpMemoryBarrierParams_st
streamMemOpMemoryBarrierParams_st :: struct #align (4) {
    operation : streamBatchMemOpType,
    flags : cffi.uint,
}

/// CUDA_BATCH_MEM_OP_NODE_PARAMS_v1_st
BATCH_MEM_OP_NODE_PARAMS_v1_st :: struct #align (8) {
    ctx : ^ctx_st,
    count : cffi.uint,
    paramArray : ^streamBatchMemOpParams_union,
    flags : cffi.uint,
}

/// CUDA_BATCH_MEM_OP_NODE_PARAMS_v2_st
BATCH_MEM_OP_NODE_PARAMS_v2_st :: struct #align (8) {
    ctx : ^ctx_st,
    count : cffi.uint,
    paramArray : ^streamBatchMemOpParams_union,
    flags : cffi.uint,
}

/// CUdevprop_st
devprop_st :: struct #align (4) {
    maxThreadsPerBlock : cffi.int,
    maxThreadsDim : [3]cffi.int,
    maxGridSize : [3]cffi.int,
    sharedMemPerBlock : cffi.int,
    totalConstantMemory : cffi.int,
    SIMDWidth : cffi.int,
    memPitch : cffi.int,
    regsPerBlock : cffi.int,
    clockRate : cffi.int,
    textureAlign : cffi.int,
}

/// CUlinkState_st
linkState_st :: struct {}

/// CUaccessPolicyWindow_st
accessPolicyWindow_st :: struct #align (8) {
    base_ptr : rawptr,
    num_bytes : cffi.ulong,
    hitRatio : cffi.float,
    hitProp : accessProperty,
    missProp : accessProperty,
}

/// CUDA_KERNEL_NODE_PARAMS_st
KERNEL_NODE_PARAMS_st :: struct #align (8) {
    func : ^func_st,
    gridDimX : cffi.uint,
    gridDimY : cffi.uint,
    gridDimZ : cffi.uint,
    blockDimX : cffi.uint,
    blockDimY : cffi.uint,
    blockDimZ : cffi.uint,
    sharedMemBytes : cffi.uint,
    kernelParams : ^rawptr,
    extra : ^rawptr,
}

/// CUDA_KERNEL_NODE_PARAMS_v2_st
KERNEL_NODE_PARAMS_v2_st :: struct #align (8) {
    func : ^func_st,
    gridDimX : cffi.uint,
    gridDimY : cffi.uint,
    gridDimZ : cffi.uint,
    blockDimX : cffi.uint,
    blockDimY : cffi.uint,
    blockDimZ : cffi.uint,
    sharedMemBytes : cffi.uint,
    kernelParams : ^rawptr,
    extra : ^rawptr,
    kern : ^kern_st,
    ctx : ^ctx_st,
}

/// CUDA_KERNEL_NODE_PARAMS_v3_st
KERNEL_NODE_PARAMS_v3_st :: struct #align (8) {
    func : ^func_st,
    gridDimX : cffi.uint,
    gridDimY : cffi.uint,
    gridDimZ : cffi.uint,
    blockDimX : cffi.uint,
    blockDimY : cffi.uint,
    blockDimZ : cffi.uint,
    sharedMemBytes : cffi.uint,
    kernelParams : ^rawptr,
    extra : ^rawptr,
    kern : ^kern_st,
    ctx : ^ctx_st,
}

/// CUDA_MEMSET_NODE_PARAMS_st
MEMSET_NODE_PARAMS_st :: struct #align (8) {
    dst : cffi.ulonglong,
    pitch : cffi.ulong,
    value : cffi.uint,
    elementSize : cffi.uint,
    width : cffi.ulong,
    height : cffi.ulong,
}

/// CUDA_MEMSET_NODE_PARAMS_v2_st
MEMSET_NODE_PARAMS_v2_st :: struct #align (8) {
    dst : cffi.ulonglong,
    pitch : cffi.ulong,
    value : cffi.uint,
    elementSize : cffi.uint,
    width : cffi.ulong,
    height : cffi.ulong,
    ctx : ^ctx_st,
}

/// CUDA_HOST_NODE_PARAMS_st
HOST_NODE_PARAMS_st :: struct #align (8) {
    fn : proc "c" (),
    userData : rawptr,
}

/// CUDA_HOST_NODE_PARAMS_v2_st
HOST_NODE_PARAMS_v2_st :: struct #align (8) {
    fn : proc "c" (),
    userData : rawptr,
}

/// CUDA_CONDITIONAL_NODE_PARAMS
CONDITIONAL_NODE_PARAMS :: struct #align (8) {
    handle : cffi.ulonglong,
    type : graphConditionalNodeType,
    size : cffi.uint,
    phGraph_out : ^^graph_st,
    ctx : ^ctx_st,
}

/// CUgraphEdgeData_st
graphEdgeData_st :: struct  {
    from_port : cffi.uchar,
    to_port : cffi.uchar,
    type : cffi.uchar,
    reserved : [5]cffi.uchar,
}

/// CUDA_GRAPH_INSTANTIATE_PARAMS_st
GRAPH_INSTANTIATE_PARAMS_st :: struct #align (8) {
    flags : cffi.ulonglong,
    hUploadStream : ^stream_st,
    hErrNode_out : ^graphNode_st,
    result_out : graphInstantiateResult,
}

/// CUlaunchMemSyncDomainMap_st
launchMemSyncDomainMap_st :: struct  {
    default_ : cffi.uchar,
    remote : cffi.uchar,
}

/// CUlaunchAttribute_st
launchAttribute_st :: struct #align (8) {
    id : launchAttributeID,
    pad : [4]cffi.char,
    value : launchAttributeValue_union,
}

/// CUlaunchConfig_st
launchConfig_st :: struct #align (8) {
    gridDimX : cffi.uint,
    gridDimY : cffi.uint,
    gridDimZ : cffi.uint,
    blockDimX : cffi.uint,
    blockDimY : cffi.uint,
    blockDimZ : cffi.uint,
    sharedMemBytes : cffi.uint,
    hStream : ^stream_st,
    attrs : ^launchAttribute_st,
    numAttrs : cffi.uint,
}

/// CUexecAffinitySmCount_st
execAffinitySmCount_st :: struct #align (4) {
    val : cffi.uint,
}

/// CUexecAffinityParam_st
execAffinityParam_st :: struct #align (4) {
    type : execAffinityType,
    param_smCount : execAffinitySmCount_st,
}

/// CUlibraryHostUniversalFunctionAndDataTable_st
libraryHostUniversalFunctionAndDataTable_st :: struct #align (8) {
    functionTable : rawptr,
    functionWindowSize : cffi.ulong,
    dataTable : rawptr,
    dataWindowSize : cffi.ulong,
}

/// CUDA_MEMCPY2D_st
MEMCPY2D_st :: struct #align (8) {
    srcXInBytes : cffi.ulong,
    srcY : cffi.ulong,
    srcMemoryType : memorytype,
    srcHost : rawptr,
    srcDevice : cffi.ulonglong,
    srcArray : ^array_st,
    srcPitch : cffi.ulong,
    dstXInBytes : cffi.ulong,
    dstY : cffi.ulong,
    dstMemoryType : memorytype,
    dstHost : rawptr,
    dstDevice : cffi.ulonglong,
    dstArray : ^array_st,
    dstPitch : cffi.ulong,
    WidthInBytes : cffi.ulong,
    Height : cffi.ulong,
}

/// CUDA_MEMCPY3D_st
MEMCPY3D_st :: struct #align (8) {
    srcXInBytes : cffi.ulong,
    srcY : cffi.ulong,
    srcZ : cffi.ulong,
    srcLOD : cffi.ulong,
    srcMemoryType : memorytype,
    srcHost : rawptr,
    srcDevice : cffi.ulonglong,
    srcArray : ^array_st,
    reserved0 : rawptr,
    srcPitch : cffi.ulong,
    srcHeight : cffi.ulong,
    dstXInBytes : cffi.ulong,
    dstY : cffi.ulong,
    dstZ : cffi.ulong,
    dstLOD : cffi.ulong,
    dstMemoryType : memorytype,
    dstHost : rawptr,
    dstDevice : cffi.ulonglong,
    dstArray : ^array_st,
    reserved1 : rawptr,
    dstPitch : cffi.ulong,
    dstHeight : cffi.ulong,
    WidthInBytes : cffi.ulong,
    Height : cffi.ulong,
    Depth : cffi.ulong,
}

/// CUDA_MEMCPY3D_PEER_st
MEMCPY3D_PEER_st :: struct #align (8) {
    srcXInBytes : cffi.ulong,
    srcY : cffi.ulong,
    srcZ : cffi.ulong,
    srcLOD : cffi.ulong,
    srcMemoryType : memorytype,
    srcHost : rawptr,
    srcDevice : cffi.ulonglong,
    srcArray : ^array_st,
    srcContext : ^ctx_st,
    srcPitch : cffi.ulong,
    srcHeight : cffi.ulong,
    dstXInBytes : cffi.ulong,
    dstY : cffi.ulong,
    dstZ : cffi.ulong,
    dstLOD : cffi.ulong,
    dstMemoryType : memorytype,
    dstHost : rawptr,
    dstDevice : cffi.ulonglong,
    dstArray : ^array_st,
    dstContext : ^ctx_st,
    dstPitch : cffi.ulong,
    dstHeight : cffi.ulong,
    WidthInBytes : cffi.ulong,
    Height : cffi.ulong,
    Depth : cffi.ulong,
}

/// CUDA_MEMCPY_NODE_PARAMS_st
MEMCPY_NODE_PARAMS_st :: struct #align (8) {
    flags : cffi.int,
    reserved : cffi.int,
    copyCtx : ^ctx_st,
    copyParams : MEMCPY3D_st,
}

/// CUDA_ARRAY_DESCRIPTOR_st
ARRAY_DESCRIPTOR_st :: struct #align (8) {
    Width : cffi.ulong,
    Height : cffi.ulong,
    Format : array_format,
    NumChannels : cffi.uint,
}

/// CUDA_ARRAY3D_DESCRIPTOR_st
ARRAY3D_DESCRIPTOR_st :: struct #align (8) {
    Width : cffi.ulong,
    Height : cffi.ulong,
    Depth : cffi.ulong,
    Format : array_format,
    NumChannels : cffi.uint,
    Flags : cffi.uint,
}

/// CUDA_ARRAY_SPARSE_PROPERTIES_st
ARRAY_SPARSE_PROPERTIES_st :: struct #align (8) {
    tileExtent_width : cffi.uint,
    tileExtent_height : cffi.uint,
    tileExtent_depth : cffi.uint,
    miptailFirstLevel : cffi.uint,
    miptailSize : cffi.ulonglong,
    flags : cffi.uint,
    reserved : [4]cffi.uint,
}

/// CUDA_ARRAY_MEMORY_REQUIREMENTS_st
ARRAY_MEMORY_REQUIREMENTS_st :: struct #align (8) {
    size : cffi.ulong,
    alignment : cffi.ulong,
    reserved : [4]cffi.uint,
}

/// CUDA_RESOURCE_DESC_st
RESOURCE_DESC_st :: struct #align (8) {
    resType : resourcetype,
    res_array_hArray : ^array_st,
    res_mipmap_hMipmappedArray : ^mipmappedArray_st,
    res_linear_devPtr : cffi.ulonglong,
    res_linear_format : array_format,
    res_linear_numChannels : cffi.uint,
    res_linear_sizeInBytes : cffi.ulong,
    res_pitch2D_devPtr : cffi.ulonglong,
    res_pitch2D_format : array_format,
    res_pitch2D_numChannels : cffi.uint,
    res_pitch2D_width : cffi.ulong,
    res_pitch2D_height : cffi.ulong,
    res_pitch2D_pitchInBytes : cffi.ulong,
    res_reserved_reserved : [32]cffi.int,
    flags : cffi.uint,
}

/// CUDA_TEXTURE_DESC_st
TEXTURE_DESC_st :: struct #align (4) {
    addressMode : [3]address_mode,
    filterMode : filter_mode,
    flags : cffi.uint,
    maxAnisotropy : cffi.uint,
    mipmapFilterMode : filter_mode,
    mipmapLevelBias : cffi.float,
    minMipmapLevelClamp : cffi.float,
    maxMipmapLevelClamp : cffi.float,
    borderColor : [4]cffi.float,
    reserved : [12]cffi.int,
}

/// CUDA_RESOURCE_VIEW_DESC_st
RESOURCE_VIEW_DESC_st :: struct #align (8) {
    format : resourceViewFormat,
    width : cffi.ulong,
    height : cffi.ulong,
    depth : cffi.ulong,
    firstMipmapLevel : cffi.uint,
    lastMipmapLevel : cffi.uint,
    firstLayer : cffi.uint,
    lastLayer : cffi.uint,
    reserved : [16]cffi.uint,
}

/// CUtensorMap_st
tensorMap_st :: struct #align (64) {
    opaque : [16]cffi.ulonglong,
}

/// CUDA_POINTER_ATTRIBUTE_P2P_TOKENS_st
POINTER_ATTRIBUTE_P2P_TOKENS_st :: struct #align (8) {
    p2pToken : cffi.ulonglong,
    vaSpaceToken : cffi.uint,
}

/// CUDA_LAUNCH_PARAMS_st
LAUNCH_PARAMS_st :: struct #align (8) {
    function : ^func_st,
    gridDimX : cffi.uint,
    gridDimY : cffi.uint,
    gridDimZ : cffi.uint,
    blockDimX : cffi.uint,
    blockDimY : cffi.uint,
    blockDimZ : cffi.uint,
    sharedMemBytes : cffi.uint,
    hStream : ^stream_st,
    kernelParams : ^rawptr,
}

/// CUDA_EXTERNAL_MEMORY_HANDLE_DESC_st
EXTERNAL_MEMORY_HANDLE_DESC_st :: struct #align (8) {
    type : externalMemoryHandleType,
    handle_fd : cffi.int,
    handle_win32_handle : rawptr,
    handle_win32_name : rawptr,
    handle_nvSciBufObject : rawptr,
    size : cffi.ulonglong,
    flags : cffi.uint,
    reserved : [16]cffi.uint,
}

/// CUDA_EXTERNAL_MEMORY_BUFFER_DESC_st
EXTERNAL_MEMORY_BUFFER_DESC_st :: struct #align (8) {
    offset : cffi.ulonglong,
    size : cffi.ulonglong,
    flags : cffi.uint,
    reserved : [16]cffi.uint,
}

/// CUDA_EXTERNAL_MEMORY_MIPMAPPED_ARRAY_DESC_st
EXTERNAL_MEMORY_MIPMAPPED_ARRAY_DESC_st :: struct #align (8) {
    offset : cffi.ulonglong,
    arrayDesc : ARRAY3D_DESCRIPTOR_st,
    numLevels : cffi.uint,
    reserved : [16]cffi.uint,
}

/// CUDA_EXTERNAL_SEMAPHORE_HANDLE_DESC_st
EXTERNAL_SEMAPHORE_HANDLE_DESC_st :: struct #align (8) {
    type : externalSemaphoreHandleType,
    handle_fd : cffi.int,
    handle_win32_handle : rawptr,
    handle_win32_name : rawptr,
    handle_nvSciSyncObj : rawptr,
    flags : cffi.uint,
    reserved : [16]cffi.uint,
}

/// CUDA_EXTERNAL_SEMAPHORE_SIGNAL_PARAMS_st
EXTERNAL_SEMAPHORE_SIGNAL_PARAMS_st :: struct #align (8) {
    params_fence_value : cffi.ulonglong,
    params_nvSciSync_fence : rawptr,
    params_nvSciSync_reserved : cffi.ulonglong,
    params_keyedMutex_key : cffi.ulonglong,
    params_reserved : [12]cffi.uint,
    flags : cffi.uint,
    reserved : [16]cffi.uint,
}

/// CUDA_EXTERNAL_SEMAPHORE_WAIT_PARAMS_st
EXTERNAL_SEMAPHORE_WAIT_PARAMS_st :: struct #align (8) {
    params_fence_value : cffi.ulonglong,
    params_nvSciSync_fence : rawptr,
    params_nvSciSync_reserved : cffi.ulonglong,
    params_keyedMutex_key : cffi.ulonglong,
    params_keyedMutex_timeoutMs : cffi.uint,
    params_reserved : [10]cffi.uint,
    flags : cffi.uint,
    reserved : [16]cffi.uint,
}

/// CUDA_EXT_SEM_SIGNAL_NODE_PARAMS_st
EXT_SEM_SIGNAL_NODE_PARAMS_st :: struct #align (8) {
    extSemArray : ^^extSemaphore_st,
    paramsArray : ^EXTERNAL_SEMAPHORE_SIGNAL_PARAMS_st,
    numExtSems : cffi.uint,
}

/// CUDA_EXT_SEM_SIGNAL_NODE_PARAMS_v2_st
EXT_SEM_SIGNAL_NODE_PARAMS_v2_st :: struct #align (8) {
    extSemArray : ^^extSemaphore_st,
    paramsArray : ^EXTERNAL_SEMAPHORE_SIGNAL_PARAMS_st,
    numExtSems : cffi.uint,
}

/// CUDA_EXT_SEM_WAIT_NODE_PARAMS_st
EXT_SEM_WAIT_NODE_PARAMS_st :: struct #align (8) {
    extSemArray : ^^extSemaphore_st,
    paramsArray : ^EXTERNAL_SEMAPHORE_WAIT_PARAMS_st,
    numExtSems : cffi.uint,
}

/// CUDA_EXT_SEM_WAIT_NODE_PARAMS_v2_st
EXT_SEM_WAIT_NODE_PARAMS_v2_st :: struct #align (8) {
    extSemArray : ^^extSemaphore_st,
    paramsArray : ^EXTERNAL_SEMAPHORE_WAIT_PARAMS_st,
    numExtSems : cffi.uint,
}

/// CUarrayMapInfo_st
arrayMapInfo_st :: struct #align (8) {
    resourceType : resourcetype,
    resource_mipmap : ^mipmappedArray_st,
    resource_array : ^array_st,
    subresourceType : arraySparseSubresourceType,
    subresource_sparseLevel_level : cffi.uint,
    subresource_sparseLevel_layer : cffi.uint,
    subresource_sparseLevel_offsetX : cffi.uint,
    subresource_sparseLevel_offsetY : cffi.uint,
    subresource_sparseLevel_offsetZ : cffi.uint,
    subresource_sparseLevel_extentWidth : cffi.uint,
    subresource_sparseLevel_extentHeight : cffi.uint,
    subresource_sparseLevel_extentDepth : cffi.uint,
    subresource_miptail_layer : cffi.uint,
    subresource_miptail_offset : cffi.ulonglong,
    subresource_miptail_size : cffi.ulonglong,
    memOperationType : memOperationType,
    memHandleType : memHandleType,
    memHandle_memHandle : cffi.ulonglong,
    offset : cffi.ulonglong,
    deviceBitMask : cffi.uint,
    flags : cffi.uint,
    reserved : [2]cffi.uint,
}

/// CUmemLocation_st
memLocation_st :: struct #align (4) {
    type : memLocationType,
    id : cffi.int,
}

/// CUmemAllocationProp_st
memAllocationProp_st :: struct #align (8) {
    type : memAllocationType,
    requestedHandleTypes : memAllocationHandleType,
    location : memLocation_st,
    win32HandleMetaData : rawptr,
    allocFlags_compressionType : cffi.uchar,
    allocFlags_gpuDirectRDMACapable : cffi.uchar,
    allocFlags_usage : cffi.ushort,
    allocFlags_reserved : [4]cffi.uchar,
}

/// CUmulticastObjectProp_st
multicastObjectProp_st :: struct #align (8) {
    numDevices : cffi.uint,
    size : cffi.ulong,
    handleTypes : cffi.ulonglong,
    flags : cffi.ulonglong,
}

/// CUmemAccessDesc_st
memAccessDesc_st :: struct #align (4) {
    location : memLocation_st,
    flags : memAccess_flags,
}

/// CUgraphExecUpdateResultInfo_st
graphExecUpdateResultInfo_st :: struct #align (8) {
    result : graphExecUpdateResult,
    errorNode : ^graphNode_st,
    errorFromNode : ^graphNode_st,
}

/// CUmemPoolProps_st
memPoolProps_st :: struct #align (8) {
    allocType : memAllocationType,
    handleTypes : memAllocationHandleType,
    location : memLocation_st,
    win32SecurityAttributes : rawptr,
    maxSize : cffi.ulong,
    reserved : [56]cffi.uchar,
}

/// CUmemPoolPtrExportData_st
memPoolPtrExportData_st :: struct  {
    reserved : [64]cffi.uchar,
}

/// CUDA_MEM_ALLOC_NODE_PARAMS_v1_st
MEM_ALLOC_NODE_PARAMS_v1_st :: struct #align (8) {
    poolProps : memPoolProps_st,
    accessDescs : ^memAccessDesc_st,
    accessDescCount : cffi.ulong,
    bytesize : cffi.ulong,
    dptr : cffi.ulonglong,
}

/// CUDA_MEM_ALLOC_NODE_PARAMS_v2_st
MEM_ALLOC_NODE_PARAMS_v2_st :: struct #align (8) {
    poolProps : memPoolProps_st,
    accessDescs : ^memAccessDesc_st,
    accessDescCount : cffi.ulong,
    bytesize : cffi.ulong,
    dptr : cffi.ulonglong,
}

/// CUDA_MEM_FREE_NODE_PARAMS_st
MEM_FREE_NODE_PARAMS_st :: struct #align (8) {
    dptr : cffi.ulonglong,
}

/// CUDA_CHILD_GRAPH_NODE_PARAMS_st
CHILD_GRAPH_NODE_PARAMS_st :: struct #align (8) {
    graph : ^graph_st,
}

/// CUDA_EVENT_RECORD_NODE_PARAMS_st
EVENT_RECORD_NODE_PARAMS_st :: struct #align (8) {
    event : ^event_st,
}

/// CUDA_EVENT_WAIT_NODE_PARAMS_st
EVENT_WAIT_NODE_PARAMS_st :: struct #align (8) {
    event : ^event_st,
}

/// CUgraphNodeParams_st
graphNodeParams_st :: struct #align (8) {
    type : graphNodeType,
    reserved0 : [3]cffi.int,
    reserved1 : [29]cffi.longlong,
    kernel : KERNEL_NODE_PARAMS_v3_st,
    memcpy : MEMCPY_NODE_PARAMS_st,
    memset : MEMSET_NODE_PARAMS_v2_st,
    host : HOST_NODE_PARAMS_v2_st,
    graph : CHILD_GRAPH_NODE_PARAMS_st,
    eventWait : EVENT_WAIT_NODE_PARAMS_st,
    eventRecord : EVENT_RECORD_NODE_PARAMS_st,
    extSemSignal : EXT_SEM_SIGNAL_NODE_PARAMS_v2_st,
    extSemWait : EXT_SEM_WAIT_NODE_PARAMS_v2_st,
    alloc : MEM_ALLOC_NODE_PARAMS_v2_st,
    free : MEM_FREE_NODE_PARAMS_st,
    memOp : BATCH_MEM_OP_NODE_PARAMS_v2_st,
    conditional : CONDITIONAL_NODE_PARAMS,
    reserved2 : cffi.longlong,
}

/// CUstreamBatchMemOpParams_union
streamBatchMemOpParams_union :: struct  {
    operation : streamBatchMemOpType,
    waitValue : streamMemOpWaitValueParams_st,
    writeValue : streamMemOpWriteValueParams_st,
    flushRemoteWrites : streamMemOpFlushRemoteWritesParams_st,
    memoryBarrier : streamMemOpMemoryBarrierParams_st,
    pad : [6]cffi.ulonglong,
}

/// CUlaunchAttributeValue_union
launchAttributeValue_union :: struct  {
    pad : [64]cffi.char,
    accessPolicyWindow : accessPolicyWindow_st,
    cooperative : cffi.int,
    syncPolicy : synchronizationPolicy,
    clusterDim_x : cffi.uint,
    clusterDim_y : cffi.uint,
    clusterDim_z : cffi.uint,
    clusterSchedulingPolicyPreference : clusterSchedulingPolicy,
    programmaticStreamSerializationAllowed : cffi.int,
    programmaticEvent_event : ^event_st,
    programmaticEvent_flags : cffi.int,
    programmaticEvent_triggerAtBlockStart : cffi.int,
    launchCompletionEvent_event : ^event_st,
    launchCompletionEvent_flags : cffi.int,
    priority : cffi.int,
    memSyncDomainMap : launchMemSyncDomainMap_st,
    memSyncDomain : launchMemSyncDomain,
}


package cuda

import "base:intrinsics"
import "base:runtime"
import cffi "core:c"

when ODIN_OS == .Linux {
    foreign import lib {
        "system:cudart_static",
    }
}
when ODIN_OS == .Windows {
    foreign import lib {
        "system:cudart_static.lib",
    }
}


dim3 :: distinct [3]u32


foreign lib {
}
@(default_calling_convention="c")
foreign lib {
    @(require_results)
    @(link_name="cudaDeviceReset")
    DeviceReset :: proc() -> Error ---

    @(require_results)
    @(link_name="cudaDeviceSynchronize")
    DeviceSynchronize :: proc() -> Error ---

    @(require_results)
    @(link_name="cudaDeviceSetLimit")
    DeviceSetLimit :: proc(limit: Limit, value: cffi.uint) -> Error ---

    @(require_results)
    @(link_name="cudaDeviceGetLimit")
    DeviceGetLimit :: proc(pValue: ^cffi.ulong, limit: Limit) -> Error ---

    @(require_results)
    @(link_name="cudaDeviceGetTexture1DLinearMaxWidth")
    DeviceGetTexture1DLinearMaxWidth :: proc(maxWidthInElements: ^cffi.ulong, fmtDesc: ^ChannelFormatDesc, device: cffi.int) -> Error ---

    @(require_results)
    @(link_name="cudaDeviceGetCacheConfig")
    DeviceGetCacheConfig :: proc(pCacheConfig: ^FuncCache) -> Error ---

    @(require_results)
    @(link_name="cudaDeviceGetStreamPriorityRange")
    DeviceGetStreamPriorityRange :: proc(leastPriority: ^cffi.int, greatestPriority: ^cffi.int) -> Error ---

    @(require_results)
    @(link_name="cudaDeviceSetCacheConfig")
    DeviceSetCacheConfig :: proc(cacheConfig: FuncCache) -> Error ---

    @(require_results)
    @(link_name="cudaDeviceGetSharedMemConfig")
    DeviceGetSharedMemConfig :: proc(pConfig: ^SharedMemConfig) -> Error ---

    @(require_results)
    @(link_name="cudaDeviceSetSharedMemConfig")
    DeviceSetSharedMemConfig :: proc(config: SharedMemConfig) -> Error ---

    @(require_results)
    @(link_name="cudaDeviceGetByPCIBusId")
    DeviceGetByPCIBusId :: proc(device: ^cffi.int, pciBusId: cstring) -> Error ---

    @(require_results)
    @(link_name="cudaDeviceGetPCIBusId")
    DeviceGetPCIBusId :: proc(pciBusId: cstring, len: cffi.int, device: cffi.int) -> Error ---

    @(require_results)
    @(link_name="cudaIpcGetEventHandle")
    IpcGetEventHandle :: proc(handle: ^IpcEventHandle_st, event: Event_t) -> Error ---

    @(require_results)
    @(link_name="cudaIpcOpenEventHandle")
    IpcOpenEventHandle :: proc(event: ^^event_st, handle: IpcEventHandle_st) -> Error ---

    @(require_results)
    @(link_name="cudaIpcGetMemHandle")
    IpcGetMemHandle :: proc(handle: ^IpcMemHandle_st, devPtr: rawptr) -> Error ---

    @(require_results)
    @(link_name="cudaIpcOpenMemHandle")
    IpcOpenMemHandle :: proc(devPtr: ^rawptr, handle: IpcMemHandle_st, flags: cffi.uint) -> Error ---

    @(require_results)
    @(link_name="cudaIpcCloseMemHandle")
    IpcCloseMemHandle :: proc(devPtr: rawptr) -> Error ---

    @(require_results)
    @(link_name="cudaDeviceFlushGPUDirectRDMAWrites")
    DeviceFlushGPUDirectRDMAWrites :: proc(target: FlushGPUDirectRDMAWritesTarget, scope: FlushGPUDirectRDMAWritesScope) -> Error ---

    @(require_results)
    @(link_name="cudaThreadExit")
    ThreadExit :: proc() -> Error ---

    @(require_results)
    @(link_name="cudaThreadSynchronize")
    ThreadSynchronize :: proc() -> Error ---

    @(require_results)
    @(link_name="cudaThreadSetLimit")
    ThreadSetLimit :: proc(limit: Limit, value: cffi.uint) -> Error ---

    @(require_results)
    @(link_name="cudaThreadGetLimit")
    ThreadGetLimit :: proc(pValue: ^cffi.ulong, limit: Limit) -> Error ---

    @(require_results)
    @(link_name="cudaThreadGetCacheConfig")
    ThreadGetCacheConfig :: proc(pCacheConfig: ^FuncCache) -> Error ---

    @(require_results)
    @(link_name="cudaThreadSetCacheConfig")
    ThreadSetCacheConfig :: proc(cacheConfig: FuncCache) -> Error ---

    @(require_results)
    @(link_name="cudaGetLastError")
    GetLastError :: proc() -> Error ---

    @(require_results)
    @(link_name="cudaPeekAtLastError")
    PeekAtLastError :: proc() -> Error ---

    @(require_results)
    @(link_name="cudaGetErrorName")
    GetErrorName :: proc(error: Error_t) -> cstring ---

    @(require_results)
    @(link_name="cudaGetErrorString")
    GetErrorString :: proc(error: Error_t) -> cstring ---

    @(require_results)
    @(link_name="cudaGetDeviceCount")
    GetDeviceCount :: proc(count: ^cffi.int) -> Error ---

    @(require_results)
    @(link_name="cudaGetDeviceProperties_v2")
    GetDeviceProperties_v2 :: proc(prop: ^DeviceProp, device: cffi.int) -> Error ---

    @(require_results)
    @(link_name="cudaDeviceGetAttribute")
    DeviceGetAttribute :: proc(value: ^cffi.int, attr: DeviceAttr, device: cffi.int) -> Error ---

    @(require_results)
    @(link_name="cudaDeviceGetDefaultMemPool")
    DeviceGetDefaultMemPool :: proc(memPool: ^^memPoolHandle_st, device: cffi.int) -> Error ---

    @(require_results)
    @(link_name="cudaDeviceSetMemPool")
    DeviceSetMemPool :: proc(device: cffi.int, memPool: MemPool_t) -> Error ---

    @(require_results)
    @(link_name="cudaDeviceGetMemPool")
    DeviceGetMemPool :: proc(memPool: ^^memPoolHandle_st, device: cffi.int) -> Error ---

    @(require_results)
    @(link_name="cudaDeviceGetNvSciSyncAttributes")
    DeviceGetNvSciSyncAttributes :: proc(nvSciSyncAttrList: rawptr, device: cffi.int, flags: cffi.int) -> Error ---

    @(require_results)
    @(link_name="cudaDeviceGetP2PAttribute")
    DeviceGetP2PAttribute :: proc(value: ^cffi.int, attr: DeviceP2PAttr, srcDevice: cffi.int, dstDevice: cffi.int) -> Error ---

    @(require_results)
    @(link_name="cudaChooseDevice")
    ChooseDevice :: proc(device: ^cffi.int, prop: ^DeviceProp) -> Error ---

    @(require_results)
    @(link_name="cudaInitDevice")
    InitDevice :: proc(device: cffi.int, deviceFlags: cffi.uint, flags: cffi.uint) -> Error ---

    @(require_results)
    @(link_name="cudaSetDevice")
    SetDevice :: proc(device: cffi.int) -> Error ---

    @(require_results)
    @(link_name="cudaGetDevice")
    GetDevice :: proc(device: ^cffi.int) -> Error ---

    @(require_results)
    @(link_name="cudaSetValidDevices")
    SetValidDevices :: proc(device_arr: ^cffi.int, len: cffi.int) -> Error ---

    @(require_results)
    @(link_name="cudaSetDeviceFlags")
    SetDeviceFlags :: proc(flags: cffi.uint) -> Error ---

    @(require_results)
    @(link_name="cudaGetDeviceFlags")
    GetDeviceFlags :: proc(flags: ^cffi.uint) -> Error ---

    @(require_results)
    @(link_name="cudaStreamCreate")
    StreamCreate :: proc(pStream: ^^stream_st) -> Error ---

    @(require_results)
    @(link_name="cudaStreamCreateWithFlags")
    StreamCreateWithFlags :: proc(pStream: ^^stream_st, flags: cffi.uint) -> Error ---

    @(require_results)
    @(link_name="cudaStreamCreateWithPriority")
    StreamCreateWithPriority :: proc(pStream: ^^stream_st, flags: cffi.uint, priority: cffi.int) -> Error ---

    @(require_results)
    @(link_name="cudaStreamGetPriority")
    StreamGetPriority :: proc(hStream: Stream_t, priority: ^cffi.int) -> Error ---

    @(require_results)
    @(link_name="cudaStreamGetFlags")
    StreamGetFlags :: proc(hStream: Stream_t, flags: ^cffi.uint) -> Error ---

    @(require_results)
    @(link_name="cudaStreamGetId")
    StreamGetId :: proc(hStream: Stream_t, streamId: ^cffi.ulonglong) -> Error ---

    @(require_results)
    @(link_name="cudaCtxResetPersistingL2Cache")
    CtxResetPersistingL2Cache :: proc() -> Error ---

    @(require_results)
    @(link_name="cudaStreamCopyAttributes")
    StreamCopyAttributes :: proc(dst: Stream_t, src: Stream_t) -> Error ---

    @(require_results)
    @(link_name="cudaStreamGetAttribute")
    StreamGetAttribute :: proc(hStream: Stream_t, attr: LaunchAttributeID, value_out: ^LaunchAttributeValue) -> Error ---

    @(require_results)
    @(link_name="cudaStreamSetAttribute")
    StreamSetAttribute :: proc(hStream: Stream_t, attr: LaunchAttributeID, value: ^LaunchAttributeValue) -> Error ---

    @(require_results)
    @(link_name="cudaStreamDestroy")
    StreamDestroy :: proc(stream: Stream_t) -> Error ---

    @(require_results)
    @(link_name="cudaStreamWaitEvent")
    StreamWaitEvent :: proc(stream: Stream_t, event: Event_t, flags: cffi.uint) -> Error ---

    @(require_results)
    @(link_name="cudaStreamAddCallback")
    StreamAddCallback :: proc(stream: Stream_t, callback: StreamCallback_t, userData: rawptr, flags: cffi.uint) -> Error ---

    @(require_results)
    @(link_name="cudaStreamSynchronize")
    StreamSynchronize :: proc(stream: Stream_t) -> Error ---

    @(require_results)
    @(link_name="cudaStreamQuery")
    StreamQuery :: proc(stream: Stream_t) -> Error ---

    @(require_results)
    @(link_name="cudaStreamAttachMemAsync")
    StreamAttachMemAsync :: proc(stream: Stream_t, devPtr: rawptr, length: cffi.uint, flags: cffi.uint) -> Error ---

    @(require_results)
    @(link_name="cudaStreamBeginCapture")
    StreamBeginCapture :: proc(stream: Stream_t, mode: StreamCaptureMode) -> Error ---

    @(require_results)
    @(link_name="cudaStreamBeginCaptureToGraph")
    StreamBeginCaptureToGraph :: proc(stream: Stream_t, graph: Graph_t, dependencies: ^^graphNode_st, dependencyData: ^GraphEdgeData_st, numDependencies: cffi.uint, mode: StreamCaptureMode) -> Error ---

    @(require_results)
    @(link_name="cudaThreadExchangeStreamCaptureMode")
    ThreadExchangeStreamCaptureMode :: proc(mode: ^StreamCaptureMode) -> Error ---

    @(require_results)
    @(link_name="cudaStreamEndCapture")
    StreamEndCapture :: proc(stream: Stream_t, pGraph: ^^graph_st) -> Error ---

    @(require_results)
    @(link_name="cudaStreamIsCapturing")
    StreamIsCapturing :: proc(stream: Stream_t, pCaptureStatus: ^StreamCaptureStatus) -> Error ---

    @(require_results)
    @(link_name="cudaStreamGetCaptureInfo_v2")
    StreamGetCaptureInfo_v2 :: proc(stream: Stream_t, captureStatus_out: ^StreamCaptureStatus, id_out: ^cffi.ulonglong, graph_out: ^^graph_st, dependencies_out: ^^^graphNode_st, numDependencies_out: ^cffi.ulong) -> Error ---

    @(require_results)
    @(link_name="cudaStreamGetCaptureInfo_v3")
    StreamGetCaptureInfo_v3 :: proc(stream: Stream_t, captureStatus_out: ^StreamCaptureStatus, id_out: ^cffi.ulonglong, graph_out: ^^graph_st, dependencies_out: ^^^graphNode_st, edgeData_out: ^^GraphEdgeData_st, numDependencies_out: ^cffi.ulong) -> Error ---

    @(require_results)
    @(link_name="cudaStreamUpdateCaptureDependencies")
    StreamUpdateCaptureDependencies :: proc(stream: Stream_t, dependencies: ^^graphNode_st, numDependencies: cffi.uint, flags: cffi.uint) -> Error ---

    @(require_results)
    @(link_name="cudaStreamUpdateCaptureDependencies_v2")
    StreamUpdateCaptureDependencies_v2 :: proc(stream: Stream_t, dependencies: ^^graphNode_st, dependencyData: ^GraphEdgeData_st, numDependencies: cffi.uint, flags: cffi.uint) -> Error ---

    @(require_results)
    @(link_name="cudaEventCreate")
    EventCreate :: proc(event: ^^event_st) -> Error ---

    @(require_results)
    @(link_name="cudaEventCreateWithFlags")
    EventCreateWithFlags :: proc(event: ^^event_st, flags: cffi.uint) -> Error ---

    @(require_results)
    @(link_name="cudaEventRecord")
    EventRecord :: proc(event: Event_t, stream: Stream_t) -> Error ---

    @(require_results)
    @(link_name="cudaEventRecordWithFlags")
    EventRecordWithFlags :: proc(event: Event_t, stream: Stream_t, flags: cffi.uint) -> Error ---

    @(require_results)
    @(link_name="cudaEventQuery")
    EventQuery :: proc(event: Event_t) -> Error ---

    @(require_results)
    @(link_name="cudaEventSynchronize")
    EventSynchronize :: proc(event: Event_t) -> Error ---

    @(require_results)
    @(link_name="cudaEventDestroy")
    EventDestroy :: proc(event: Event_t) -> Error ---

    @(require_results)
    @(link_name="cudaEventElapsedTime")
    EventElapsedTime :: proc(ms: ^cffi.float, start: Event_t, end: Event_t) -> Error ---

    @(require_results)
    @(link_name="cudaImportExternalMemory")
    ImportExternalMemory :: proc(extMem_out: ^^externalMemory_st, memHandleDesc: ^ExternalMemoryHandleDesc) -> Error ---

    @(require_results)
    @(link_name="cudaExternalMemoryGetMappedBuffer")
    ExternalMemoryGetMappedBuffer :: proc(devPtr: ^rawptr, extMem: ExternalMemory_t, bufferDesc: ^ExternalMemoryBufferDesc) -> Error ---

    @(require_results)
    @(link_name="cudaExternalMemoryGetMappedMipmappedArray")
    ExternalMemoryGetMappedMipmappedArray :: proc(mipmap: ^^MipmappedArray, extMem: ExternalMemory_t, mipmapDesc: ^ExternalMemoryMipmappedArrayDesc) -> Error ---

    @(require_results)
    @(link_name="cudaDestroyExternalMemory")
    DestroyExternalMemory :: proc(extMem: ExternalMemory_t) -> Error ---

    @(require_results)
    @(link_name="cudaImportExternalSemaphore")
    ImportExternalSemaphore :: proc(extSem_out: ^^externalSemaphore_st, semHandleDesc: ^ExternalSemaphoreHandleDesc) -> Error ---

    @(require_results)
    @(link_name="cudaSignalExternalSemaphoresAsync_v2")
    SignalExternalSemaphoresAsync_v2 :: proc(extSemArray: ^^externalSemaphore_st, paramsArray: ^ExternalSemaphoreSignalParams, numExtSems: cffi.uint, stream: Stream_t) -> Error ---

    @(require_results)
    @(link_name="cudaWaitExternalSemaphoresAsync_v2")
    WaitExternalSemaphoresAsync_v2 :: proc(extSemArray: ^^externalSemaphore_st, paramsArray: ^ExternalSemaphoreWaitParams, numExtSems: cffi.uint, stream: Stream_t) -> Error ---

    @(require_results)
    @(link_name="cudaDestroyExternalSemaphore")
    DestroyExternalSemaphore :: proc(extSem: ExternalSemaphore_t) -> Error ---

    @(require_results)
    @(link_name="cudaLaunchKernel")
    LaunchKernel :: proc(func: rawptr, gridDim: dim3, blockDim: dim3, args: ^rawptr, sharedMem: cffi.uint, stream: Stream_t) -> Error ---

    @(require_results)
    @(link_name="cudaLaunchKernelExC")
    LaunchKernelExC :: proc(config: ^LaunchConfig_st, func: rawptr, args: ^rawptr) -> Error ---

    @(require_results)
    @(link_name="cudaLaunchCooperativeKernel")
    LaunchCooperativeKernel :: proc(func: rawptr, gridDim: dim3, blockDim: dim3, args: ^rawptr, sharedMem: cffi.uint, stream: Stream_t) -> Error ---

    @(require_results)
    @(link_name="cudaLaunchCooperativeKernelMultiDevice")
    LaunchCooperativeKernelMultiDevice :: proc(launchParamsList: ^LaunchParams, numDevices: cffi.uint, flags: cffi.uint) -> Error ---

    @(require_results)
    @(link_name="cudaFuncSetCacheConfig")
    FuncSetCacheConfig :: proc(func: rawptr, cacheConfig: FuncCache) -> Error ---

    @(require_results)
    @(link_name="cudaFuncSetSharedMemConfig")
    FuncSetSharedMemConfig :: proc(func: rawptr, config: SharedMemConfig) -> Error ---

    @(require_results)
    @(link_name="cudaFuncGetAttributes")
    FuncGetAttributes :: proc(attr: ^FuncAttributes, func: rawptr) -> Error ---

    @(require_results)
    @(link_name="cudaFuncSetAttribute")
    FuncSetAttribute :: proc(func: rawptr, attr: FuncAttribute, value: cffi.int) -> Error ---

    @(require_results)
    @(link_name="cudaFuncGetName")
    FuncGetName :: proc(name: ^cstring, func: rawptr) -> Error ---

    @(require_results)
    @(link_name="cudaSetDoubleForDevice")
    SetDoubleForDevice :: proc(d: ^cffi.double) -> Error ---

    @(require_results)
    @(link_name="cudaSetDoubleForHost")
    SetDoubleForHost :: proc(d: ^cffi.double) -> Error ---

    @(require_results)
    @(link_name="cudaLaunchHostFunc")
    LaunchHostFunc :: proc(stream: Stream_t, fn: HostFn_t, userData: rawptr) -> Error ---

    @(require_results)
    @(link_name="cudaOccupancyMaxActiveBlocksPerMultiprocessor")
    OccupancyMaxActiveBlocksPerMultiprocessor :: proc(numBlocks: ^cffi.int, func: rawptr, blockSize: cffi.int, dynamicSMemSize: cffi.uint) -> Error ---

    @(require_results)
    @(link_name="cudaOccupancyAvailableDynamicSMemPerBlock")
    OccupancyAvailableDynamicSMemPerBlock :: proc(dynamicSmemSize: ^cffi.ulong, func: rawptr, numBlocks: cffi.int, blockSize: cffi.int) -> Error ---

    @(require_results)
    @(link_name="cudaOccupancyMaxActiveBlocksPerMultiprocessorWithFlags")
    OccupancyMaxActiveBlocksPerMultiprocessorWithFlags :: proc(numBlocks: ^cffi.int, func: rawptr, blockSize: cffi.int, dynamicSMemSize: cffi.uint, flags: cffi.uint) -> Error ---

    @(require_results)
    @(link_name="cudaOccupancyMaxPotentialClusterSize")
    OccupancyMaxPotentialClusterSize :: proc(clusterSize: ^cffi.int, func: rawptr, launchConfig: ^LaunchConfig_st) -> Error ---

    @(require_results)
    @(link_name="cudaOccupancyMaxActiveClusters")
    OccupancyMaxActiveClusters :: proc(numClusters: ^cffi.int, func: rawptr, launchConfig: ^LaunchConfig_st) -> Error ---

    @(require_results)
    @(link_name="cudaMallocManaged")
    MallocManaged :: proc(devPtr: ^rawptr, size: cffi.uint, flags: cffi.uint) -> Error ---

    @(require_results)
    @(link_name="cudaMalloc")
    Malloc :: proc(devPtr: ^rawptr, size: cffi.uint) -> Error ---

    @(require_results)
    @(link_name="cudaMallocHost")
    MallocHost :: proc(ptr: ^rawptr, size: cffi.uint) -> Error ---

    @(require_results)
    @(link_name="cudaMallocPitch")
    MallocPitch :: proc(devPtr: ^rawptr, pitch: ^cffi.ulong, width: cffi.uint, height: cffi.uint) -> Error ---

    @(require_results)
    @(link_name="cudaMallocArray")
    MallocArray :: proc(array: ^^Array, desc: ^ChannelFormatDesc, width: cffi.uint, height: cffi.uint, flags: cffi.uint) -> Error ---

    @(require_results)
    @(link_name="cudaFree")
    Free :: proc(devPtr: rawptr) -> Error ---

    @(require_results)
    @(link_name="cudaFreeHost")
    FreeHost :: proc(ptr: rawptr) -> Error ---

    @(require_results)
    @(link_name="cudaFreeArray")
    FreeArray :: proc(array: Array_t) -> Error ---

    @(require_results)
    @(link_name="cudaFreeMipmappedArray")
    FreeMipmappedArray :: proc(mipmappedArray: MipmappedArray_t) -> Error ---

    @(require_results)
    @(link_name="cudaHostAlloc")
    HostAlloc :: proc(pHost: ^rawptr, size: cffi.uint, flags: cffi.uint) -> Error ---

    @(require_results)
    @(link_name="cudaHostRegister")
    HostRegister :: proc(ptr: rawptr, size: cffi.uint, flags: cffi.uint) -> Error ---

    @(require_results)
    @(link_name="cudaHostUnregister")
    HostUnregister :: proc(ptr: rawptr) -> Error ---

    @(require_results)
    @(link_name="cudaHostGetDevicePointer")
    HostGetDevicePointer :: proc(pDevice: ^rawptr, pHost: rawptr, flags: cffi.uint) -> Error ---

    @(require_results)
    @(link_name="cudaHostGetFlags")
    HostGetFlags :: proc(pFlags: ^cffi.uint, pHost: rawptr) -> Error ---

    @(require_results)
    @(link_name="cudaMalloc3D")
    Malloc3D :: proc(pitchedDevPtr: ^PitchedPtr, extent: Extent) -> Error ---

    @(require_results)
    @(link_name="cudaMalloc3DArray")
    Malloc3DArray :: proc(array: ^^Array, desc: ^ChannelFormatDesc, extent: Extent, flags: cffi.uint) -> Error ---

    @(require_results)
    @(link_name="cudaMallocMipmappedArray")
    MallocMipmappedArray :: proc(mipmappedArray: ^^MipmappedArray, desc: ^ChannelFormatDesc, extent: Extent, numLevels: cffi.uint, flags: cffi.uint) -> Error ---

    @(require_results)
    @(link_name="cudaGetMipmappedArrayLevel")
    GetMipmappedArrayLevel :: proc(levelArray: ^^Array, mipmappedArray: MipmappedArray_const_t, level: cffi.uint) -> Error ---

    @(require_results)
    @(link_name="cudaMemcpy3D")
    Memcpy3D :: proc(p: ^Memcpy3DParms) -> Error ---

    @(require_results)
    @(link_name="cudaMemcpy3DPeer")
    Memcpy3DPeer :: proc(p: ^Memcpy3DPeerParms) -> Error ---

    @(require_results)
    @(link_name="cudaMemcpy3DAsync")
    Memcpy3DAsync :: proc(p: ^Memcpy3DParms, stream: Stream_t) -> Error ---

    @(require_results)
    @(link_name="cudaMemcpy3DPeerAsync")
    Memcpy3DPeerAsync :: proc(p: ^Memcpy3DPeerParms, stream: Stream_t) -> Error ---

    @(require_results)
    @(link_name="cudaMemGetInfo")
    MemGetInfo :: proc(free: ^cffi.ulong, total: ^cffi.ulong) -> Error ---

    @(require_results)
    @(link_name="cudaArrayGetInfo")
    ArrayGetInfo :: proc(desc: ^ChannelFormatDesc, extent: ^Extent, flags: ^cffi.uint, array: Array_t) -> Error ---

    @(require_results)
    @(link_name="cudaArrayGetPlane")
    ArrayGetPlane :: proc(pPlaneArray: ^^Array, hArray: Array_t, planeIdx: cffi.uint) -> Error ---

    @(require_results)
    @(link_name="cudaArrayGetMemoryRequirements")
    ArrayGetMemoryRequirements :: proc(memoryRequirements: ^ArrayMemoryRequirements, array: Array_t, device: cffi.int) -> Error ---

    @(require_results)
    @(link_name="cudaMipmappedArrayGetMemoryRequirements")
    MipmappedArrayGetMemoryRequirements :: proc(memoryRequirements: ^ArrayMemoryRequirements, mipmap: MipmappedArray_t, device: cffi.int) -> Error ---

    @(require_results)
    @(link_name="cudaArrayGetSparseProperties")
    ArrayGetSparseProperties :: proc(sparseProperties: ^ArraySparseProperties, array: Array_t) -> Error ---

    @(require_results)
    @(link_name="cudaMipmappedArrayGetSparseProperties")
    MipmappedArrayGetSparseProperties :: proc(sparseProperties: ^ArraySparseProperties, mipmap: MipmappedArray_t) -> Error ---

    @(require_results)
    @(link_name="cudaMemcpy")
    Memcpy :: proc(dst: rawptr, src: rawptr, count: cffi.uint, kind: MemcpyKind) -> Error ---

    @(require_results)
    @(link_name="cudaMemcpyPeer")
    MemcpyPeer :: proc(dst: rawptr, dstDevice: cffi.int, src: rawptr, srcDevice: cffi.int, count: cffi.uint) -> Error ---

    @(require_results)
    @(link_name="cudaMemcpy2D")
    Memcpy2D :: proc(dst: rawptr, dpitch: cffi.uint, src: rawptr, spitch: cffi.uint, width: cffi.uint, height: cffi.uint, kind: MemcpyKind) -> Error ---

    @(require_results)
    @(link_name="cudaMemcpy2DToArray")
    Memcpy2DToArray :: proc(dst: Array_t, wOffset: cffi.uint, hOffset: cffi.uint, src: rawptr, spitch: cffi.uint, width: cffi.uint, height: cffi.uint, kind: MemcpyKind) -> Error ---

    @(require_results)
    @(link_name="cudaMemcpy2DFromArray")
    Memcpy2DFromArray :: proc(dst: rawptr, dpitch: cffi.uint, src: Array_const_t, wOffset: cffi.uint, hOffset: cffi.uint, width: cffi.uint, height: cffi.uint, kind: MemcpyKind) -> Error ---

    @(require_results)
    @(link_name="cudaMemcpy2DArrayToArray")
    Memcpy2DArrayToArray :: proc(dst: Array_t, wOffsetDst: cffi.uint, hOffsetDst: cffi.uint, src: Array_const_t, wOffsetSrc: cffi.uint, hOffsetSrc: cffi.uint, width: cffi.uint, height: cffi.uint, kind: MemcpyKind) -> Error ---

    @(require_results)
    @(link_name="cudaMemcpyToSymbol")
    MemcpyToSymbol :: proc(symbol: rawptr, src: rawptr, count: cffi.uint, offset: cffi.uint, kind: MemcpyKind) -> Error ---

    @(require_results)
    @(link_name="cudaMemcpyFromSymbol")
    MemcpyFromSymbol :: proc(dst: rawptr, symbol: rawptr, count: cffi.uint, offset: cffi.uint, kind: MemcpyKind) -> Error ---

    @(require_results)
    @(link_name="cudaMemcpyAsync")
    MemcpyAsync :: proc(dst: rawptr, src: rawptr, count: cffi.uint, kind: MemcpyKind, stream: Stream_t) -> Error ---

    @(require_results)
    @(link_name="cudaMemcpyPeerAsync")
    MemcpyPeerAsync :: proc(dst: rawptr, dstDevice: cffi.int, src: rawptr, srcDevice: cffi.int, count: cffi.uint, stream: Stream_t) -> Error ---

    @(require_results)
    @(link_name="cudaMemcpy2DAsync")
    Memcpy2DAsync :: proc(dst: rawptr, dpitch: cffi.uint, src: rawptr, spitch: cffi.uint, width: cffi.uint, height: cffi.uint, kind: MemcpyKind, stream: Stream_t) -> Error ---

    @(require_results)
    @(link_name="cudaMemcpy2DToArrayAsync")
    Memcpy2DToArrayAsync :: proc(dst: Array_t, wOffset: cffi.uint, hOffset: cffi.uint, src: rawptr, spitch: cffi.uint, width: cffi.uint, height: cffi.uint, kind: MemcpyKind, stream: Stream_t) -> Error ---

    @(require_results)
    @(link_name="cudaMemcpy2DFromArrayAsync")
    Memcpy2DFromArrayAsync :: proc(dst: rawptr, dpitch: cffi.uint, src: Array_const_t, wOffset: cffi.uint, hOffset: cffi.uint, width: cffi.uint, height: cffi.uint, kind: MemcpyKind, stream: Stream_t) -> Error ---

    @(require_results)
    @(link_name="cudaMemcpyToSymbolAsync")
    MemcpyToSymbolAsync :: proc(symbol: rawptr, src: rawptr, count: cffi.uint, offset: cffi.uint, kind: MemcpyKind, stream: Stream_t) -> Error ---

    @(require_results)
    @(link_name="cudaMemcpyFromSymbolAsync")
    MemcpyFromSymbolAsync :: proc(dst: rawptr, symbol: rawptr, count: cffi.uint, offset: cffi.uint, kind: MemcpyKind, stream: Stream_t) -> Error ---

    @(require_results)
    @(link_name="cudaMemset")
    Memset :: proc(devPtr: rawptr, value: cffi.int, count: cffi.uint) -> Error ---

    @(require_results)
    @(link_name="cudaMemset2D")
    Memset2D :: proc(devPtr: rawptr, pitch: cffi.uint, value: cffi.int, width: cffi.uint, height: cffi.uint) -> Error ---

    @(require_results)
    @(link_name="cudaMemset3D")
    Memset3D :: proc(pitchedDevPtr: PitchedPtr, value: cffi.int, extent: Extent) -> Error ---

    @(require_results)
    @(link_name="cudaMemsetAsync")
    MemsetAsync :: proc(devPtr: rawptr, value: cffi.int, count: cffi.uint, stream: Stream_t) -> Error ---

    @(require_results)
    @(link_name="cudaMemset2DAsync")
    Memset2DAsync :: proc(devPtr: rawptr, pitch: cffi.uint, value: cffi.int, width: cffi.uint, height: cffi.uint, stream: Stream_t) -> Error ---

    @(require_results)
    @(link_name="cudaMemset3DAsync")
    Memset3DAsync :: proc(pitchedDevPtr: PitchedPtr, value: cffi.int, extent: Extent, stream: Stream_t) -> Error ---

    @(require_results)
    @(link_name="cudaGetSymbolAddress")
    GetSymbolAddress :: proc(devPtr: ^rawptr, symbol: rawptr) -> Error ---

    @(require_results)
    @(link_name="cudaGetSymbolSize")
    GetSymbolSize :: proc(size: ^cffi.ulong, symbol: rawptr) -> Error ---

    @(require_results)
    @(link_name="cudaMemPrefetchAsync")
    MemPrefetchAsync :: proc(devPtr: rawptr, count: cffi.uint, dstDevice: cffi.int, stream: Stream_t) -> Error ---

    @(require_results)
    @(link_name="cudaMemPrefetchAsync_v2")
    MemPrefetchAsync_v2 :: proc(devPtr: rawptr, count: cffi.uint, location: MemLocation, flags: cffi.uint, stream: Stream_t) -> Error ---

    @(require_results)
    @(link_name="cudaMemAdvise")
    MemAdvise :: proc(devPtr: rawptr, count: cffi.uint, advice: MemoryAdvise, device: cffi.int) -> Error ---

    @(require_results)
    @(link_name="cudaMemAdvise_v2")
    MemAdvise_v2 :: proc(devPtr: rawptr, count: cffi.uint, advice: MemoryAdvise, location: MemLocation) -> Error ---

    @(require_results)
    @(link_name="cudaMemRangeGetAttribute")
    MemRangeGetAttribute :: proc(data: rawptr, dataSize: cffi.uint, attribute: MemRangeAttribute, devPtr: rawptr, count: cffi.uint) -> Error ---

    @(require_results)
    @(link_name="cudaMemRangeGetAttributes")
    MemRangeGetAttributes :: proc(data: ^rawptr, dataSizes: ^cffi.ulong, attributes: ^MemRangeAttribute, numAttributes: cffi.uint, devPtr: rawptr, count: cffi.uint) -> Error ---

    @(require_results)
    @(link_name="cudaMemcpyToArray")
    MemcpyToArray :: proc(dst: Array_t, wOffset: cffi.uint, hOffset: cffi.uint, src: rawptr, count: cffi.uint, kind: MemcpyKind) -> Error ---

    @(require_results)
    @(link_name="cudaMemcpyFromArray")
    MemcpyFromArray :: proc(dst: rawptr, src: Array_const_t, wOffset: cffi.uint, hOffset: cffi.uint, count: cffi.uint, kind: MemcpyKind) -> Error ---

    @(require_results)
    @(link_name="cudaMemcpyArrayToArray")
    MemcpyArrayToArray :: proc(dst: Array_t, wOffsetDst: cffi.uint, hOffsetDst: cffi.uint, src: Array_const_t, wOffsetSrc: cffi.uint, hOffsetSrc: cffi.uint, count: cffi.uint, kind: MemcpyKind) -> Error ---

    @(require_results)
    @(link_name="cudaMemcpyToArrayAsync")
    MemcpyToArrayAsync :: proc(dst: Array_t, wOffset: cffi.uint, hOffset: cffi.uint, src: rawptr, count: cffi.uint, kind: MemcpyKind, stream: Stream_t) -> Error ---

    @(require_results)
    @(link_name="cudaMemcpyFromArrayAsync")
    MemcpyFromArrayAsync :: proc(dst: rawptr, src: Array_const_t, wOffset: cffi.uint, hOffset: cffi.uint, count: cffi.uint, kind: MemcpyKind, stream: Stream_t) -> Error ---

    @(require_results)
    @(link_name="cudaMallocAsync")
    MallocAsync :: proc(devPtr: ^rawptr, size: cffi.uint, hStream: Stream_t) -> Error ---

    @(require_results)
    @(link_name="cudaFreeAsync")
    FreeAsync :: proc(devPtr: rawptr, hStream: Stream_t) -> Error ---

    @(require_results)
    @(link_name="cudaMemPoolTrimTo")
    MemPoolTrimTo :: proc(memPool: MemPool_t, minBytesToKeep: cffi.uint) -> Error ---

    @(require_results)
    @(link_name="cudaMemPoolSetAttribute")
    MemPoolSetAttribute :: proc(memPool: MemPool_t, attr: MemPoolAttr, value: rawptr) -> Error ---

    @(require_results)
    @(link_name="cudaMemPoolGetAttribute")
    MemPoolGetAttribute :: proc(memPool: MemPool_t, attr: MemPoolAttr, value: rawptr) -> Error ---

    @(require_results)
    @(link_name="cudaMemPoolSetAccess")
    MemPoolSetAccess :: proc(memPool: MemPool_t, descList: ^MemAccessDesc, count: cffi.uint) -> Error ---

    @(require_results)
    @(link_name="cudaMemPoolGetAccess")
    MemPoolGetAccess :: proc(flags: ^MemAccessFlags, memPool: MemPool_t, location: ^MemLocation) -> Error ---

    @(require_results)
    @(link_name="cudaMemPoolCreate")
    MemPoolCreate :: proc(memPool: ^^memPoolHandle_st, poolProps: ^MemPoolProps) -> Error ---

    @(require_results)
    @(link_name="cudaMemPoolDestroy")
    MemPoolDestroy :: proc(memPool: MemPool_t) -> Error ---

    @(require_results)
    @(link_name="cudaMallocFromPoolAsync")
    MallocFromPoolAsync :: proc(ptr: ^rawptr, size: cffi.uint, memPool: MemPool_t, stream: Stream_t) -> Error ---

    @(require_results)
    @(link_name="cudaMemPoolExportToShareableHandle")
    MemPoolExportToShareableHandle :: proc(shareableHandle: rawptr, memPool: MemPool_t, handleType: MemAllocationHandleType, flags: cffi.uint) -> Error ---

    @(require_results)
    @(link_name="cudaMemPoolImportFromShareableHandle")
    MemPoolImportFromShareableHandle :: proc(memPool: ^^memPoolHandle_st, shareableHandle: rawptr, handleType: MemAllocationHandleType, flags: cffi.uint) -> Error ---

    @(require_results)
    @(link_name="cudaMemPoolExportPointer")
    MemPoolExportPointer :: proc(exportData: ^MemPoolPtrExportData, ptr: rawptr) -> Error ---

    @(require_results)
    @(link_name="cudaMemPoolImportPointer")
    MemPoolImportPointer :: proc(ptr: ^rawptr, memPool: MemPool_t, exportData: ^MemPoolPtrExportData) -> Error ---

    @(require_results)
    @(link_name="cudaPointerGetAttributes")
    PointerGetAttributes :: proc(attributes: ^PointerAttributes, ptr: rawptr) -> Error ---

    @(require_results)
    @(link_name="cudaDeviceCanAccessPeer")
    DeviceCanAccessPeer :: proc(canAccessPeer: ^cffi.int, device: cffi.int, peerDevice: cffi.int) -> Error ---

    @(require_results)
    @(link_name="cudaDeviceEnablePeerAccess")
    DeviceEnablePeerAccess :: proc(peerDevice: cffi.int, flags: cffi.uint) -> Error ---

    @(require_results)
    @(link_name="cudaDeviceDisablePeerAccess")
    DeviceDisablePeerAccess :: proc(peerDevice: cffi.int) -> Error ---

    @(require_results)
    @(link_name="cudaGraphicsUnregisterResource")
    GraphicsUnregisterResource :: proc(resource: GraphicsResource_t) -> Error ---

    @(require_results)
    @(link_name="cudaGraphicsResourceSetMapFlags")
    GraphicsResourceSetMapFlags :: proc(resource: GraphicsResource_t, flags: cffi.uint) -> Error ---

    @(require_results)
    @(link_name="cudaGraphicsMapResources")
    GraphicsMapResources :: proc(count: cffi.int, resources: ^^GraphicsResource, stream: Stream_t) -> Error ---

    @(require_results)
    @(link_name="cudaGraphicsUnmapResources")
    GraphicsUnmapResources :: proc(count: cffi.int, resources: ^^GraphicsResource, stream: Stream_t) -> Error ---

    @(require_results)
    @(link_name="cudaGraphicsResourceGetMappedPointer")
    GraphicsResourceGetMappedPointer :: proc(devPtr: ^rawptr, size: ^cffi.ulong, resource: GraphicsResource_t) -> Error ---

    @(require_results)
    @(link_name="cudaGraphicsSubResourceGetMappedArray")
    GraphicsSubResourceGetMappedArray :: proc(array: ^^Array, resource: GraphicsResource_t, arrayIndex: cffi.uint, mipLevel: cffi.uint) -> Error ---

    @(require_results)
    @(link_name="cudaGraphicsResourceGetMappedMipmappedArray")
    GraphicsResourceGetMappedMipmappedArray :: proc(mipmappedArray: ^^MipmappedArray, resource: GraphicsResource_t) -> Error ---

    @(require_results)
    @(link_name="cudaGetChannelDesc")
    GetChannelDesc :: proc(desc: ^ChannelFormatDesc, array: Array_const_t) -> Error ---

    @(require_results)
    @(link_name="cudaCreateChannelDesc")
    CreateChannelDesc :: proc(x: cffi.int, y: cffi.int, z: cffi.int, w: cffi.int, f: ChannelFormatKind) -> ChannelFormatDesc ---

    @(require_results)
    @(link_name="cudaCreateTextureObject")
    CreateTextureObject :: proc(pTexObject: ^cffi.ulonglong, pResDesc: ^ResourceDesc, pTexDesc: ^TextureDesc, pResViewDesc: ^ResourceViewDesc) -> Error ---

    @(require_results)
    @(link_name="cudaDestroyTextureObject")
    DestroyTextureObject :: proc(texObject: TextureObject_t) -> Error ---

    @(require_results)
    @(link_name="cudaGetTextureObjectResourceDesc")
    GetTextureObjectResourceDesc :: proc(pResDesc: ^ResourceDesc, texObject: TextureObject_t) -> Error ---

    @(require_results)
    @(link_name="cudaGetTextureObjectTextureDesc")
    GetTextureObjectTextureDesc :: proc(pTexDesc: ^TextureDesc, texObject: TextureObject_t) -> Error ---

    @(require_results)
    @(link_name="cudaGetTextureObjectResourceViewDesc")
    GetTextureObjectResourceViewDesc :: proc(pResViewDesc: ^ResourceViewDesc, texObject: TextureObject_t) -> Error ---

    @(require_results)
    @(link_name="cudaCreateSurfaceObject")
    CreateSurfaceObject :: proc(pSurfObject: ^cffi.ulonglong, pResDesc: ^ResourceDesc) -> Error ---

    @(require_results)
    @(link_name="cudaDestroySurfaceObject")
    DestroySurfaceObject :: proc(surfObject: SurfaceObject_t) -> Error ---

    @(require_results)
    @(link_name="cudaGetSurfaceObjectResourceDesc")
    GetSurfaceObjectResourceDesc :: proc(pResDesc: ^ResourceDesc, surfObject: SurfaceObject_t) -> Error ---

    @(require_results)
    @(link_name="cudaDriverGetVersion")
    DriverGetVersion :: proc(driverVersion: ^cffi.int) -> Error ---

    @(require_results)
    @(link_name="cudaRuntimeGetVersion")
    RuntimeGetVersion :: proc(runtimeVersion: ^cffi.int) -> Error ---

    @(require_results)
    @(link_name="cudaGraphCreate")
    GraphCreate :: proc(pGraph: ^^graph_st, flags: cffi.uint) -> Error ---

    @(require_results)
    @(link_name="cudaGraphAddKernelNode")
    GraphAddKernelNode :: proc(pGraphNode: ^^graphNode_st, graph: Graph_t, pDependencies: ^^graphNode_st, numDependencies: cffi.uint, pNodeParams: ^KernelNodeParams) -> Error ---

    @(require_results)
    @(link_name="cudaGraphKernelNodeGetParams")
    GraphKernelNodeGetParams :: proc(node: GraphNode_t, pNodeParams: ^KernelNodeParams) -> Error ---

    @(require_results)
    @(link_name="cudaGraphKernelNodeSetParams")
    GraphKernelNodeSetParams :: proc(node: GraphNode_t, pNodeParams: ^KernelNodeParams) -> Error ---

    @(require_results)
    @(link_name="cudaGraphKernelNodeCopyAttributes")
    GraphKernelNodeCopyAttributes :: proc(hSrc: GraphNode_t, hDst: GraphNode_t) -> Error ---

    @(require_results)
    @(link_name="cudaGraphKernelNodeGetAttribute")
    GraphKernelNodeGetAttribute :: proc(hNode: GraphNode_t, attr: LaunchAttributeID, value_out: ^LaunchAttributeValue) -> Error ---

    @(require_results)
    @(link_name="cudaGraphKernelNodeSetAttribute")
    GraphKernelNodeSetAttribute :: proc(hNode: GraphNode_t, attr: LaunchAttributeID, value: ^LaunchAttributeValue) -> Error ---

    @(require_results)
    @(link_name="cudaGraphAddMemcpyNode")
    GraphAddMemcpyNode :: proc(pGraphNode: ^^graphNode_st, graph: Graph_t, pDependencies: ^^graphNode_st, numDependencies: cffi.uint, pCopyParams: ^Memcpy3DParms) -> Error ---

    @(require_results)
    @(link_name="cudaGraphAddMemcpyNodeToSymbol")
    GraphAddMemcpyNodeToSymbol :: proc(pGraphNode: ^^graphNode_st, graph: Graph_t, pDependencies: ^^graphNode_st, numDependencies: cffi.uint, symbol: rawptr, src: rawptr, count: cffi.uint, offset: cffi.uint, kind: MemcpyKind) -> Error ---

    @(require_results)
    @(link_name="cudaGraphAddMemcpyNodeFromSymbol")
    GraphAddMemcpyNodeFromSymbol :: proc(pGraphNode: ^^graphNode_st, graph: Graph_t, pDependencies: ^^graphNode_st, numDependencies: cffi.uint, dst: rawptr, symbol: rawptr, count: cffi.uint, offset: cffi.uint, kind: MemcpyKind) -> Error ---

    @(require_results)
    @(link_name="cudaGraphAddMemcpyNode1D")
    GraphAddMemcpyNode1D :: proc(pGraphNode: ^^graphNode_st, graph: Graph_t, pDependencies: ^^graphNode_st, numDependencies: cffi.uint, dst: rawptr, src: rawptr, count: cffi.uint, kind: MemcpyKind) -> Error ---

    @(require_results)
    @(link_name="cudaGraphMemcpyNodeGetParams")
    GraphMemcpyNodeGetParams :: proc(node: GraphNode_t, pNodeParams: ^Memcpy3DParms) -> Error ---

    @(require_results)
    @(link_name="cudaGraphMemcpyNodeSetParams")
    GraphMemcpyNodeSetParams :: proc(node: GraphNode_t, pNodeParams: ^Memcpy3DParms) -> Error ---

    @(require_results)
    @(link_name="cudaGraphMemcpyNodeSetParamsToSymbol")
    GraphMemcpyNodeSetParamsToSymbol :: proc(node: GraphNode_t, symbol: rawptr, src: rawptr, count: cffi.uint, offset: cffi.uint, kind: MemcpyKind) -> Error ---

    @(require_results)
    @(link_name="cudaGraphMemcpyNodeSetParamsFromSymbol")
    GraphMemcpyNodeSetParamsFromSymbol :: proc(node: GraphNode_t, dst: rawptr, symbol: rawptr, count: cffi.uint, offset: cffi.uint, kind: MemcpyKind) -> Error ---

    @(require_results)
    @(link_name="cudaGraphMemcpyNodeSetParams1D")
    GraphMemcpyNodeSetParams1D :: proc(node: GraphNode_t, dst: rawptr, src: rawptr, count: cffi.uint, kind: MemcpyKind) -> Error ---

    @(require_results)
    @(link_name="cudaGraphAddMemsetNode")
    GraphAddMemsetNode :: proc(pGraphNode: ^^graphNode_st, graph: Graph_t, pDependencies: ^^graphNode_st, numDependencies: cffi.uint, pMemsetParams: ^MemsetParams) -> Error ---

    @(require_results)
    @(link_name="cudaGraphMemsetNodeGetParams")
    GraphMemsetNodeGetParams :: proc(node: GraphNode_t, pNodeParams: ^MemsetParams) -> Error ---

    @(require_results)
    @(link_name="cudaGraphMemsetNodeSetParams")
    GraphMemsetNodeSetParams :: proc(node: GraphNode_t, pNodeParams: ^MemsetParams) -> Error ---

    @(require_results)
    @(link_name="cudaGraphAddHostNode")
    GraphAddHostNode :: proc(pGraphNode: ^^graphNode_st, graph: Graph_t, pDependencies: ^^graphNode_st, numDependencies: cffi.uint, pNodeParams: ^HostNodeParams) -> Error ---

    @(require_results)
    @(link_name="cudaGraphHostNodeGetParams")
    GraphHostNodeGetParams :: proc(node: GraphNode_t, pNodeParams: ^HostNodeParams) -> Error ---

    @(require_results)
    @(link_name="cudaGraphHostNodeSetParams")
    GraphHostNodeSetParams :: proc(node: GraphNode_t, pNodeParams: ^HostNodeParams) -> Error ---

    @(require_results)
    @(link_name="cudaGraphAddChildGraphNode")
    GraphAddChildGraphNode :: proc(pGraphNode: ^^graphNode_st, graph: Graph_t, pDependencies: ^^graphNode_st, numDependencies: cffi.uint, childGraph: Graph_t) -> Error ---

    @(require_results)
    @(link_name="cudaGraphChildGraphNodeGetGraph")
    GraphChildGraphNodeGetGraph :: proc(node: GraphNode_t, pGraph: ^^graph_st) -> Error ---

    @(require_results)
    @(link_name="cudaGraphAddEmptyNode")
    GraphAddEmptyNode :: proc(pGraphNode: ^^graphNode_st, graph: Graph_t, pDependencies: ^^graphNode_st, numDependencies: cffi.uint) -> Error ---

    @(require_results)
    @(link_name="cudaGraphAddEventRecordNode")
    GraphAddEventRecordNode :: proc(pGraphNode: ^^graphNode_st, graph: Graph_t, pDependencies: ^^graphNode_st, numDependencies: cffi.uint, event: Event_t) -> Error ---

    @(require_results)
    @(link_name="cudaGraphEventRecordNodeGetEvent")
    GraphEventRecordNodeGetEvent :: proc(node: GraphNode_t, event_out: ^^event_st) -> Error ---

    @(require_results)
    @(link_name="cudaGraphEventRecordNodeSetEvent")
    GraphEventRecordNodeSetEvent :: proc(node: GraphNode_t, event: Event_t) -> Error ---

    @(require_results)
    @(link_name="cudaGraphAddEventWaitNode")
    GraphAddEventWaitNode :: proc(pGraphNode: ^^graphNode_st, graph: Graph_t, pDependencies: ^^graphNode_st, numDependencies: cffi.uint, event: Event_t) -> Error ---

    @(require_results)
    @(link_name="cudaGraphEventWaitNodeGetEvent")
    GraphEventWaitNodeGetEvent :: proc(node: GraphNode_t, event_out: ^^event_st) -> Error ---

    @(require_results)
    @(link_name="cudaGraphEventWaitNodeSetEvent")
    GraphEventWaitNodeSetEvent :: proc(node: GraphNode_t, event: Event_t) -> Error ---

    @(require_results)
    @(link_name="cudaGraphAddExternalSemaphoresSignalNode")
    GraphAddExternalSemaphoresSignalNode :: proc(pGraphNode: ^^graphNode_st, graph: Graph_t, pDependencies: ^^graphNode_st, numDependencies: cffi.uint, nodeParams: ^ExternalSemaphoreSignalNodeParams) -> Error ---

    @(require_results)
    @(link_name="cudaGraphExternalSemaphoresSignalNodeGetParams")
    GraphExternalSemaphoresSignalNodeGetParams :: proc(hNode: GraphNode_t, params_out: ^ExternalSemaphoreSignalNodeParams) -> Error ---

    @(require_results)
    @(link_name="cudaGraphExternalSemaphoresSignalNodeSetParams")
    GraphExternalSemaphoresSignalNodeSetParams :: proc(hNode: GraphNode_t, nodeParams: ^ExternalSemaphoreSignalNodeParams) -> Error ---

    @(require_results)
    @(link_name="cudaGraphAddExternalSemaphoresWaitNode")
    GraphAddExternalSemaphoresWaitNode :: proc(pGraphNode: ^^graphNode_st, graph: Graph_t, pDependencies: ^^graphNode_st, numDependencies: cffi.uint, nodeParams: ^ExternalSemaphoreWaitNodeParams) -> Error ---

    @(require_results)
    @(link_name="cudaGraphExternalSemaphoresWaitNodeGetParams")
    GraphExternalSemaphoresWaitNodeGetParams :: proc(hNode: GraphNode_t, params_out: ^ExternalSemaphoreWaitNodeParams) -> Error ---

    @(require_results)
    @(link_name="cudaGraphExternalSemaphoresWaitNodeSetParams")
    GraphExternalSemaphoresWaitNodeSetParams :: proc(hNode: GraphNode_t, nodeParams: ^ExternalSemaphoreWaitNodeParams) -> Error ---

    @(require_results)
    @(link_name="cudaGraphAddMemAllocNode")
    GraphAddMemAllocNode :: proc(pGraphNode: ^^graphNode_st, graph: Graph_t, pDependencies: ^^graphNode_st, numDependencies: cffi.uint, nodeParams: ^MemAllocNodeParams) -> Error ---

    @(require_results)
    @(link_name="cudaGraphMemAllocNodeGetParams")
    GraphMemAllocNodeGetParams :: proc(node: GraphNode_t, params_out: ^MemAllocNodeParams) -> Error ---

    @(require_results)
    @(link_name="cudaGraphAddMemFreeNode")
    GraphAddMemFreeNode :: proc(pGraphNode: ^^graphNode_st, graph: Graph_t, pDependencies: ^^graphNode_st, numDependencies: cffi.uint, dptr: rawptr) -> Error ---

    @(require_results)
    @(link_name="cudaGraphMemFreeNodeGetParams")
    GraphMemFreeNodeGetParams :: proc(node: GraphNode_t, dptr_out: rawptr) -> Error ---

    @(require_results)
    @(link_name="cudaDeviceGraphMemTrim")
    DeviceGraphMemTrim :: proc(device: cffi.int) -> Error ---

    @(require_results)
    @(link_name="cudaDeviceGetGraphMemAttribute")
    DeviceGetGraphMemAttribute :: proc(device: cffi.int, attr: GraphMemAttributeType, value: rawptr) -> Error ---

    @(require_results)
    @(link_name="cudaDeviceSetGraphMemAttribute")
    DeviceSetGraphMemAttribute :: proc(device: cffi.int, attr: GraphMemAttributeType, value: rawptr) -> Error ---

    @(require_results)
    @(link_name="cudaGraphClone")
    GraphClone :: proc(pGraphClone: ^^graph_st, originalGraph: Graph_t) -> Error ---

    @(require_results)
    @(link_name="cudaGraphNodeFindInClone")
    GraphNodeFindInClone :: proc(pNode: ^^graphNode_st, originalNode: GraphNode_t, clonedGraph: Graph_t) -> Error ---

    @(require_results)
    @(link_name="cudaGraphNodeGetType")
    GraphNodeGetType :: proc(node: GraphNode_t, pType: ^GraphNodeType) -> Error ---

    @(require_results)
    @(link_name="cudaGraphGetNodes")
    GraphGetNodes :: proc(graph: Graph_t, nodes: ^^graphNode_st, numNodes: ^cffi.ulong) -> Error ---

    @(require_results)
    @(link_name="cudaGraphGetRootNodes")
    GraphGetRootNodes :: proc(graph: Graph_t, pRootNodes: ^^graphNode_st, pNumRootNodes: ^cffi.ulong) -> Error ---

    @(require_results)
    @(link_name="cudaGraphGetEdges")
    GraphGetEdges :: proc(graph: Graph_t, from: ^^graphNode_st, to: ^^graphNode_st, numEdges: ^cffi.ulong) -> Error ---

    @(require_results)
    @(link_name="cudaGraphGetEdges_v2")
    GraphGetEdges_v2 :: proc(graph: Graph_t, from: ^^graphNode_st, to: ^^graphNode_st, edgeData: ^GraphEdgeData_st, numEdges: ^cffi.ulong) -> Error ---

    @(require_results)
    @(link_name="cudaGraphNodeGetDependencies")
    GraphNodeGetDependencies :: proc(node: GraphNode_t, pDependencies: ^^graphNode_st, pNumDependencies: ^cffi.ulong) -> Error ---

    @(require_results)
    @(link_name="cudaGraphNodeGetDependencies_v2")
    GraphNodeGetDependencies_v2 :: proc(node: GraphNode_t, pDependencies: ^^graphNode_st, edgeData: ^GraphEdgeData_st, pNumDependencies: ^cffi.ulong) -> Error ---

    @(require_results)
    @(link_name="cudaGraphNodeGetDependentNodes")
    GraphNodeGetDependentNodes :: proc(node: GraphNode_t, pDependentNodes: ^^graphNode_st, pNumDependentNodes: ^cffi.ulong) -> Error ---

    @(require_results)
    @(link_name="cudaGraphNodeGetDependentNodes_v2")
    GraphNodeGetDependentNodes_v2 :: proc(node: GraphNode_t, pDependentNodes: ^^graphNode_st, edgeData: ^GraphEdgeData_st, pNumDependentNodes: ^cffi.ulong) -> Error ---

    @(require_results)
    @(link_name="cudaGraphAddDependencies")
    GraphAddDependencies :: proc(graph: Graph_t, from: ^^graphNode_st, to: ^^graphNode_st, numDependencies: cffi.uint) -> Error ---

    @(require_results)
    @(link_name="cudaGraphAddDependencies_v2")
    GraphAddDependencies_v2 :: proc(graph: Graph_t, from: ^^graphNode_st, to: ^^graphNode_st, edgeData: ^GraphEdgeData_st, numDependencies: cffi.uint) -> Error ---

    @(require_results)
    @(link_name="cudaGraphRemoveDependencies")
    GraphRemoveDependencies :: proc(graph: Graph_t, from: ^^graphNode_st, to: ^^graphNode_st, numDependencies: cffi.uint) -> Error ---

    @(require_results)
    @(link_name="cudaGraphRemoveDependencies_v2")
    GraphRemoveDependencies_v2 :: proc(graph: Graph_t, from: ^^graphNode_st, to: ^^graphNode_st, edgeData: ^GraphEdgeData_st, numDependencies: cffi.uint) -> Error ---

    @(require_results)
    @(link_name="cudaGraphDestroyNode")
    GraphDestroyNode :: proc(node: GraphNode_t) -> Error ---

    @(require_results)
    @(link_name="cudaGraphInstantiate")
    GraphInstantiate :: proc(pGraphExec: ^^graphExec_st, graph: Graph_t, flags: cffi.ulonglong) -> Error ---

    @(require_results)
    @(link_name="cudaGraphInstantiateWithFlags")
    GraphInstantiateWithFlags :: proc(pGraphExec: ^^graphExec_st, graph: Graph_t, flags: cffi.ulonglong) -> Error ---

    @(require_results)
    @(link_name="cudaGraphInstantiateWithParams")
    GraphInstantiateWithParams :: proc(pGraphExec: ^^graphExec_st, graph: Graph_t, instantiateParams: ^GraphInstantiateParams_st) -> Error ---

    @(require_results)
    @(link_name="cudaGraphExecGetFlags")
    GraphExecGetFlags :: proc(graphExec: GraphExec_t, flags: ^cffi.ulonglong) -> Error ---

    @(require_results)
    @(link_name="cudaGraphExecKernelNodeSetParams")
    GraphExecKernelNodeSetParams :: proc(hGraphExec: GraphExec_t, node: GraphNode_t, pNodeParams: ^KernelNodeParams) -> Error ---

    @(require_results)
    @(link_name="cudaGraphExecMemcpyNodeSetParams")
    GraphExecMemcpyNodeSetParams :: proc(hGraphExec: GraphExec_t, node: GraphNode_t, pNodeParams: ^Memcpy3DParms) -> Error ---

    @(require_results)
    @(link_name="cudaGraphExecMemcpyNodeSetParamsToSymbol")
    GraphExecMemcpyNodeSetParamsToSymbol :: proc(hGraphExec: GraphExec_t, node: GraphNode_t, symbol: rawptr, src: rawptr, count: cffi.uint, offset: cffi.uint, kind: MemcpyKind) -> Error ---

    @(require_results)
    @(link_name="cudaGraphExecMemcpyNodeSetParamsFromSymbol")
    GraphExecMemcpyNodeSetParamsFromSymbol :: proc(hGraphExec: GraphExec_t, node: GraphNode_t, dst: rawptr, symbol: rawptr, count: cffi.uint, offset: cffi.uint, kind: MemcpyKind) -> Error ---

    @(require_results)
    @(link_name="cudaGraphExecMemcpyNodeSetParams1D")
    GraphExecMemcpyNodeSetParams1D :: proc(hGraphExec: GraphExec_t, node: GraphNode_t, dst: rawptr, src: rawptr, count: cffi.uint, kind: MemcpyKind) -> Error ---

    @(require_results)
    @(link_name="cudaGraphExecMemsetNodeSetParams")
    GraphExecMemsetNodeSetParams :: proc(hGraphExec: GraphExec_t, node: GraphNode_t, pNodeParams: ^MemsetParams) -> Error ---

    @(require_results)
    @(link_name="cudaGraphExecHostNodeSetParams")
    GraphExecHostNodeSetParams :: proc(hGraphExec: GraphExec_t, node: GraphNode_t, pNodeParams: ^HostNodeParams) -> Error ---

    @(require_results)
    @(link_name="cudaGraphExecChildGraphNodeSetParams")
    GraphExecChildGraphNodeSetParams :: proc(hGraphExec: GraphExec_t, node: GraphNode_t, childGraph: Graph_t) -> Error ---

    @(require_results)
    @(link_name="cudaGraphExecEventRecordNodeSetEvent")
    GraphExecEventRecordNodeSetEvent :: proc(hGraphExec: GraphExec_t, hNode: GraphNode_t, event: Event_t) -> Error ---

    @(require_results)
    @(link_name="cudaGraphExecEventWaitNodeSetEvent")
    GraphExecEventWaitNodeSetEvent :: proc(hGraphExec: GraphExec_t, hNode: GraphNode_t, event: Event_t) -> Error ---

    @(require_results)
    @(link_name="cudaGraphExecExternalSemaphoresSignalNodeSetParams")
    GraphExecExternalSemaphoresSignalNodeSetParams :: proc(hGraphExec: GraphExec_t, hNode: GraphNode_t, nodeParams: ^ExternalSemaphoreSignalNodeParams) -> Error ---

    @(require_results)
    @(link_name="cudaGraphExecExternalSemaphoresWaitNodeSetParams")
    GraphExecExternalSemaphoresWaitNodeSetParams :: proc(hGraphExec: GraphExec_t, hNode: GraphNode_t, nodeParams: ^ExternalSemaphoreWaitNodeParams) -> Error ---

    @(require_results)
    @(link_name="cudaGraphNodeSetEnabled")
    GraphNodeSetEnabled :: proc(hGraphExec: GraphExec_t, hNode: GraphNode_t, isEnabled: cffi.uint) -> Error ---

    @(require_results)
    @(link_name="cudaGraphNodeGetEnabled")
    GraphNodeGetEnabled :: proc(hGraphExec: GraphExec_t, hNode: GraphNode_t, isEnabled: ^cffi.uint) -> Error ---

    @(require_results)
    @(link_name="cudaGraphExecUpdate")
    GraphExecUpdate :: proc(hGraphExec: GraphExec_t, hGraph: Graph_t, resultInfo: ^GraphExecUpdateResultInfo_st) -> Error ---

    @(require_results)
    @(link_name="cudaGraphUpload")
    GraphUpload :: proc(graphExec: GraphExec_t, stream: Stream_t) -> Error ---

    @(require_results)
    @(link_name="cudaGraphLaunch")
    GraphLaunch :: proc(graphExec: GraphExec_t, stream: Stream_t) -> Error ---

    @(require_results)
    @(link_name="cudaGraphExecDestroy")
    GraphExecDestroy :: proc(graphExec: GraphExec_t) -> Error ---

    @(require_results)
    @(link_name="cudaGraphDestroy")
    GraphDestroy :: proc(graph: Graph_t) -> Error ---

    @(require_results)
    @(link_name="cudaGraphDebugDotPrint")
    GraphDebugDotPrint :: proc(graph: Graph_t, path: cstring, flags: cffi.uint) -> Error ---

    @(require_results)
    @(link_name="cudaUserObjectCreate")
    UserObjectCreate :: proc(object_out: ^^userObject_st, ptr: rawptr, destroy: HostFn_t, initialRefcount: cffi.uint, flags: cffi.uint) -> Error ---

    @(require_results)
    @(link_name="cudaUserObjectRetain")
    UserObjectRetain :: proc(object: UserObject_t, count: cffi.uint) -> Error ---

    @(require_results)
    @(link_name="cudaUserObjectRelease")
    UserObjectRelease :: proc(object: UserObject_t, count: cffi.uint) -> Error ---

    @(require_results)
    @(link_name="cudaGraphRetainUserObject")
    GraphRetainUserObject :: proc(graph: Graph_t, object: UserObject_t, count: cffi.uint, flags: cffi.uint) -> Error ---

    @(require_results)
    @(link_name="cudaGraphReleaseUserObject")
    GraphReleaseUserObject :: proc(graph: Graph_t, object: UserObject_t, count: cffi.uint) -> Error ---

    @(require_results)
    @(link_name="cudaGraphAddNode")
    GraphAddNode :: proc(pGraphNode: ^^graphNode_st, graph: Graph_t, pDependencies: ^^graphNode_st, numDependencies: cffi.uint, nodeParams: ^GraphNodeParams) -> Error ---

    @(require_results)
    @(link_name="cudaGraphAddNode_v2")
    GraphAddNode_v2 :: proc(pGraphNode: ^^graphNode_st, graph: Graph_t, pDependencies: ^^graphNode_st, dependencyData: ^GraphEdgeData_st, numDependencies: cffi.uint, nodeParams: ^GraphNodeParams) -> Error ---

    @(require_results)
    @(link_name="cudaGraphNodeSetParams")
    GraphNodeSetParams :: proc(node: GraphNode_t, nodeParams: ^GraphNodeParams) -> Error ---

    @(require_results)
    @(link_name="cudaGraphExecNodeSetParams")
    GraphExecNodeSetParams :: proc(graphExec: GraphExec_t, node: GraphNode_t, nodeParams: ^GraphNodeParams) -> Error ---

    @(require_results)
    @(link_name="cudaGraphConditionalHandleCreate")
    GraphConditionalHandleCreate :: proc(pHandle_out: ^cffi.ulonglong, graph: Graph_t, defaultLaunchValue: cffi.uint, flags: cffi.uint) -> Error ---

    @(require_results)
    @(link_name="cudaGetDriverEntryPoint")
    GetDriverEntryPoint :: proc(symbol: cstring, funcPtr: ^rawptr, flags: cffi.ulonglong, driverStatus: ^DriverEntryPointQueryResult) -> Error ---

    @(require_results)
    @(link_name="cudaGetExportTable")
    GetExportTable :: proc(ppExportTable: ^rawptr, pExportTableId: ^uuid_st) -> Error ---

    @(require_results)
    @(link_name="cudaGetFuncBySymbol")
    GetFuncBySymbol :: proc(functionPtr: ^^func_st, symbolPtr: rawptr) -> Error ---

    @(require_results)
    @(link_name="cudaGetKernel")
    GetKernel :: proc(kernelPtr: ^^kern_st, entryFuncAddr: rawptr) -> Error ---

}

/// cudaArray_t
Array_t :: distinct ^Array

/// cudaArray_const_t
Array_const_t :: distinct ^Array

/// cudaMipmappedArray_t
MipmappedArray_t :: distinct ^MipmappedArray

/// cudaMipmappedArray_const_t
MipmappedArray_const_t :: distinct ^MipmappedArray

/// cudaHostFn_t
HostFn_t :: distinct proc "c" (userData: rawptr)

/// CUuuid
uuid :: distinct uuid_st

/// cudaUUID_t
UUID_t :: distinct uuid_st

/// cudaIpcEventHandle_t
IpcEventHandle_t :: distinct IpcEventHandle_st

/// cudaIpcMemHandle_t
IpcMemHandle_t :: distinct IpcMemHandle_st

/// cudaMemFabricHandle_t
MemFabricHandle_t :: distinct MemFabricHandle_st

/// cudaError_t
Error_t :: distinct Error

/// cudaStream_t
Stream_t :: distinct ^stream_st

/// cudaEvent_t
Event_t :: distinct ^event_st

/// cudaGraphicsResource_t
GraphicsResource_t :: distinct ^GraphicsResource

/// cudaExternalMemory_t
ExternalMemory_t :: distinct ^externalMemory_st

/// cudaExternalSemaphore_t
ExternalSemaphore_t :: distinct ^externalSemaphore_st

/// cudaGraph_t
Graph_t :: distinct ^graph_st

/// cudaGraphNode_t
GraphNode_t :: distinct ^graphNode_st

/// cudaUserObject_t
UserObject_t :: distinct ^userObject_st

/// cudaGraphConditionalHandle
GraphConditionalHandle :: distinct cffi.ulonglong

/// cudaFunction_t
Function_t :: distinct ^func_st

/// cudaKernel_t
Kernel_t :: distinct ^kern_st

/// cudaMemPool_t
MemPool_t :: distinct ^memPoolHandle_st

/// cudaGraphEdgeData
GraphEdgeData :: distinct GraphEdgeData_st

/// cudaGraphExec_t
GraphExec_t :: distinct ^graphExec_st

/// cudaGraphInstantiateParams
GraphInstantiateParams :: distinct GraphInstantiateParams_st

/// cudaGraphExecUpdateResultInfo
GraphExecUpdateResultInfo :: distinct GraphExecUpdateResultInfo_st

/// cudaLaunchMemSyncDomainMap
LaunchMemSyncDomainMap :: distinct LaunchMemSyncDomainMap_st

/// cudaLaunchAttribute
LaunchAttribute :: distinct LaunchAttribute_st

/// cudaLaunchConfig_t
LaunchConfig_t :: distinct LaunchConfig_st

/// cudaSurfaceObject_t
SurfaceObject_t :: distinct cffi.ulonglong

/// cudaTextureObject_t
TextureObject_t :: distinct cffi.ulonglong

/// cudaStreamCallback_t
StreamCallback_t :: distinct proc "c" (stream: ^stream_st, status: Error, userData: rawptr)

/// cudaGraphDependencyType
GraphDependencyType :: enum cffi.uint {
    Default = 0,
    Programmatic = 1,
}

/// cudaGraphInstantiateResult
GraphInstantiateResult :: enum cffi.uint {
    Success = 0,
    Error = 1,
    InvalidStructure = 2,
    NodeOperationNotSupported = 3,
    MultipleDevicesNotSupported = 4,
}

/// cudaLaunchMemSyncDomain
LaunchMemSyncDomain :: enum cffi.uint {
    Default = 0,
    Remote = 1,
}

/// cudaLaunchAttributeID
LaunchAttributeID :: enum cffi.uint {
    Ignore = 0,
    AccessPolicyWindow = 1,
    Cooperative = 2,
    SynchronizationPolicy = 3,
    ClusterDimension = 4,
    ClusterSchedulingPolicyPreference = 5,
    ProgrammaticStreamSerialization = 6,
    ProgrammaticEvent = 7,
    Priority = 8,
    MemSyncDomainMap = 9,
    MemSyncDomain = 10,
    LaunchCompletionEvent = 12,
}

/// cudaRoundMode
RoundMode :: enum cffi.uint {
    Nearest = 0,
    Zero = 1,
    PosInf = 2,
    MinInf = 3,
}

/// cudaError
Error :: enum cffi.uint {
    Success = 0,
    InvalidValue = 1,
    MemoryAllocation = 2,
    InitializationError = 3,
    CudartUnloading = 4,
    ProfilerDisabled = 5,
    ProfilerNotInitialized = 6,
    ProfilerAlreadyStarted = 7,
    ProfilerAlreadyStopped = 8,
    InvalidConfiguration = 9,
    InvalidPitchValue = 12,
    InvalidSymbol = 13,
    InvalidHostPointer = 16,
    InvalidDevicePointer = 17,
    InvalidTexture = 18,
    InvalidTextureBinding = 19,
    InvalidChannelDescriptor = 20,
    InvalidMemcpyDirection = 21,
    AddressOfConstant = 22,
    TextureFetchFailed = 23,
    TextureNotBound = 24,
    SynchronizationError = 25,
    InvalidFilterSetting = 26,
    InvalidNormSetting = 27,
    MixedDeviceExecution = 28,
    NotYetImplemented = 31,
    MemoryValueTooLarge = 32,
    StubLibrary = 34,
    InsufficientDriver = 35,
    CallRequiresNewerDriver = 36,
    InvalidSurface = 37,
    DuplicateVariableName = 43,
    DuplicateTextureName = 44,
    DuplicateSurfaceName = 45,
    DevicesUnavailable = 46,
    IncompatibleDriverContext = 49,
    MissingConfiguration = 52,
    PriorLaunchFailure = 53,
    LaunchMaxDepthExceeded = 65,
    LaunchFileScopedTex = 66,
    LaunchFileScopedSurf = 67,
    SyncDepthExceeded = 68,
    LaunchPendingCountExceeded = 69,
    InvalidDeviceFunction = 98,
    NoDevice = 100,
    InvalidDevice = 101,
    DeviceNotLicensed = 102,
    SoftwareValidityNotEstablished = 103,
    StartupFailure = 127,
    InvalidKernelImage = 200,
    DeviceUninitialized = 201,
    MapBufferObjectFailed = 205,
    UnmapBufferObjectFailed = 206,
    ArrayIsMapped = 207,
    AlreadyMapped = 208,
    NoKernelImageForDevice = 209,
    AlreadyAcquired = 210,
    NotMapped = 211,
    NotMappedAsArray = 212,
    NotMappedAsPointer = 213,
    ECCUncorrectable = 214,
    UnsupportedLimit = 215,
    DeviceAlreadyInUse = 216,
    PeerAccessUnsupported = 217,
    InvalidPtx = 218,
    InvalidGraphicsContext = 219,
    NvlinkUncorrectable = 220,
    JitCompilerNotFound = 221,
    UnsupportedPtxVersion = 222,
    JitCompilationDisabled = 223,
    UnsupportedExecAffinity = 224,
    UnsupportedDevSideSync = 225,
    InvalidSource = 300,
    FileNotFound = 301,
    SharedObjectSymbolNotFound = 302,
    SharedObjectInitFailed = 303,
    OperatingSystem = 304,
    InvalidResourceHandle = 400,
    IllegalState = 401,
    LossyQuery = 402,
    SymbolNotFound = 500,
    NotReady = 600,
    IllegalAddress = 700,
    LaunchOutOfResources = 701,
    LaunchTimeout = 702,
    LaunchIncompatibleTexturing = 703,
    PeerAccessAlreadyEnabled = 704,
    PeerAccessNotEnabled = 705,
    SetOnActiveProcess = 708,
    ContextIsDestroyed = 709,
    Assert = 710,
    TooManyPeers = 711,
    HostMemoryAlreadyRegistered = 712,
    HostMemoryNotRegistered = 713,
    HardwareStackError = 714,
    IllegalInstruction = 715,
    MisalignedAddress = 716,
    InvalidAddressSpace = 717,
    InvalidPc = 718,
    LaunchFailure = 719,
    CooperativeLaunchTooLarge = 720,
    NotPermitted = 800,
    NotSupported = 801,
    SystemNotReady = 802,
    SystemDriverMismatch = 803,
    CompatNotSupportedOnDevice = 804,
    MpsConnectionFailed = 805,
    MpsRpcFailure = 806,
    MpsServerNotReady = 807,
    MpsMaxClientsReached = 808,
    MpsMaxConnectionsReached = 809,
    MpsClientTerminated = 810,
    CdpNotSupported = 811,
    CdpVersionMismatch = 812,
    StreamCaptureUnsupported = 900,
    StreamCaptureInvalidated = 901,
    StreamCaptureMerge = 902,
    StreamCaptureUnmatched = 903,
    StreamCaptureUnjoined = 904,
    StreamCaptureIsolation = 905,
    StreamCaptureImplicit = 906,
    CapturedEvent = 907,
    StreamCaptureWrongThread = 908,
    Timeout = 909,
    GraphExecUpdateFailure = 910,
    ExternalDevice = 911,
    InvalidClusterSize = 912,
    Unknown = 999,
    ApiFailureBase = 10000,
}

/// cudaChannelFormatKind
ChannelFormatKind :: enum cffi.uint {
    Signed = 0,
    Unsigned = 1,
    Float = 2,
    None = 3,
    NV12 = 4,
    UnsignedNormalized8X1 = 5,
    UnsignedNormalized8X2 = 6,
    UnsignedNormalized8X4 = 7,
    UnsignedNormalized16X1 = 8,
    UnsignedNormalized16X2 = 9,
    UnsignedNormalized16X4 = 10,
    SignedNormalized8X1 = 11,
    SignedNormalized8X2 = 12,
    SignedNormalized8X4 = 13,
    SignedNormalized16X1 = 14,
    SignedNormalized16X2 = 15,
    SignedNormalized16X4 = 16,
    UnsignedBlockCompressed1 = 17,
    UnsignedBlockCompressed1SRGB = 18,
    UnsignedBlockCompressed2 = 19,
    UnsignedBlockCompressed2SRGB = 20,
    UnsignedBlockCompressed3 = 21,
    UnsignedBlockCompressed3SRGB = 22,
    UnsignedBlockCompressed4 = 23,
    SignedBlockCompressed4 = 24,
    UnsignedBlockCompressed5 = 25,
    SignedBlockCompressed5 = 26,
    UnsignedBlockCompressed6H = 27,
    SignedBlockCompressed6H = 28,
    UnsignedBlockCompressed7 = 29,
    UnsignedBlockCompressed7SRGB = 30,
}

/// cudaMemoryType
MemoryType :: enum cffi.uint {
    Unregistered = 0,
    Host = 1,
    Device = 2,
    Managed = 3,
}

/// cudaMemcpyKind
MemcpyKind :: enum cffi.uint {
    HostToHost = 0,
    HostToDevice = 1,
    DeviceToHost = 2,
    DeviceToDevice = 3,
    Default = 4,
}

/// cudaAccessProperty
AccessProperty :: enum cffi.uint {
    Normal = 0,
    Streaming = 1,
    Persisting = 2,
}

/// cudaStreamCaptureStatus
StreamCaptureStatus :: enum cffi.uint {
    None = 0,
    Active = 1,
    Invalidated = 2,
}

/// cudaStreamCaptureMode
StreamCaptureMode :: enum cffi.uint {
    Global = 0,
    ThreadLocal = 1,
    Relaxed = 2,
}

/// cudaSynchronizationPolicy
SynchronizationPolicy :: enum cffi.uint {
    SyncPolicyAuto = 1,
    SyncPolicySpin = 2,
    SyncPolicyYield = 3,
    SyncPolicyBlockingSync = 4,
}

/// cudaClusterSchedulingPolicy
ClusterSchedulingPolicy :: enum cffi.uint {
    Default = 0,
    Spread = 1,
    LoadBalancing = 2,
}

/// cudaStreamUpdateCaptureDependenciesFlags
StreamUpdateCaptureDependenciesFlags :: enum cffi.uint {
    AddCaptureDependencies = 0,
    SetCaptureDependencies = 0,
}
StreamUpdateCaptureDependenciesFlagsSet :: bit_set[StreamUpdateCaptureDependenciesFlags; cffi.uint]

/// cudaUserObjectFlags
UserObjectFlags :: enum cffi.uint {
    NoDestructorSync = 0,
}
UserObjectFlagsSet :: bit_set[UserObjectFlags; cffi.uint]

/// cudaUserObjectRetainFlags
UserObjectRetainFlags :: enum cffi.uint {
    GraphUserObjectMove = 0,
}
UserObjectRetainFlagsSet :: bit_set[UserObjectRetainFlags; cffi.uint]

/// cudaGraphicsRegisterFlags
GraphicsRegisterFlags :: enum cffi.uint {
    None = 0,
    ReadOnly = 0,
    WriteDiscard = 1,
    SurfaceLoadStore = 2,
    TextureGather = 3,
}
GraphicsRegisterFlagsSet :: bit_set[GraphicsRegisterFlags; cffi.uint]

/// cudaGraphicsMapFlags
GraphicsMapFlags :: enum cffi.uint {
    None = 0,
    ReadOnly = 0,
    WriteDiscard = 1,
}
GraphicsMapFlagsSet :: bit_set[GraphicsMapFlags; cffi.uint]

/// cudaGraphicsCubeFace
GraphicsCubeFace :: enum cffi.uint {
    PositiveX = 0,
    NegativeX = 1,
    PositiveY = 2,
    NegativeY = 3,
    PositiveZ = 4,
    NegativeZ = 5,
}

/// cudaResourceType
ResourceType :: enum cffi.uint {
    Array = 0,
    MipmappedArray = 1,
    Linear = 2,
    Pitch2D = 3,
}

/// cudaResourceViewFormat
ResourceViewFormat :: enum cffi.uint {
    ResViewFormatNone = 0,
    ResViewFormatUnsignedChar1 = 1,
    ResViewFormatUnsignedChar2 = 2,
    ResViewFormatUnsignedChar4 = 3,
    ResViewFormatSignedChar1 = 4,
    ResViewFormatSignedChar2 = 5,
    ResViewFormatSignedChar4 = 6,
    ResViewFormatUnsignedShort1 = 7,
    ResViewFormatUnsignedShort2 = 8,
    ResViewFormatUnsignedShort4 = 9,
    ResViewFormatSignedShort1 = 10,
    ResViewFormatSignedShort2 = 11,
    ResViewFormatSignedShort4 = 12,
    ResViewFormatUnsignedInt1 = 13,
    ResViewFormatUnsignedInt2 = 14,
    ResViewFormatUnsignedInt4 = 15,
    ResViewFormatSignedInt1 = 16,
    ResViewFormatSignedInt2 = 17,
    ResViewFormatSignedInt4 = 18,
    ResViewFormatHalf1 = 19,
    ResViewFormatHalf2 = 20,
    ResViewFormatHalf4 = 21,
    ResViewFormatFloat1 = 22,
    ResViewFormatFloat2 = 23,
    ResViewFormatFloat4 = 24,
    ResViewFormatUnsignedBlockCompressed1 = 25,
    ResViewFormatUnsignedBlockCompressed2 = 26,
    ResViewFormatUnsignedBlockCompressed3 = 27,
    ResViewFormatUnsignedBlockCompressed4 = 28,
    ResViewFormatSignedBlockCompressed4 = 29,
    ResViewFormatUnsignedBlockCompressed5 = 30,
    ResViewFormatSignedBlockCompressed5 = 31,
    ResViewFormatUnsignedBlockCompressed6H = 32,
    ResViewFormatSignedBlockCompressed6H = 33,
    ResViewFormatUnsignedBlockCompressed7 = 34,
}

/// cudaFuncAttribute
FuncAttribute :: enum cffi.uint {
    MaxDynamicSharedMemorySize = 8,
    PreferredSharedMemoryCarveout = 9,
    ClusterDimMustBeSet = 10,
    RequiredClusterWidth = 11,
    RequiredClusterHeight = 12,
    RequiredClusterDepth = 13,
    NonPortableClusterSizeAllowed = 14,
    ClusterSchedulingPolicyPreference = 15,
    Max = 16,
}

/// cudaFuncCache
FuncCache :: enum cffi.uint {
    PreferNone = 0,
    PreferShared = 1,
    PreferL1 = 2,
    PreferEqual = 3,
}

/// cudaSharedMemConfig
SharedMemConfig :: enum cffi.uint {
    BankSizeDefault = 0,
    BankSizeFourByte = 1,
    BankSizeEightByte = 2,
}

/// cudaSharedCarveout
SharedCarveout :: enum cffi.int {
    memCarveoutDefault = -1,
    memCarveoutMaxShared = 100,
    memCarveoutMaxL1 = 0,
}

/// cudaComputeMode
ComputeMode :: enum cffi.uint {
    Default = 0,
    Exclusive = 1,
    Prohibited = 2,
    ExclusiveProcess = 3,
}

/// cudaLimit
Limit :: enum cffi.uint {
    StackSize = 0,
    PrintfFifoSize = 1,
    MallocHeapSize = 2,
    DevRuntimeSyncDepth = 3,
    DevRuntimePendingLaunchCount = 4,
    MaxL2FetchGranularity = 5,
    PersistingL2CacheSize = 6,
}

/// cudaMemoryAdvise
MemoryAdvise :: enum cffi.uint {
    MemAdviseSetReadMostly = 1,
    MemAdviseUnsetReadMostly = 2,
    MemAdviseSetPreferredLocation = 3,
    MemAdviseUnsetPreferredLocation = 4,
    MemAdviseSetAccessedBy = 5,
    MemAdviseUnsetAccessedBy = 6,
}

/// cudaMemRangeAttribute
MemRangeAttribute :: enum cffi.uint {
    ReadMostly = 1,
    PreferredLocation = 2,
    AccessedBy = 3,
    LastPrefetchLocation = 4,
    PreferredLocationType = 5,
    PreferredLocationId = 6,
    LastPrefetchLocationType = 7,
    LastPrefetchLocationId = 8,
}

/// cudaFlushGPUDirectRDMAWritesOptions
FlushGPUDirectRDMAWritesOptions :: enum cffi.uint {
    OptionHost = 1,
    OptionMemOps = 2,
}

/// cudaGPUDirectRDMAWritesOrdering
GPUDirectRDMAWritesOrdering :: enum cffi.uint {
    None = 0,
    Owner = 100,
    AllDevices = 200,
}

/// cudaFlushGPUDirectRDMAWritesScope
FlushGPUDirectRDMAWritesScope :: enum cffi.uint {
    ToOwner = 100,
    ToAllDevices = 200,
}

/// cudaFlushGPUDirectRDMAWritesTarget
FlushGPUDirectRDMAWritesTarget :: enum cffi.uint {
    CurrentDevice = 0,
}

/// cudaDeviceAttr
DeviceAttr :: enum cffi.uint {
    DevAttrMaxThreadsPerBlock = 1,
    DevAttrMaxBlockDimX = 2,
    DevAttrMaxBlockDimY = 3,
    DevAttrMaxBlockDimZ = 4,
    DevAttrMaxGridDimX = 5,
    DevAttrMaxGridDimY = 6,
    DevAttrMaxGridDimZ = 7,
    DevAttrMaxSharedMemoryPerBlock = 8,
    DevAttrTotalConstantMemory = 9,
    DevAttrWarpSize = 10,
    DevAttrMaxPitch = 11,
    DevAttrMaxRegistersPerBlock = 12,
    DevAttrClockRate = 13,
    DevAttrTextureAlignment = 14,
    DevAttrGpuOverlap = 15,
    DevAttrMultiProcessorCount = 16,
    DevAttrKernelExecTimeout = 17,
    DevAttrIntegrated = 18,
    DevAttrCanMapHostMemory = 19,
    DevAttrComputeMode = 20,
    DevAttrMaxTexture1DWidth = 21,
    DevAttrMaxTexture2DWidth = 22,
    DevAttrMaxTexture2DHeight = 23,
    DevAttrMaxTexture3DWidth = 24,
    DevAttrMaxTexture3DHeight = 25,
    DevAttrMaxTexture3DDepth = 26,
    DevAttrMaxTexture2DLayeredWidth = 27,
    DevAttrMaxTexture2DLayeredHeight = 28,
    DevAttrMaxTexture2DLayeredLayers = 29,
    DevAttrSurfaceAlignment = 30,
    DevAttrConcurrentKernels = 31,
    DevAttrEccEnabled = 32,
    DevAttrPciBusId = 33,
    DevAttrPciDeviceId = 34,
    DevAttrTccDriver = 35,
    DevAttrMemoryClockRate = 36,
    DevAttrGlobalMemoryBusWidth = 37,
    DevAttrL2CacheSize = 38,
    DevAttrMaxThreadsPerMultiProcessor = 39,
    DevAttrAsyncEngineCount = 40,
    DevAttrUnifiedAddressing = 41,
    DevAttrMaxTexture1DLayeredWidth = 42,
    DevAttrMaxTexture1DLayeredLayers = 43,
    DevAttrMaxTexture2DGatherWidth = 45,
    DevAttrMaxTexture2DGatherHeight = 46,
    DevAttrMaxTexture3DWidthAlt = 47,
    DevAttrMaxTexture3DHeightAlt = 48,
    DevAttrMaxTexture3DDepthAlt = 49,
    DevAttrPciDomainId = 50,
    DevAttrTexturePitchAlignment = 51,
    DevAttrMaxTextureCubemapWidth = 52,
    DevAttrMaxTextureCubemapLayeredWidth = 53,
    DevAttrMaxTextureCubemapLayeredLayers = 54,
    DevAttrMaxSurface1DWidth = 55,
    DevAttrMaxSurface2DWidth = 56,
    DevAttrMaxSurface2DHeight = 57,
    DevAttrMaxSurface3DWidth = 58,
    DevAttrMaxSurface3DHeight = 59,
    DevAttrMaxSurface3DDepth = 60,
    DevAttrMaxSurface1DLayeredWidth = 61,
    DevAttrMaxSurface1DLayeredLayers = 62,
    DevAttrMaxSurface2DLayeredWidth = 63,
    DevAttrMaxSurface2DLayeredHeight = 64,
    DevAttrMaxSurface2DLayeredLayers = 65,
    DevAttrMaxSurfaceCubemapWidth = 66,
    DevAttrMaxSurfaceCubemapLayeredWidth = 67,
    DevAttrMaxSurfaceCubemapLayeredLayers = 68,
    DevAttrMaxTexture1DLinearWidth = 69,
    DevAttrMaxTexture2DLinearWidth = 70,
    DevAttrMaxTexture2DLinearHeight = 71,
    DevAttrMaxTexture2DLinearPitch = 72,
    DevAttrMaxTexture2DMipmappedWidth = 73,
    DevAttrMaxTexture2DMipmappedHeight = 74,
    DevAttrComputeCapabilityMajor = 75,
    DevAttrComputeCapabilityMinor = 76,
    DevAttrMaxTexture1DMipmappedWidth = 77,
    DevAttrStreamPrioritiesSupported = 78,
    DevAttrGlobalL1CacheSupported = 79,
    DevAttrLocalL1CacheSupported = 80,
    DevAttrMaxSharedMemoryPerMultiprocessor = 81,
    DevAttrMaxRegistersPerMultiprocessor = 82,
    DevAttrManagedMemory = 83,
    DevAttrIsMultiGpuBoard = 84,
    DevAttrMultiGpuBoardGroupID = 85,
    DevAttrHostNativeAtomicSupported = 86,
    DevAttrSingleToDoublePrecisionPerfRatio = 87,
    DevAttrPageableMemoryAccess = 88,
    DevAttrConcurrentManagedAccess = 89,
    DevAttrComputePreemptionSupported = 90,
    DevAttrCanUseHostPointerForRegisteredMem = 91,
    DevAttrReserved92 = 92,
    DevAttrReserved93 = 93,
    DevAttrReserved94 = 94,
    DevAttrCooperativeLaunch = 95,
    DevAttrCooperativeMultiDeviceLaunch = 96,
    DevAttrMaxSharedMemoryPerBlockOptin = 97,
    DevAttrCanFlushRemoteWrites = 98,
    DevAttrHostRegisterSupported = 99,
    DevAttrPageableMemoryAccessUsesHostPageTables = 100,
    DevAttrDirectManagedMemAccessFromHost = 101,
    DevAttrMaxBlocksPerMultiprocessor = 106,
    DevAttrMaxPersistingL2CacheSize = 108,
    DevAttrMaxAccessPolicyWindowSize = 109,
    DevAttrReservedSharedMemoryPerBlock = 111,
    DevAttrSparseCudaArraySupported = 112,
    DevAttrHostRegisterReadOnlySupported = 113,
    DevAttrTimelineSemaphoreInteropSupported = 114,
    DevAttrMaxTimelineSemaphoreInteropSupported = 114,
    DevAttrMemoryPoolsSupported = 115,
    DevAttrGPUDirectRDMASupported = 116,
    DevAttrGPUDirectRDMAFlushWritesOptions = 117,
    DevAttrGPUDirectRDMAWritesOrdering = 118,
    DevAttrMemoryPoolSupportedHandleTypes = 119,
    DevAttrClusterLaunch = 120,
    DevAttrDeferredMappingCudaArraySupported = 121,
    DevAttrReserved122 = 122,
    DevAttrReserved123 = 123,
    DevAttrReserved124 = 124,
    DevAttrIpcEventSupport = 125,
    DevAttrMemSyncDomainCount = 126,
    DevAttrReserved127 = 127,
    DevAttrReserved128 = 128,
    DevAttrReserved129 = 129,
    DevAttrNumaConfig = 130,
    DevAttrNumaId = 131,
    DevAttrReserved132 = 132,
    DevAttrMpsEnabled = 133,
    DevAttrHostNumaId = 134,
    DevAttrMax = 135,
}

/// cudaMemPoolAttr
MemPoolAttr :: enum cffi.uint {
    ReuseFollowEventDependencies = 1,
    ReuseAllowOpportunistic = 2,
    ReuseAllowInternalDependencies = 3,
    ReleaseThreshold = 4,
    ReservedMemCurrent = 5,
    ReservedMemHigh = 6,
    UsedMemCurrent = 7,
    UsedMemHigh = 8,
}

/// cudaMemLocationType
MemLocationType :: enum cffi.uint {
    Invalid = 0,
    Device = 1,
    Host = 2,
    HostNuma = 3,
    HostNumaCurrent = 4,
}

/// cudaMemAccessFlags
MemAccessFlags :: enum cffi.uint {
    ProtNone = 0,
    ProtRead = 0,
    ProtReadWrite = 1,
}
MemAccessFlagsSet :: bit_set[MemAccessFlags; cffi.uint]

/// cudaMemAllocationType
MemAllocationType :: enum cffi.uint {
    Invalid = 0,
    Pinned = 1,
    Max = 2147483647,
}

/// cudaMemAllocationHandleType
MemAllocationHandleType :: enum cffi.uint {
    None = 0,
    PosixFileDescriptor = 1,
    Win32 = 2,
    Win32Kmt = 4,
}

/// cudaGraphMemAttributeType
GraphMemAttributeType :: enum cffi.uint {
    AttrUsedMemCurrent = 0,
    AttrUsedMemHigh = 1,
    AttrReservedMemCurrent = 2,
    AttrReservedMemHigh = 3,
}

/// cudaDeviceP2PAttr
DeviceP2PAttr :: enum cffi.uint {
    DevP2PAttrPerformanceRank = 1,
    DevP2PAttrAccessSupported = 2,
    DevP2PAttrNativeAtomicSupported = 3,
    DevP2PAttrCudaArrayAccessSupported = 4,
}

/// cudaExternalMemoryHandleType
ExternalMemoryHandleType :: enum cffi.uint {
    OpaqueFd = 1,
    OpaqueWin32 = 2,
    OpaqueWin32Kmt = 3,
    D3D12Heap = 4,
    D3D12Resource = 5,
    D3D11Resource = 6,
    D3D11ResourceKmt = 7,
    NvSciBuf = 8,
}

/// cudaExternalSemaphoreHandleType
ExternalSemaphoreHandleType :: enum cffi.uint {
    OpaqueFd = 1,
    OpaqueWin32 = 2,
    OpaqueWin32Kmt = 3,
    D3D12Fence = 4,
    D3D11Fence = 5,
    NvSciSync = 6,
    KeyedMutex = 7,
    KeyedMutexKmt = 8,
    TimelineSemaphoreFd = 9,
    TimelineSemaphoreWin32 = 10,
}

/// cudaCGScope
CGScope :: enum cffi.uint {
    Invalid = 0,
    Grid = 1,
    MultiGrid = 2,
}

/// cudaGraphConditionalHandleFlags
GraphConditionalHandleFlags :: enum cffi.uint {
    CondAssignDefault = 0,
}
GraphConditionalHandleFlagsSet :: bit_set[GraphConditionalHandleFlags; cffi.uint]

/// cudaGraphConditionalNodeType
GraphConditionalNodeType :: enum cffi.uint {
    CondTypeIf = 0,
    CondTypeWhile = 1,
}

/// cudaGraphNodeType
GraphNodeType :: enum cffi.uint {
    Kernel = 0,
    Memcpy = 1,
    Memset = 2,
    Host = 3,
    Graph = 4,
    Empty = 5,
    WaitEvent = 6,
    EventRecord = 7,
    ExtSemaphoreSignal = 8,
    ExtSemaphoreWait = 9,
    MemAlloc = 10,
    MemFree = 11,
    Conditional = 13,
    Count = 14,
}

/// cudaGraphExecUpdateResult
GraphExecUpdateResult :: enum cffi.uint {
    Success = 0,
    Error = 1,
    ErrorTopologyChanged = 2,
    ErrorNodeTypeChanged = 3,
    ErrorFunctionChanged = 4,
    ErrorParametersChanged = 5,
    ErrorNotSupported = 6,
    ErrorUnsupportedFunctionChange = 7,
    ErrorAttributesChanged = 8,
}

/// cudaGetDriverEntryPointFlags
GetDriverEntryPointFlags :: enum cffi.uint {
    EnableDefault = 0,
    EnableLegacyStream = 0,
    EnablePerThreadDefaultStream = 1,
}
GetDriverEntryPointFlagsSet :: bit_set[GetDriverEntryPointFlags; cffi.uint]

/// cudaDriverEntryPointQueryResult
DriverEntryPointQueryResult :: enum cffi.uint {
    Success = 0,
    SymbolNotFound = 1,
    VersionNotSufficent = 2,
}

/// cudaGraphDebugDotFlags
GraphDebugDotFlags :: enum cffi.uint {
    Verbose = 0,
    KernelNodeParams = 2,
    MemcpyNodeParams = 3,
    MemsetNodeParams = 4,
    HostNodeParams = 5,
    EventNodeParams = 6,
    ExtSemasSignalNodeParams = 7,
    ExtSemasWaitNodeParams = 8,
    KernelNodeAttributes = 9,
    Handles = 10,
    ConditionalNodeParams = 15,
}
GraphDebugDotFlagsSet :: bit_set[GraphDebugDotFlags; cffi.uint]

/// cudaGraphInstantiateFlags
GraphInstantiateFlags :: enum cffi.uint {
    FlagAutoFreeOnLaunch = 0,
    FlagUpload = 1,
    FlagDeviceLaunch = 2,
    FlagUseNodePriority = 3,
}
GraphInstantiateFlagsSet :: bit_set[GraphInstantiateFlags; cffi.uint]

/// cudaDeviceNumaConfig
DeviceNumaConfig :: enum cffi.uint {
    None = 0,
    NumaNode = 1,
}

/// cudaSurfaceBoundaryMode
SurfaceBoundaryMode :: enum cffi.uint {
    Zero = 0,
    Clamp = 1,
    Trap = 2,
}

/// cudaSurfaceFormatMode
SurfaceFormatMode :: enum cffi.uint {
    Forced = 0,
    Auto = 1,
}

/// cudaTextureAddressMode
TextureAddressMode :: enum cffi.uint {
    Wrap = 0,
    Clamp = 1,
    Mirror = 2,
    Border = 3,
}

/// cudaTextureFilterMode
TextureFilterMode :: enum cffi.uint {
    Point = 0,
    Linear = 1,
}

/// cudaTextureReadMode
TextureReadMode :: enum cffi.uint {
    ElementType = 0,
    NormalizedFloat = 1,
}

/// cudaChannelFormatDesc
ChannelFormatDesc :: struct #align (4) {
    x : cffi.int,
    y : cffi.int,
    z : cffi.int,
    w : cffi.int,
    f : ChannelFormatKind,
}

/// cudaArray
Array :: struct {}

/// cudaMipmappedArray
MipmappedArray :: struct {}

/// cudaArraySparseProperties
ArraySparseProperties :: struct #align (8) {
    tileExtent_width : cffi.uint,
    tileExtent_height : cffi.uint,
    tileExtent_depth : cffi.uint,
    miptailFirstLevel : cffi.uint,
    miptailSize : cffi.ulonglong,
    flags : cffi.uint,
    reserved : [4]cffi.uint,
}

/// cudaArrayMemoryRequirements
ArrayMemoryRequirements :: struct #align (8) {
    size : cffi.ulong,
    alignment : cffi.ulong,
    reserved : [4]cffi.uint,
}

/// cudaPitchedPtr
PitchedPtr :: struct #align (8) {
    ptr : rawptr,
    pitch : cffi.ulong,
    xsize : cffi.ulong,
    ysize : cffi.ulong,
}

/// cudaExtent
Extent :: struct #align (8) {
    width : cffi.ulong,
    height : cffi.ulong,
    depth : cffi.ulong,
}

/// cudaPos
Pos :: struct #align (8) {
    x : cffi.ulong,
    y : cffi.ulong,
    z : cffi.ulong,
}

/// cudaMemcpy3DParms
Memcpy3DParms :: struct #align (8) {
    srcArray : ^Array,
    srcPos : Pos,
    srcPtr : PitchedPtr,
    dstArray : ^Array,
    dstPos : Pos,
    dstPtr : PitchedPtr,
    extent : Extent,
    kind : MemcpyKind,
}

/// cudaMemcpyNodeParams
MemcpyNodeParams :: struct #align (8) {
    flags : cffi.int,
    reserved : [3]cffi.int,
    copyParams : Memcpy3DParms,
}

/// cudaMemcpy3DPeerParms
Memcpy3DPeerParms :: struct #align (8) {
    srcArray : ^Array,
    srcPos : Pos,
    srcPtr : PitchedPtr,
    srcDevice : cffi.int,
    dstArray : ^Array,
    dstPos : Pos,
    dstPtr : PitchedPtr,
    dstDevice : cffi.int,
    extent : Extent,
}

/// cudaMemsetParams
MemsetParams :: struct #align (8) {
    dst : rawptr,
    pitch : cffi.ulong,
    value : cffi.uint,
    elementSize : cffi.uint,
    width : cffi.ulong,
    height : cffi.ulong,
}

/// cudaMemsetParamsV2
MemsetParamsV2 :: struct #align (8) {
    dst : rawptr,
    pitch : cffi.ulong,
    value : cffi.uint,
    elementSize : cffi.uint,
    width : cffi.ulong,
    height : cffi.ulong,
}

/// cudaAccessPolicyWindow
AccessPolicyWindow :: struct #align (8) {
    base_ptr : rawptr,
    num_bytes : cffi.ulong,
    hitRatio : cffi.float,
    hitProp : AccessProperty,
    missProp : AccessProperty,
}

/// cudaHostNodeParams
HostNodeParams :: struct #align (8) {
    fn : proc "c" (),
    userData : rawptr,
}

/// cudaHostNodeParamsV2
HostNodeParamsV2 :: struct #align (8) {
    fn : proc "c" (),
    userData : rawptr,
}

/// cudaGraphicsResource
GraphicsResource :: struct {}

/// cudaResourceDesc
ResourceDesc :: struct #align (8) {
    resType : ResourceType,
    res_array_array : ^Array,
    res_mipmap_mipmap : ^MipmappedArray,
    res_linear_devPtr : rawptr,
    res_linear_desc : ChannelFormatDesc,
    res_linear_sizeInBytes : cffi.ulong,
    res_pitch2D_devPtr : rawptr,
    res_pitch2D_desc : ChannelFormatDesc,
    res_pitch2D_width : cffi.ulong,
    res_pitch2D_height : cffi.ulong,
    res_pitch2D_pitchInBytes : cffi.ulong,
}

/// cudaResourceViewDesc
ResourceViewDesc :: struct #align (8) {
    format : ResourceViewFormat,
    width : cffi.ulong,
    height : cffi.ulong,
    depth : cffi.ulong,
    firstMipmapLevel : cffi.uint,
    lastMipmapLevel : cffi.uint,
    firstLayer : cffi.uint,
    lastLayer : cffi.uint,
}

/// cudaPointerAttributes
PointerAttributes :: struct #align (8) {
    type : MemoryType,
    device : cffi.int,
    devicePointer : rawptr,
    hostPointer : rawptr,
}

/// cudaFuncAttributes
FuncAttributes :: struct #align (8) {
    sharedSizeBytes : cffi.ulong,
    constSizeBytes : cffi.ulong,
    localSizeBytes : cffi.ulong,
    maxThreadsPerBlock : cffi.int,
    numRegs : cffi.int,
    ptxVersion : cffi.int,
    binaryVersion : cffi.int,
    cacheModeCA : cffi.int,
    maxDynamicSharedSizeBytes : cffi.int,
    preferredShmemCarveout : cffi.int,
    clusterDimMustBeSet : cffi.int,
    requiredClusterWidth : cffi.int,
    requiredClusterHeight : cffi.int,
    requiredClusterDepth : cffi.int,
    clusterSchedulingPolicyPreference : cffi.int,
    nonPortableClusterSizeAllowed : cffi.int,
    reserved : [16]cffi.int,
}

/// cudaMemLocation
MemLocation :: struct #align (4) {
    type : MemLocationType,
    id : cffi.int,
}

/// cudaMemAccessDesc
MemAccessDesc :: struct #align (4) {
    location : MemLocation,
    flags : MemAccessFlags,
}

/// cudaMemPoolProps
MemPoolProps :: struct #align (8) {
    allocType : MemAllocationType,
    handleTypes : MemAllocationHandleType,
    location : MemLocation,
    win32SecurityAttributes : rawptr,
    maxSize : cffi.ulong,
    reserved : [56]cffi.uchar,
}

/// cudaMemPoolPtrExportData
MemPoolPtrExportData :: struct  {
    reserved : [64]cffi.uchar,
}

/// cudaMemAllocNodeParams
MemAllocNodeParams :: struct #align (8) {
    poolProps : MemPoolProps,
    accessDescs : ^MemAccessDesc,
    accessDescCount : cffi.ulong,
    bytesize : cffi.ulong,
    dptr : rawptr,
}

/// cudaMemAllocNodeParamsV2
MemAllocNodeParamsV2 :: struct #align (8) {
    poolProps : MemPoolProps,
    accessDescs : ^MemAccessDesc,
    accessDescCount : cffi.ulong,
    bytesize : cffi.ulong,
    dptr : rawptr,
}

/// cudaMemFreeNodeParams
MemFreeNodeParams :: struct #align (8) {
    dptr : rawptr,
}

/// CUuuid_st
uuid_st :: struct  {
    bytes : [16]cffi.char,
}

/// cudaDeviceProp
DeviceProp :: struct #align (8) {
    name : [256]cffi.char,
    uuid : uuid_st,
    luid : [8]cffi.char,
    luidDeviceNodeMask : cffi.uint,
    totalGlobalMem : cffi.ulong,
    sharedMemPerBlock : cffi.ulong,
    regsPerBlock : cffi.int,
    warpSize : cffi.int,
    memPitch : cffi.ulong,
    maxThreadsPerBlock : cffi.int,
    maxThreadsDim : [3]cffi.int,
    maxGridSize : [3]cffi.int,
    clockRate : cffi.int,
    totalConstMem : cffi.ulong,
    major : cffi.int,
    minor : cffi.int,
    textureAlignment : cffi.ulong,
    texturePitchAlignment : cffi.ulong,
    deviceOverlap : cffi.int,
    multiProcessorCount : cffi.int,
    kernelExecTimeoutEnabled : cffi.int,
    integrated : cffi.int,
    canMapHostMemory : cffi.int,
    computeMode : cffi.int,
    maxTexture1D : cffi.int,
    maxTexture1DMipmap : cffi.int,
    maxTexture1DLinear : cffi.int,
    maxTexture2D : [2]cffi.int,
    maxTexture2DMipmap : [2]cffi.int,
    maxTexture2DLinear : [3]cffi.int,
    maxTexture2DGather : [2]cffi.int,
    maxTexture3D : [3]cffi.int,
    maxTexture3DAlt : [3]cffi.int,
    maxTextureCubemap : cffi.int,
    maxTexture1DLayered : [2]cffi.int,
    maxTexture2DLayered : [3]cffi.int,
    maxTextureCubemapLayered : [2]cffi.int,
    maxSurface1D : cffi.int,
    maxSurface2D : [2]cffi.int,
    maxSurface3D : [3]cffi.int,
    maxSurface1DLayered : [2]cffi.int,
    maxSurface2DLayered : [3]cffi.int,
    maxSurfaceCubemap : cffi.int,
    maxSurfaceCubemapLayered : [2]cffi.int,
    surfaceAlignment : cffi.ulong,
    concurrentKernels : cffi.int,
    ECCEnabled : cffi.int,
    pciBusID : cffi.int,
    pciDeviceID : cffi.int,
    pciDomainID : cffi.int,
    tccDriver : cffi.int,
    asyncEngineCount : cffi.int,
    unifiedAddressing : cffi.int,
    memoryClockRate : cffi.int,
    memoryBusWidth : cffi.int,
    l2CacheSize : cffi.int,
    persistingL2CacheMaxSize : cffi.int,
    maxThreadsPerMultiProcessor : cffi.int,
    streamPrioritiesSupported : cffi.int,
    globalL1CacheSupported : cffi.int,
    localL1CacheSupported : cffi.int,
    sharedMemPerMultiprocessor : cffi.ulong,
    regsPerMultiprocessor : cffi.int,
    managedMemory : cffi.int,
    isMultiGpuBoard : cffi.int,
    multiGpuBoardGroupID : cffi.int,
    hostNativeAtomicSupported : cffi.int,
    singleToDoublePrecisionPerfRatio : cffi.int,
    pageableMemoryAccess : cffi.int,
    concurrentManagedAccess : cffi.int,
    computePreemptionSupported : cffi.int,
    canUseHostPointerForRegisteredMem : cffi.int,
    cooperativeLaunch : cffi.int,
    cooperativeMultiDeviceLaunch : cffi.int,
    sharedMemPerBlockOptin : cffi.ulong,
    pageableMemoryAccessUsesHostPageTables : cffi.int,
    directManagedMemAccessFromHost : cffi.int,
    maxBlocksPerMultiProcessor : cffi.int,
    accessPolicyMaxWindowSize : cffi.int,
    reservedSharedMemPerBlock : cffi.ulong,
    hostRegisterSupported : cffi.int,
    sparseCudaArraySupported : cffi.int,
    hostRegisterReadOnlySupported : cffi.int,
    timelineSemaphoreInteropSupported : cffi.int,
    memoryPoolsSupported : cffi.int,
    gpuDirectRDMASupported : cffi.int,
    gpuDirectRDMAFlushWritesOptions : cffi.uint,
    gpuDirectRDMAWritesOrdering : cffi.int,
    memoryPoolSupportedHandleTypes : cffi.uint,
    deferredMappingCudaArraySupported : cffi.int,
    ipcEventSupported : cffi.int,
    clusterLaunch : cffi.int,
    unifiedFunctionPointers : cffi.int,
    reserved2 : [2]cffi.int,
    reserved1 : [1]cffi.int,
    reserved : [60]cffi.int,
}

/// cudaIpcEventHandle_st
IpcEventHandle_st :: struct  {
    reserved : [64]cffi.char,
}

/// cudaIpcMemHandle_st
IpcMemHandle_st :: struct  {
    reserved : [64]cffi.char,
}

/// cudaMemFabricHandle_st
MemFabricHandle_st :: struct  {
    reserved : [64]cffi.char,
}

/// cudaExternalMemoryHandleDesc
ExternalMemoryHandleDesc :: struct #align (8) {
    type : ExternalMemoryHandleType,
    handle_fd : cffi.int,
    handle_win32_handle : rawptr,
    handle_win32_name : rawptr,
    handle_nvSciBufObject : rawptr,
    size : cffi.ulonglong,
    flags : cffi.uint,
}

/// cudaExternalMemoryBufferDesc
ExternalMemoryBufferDesc :: struct #align (8) {
    offset : cffi.ulonglong,
    size : cffi.ulonglong,
    flags : cffi.uint,
}

/// cudaExternalMemoryMipmappedArrayDesc
ExternalMemoryMipmappedArrayDesc :: struct #align (8) {
    offset : cffi.ulonglong,
    formatDesc : ChannelFormatDesc,
    extent : Extent,
    flags : cffi.uint,
    numLevels : cffi.uint,
}

/// cudaExternalSemaphoreHandleDesc
ExternalSemaphoreHandleDesc :: struct #align (8) {
    type : ExternalSemaphoreHandleType,
    handle_fd : cffi.int,
    handle_win32_handle : rawptr,
    handle_win32_name : rawptr,
    handle_nvSciSyncObj : rawptr,
    flags : cffi.uint,
}

/// cudaExternalSemaphoreSignalParams_v1
ExternalSemaphoreSignalParams_v1 :: struct #align (8) {
    params_fence_value : cffi.ulonglong,
    params_nvSciSync_fence : rawptr,
    params_nvSciSync_reserved : cffi.ulonglong,
    params_keyedMutex_key : cffi.ulonglong,
    flags : cffi.uint,
}

/// cudaExternalSemaphoreWaitParams_v1
ExternalSemaphoreWaitParams_v1 :: struct #align (8) {
    params_fence_value : cffi.ulonglong,
    params_nvSciSync_fence : rawptr,
    params_nvSciSync_reserved : cffi.ulonglong,
    params_keyedMutex_key : cffi.ulonglong,
    params_keyedMutex_timeoutMs : cffi.uint,
    flags : cffi.uint,
}

/// cudaExternalSemaphoreSignalParams
ExternalSemaphoreSignalParams :: struct #align (8) {
    params_fence_value : cffi.ulonglong,
    params_nvSciSync_fence : rawptr,
    params_nvSciSync_reserved : cffi.ulonglong,
    params_keyedMutex_key : cffi.ulonglong,
    params_reserved : [12]cffi.uint,
    flags : cffi.uint,
    reserved : [16]cffi.uint,
}

/// cudaExternalSemaphoreWaitParams
ExternalSemaphoreWaitParams :: struct #align (8) {
    params_fence_value : cffi.ulonglong,
    params_nvSciSync_fence : rawptr,
    params_nvSciSync_reserved : cffi.ulonglong,
    params_keyedMutex_key : cffi.ulonglong,
    params_keyedMutex_timeoutMs : cffi.uint,
    params_reserved : [10]cffi.uint,
    flags : cffi.uint,
    reserved : [16]cffi.uint,
}

/// CUstream_st
stream_st :: struct {}

/// CUevent_st
event_st :: struct {}

/// CUexternalMemory_st
externalMemory_st :: struct {}

/// CUexternalSemaphore_st
externalSemaphore_st :: struct {}

/// CUgraph_st
graph_st :: struct {}

/// CUgraphNode_st
graphNode_st :: struct {}

/// CUuserObject_st
userObject_st :: struct {}

/// CUfunc_st
func_st :: struct {}

/// CUkern_st
kern_st :: struct {}

/// CUmemPoolHandle_st
memPoolHandle_st :: struct {}

/// cudaLaunchParams
LaunchParams :: struct #align (8) {
    func : rawptr,
    gridDim : dim3,
    blockDim : dim3,
    args : ^rawptr,
    sharedMem : cffi.ulong,
    stream : ^stream_st,
}

/// cudaKernelNodeParams
KernelNodeParams :: struct #align (8) {
    func : rawptr,
    gridDim : dim3,
    blockDim : dim3,
    sharedMemBytes : cffi.uint,
    kernelParams : ^rawptr,
    extra : ^rawptr,
}

/// cudaKernelNodeParamsV2
KernelNodeParamsV2 :: struct #align (8) {
    func : rawptr,
    gridDim : dim3,
    blockDim : dim3,
    sharedMemBytes : cffi.uint,
    kernelParams : ^rawptr,
    extra : ^rawptr,
}

/// cudaExternalSemaphoreSignalNodeParams
ExternalSemaphoreSignalNodeParams :: struct #align (8) {
    extSemArray : ^^externalSemaphore_st,
    paramsArray : ^ExternalSemaphoreSignalParams,
    numExtSems : cffi.uint,
}

/// cudaExternalSemaphoreSignalNodeParamsV2
ExternalSemaphoreSignalNodeParamsV2 :: struct #align (8) {
    extSemArray : ^^externalSemaphore_st,
    paramsArray : ^ExternalSemaphoreSignalParams,
    numExtSems : cffi.uint,
}

/// cudaExternalSemaphoreWaitNodeParams
ExternalSemaphoreWaitNodeParams :: struct #align (8) {
    extSemArray : ^^externalSemaphore_st,
    paramsArray : ^ExternalSemaphoreWaitParams,
    numExtSems : cffi.uint,
}

/// cudaExternalSemaphoreWaitNodeParamsV2
ExternalSemaphoreWaitNodeParamsV2 :: struct #align (8) {
    extSemArray : ^^externalSemaphore_st,
    paramsArray : ^ExternalSemaphoreWaitParams,
    numExtSems : cffi.uint,
}

/// cudaConditionalNodeParams
ConditionalNodeParams :: struct #align (8) {
    handle : cffi.ulonglong,
    type : GraphConditionalNodeType,
    size : cffi.uint,
    phGraph_out : ^^graph_st,
}

/// cudaChildGraphNodeParams
ChildGraphNodeParams :: struct #align (8) {
    graph : ^graph_st,
}

/// cudaEventRecordNodeParams
EventRecordNodeParams :: struct #align (8) {
    event : ^event_st,
}

/// cudaEventWaitNodeParams
EventWaitNodeParams :: struct #align (8) {
    event : ^event_st,
}

/// cudaGraphNodeParams
GraphNodeParams :: struct #align (8) {
    type : GraphNodeType,
    reserved0 : [3]cffi.int,
    reserved1 : [29]cffi.longlong,
    kernel : KernelNodeParamsV2,
    memcpy : MemcpyNodeParams,
    memset : MemsetParamsV2,
    host : HostNodeParamsV2,
    graph : ChildGraphNodeParams,
    eventWait : EventWaitNodeParams,
    eventRecord : EventRecordNodeParams,
    extSemSignal : ExternalSemaphoreSignalNodeParamsV2,
    extSemWait : ExternalSemaphoreWaitNodeParamsV2,
    alloc : MemAllocNodeParamsV2,
    free : MemFreeNodeParams,
    conditional : ConditionalNodeParams,
    reserved2 : cffi.longlong,
}

/// cudaGraphEdgeData_st
GraphEdgeData_st :: struct  {
    from_port : cffi.uchar,
    to_port : cffi.uchar,
    type : cffi.uchar,
    reserved : [5]cffi.uchar,
}

/// CUgraphExec_st
graphExec_st :: struct {}

/// cudaGraphInstantiateParams_st
GraphInstantiateParams_st :: struct #align (8) {
    flags : cffi.ulonglong,
    uploadStream : ^stream_st,
    errNode_out : ^graphNode_st,
    result_out : GraphInstantiateResult,
}

/// cudaGraphExecUpdateResultInfo_st
GraphExecUpdateResultInfo_st :: struct #align (8) {
    result : GraphExecUpdateResult,
    errorNode : ^graphNode_st,
    errorFromNode : ^graphNode_st,
}

/// cudaLaunchMemSyncDomainMap_st
LaunchMemSyncDomainMap_st :: struct  {
    default_ : cffi.uchar,
    remote : cffi.uchar,
}

/// cudaLaunchAttribute_st
LaunchAttribute_st :: struct #align (8) {
    id : LaunchAttributeID,
    pad : [4]cffi.char,
    val : LaunchAttributeValue,
}

/// cudaLaunchConfig_st
LaunchConfig_st :: struct #align (8) {
    gridDim : dim3,
    blockDim : dim3,
    dynamicSmemBytes : cffi.ulong,
    stream : ^stream_st,
    attrs : ^LaunchAttribute_st,
    numAttrs : cffi.uint,
}

/// cudaTextureDesc
TextureDesc :: struct #align (4) {
    addressMode : [3]TextureAddressMode,
    filterMode : TextureFilterMode,
    readMode : TextureReadMode,
    sRGB : cffi.int,
    borderColor : [4]cffi.float,
    normalizedCoords : cffi.int,
    maxAnisotropy : cffi.uint,
    mipmapFilterMode : TextureFilterMode,
    mipmapLevelBias : cffi.float,
    minMipmapLevelClamp : cffi.float,
    maxMipmapLevelClamp : cffi.float,
    disableTrilinearOptimization : cffi.int,
    seamlessCubemap : cffi.int,
}

/// cudaLaunchAttributeValue
LaunchAttributeValue :: struct  {
    pad : [64]cffi.char,
    accessPolicyWindow : AccessPolicyWindow,
    cooperative : cffi.int,
    syncPolicy : SynchronizationPolicy,
    clusterDim_x : cffi.uint,
    clusterDim_y : cffi.uint,
    clusterDim_z : cffi.uint,
    clusterSchedulingPolicyPreference : ClusterSchedulingPolicy,
    programmaticStreamSerializationAllowed : cffi.int,
    programmaticEvent_event : ^event_st,
    programmaticEvent_flags : cffi.int,
    programmaticEvent_triggerAtBlockStart : cffi.int,
    priority : cffi.int,
    memSyncDomainMap : LaunchMemSyncDomainMap_st,
    memSyncDomain : LaunchMemSyncDomain,
    launchCompletionEvent_event : ^event_st,
    launchCompletionEvent_flags : cffi.int,
}


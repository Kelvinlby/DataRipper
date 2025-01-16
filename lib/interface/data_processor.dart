import 'dart:ffi' as ffi;


typedef NativeVoidFunction = ffi.Void Function();
typedef DartVoidFunction = void Function();


class DataProcessor {
  static final ffi.DynamicLibrary _lib = ffi.DynamicLibrary.open('/mnt/Data/Code/Python/libDataProcessor/libDataProcessor/so.cpython-312-x86_64-linux-gnu.so');

  final readParquet = _lib.lookup<ffi.NativeFunction<NativeVoidFunction>>('read_parquet').asFunction<DartVoidFunction>();
  final readCsv = _lib.lookup<ffi.NativeFunction<NativeVoidFunction>>('read_csv').asFunction<DartVoidFunction>();
  final readJson = _lib.lookup<ffi.NativeFunction<NativeVoidFunction>>('read_json').asFunction<DartVoidFunction>();
  final readNdjson = _lib.lookup<ffi.NativeFunction<NativeVoidFunction>>('read_ndjson').asFunction<DartVoidFunction>();

  final scanParquet = _lib.lookup<ffi.NativeFunction<NativeVoidFunction>>('scan_parquet').asFunction<DartVoidFunction>();
  final scanCsv = _lib.lookup<ffi.NativeFunction<NativeVoidFunction>>('scan_csv').asFunction<DartVoidFunction>();
  final scanJson = _lib.lookup<ffi.NativeFunction<NativeVoidFunction>>('scan_json').asFunction<DartVoidFunction>();
  final scanNdjson = _lib.lookup<ffi.NativeFunction<NativeVoidFunction>>('scan_ndjson').asFunction<DartVoidFunction>();
}

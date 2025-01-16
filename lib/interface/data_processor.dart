import 'dart:ffi' as ffi;
import 'package:ffi/ffi.dart';


typedef NativeLoadFunction = ffi.Void Function(ffi.Pointer<ffi.Char>);
typedef DartLoadFunction = void Function(ffi.Pointer<ffi.Char>);


abstract class DataProcessor {
  static final ffi.DynamicLibrary _lib = ffi.DynamicLibrary.open('/mnt/Data/Code/Python/libDataProcessor/libDataProcessor/so.cpython-312-x86_64-linux-gnu.so');

  static final _readParquet = _lib.lookup<ffi.NativeFunction<NativeLoadFunction>>('read_parquet').asFunction<DartLoadFunction>();
  static final _readCsv = _lib.lookup<ffi.NativeFunction<NativeLoadFunction>>('read_csv').asFunction<DartLoadFunction>();
  static final _readJson = _lib.lookup<ffi.NativeFunction<NativeLoadFunction>>('read_json').asFunction<DartLoadFunction>();
  static final _readNdjson = _lib.lookup<ffi.NativeFunction<NativeLoadFunction>>('read_ndjson').asFunction<DartLoadFunction>();

  static final _scanParquet = _lib.lookup<ffi.NativeFunction<NativeLoadFunction>>('scan_parquet').asFunction<DartLoadFunction>();
  static final _scanCsv = _lib.lookup<ffi.NativeFunction<NativeLoadFunction>>('scan_csv').asFunction<DartLoadFunction>();
  static final _scanJson = _lib.lookup<ffi.NativeFunction<NativeLoadFunction>>('scan_json').asFunction<DartLoadFunction>();
  static final _scanNdjson = _lib.lookup<ffi.NativeFunction<NativeLoadFunction>>('scan_ndjson').asFunction<DartLoadFunction>();

  static void _load(DartLoadFunction func, String path) {
    final ffi.Pointer<ffi.Char> cString = path.toNativeUtf8().cast<ffi.Char>();

    try {
      func(cString); // Call the native function with the string pointer
    } finally {
      malloc.free(cString); // Free the allocated memory
    }
  }

  static void readParquet(String path) => _load(_readParquet, path);
  static void readCsv(String path) => _load(_readCsv, path);
  static void readJson(String path) => _load(_readJson, path);
  static void readNdjson(String path) => _load(_readNdjson, path);

  static void scanParquet(String path) => _load(_scanParquet, path);
  static void scanCsv(String path) => _load(_scanCsv, path);
  static void scanJson(String path) => _load(_scanJson, path);
  static void scanNdjson(String path) => _load(_scanNdjson, path);
}

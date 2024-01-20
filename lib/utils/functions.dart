import 'dart:developer';
import 'dart:ui' as ui;

import 'package:flutter/services.dart';

Future loadCustomMapStyle() async {
  return await rootBundle.loadString('assets/styles/custom_map_style.json');
}

Future<Uint8List> getBytesFromAsset(String path, int width) async {
  try {
    ByteData data = await rootBundle.load(path);
    late ui.Codec codec;
    late Uint8List result;
    try {
      result = data.buffer.asUint8List();
    } catch (e) {
      rethrow;
    }
    codec = await ui.instantiateImageCodec(result, targetWidth: 100);
    ui.FrameInfo fi = await codec.getNextFrame();
    return (await fi.image.toByteData(format: ui.ImageByteFormat.png))!
        .buffer
        .asUint8List();
  } catch (e) {
    log(e.toString());
    rethrow;
  }
}

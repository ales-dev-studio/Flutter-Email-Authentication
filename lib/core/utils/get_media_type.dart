import 'package:dio/dio.dart';

DioMediaType getMediaType(String filename) {
  if (filename.endsWith('.png')) return DioMediaType('image', 'png');
  if (filename.endsWith('.jpg') || filename.endsWith('.jpeg')) {
    return DioMediaType('image', 'jpeg');
  }
  if (filename.endsWith('.webp')) return DioMediaType('image', 'webp');
  if (filename.endsWith('.svg')) return DioMediaType('image', 'svg+xml');
  return DioMediaType('application', 'octet-stream');
}

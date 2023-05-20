import 'dart:async';

import '../def/function_def.dart';

/// A provider can provide definations or implementations or both
mixin BallFunctionDefProviderBase {
  String get defProviderName;

  FutureOr<List<BallFunctionDef>> provideDefs();
}

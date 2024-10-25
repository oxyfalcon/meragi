import 'package:flutter/foundation.dart';

class ValueListenableChangeNotifier<T> extends ChangeNotifier
    implements ValueListenable<T?> {
  T? _value;
  ValueListenableChangeNotifier({T? value}) : _value = value;

  setValue(T? newValue, {bool notifyListener = false}) {
    if (_value == newValue) {
      return;
    }
    _value = newValue;
    if (notifyListener) notifyListeners();
  }

  @override
  T? get value => _value;
}

class ImageFormController extends ValueNotifier<(Uint8List?, String?)> {
  ImageFormController(super.value);
}

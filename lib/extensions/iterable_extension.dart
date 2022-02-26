extension ExtendedIterable<E> on Iterable<E> {
  /// Alternative to forEach method that provides indexes.
  void forEachIndexed(void Function(E e, int i) f) {
    var i = 0;
    forEach((e) => f(e, i++));
  }

  /// Alternative to map method that provides indexes.
  Iterable<T> mapIndexed<T>(T Function(E e, int i) f) {
    var i = 0;
    return map((e) => f(e, i++));
  }

  /// Alternative to where method that provides indexes.
  /// The where method is similar to the JavaScript Array filter method.
  Iterable<E> whereIndexed(bool Function(E e, int i) f) {
    var i = 0;
    return where((e) => f(e, i++));
  }
}

/// Generator function that lazily iterates over an Iterable,
/// providing each element and its index to a callback function
/// whose return value is yielded.
Iterable<E> mapIndexed<E, T>(
    Iterable<T> items, E Function(int index, T item) f) sync* {
  var index = 0;

  for (final item in items) {
    yield f(index, item);
    index = index + 1;
  }
}

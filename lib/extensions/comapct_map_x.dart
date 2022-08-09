import 'package:flutter/widgets.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

extension ComapactMapX<T> on Iterable<T?> {
  Iterable<T> compactMap<E>([
    E? Function(T?)? transform,
  ]) =>
      map(
        transform ?? (e) => e,
      ).where((e) => e != null).cast();
}

AsyncSnapshot<T> useFutureMem<T>(
  Future<T> Function() create,
) {
  final future = useMemoized(create, const []);
  return useFuture(future);
}

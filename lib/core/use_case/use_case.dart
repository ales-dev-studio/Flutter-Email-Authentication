abstract class UseCase<T, P> {
  /// The call() method allows an instance of any class
  /// that defines it to emulate a function.
  /// See: https://dart.dev/language/callable-objects
  Future<T> call(final P params);
}

/// When you have no parameters to send to the call method,
/// pass this class as a parameter
class NoParams {}

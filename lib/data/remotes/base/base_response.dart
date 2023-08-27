class Success<T> extends SealedResult<T> {
  Success(this.data);

  final T data;
}

class Error<T> extends SealedResult<T> {
  Error(this.errorMessage);

  final String errorMessage;
}

abstract class SealedResult<T> {
  R? when<R>({
    R? Function(T)? success,
    R? Function(String)? error,
  }) {
    if (this is Success<T>) {
      return success?.call((this as Success).data);
    }
    if (this is Error) {
      return error?.call((this as Error).errorMessage);
    }
    throw Exception('Exception');
  }
}

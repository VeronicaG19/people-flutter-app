import 'package:equatable/equatable.dart';

abstract class Resource<F, T> extends Equatable {
  const Resource();
  factory Resource.none() = _ResourceNone;
  factory Resource.loading() = _ResourceLoading;
  const factory Resource.success(T resource) = _ResourceSuccess;
  const factory Resource.failure(F failure) = _ResourceFailure;

  bool get isNone => this is _ResourceNone;
  bool get isLoading => this is _ResourceLoading;
  bool get isSuccess => this is _ResourceSuccess;
  bool get isFailure => this is _ResourceFailure;

  void whenIsFailure(void Function(F failure) isFailure) {
    if (this is _ResourceFailure) {
      isFailure.call((this as _ResourceFailure).failure as F);
    }
  }

  void whenIsSuccess(void Function(T resource) isSuccess) {
    if (this is _ResourceSuccess) {
      isSuccess.call((this as _ResourceSuccess).value as T);
    }
  }

  void when({
    required void Function() isNone,
    required void Function() isLoading,
    required void Function(T resource) isSuccess,
    required void Function(F failure) isFailure,
  }) {
    if (this is _ResourceNone) {
      return isNone.call();
    }

    if (this is _ResourceLoading) {
      return isLoading.call();
    }

    if (this is _ResourceSuccess) {
      return isSuccess.call((this as _ResourceSuccess).value as T);
    }

    if (this is _ResourceFailure) {
      return isFailure.call((this as _ResourceFailure).failure as F);
    }
  }

  R map<R>({
    required R Function() isNone,
    required R Function() isLoading,
    required R Function(T resource) isSuccess,
    required R Function(F failure) isFailure,
  }) {
    if (this is _ResourceNone) {
      return isNone.call();
    }

    if (this is _ResourceLoading) {
      return isLoading.call();
    }

    if (this is _ResourceSuccess) {
      return isSuccess.call((this as _ResourceSuccess).value as T);
    }

    if (this is _ResourceFailure) {
      return isFailure.call((this as _ResourceFailure).failure as F);
    }

    return isNone.call();
  }

  void maybeWhen({
    void Function()? isNone,
    void Function()? isLoading,
    void Function(T resource)? isSuccess,
    void Function(F failure)? isFailure,
    required void Function() orElse,
  }) {
    if (this is _ResourceNone && isNone != null) {
      return isNone.call();
    }

    if (this is _ResourceLoading && isLoading != null) {
      return isLoading.call();
    }

    if (this is _ResourceSuccess && isSuccess != null) {
      return isSuccess.call((this as _ResourceSuccess).value as T);
    }

    if (this is _ResourceFailure && isFailure != null) {
      return isFailure.call((this as _ResourceFailure).failure as F);
    }

    orElse.call();
  }

  R maybeMap<R>({
    R Function()? isNone,
    R Function()? isLoading,
    R Function(T resource)? isSuccess,
    R Function(F failure)? isFailure,
    required R Function() orElse,
  }) {
    if (this is _ResourceNone && isNone != null) {
      return isNone.call();
    }

    if (this is _ResourceLoading && isLoading != null) {
      return isLoading.call();
    }

    if (this is _ResourceSuccess && isSuccess != null) {
      return isSuccess.call((this as _ResourceSuccess).value as T);
    }

    if (this is _ResourceFailure && isFailure != null) {
      return isFailure.call((this as _ResourceFailure).failure as F);
    }

    return orElse.call();
  }
}

class _ResourceNone<F, T> extends Resource<F, T> {
  @override
  List<Object> get props => [];
}

class _ResourceLoading<F, T> extends Resource<F, T> {
  @override
  List<Object> get props => [];
}

class _ResourceSuccess<F, T> extends Resource<F, T> {
  const _ResourceSuccess(this.value);

  final T value;

  @override
  List<Object> get props => [];
}

class _ResourceFailure<F, T> extends Resource<F, T> {
  const _ResourceFailure(this.failure);

  final F failure;

  @override
  List<Object> get props => [];
}

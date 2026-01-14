import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:ecommerce_app/domain/core/exception/custom_exception.dart';
import 'package:ecommerce_app/domain/core/failures/value_object/value_failure.dart';
import 'package:ecommerce_app/domain/core/failures/value_object/value_validator.dart';

@immutable
abstract class ValueObjet<T> extends Equatable {
  const ValueObjet();

  Either<ValueFailure<String>, T> get value;

  bool isValid() => value.isRight();


  T getOrCrash() {

    return value.fold(
        (l) => throw CustomException(errMsg: 'Unexpected value at $T'), id);
  }

  ValueFailure? get getFailure => value.fold(id, (r) => null);

  T? get getValue => value.fold((l) => null, id);

  @override
  List<Object> get props => [value];

  @override
  String toString() => 'Value($value)';
}

class Mail extends ValueObjet<String> {
  @override
  final Either<ValueFailure<String>, String> value;

  factory Mail(String value) => Mail._(validateMail(value));

  const Mail._(this.value);
}

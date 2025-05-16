import 'dart:io';

import 'package:midad/core/locale/generated/l10n.dart';

/// Enum for all possible status codes
enum StatusCode {
  success(HttpStatus.ok),
  noContent(HttpStatus.noContent),
  badRequest(HttpStatus.badRequest),
  unauthorized(HttpStatus.unauthorized),
  forbidden(HttpStatus.forbidden),
  notFound(HttpStatus.notFound),
  timeout(HttpStatus.requestTimeout),
  unprocessableContent(HttpStatus.unprocessableEntity),
  serverError(HttpStatus.internalServerError),
  noInternet(-1),
  cancel(-2),
  cacheError(-3),
  formatError(-4),
  connectionError(-5),
  unknown(-99);

  final int code;
  // ignore: sort_constructors_first
  const StatusCode(this.code);

  static StatusCode fromCode(int? code) {
    return StatusCode.values.firstWhere(
      (status) => status.code == code,
      orElse: () => StatusCode.unknown,
    );
  }

  String get message => switch (this) {
        noContent => '',
        success => '',
        noInternet => S.current.netWorkErrorMessage,
        timeout => S.current.timeOutErrorMessage,
        badRequest => S.current.badRequestMessage,
        unauthorized => S.current.unauthorizedMessage,
        forbidden => S.current.forbiddenMessage,
        notFound => S.current.notFoundMessage,
        serverError => S.current.serverErrorMessage,
        unknown => S.current.unknownErrorMessage,
        unprocessableContent => S.current.unprocessableContent,
        cancel =>S.current.requestCanceled,
        cacheError =>S.current.cacheError,
        formatError => S.current.formatException,
        connectionError => S.current.connectionErrorException,
      };

  @override
  toString() => message;
}

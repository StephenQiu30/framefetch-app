//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element, unused_element_parameter
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'download_error_code.g.dart';

class DownloadErrorCode extends EnumClass {
  @BuiltValueEnumConst(wireName: r'cancelled')
  static const DownloadErrorCode cancelled = _$cancelled;
  @BuiltValueEnumConst(wireName: r'download_timeout')
  static const DownloadErrorCode downloadTimeout = _$downloadTimeout;
  @BuiltValueEnumConst(wireName: r'format_unavailable')
  static const DownloadErrorCode formatUnavailable = _$formatUnavailable;
  @BuiltValueEnumConst(wireName: r'internal_error')
  static const DownloadErrorCode internalError = _$internalError;
  @BuiltValueEnumConst(wireName: r'media_validation_failed')
  static const DownloadErrorCode mediaValidationFailed =
      _$mediaValidationFailed;
  @BuiltValueEnumConst(wireName: r'output_limit_exceeded')
  static const DownloadErrorCode outputLimitExceeded = _$outputLimitExceeded;
  @BuiltValueEnumConst(wireName: r'network_blocked')
  static const DownloadErrorCode networkBlocked = _$networkBlocked;
  @BuiltValueEnumConst(wireName: r'challenge')
  static const DownloadErrorCode challenge = _$challenge;
  @BuiltValueEnumConst(wireName: r'login_required')
  static const DownloadErrorCode loginRequired = _$loginRequired;
  @BuiltValueEnumConst(wireName: r'identity_unavailable')
  static const DownloadErrorCode identityUnavailable = _$identityUnavailable;
  @BuiltValueEnumConst(wireName: r'rate_limited')
  static const DownloadErrorCode rateLimited = _$rateLimited;
  @BuiltValueEnumConst(wireName: r'context_changed')
  static const DownloadErrorCode contextChanged = _$contextChanged;
  @BuiltValueEnumConst(wireName: r'content_unavailable')
  static const DownloadErrorCode contentUnavailable = _$contentUnavailable;
  @BuiltValueEnumConst(wireName: r'content_protected')
  static const DownloadErrorCode contentProtected = _$contentProtected;
  @BuiltValueEnumConst(wireName: r'extractor_broken')
  static const DownloadErrorCode extractorBroken = _$extractorBroken;
  @BuiltValueEnumConst(wireName: r'transient')
  static const DownloadErrorCode transient = _$transient;
  @BuiltValueEnumConst(wireName: r'invalid_input')
  static const DownloadErrorCode invalidInput = _$invalidInput;
  @BuiltValueEnumConst(wireName: r'runtime_unavailable')
  static const DownloadErrorCode runtimeUnavailable = _$runtimeUnavailable;
  @BuiltValueEnumConst(wireName: r'storage_unavailable')
  static const DownloadErrorCode storageUnavailable = _$storageUnavailable;
  @BuiltValueEnumConst(wireName: r'temp_space_exhausted')
  static const DownloadErrorCode tempSpaceExhausted = _$tempSpaceExhausted;
  @BuiltValueEnumConst(wireName: r'transcode_required')
  static const DownloadErrorCode transcodeRequired = _$transcodeRequired;
  @BuiltValueEnumConst(wireName: r'unsupported_source')
  static const DownloadErrorCode unsupportedSource = _$unsupportedSource;
  @BuiltValueEnumConst(wireName: r'worker_lost')
  static const DownloadErrorCode workerLost = _$workerLost;
  @BuiltValueEnumConst(wireName: r'unknown_default_open_api', fallback: true)
  static const DownloadErrorCode unknownDefaultOpenApi =
      _$unknownDefaultOpenApi;

  static Serializer<DownloadErrorCode> get serializer =>
      _$downloadErrorCodeSerializer;

  const DownloadErrorCode._(String name) : super(name);

  static BuiltSet<DownloadErrorCode> get values => _$values;
  static DownloadErrorCode valueOf(String name) => _$valueOf(name);
}

/// Optionally, enum_class can generate a mixin to go with your enum for use
/// with Angular. It exposes your enum constants as getters. So, if you mix it
/// in to your Dart component class, the values become available to the
/// corresponding Angular template.
///
/// Trigger mixin generation by writing a line like this one next to your enum.
abstract class DownloadErrorCodeMixin = Object with _$DownloadErrorCodeMixin;

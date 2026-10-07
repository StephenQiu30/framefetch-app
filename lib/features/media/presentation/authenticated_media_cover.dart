import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:framefetch/core/theme/app_spacing.dart';
import 'package:framefetch/features/media/application/media_thumbnail_provider.dart';
import 'package:framefetch/features/media/presentation/media_cover_fallback.dart';
import 'package:framefetch/shared/presentation/app_spinner.dart';

export 'media_cover_fallback.dart';

const mediaFrameAspectRatio = 16 / 9;

final class AuthenticatedMediaCover extends ConsumerWidget {
  const AuthenticatedMediaCover({
    required this.alt,
    this.borderRadius = BorderRadius.zero,
    this.compact = false,
    this.detail,
    this.eyebrow,
    this.pending = false,
    this.source,
    this.title,
    super.key,
  });

  final String alt;
  final BorderRadius borderRadius;
  final bool compact;
  final String? detail;
  final String? eyebrow;
  final bool pending;
  final String? source;
  final String? title;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final normalized = source?.trim();
    final result = normalized == null || normalized.isEmpty
        ? null
        : ref.watch(mediaThumbnailProvider(normalized));
    return Semantics(
      image: true,
      label: alt,
      child: ExcludeSemantics(
        child: AspectRatio(
          aspectRatio: mediaFrameAspectRatio,
          child: ClipRRect(
            borderRadius: borderRadius,
            child: ColoredBox(
              color: Theme.of(context).colorScheme.surface,
              child: result == null
                  ? MediaCoverFallback(
                      compact: compact,
                      detail: detail,
                      eyebrow: eyebrow,
                      pending: pending,
                      title: title,
                    )
                  : result.when(
                      data: (bytes) => Image.memory(
                        bytes,
                        fit: BoxFit.cover,
                        gaplessPlayback: true,
                        height: double.infinity,
                        width: double.infinity,
                        frameBuilder: (context, child, frame, synchronous) =>
                            frame != null || synchronous
                            ? child
                            : _CoverLoading(compact: compact),
                        errorBuilder: (context, error, stackTrace) =>
                            MediaCoverFallback(
                              compact: compact,
                              detail: detail,
                              eyebrow: eyebrow,
                              title: title,
                            ),
                      ),
                      error: (_, _) => MediaCoverFallback(
                        compact: compact,
                        detail: detail,
                        eyebrow: eyebrow,
                        title: title,
                      ),
                      loading: () => _CoverLoading(compact: compact),
                    ),
            ),
          ),
        ),
      ),
    );
  }
}

final class _CoverLoading extends StatelessWidget {
  const _CoverLoading({required this.compact});

  final bool compact;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(compact ? AppSpacing.small : AppSpacing.large),
      child: const Center(child: AppSpinner()),
    );
  }
}

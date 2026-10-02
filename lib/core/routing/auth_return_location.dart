/// Resolves the original in-app destination without permitting an auth loop.
String safeAuthReturnLocation(String? location) {
  if (location == null ||
      !location.startsWith('/') ||
      location.startsWith('//')) {
    return '/';
  }
  final uri = Uri.tryParse(location);
  if (uri == null ||
      uri.hasScheme ||
      uri.hasAuthority ||
      uri.path == '/auth' ||
      uri.path.startsWith('/auth/')) {
    return '/';
  }
  return location;
}

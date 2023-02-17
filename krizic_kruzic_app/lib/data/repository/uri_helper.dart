class UriHelperRepo {
  static String getUrlWithParams(String uri, Map<String, dynamic> params) {
    params.forEach((String key, dynamic value) {
      uri = uri.replaceAll("{$key}", value);
    });
    return uri;
  }
}

class AppLink {

  AppLink({this.location, this.currentTab});

  String? location;

  int? currentTab;

  static const String kLoginOptionsPath = '/login-options';
  static const String kLoginPath = '/login';
  static const String kRegisterPath = '/register';
  static const String kAppTopPath = '/app-top';
  static const String kHomePagePath = '/home-page';
  static const String kAppTopDetailPath = '/app-top-detail';
  static const String kTabParam = 'tab';

  static AppLink fromLocation(String? location) {
    location = Uri.decodeFull(location ?? '');
    final uri = Uri.parse(location);
    final params = uri.queryParameters;

    final currentTab = int.tryParse(params[kTabParam] ?? '');

    final link = AppLink(
        location: uri.path,
        currentTab: currentTab
    );
    return link;
  }

  String toLocation() {
    String addKeyValPair({
      required String key,
      String? value
    }) => value == null ? '' : '$key = $value&';

    switch (location) {
      case kLoginOptionsPath :
        return kLoginOptionsPath;
      case kLoginPath :
        return kLoginPath;
      case kRegisterPath :
        return kRegisterPath;
      case kAppTopPath:
        return kAppTopPath;
      case kAppTopDetailPath:
        return kAppTopDetailPath;
      default:
        var loc = '$kHomePagePath?';
        loc  += addKeyValPair(key: kTabParam, value: currentTab.toString());
        return Uri.encodeFull(loc);
    }
  }
}

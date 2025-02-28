import '../../core/app/app_flavor.dart';

class ApiUrls {
  static String baseUrl = getServerUrl();
  static const String liveUrl =
      'http://www.randomnumberapi.com/api/v1.0/'; //live server
  static const String devUrl =
      'http://www.randomnumberapi.com/api/v1.0/'; // dev server
  static const String testUrl =
      'http://www.randomnumberapi.com/api/v1.0/'; // test server

  // get current flavor url
  static String getServerUrl() {
    if (AppFlavor.getFlavor == FlavorStatus.production) {
      return liveUrl;
    } else if (AppFlavor.getFlavor == FlavorStatus.development) {
      return devUrl;
    } else if (AppFlavor.getFlavor == FlavorStatus.staging) {
      return testUrl;
    } else {
      return liveUrl;
    }
  }

  // api url name start here //
  static const String random = 'random';
}

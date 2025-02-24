import '../../core/app/app_flavor.dart';

class ApiUrls {
  static String baseUrl = getServerUrl();
  static const String liveUrl =
      'https://test.hmbadhon.me/api/v1/'; //live server
  static const String devUrl = 'https://test.hmbadhon.me/api/v1/'; // dev server
  static const String testUrl =
      'https://test.hmbadhon.me/api/v1/'; // test server

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
  static const String login = 'login';
  static const String forgot = 'forgot-password';
}

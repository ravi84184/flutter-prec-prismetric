import '../../app_import.dart';

enum MyEnvironments { prod, dev, test }

class FlavorConfig {
  /// Define your required variables
  final MyEnvironments environment;
  final String baseUrl;
  final String googleAPIKey;
  final String firebaseWebAPIKey;

  static FlavorConfig? _instance;

  FlavorConfig._internal(
    this.environment,
    this.baseUrl,
    this.googleAPIKey,
    this.firebaseWebAPIKey,
  );

  static FlavorConfig get instance => _instance!;

  /// Factor flavor class
  factory FlavorConfig({
    MyEnvironments environment: MyEnvironments.test,
    required String baseUrl,
    required String googleAPIKey,
    required String firebaseWebAPIKey,
  }) {
    _instance ??= FlavorConfig._internal(
      environment,
      baseUrl,
      googleAPIKey,
      firebaseWebAPIKey,
    );

    return _instance!;
  }

  static void setUpFlavor(
      {MyEnvironments defaultEnvironment = MyEnvironments.dev}) {
    /// Getter for falvor environment
    MyEnvironments? getFlavorEnvironment() {
      /// Read variable from environment
      const environment = String.fromEnvironment('env');

      switch (environment) {
        case "test":
          return MyEnvironments.test;
        case "prod":
          return MyEnvironments.prod;
        case "dev":
          return MyEnvironments.dev;
        default:
          return null;
      }
    }

    /// Getter for base URL
    String getBaseUrl(MyEnvironments environment) {
      switch (environment) {
        case MyEnvironments.prod:
          return AppStrings.DevBaseURL;

        case MyEnvironments.dev:
          return AppStrings.ProdBaseURL;

        case MyEnvironments.test:
          return AppStrings.TestBaseURL;
      }
      return AppStrings.ProdBaseURL;
    }

    /// Getter for base URL
    String getGoogleAPIKey(MyEnvironments environment) {
      switch (environment) {
        case MyEnvironments.prod:
          return "";

        case MyEnvironments.dev:
          return "";

        case MyEnvironments.test:
          return "";
      }
      return "";
    }

    /// Getter for FirebaseWebAPI Key
    String getFirebaseWebAPIKey(MyEnvironments environment) {
      switch (environment) {
        case MyEnvironments.prod:
          return "";

        case MyEnvironments.dev:
          return "";

        case MyEnvironments.test:
          return "";
      }
      return "";
    }

    /// set flavorEnvironment via getter method
    var flavorEnvironment = getFlavorEnvironment() ?? defaultEnvironment;

    /// Finally set environment
    FlavorConfig(
        environment: flavorEnvironment,
        baseUrl: getBaseUrl(flavorEnvironment),
        googleAPIKey: getGoogleAPIKey(flavorEnvironment),
        firebaseWebAPIKey: getFirebaseWebAPIKey(flavorEnvironment));
  }
}

class Config {

  /// Prevents from object instantiation.
  Config._();

  /// Holds the 'Site Key' for the `Google reCAPTCHA v3` API .
  static const String siteKey = '6LeA8aMeAAAAAIZ430h3mJAoaOWKWOZJiIp_5Mag';

  /// Holds the 'Secret Key' for the `Google reCAPTCHA v3` API .
  static const String secretKey = '6LeA8aMeAAAAACTef4BMDjPY2d05ZR_ah1k2P-48';

  /// Holds the 'Verfication URL' for the `Google reCAPTCHA v3` API .
  static final verificationURL =
  Uri.parse('https://www.google.com/recaptcha/api/siteverify');
}
import 'package:otp/otp.dart';

class OtpHelper {
  static String generateTOTPCode(String otpUrl) {
    // Parse the OTP URL
    Uri uri = Uri.parse(otpUrl);

    // Extract the secret key from the URL
    String? secret = uri.queryParameters["secret"];
    int period =
        int.tryParse(uri.queryParameters["period"] ?? '') ??
        30; // Default to 30 seconds if not provided
    int digits =
        int.tryParse(uri.queryParameters["digits"] ?? '') ??
        6; // Default to 6 digits if not provided
    String algorithm =
        uri.queryParameters["algorithm"] ??
        "SHA1"; // Default to SHA1 if not provided

    String otpCode = OTP.generateTOTPCodeString(
      secret ?? "",
      DateTime.now().millisecondsSinceEpoch,
      interval: period,
      length: digits,
      isGoogle: true,
      algorithm:
          Algorithm.values
              .where((e) => e.toString().split('.').last == algorithm)
              .first,
    );

    return otpCode;
  }
}

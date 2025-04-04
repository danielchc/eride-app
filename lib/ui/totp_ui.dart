import 'dart:async';

import 'package:eride_app/helpers/base64_helper.dart';
import 'package:eride_app/helpers/otp_helper.dart';
import 'package:eride_app/model/entry.dart';
import 'package:eride_app/provider/password_provider.dart';
import 'package:eride_app/ui/entry_folder_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:otp/otp.dart';

final class ToptUI extends StatefulWidget {
  final BuildContext context;
  const ToptUI({super.key, required this.context});

  @override
  State<ToptUI> createState() => _ToptUIState();
}

class OTPEntry {
  EntryData entryData;
  String otpCode;
  int expiryDate;
  OTPEntry({
    required this.entryData,
    required this.otpCode,
    required this.expiryDate,
  });
}

class _ToptUIState extends State<ToptUI> {
  @override
  Timer? timer;
  List<OTPEntry> totpEntries = [];

  void updateList() {
    setState(() {
      totpEntries =
          PasswordProvider.generateOtpEntries()
              .map((Entry entry) {
                if (entry is EntryData) {
                  return OTPEntry(
                    entryData: entry,
                    otpCode: OtpHelper.generateTOTPCode(
                      entry.attributes?[EntryAttributes.ER_OTP] ?? "",
                    ),
                    expiryDate: OTP.remainingSeconds(),
                  );
                }
                return null;
              })
              .whereType<OTPEntry>()
              .toList();
    });
  }

  @override
  void initState() {
    super.initState();
    updateList();
    timer = Timer.periodic(
      Duration(milliseconds: 500),
      (Timer t) => updateList(),
    );
  }

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("TOTP")),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(Icons.qr_code_scanner),
      ),
      body: ListView.builder(
        itemCount: totpEntries.length,
        itemBuilder: (context, index) {
          final totpEntry = totpEntries[index];
          return ListTile(
            onTap: () {
              Clipboard.setData(ClipboardData(text: totpEntry.otpCode)).then((
                _,
              ) {
                ScaffoldMessenger.of(
                  context,
                ).showSnackBar(SnackBar(content: Text('Copied to clipboard!')));
              });
            },
            leading:
                totpEntry.entryData.attributes![EntryAttributes.ER_ICON] != null
                    ? Base64Helper.base64ToImage(
                      totpEntry.entryData.attributes![EntryAttributes.ER_ICON]!,
                    )
                    : Icon(Icons.lock),
            title: Text(totpEntry.entryData.title),

            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  totpEntry.entryData.attributes![EntryAttributes
                          .ER_USERNAME] ??
                      "",
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: LinearProgressIndicator(
                    value: totpEntry.expiryDate / 30,
                    backgroundColor: Colors.grey[300],
                    valueColor: AlwaysStoppedAnimation<Color>(Colors.blue),
                  ),
                ),
              ],
            ),
            trailing: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  totpEntry.otpCode,
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

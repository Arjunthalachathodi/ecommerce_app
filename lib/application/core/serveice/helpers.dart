import 'dart:convert';
import 'dart:io';

import 'package:ecommerce_app/application/core/utils/alert_dialog.dart';
import 'package:ecommerce_app/application/core/utils/logger.dart';
import 'package:flutter_dropdown_alert/model/data_alert.dart';

import 'package:url_launcher/url_launcher.dart';

























final RegExp emailRegex = RegExp(
  r"^[a-zA-Z0-9.!#$%&'+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?)$",
);

final RegExp phoneRegex = RegExp(
  r'^(\+\d{1,2}\s)?\(?\d{3}\)?[\s.-]\d{3}[\s.-]\d{4}$',
);

bool _isNumeric(String str) {
  if (str.isEmpty) {
    return false;
  }
  return double.tryParse(str) != null;
}


String? validateEmailOrPhone(String? value) {
  if (value == null || value.isEmpty) {
    return 'Please enter an email or phone number.';
  } else if (_isNumeric(value) &&
      value.length == 10 &&
      !phoneRegex.hasMatch(value)) {
    return null;
  } else if (!emailRegex.hasMatch(value)) {
    return 'Please enter a valid email/phone number';
  } else {
    return null;
  }
}


String? validatePassword(String? value) {
  if (value == null || value.isEmpty) {
    return 'Please enter your password.';
  } else if (value.length <= 3) {
    return 'minimum 4 character password';
  } else {
    return null;
  }
}


bool passwordMatcher(String value) {
  String symbols = r'!@#$%^&*()_+{}|[]\:";<>,.?/~`';
  return value.split('').any((char) => symbols.contains(char));
}

class LaunchUrl {
  static void launchURL(String urllink) async {
    final Uri url = Uri.parse(urllink);
    if (!await launchUrl(url)) {
      CustomAlertDialog.showCustomDialog(
        title: 'Faild to launch',
        typeAlert: TypeAlert.error,
      );
    }
  }

  static void mailTo(String mail) async {
    try {
      launchUrl(Uri.parse('mailto:$mail'),

          mode: LaunchMode.externalApplication);
    } catch (e) {

    }
  }

  static void callFunction(String number) async {
    try {
      launchUrl(
        Uri.parse('tel:$number'),

        mode: LaunchMode.externalApplication,
      );
    } catch (e) {

    }
  }
}

String? convertImageToBase64(File? file) {
  if (file != null && file.path.isNotEmpty) {

    final bytes = file.readAsBytesSync();


    String file64 = base64Encode(bytes);


    String dataUrl = 'data:image/jpeg;base64,$file64';

    return dataUrl;
  }
  return null;
}




























































































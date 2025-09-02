import 'dart:io';
import 'dart:ui';

import 'package:actapp/widgets/appText.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dio/dio.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:intl/intl.dart';
import 'package:multi_select_flutter/chip_display/multi_select_chip_display.dart';
import 'package:multi_select_flutter/dialog/multi_select_dialog_field.dart';
import 'package:multi_select_flutter/util/multi_select_item.dart';
import 'package:multi_select_flutter/util/multi_select_list_type.dart';
import 'package:path_provider/path_provider.dart';
import 'package:share_plus/share_plus.dart';
import 'package:shared_preferences/shared_preferences.dart';

class API {
  static Color appcolor = Color(0xFF191818);
  static Color subcolor = Color(0xFF191818);
  static Color backcolor = const Color(0xfff6f7fe);
  static Color textcolor = Colors.black;
  static Color whitetextcolor = Colors.white;
  static Color bordercolor = Color(0xFF09255d);
  static Color buttoncolor = Color(0xFF09255d);
  static Color cardbg = const Color.fromARGB(255, 230, 230, 230);
  static Color cardcolor = Colors.white;
  static String appfont = 'Roboto';
  static String appfont2 = 'Dutch801BT';

  static Color color1 = const Color(0xFF1F87E3);
  static Color color2 = const Color(0xFFCC3079);
  static Color color3 = const Color(0xFFEDEDED);
  static Color color4 = const Color(0xFFFC6666);
  static Color color5 = const Color(0xFF2FC156);
  static Color color6 = const Color(0xFFFFD53B);
  static Color color7 = const Color(0xFFAAB223);
  static Color color8 = const Color(0xFFF44336);

  static Color backgroundcolor = Colors.white;

  static Color buttonbordercolor = Colors.black;

  static String baseurl = "";

  static Color appbarcolor = const Color(0xFF17009f);

  static String formatDate(String dateString) {
    // Parse the date string using DateFormat
    DateTime date = DateFormat('yyyy-M-d').parse(dateString);

    // Format the date as 'dd / MM / yyyy'
    String formattedDate = DateFormat('dd / MM / yyyy').format(date);

    return formattedDate;
  }

  static Future<bool> checkInternetAvailable() async {
    // Step 1: Check if connected to any network
    var connectivityResult = await Connectivity().checkConnectivity();

    if (connectivityResult == [ConnectivityResult.none]) {
      return false; // No network
    }

    // Step 2: Check actual internet access
    try {
      final result = await InternetAddress.lookup('google.com');
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        return true; // Internet is available
      }
      return false;
    } on SocketException catch (_) {
      return false; // DNS failed, no internet
    }
  }

  static Future<Map<String, dynamic>> storeDataInSharedPrefs(
    Map<String, dynamic> companySettings,
  ) async {
    print("This is the company details");
    print(companySettings);
    final SharedPreferences zephyrerpcache =
        await SharedPreferences.getInstance();
    companySettings.forEach((key, value) {
      print(value);
      if (value is String) {
        zephyrerpcache.setString(key, value);
      } else if (value is int) {
        zephyrerpcache.setInt(key, value);
      } else if (value is double) {
        zephyrerpcache.setDouble(key, value);
      } else if (value is bool) {
        zephyrerpcache.setBool(key, value);
      }
    });
    return {"status": "success", "data": true};
  }

  static Future<dynamic> getDataFromSharedPrefs(String key) async {
    final SharedPreferences zephyrerpcache =
        await SharedPreferences.getInstance();
    if (zephyrerpcache.containsKey(key)) {
      return zephyrerpcache.get(key);
    } else {
      return "";
    }
  }

  static TextStyle textStyleType() {
    return const TextStyle(
      color: Colors.black,
      fontWeight: FontWeight.w300,
      fontSize: 13,
    );
  }

  static void showDefaultSnackbar(
    BuildContext context,
    String type,
    String message,
  ) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        backgroundColor: type == 'success' ? Colors.green : Colors.red,
        content: Text(
          message,
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w400,
          ),
        ),
      ),
    );
  }

  static TextStyle textCustomStyle() {
    return const TextStyle(
      color: Colors.black,
      fontWeight: FontWeight.w400,
      fontSize: 14,
    );
  }

  static TextStyle textCustomSnackStyle() {
    return const TextStyle(
      color: Colors.white,
      fontWeight: FontWeight.w400,
      fontSize: 14,
    );
  }

  static TextStyle textDashboardHeadingStyle() {
    return const TextStyle(
      color: Colors.white,
      fontWeight: FontWeight.w300,
      fontSize: 13,
    );
  }

  static Widget loadingScreen() {
    return const Center(
      child: SizedBox(
        height: 50,
        child: SpinKitChasingDots(color: Colors.white, size: 40.0),
      ),
    );
  }

  static Future<void> shareFileFromUrl(
    String fileUrl, {
    String? fileName,
  }) async {
    try {
      final dio = Dio();
      final tempDir = await getTemporaryDirectory();
      final name = fileName ?? fileUrl.split('/').last;
      final filePath = '${tempDir.path}/$name';

      await dio.download(
        fileUrl,
        filePath,
        options: Options(responseType: ResponseType.bytes),
      );

      final file = File(filePath);
      if (await file.exists()) {
        await Share.shareXFiles([
          XFile(file.path),
        ], text: 'Check out this file!');
      } else {
        print('Downloaded file not found.');
      }
    } catch (e) {
      print('Error sharing file: $e');
    }
  }

  static void showSnackBar(String status, String message) {
    if (status == "success") {
      Get.snackbar(
        "Great",
        message,
        backgroundColor: Colors.green,
        colorText: Colors.white,
      );
    } else {
      Get.snackbar(
        "Note",
        message,
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
    }
  }

  static Widget buildDropdown<T>({
    required List<T> items,
    required T? selectedItem,
    required ValueChanged<T?> onChanged,
    String hintText = 'Select',
    double width = double.infinity,
    double height = 50,
    bool version2 = false,
    EdgeInsetsGeometry padding = const EdgeInsets.symmetric(horizontal: 12),
  }) {
    return SizedBox(
      width: width,
      height: height,
      child: DropdownButtonHideUnderline(
        child: DropdownButton2<T>(
          isExpanded: true,
          hint: Text(
            hintText,
            style: TextStyle(
              fontSize: 14,
              color: version2 ? Colors.black : Colors.white,
            ),
          ),
          items: items
              .map(
                (item) => DropdownMenuItem<T>(
                  value: item,
                  child: Text(
                    item.toString(),
                    style: TextStyle(
                      fontSize: 14,
                      color: version2 ? Colors.black : Colors.white,
                    ),
                  ),
                ),
              )
              .toList(),
          value: selectedItem,
          onChanged: onChanged,
          buttonStyleData: ButtonStyleData(
            padding: padding,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              border: Border.all(color: version2 ? Colors.black : Colors.white),
              color: Colors.transparent,
            ),
          ),
          dropdownStyleData: DropdownStyleData(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(0),
                topRight: Radius.circular(0),
                bottomLeft: Radius.circular(8),
                bottomRight: Radius.circular(8),
              ),
              color: version2 ? Colors.white : API.subcolor,
              boxShadow: [
                BoxShadow(
                  color: version2 ? Colors.grey[600]! : Colors.transparent,
                  spreadRadius: 1,
                  blurRadius: 5,
                  offset: Offset(0, 1),
                ),
              ],
              border: Border.all(
                color: version2 ? Colors.transparent : Colors.white,
              ),
            ),
          ),
          menuItemStyleData: const MenuItemStyleData(height: 40),
        ),
      ),
    );
  }

  static Widget buildMultiSelect<T>({
    required List<T> items,
    required List<T> selectedItems,
    required Function(List<T>) onConfirm,
    bool version2 = false,
    String hintText = 'Select',
  }) {
    return Theme(
      data: ThemeData(
        dialogTheme: DialogThemeData(
          backgroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
      ),
      child: MultiSelectDialogField<T>(
        items: items
            .map((item) => MultiSelectItem<T>(item, item.toString()))
            .toList(),
        listType: MultiSelectListType.LIST,
        initialValue: selectedItems,
        selectedColor: Colors.green.shade600,
        title: Text(
          hintText,
          style: const TextStyle(
            fontSize: 14,
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
        buttonIcon: Icon(
          Icons.arrow_drop_down_outlined,
          color: version2 ? Colors.black : Colors.grey.shade600,
        ),
        buttonText: Text(
          hintText,
          style: const TextStyle(fontSize: 14, color: Colors.black87),
        ),
        onConfirm: onConfirm,
        decoration: BoxDecoration(
          color: version2 ? Colors.transparent : Color(0xFFF5F5F5),
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: version2 ? Colors.black : Colors.transparent,
          ),
        ),
        chipDisplay: MultiSelectChipDisplay(
          chipColor: Colors.grey.shade200,
          textStyle: const TextStyle(fontSize: 12, color: Colors.black),
        ),
      ),
    );
  }

  static Widget dateField<T>(
    String title,
    String hintText,
    BuildContext context,
    Function(DateTime? value) onChanged,
    String Function(DateTime? value) dateFormat,
    DateTime? currentValue,
  ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextField(
          readOnly: true,
          controller: TextEditingController(
            text: currentValue == null ? '' : dateFormat(currentValue),
          ),
          style: const TextStyle(color: Colors.black, fontSize: 14),
          decoration: InputDecoration(
            hintText: hintText,
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 16,
              vertical: 12,
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide(color: API.subcolor),
            ),
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
          ),
          onTap: () async {
            final picked = await showDatePicker(
              context: context,
              initialDate: currentValue ?? DateTime.now(),
              firstDate: DateTime(1900),
              lastDate: DateTime(2100),
              builder: (context, child) {
                return Theme(
                  data: ThemeData.dark().copyWith(
                    colorScheme: ColorScheme.dark(
                      primary: API.color6,
                      onPrimary: Colors.white,
                      surface: Colors.white,
                      onSurface: Colors.black,
                    ),
                    dialogBackgroundColor: Colors.black,
                    textButtonTheme: TextButtonThemeData(
                      style: TextButton.styleFrom(foregroundColor: API.color6),
                    ),
                  ),
                  child: child!,
                );
              },
            );
            if (picked != null) {
              onChanged(picked);
            }
          },
        ),
      ],
    );
  }

  static Widget timeField(
    String title,
    String hintText,
    BuildContext context,
    Function(TimeOfDay? value) onChanged,
    String Function(TimeOfDay? value) timeFormat,
    TimeOfDay? currentValue,
  ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextField(
          readOnly: true,
          controller: TextEditingController(
            text: currentValue == null ? '' : timeFormat(currentValue),
          ),
          style: const TextStyle(color: Colors.black, fontSize: 14),
          decoration: InputDecoration(
            hintText: hintText,
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 16,
              vertical: 12,
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide(color: API.subcolor),
            ),
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
          ),
          onTap: () async {
            final picked = await showTimePicker(
              context: context,
              initialTime: currentValue ?? TimeOfDay.now(),
              builder: (context, child) {
                return Theme(
                  data: ThemeData.dark().copyWith(
                    colorScheme: ColorScheme.dark(
                      primary: API.color6,
                      onPrimary: Colors.white,
                      surface: Colors.white,
                      onSurface: Colors.black,
                    ),
                    dialogBackgroundColor: Colors.black,
                    textButtonTheme: TextButtonThemeData(
                      style: TextButton.styleFrom(foregroundColor: API.appcolor),
                    ),
                  ),
                  child: child!,
                );
              },
            );
            if (picked != null) {
              onChanged(picked);
            }
          },
        ),
      ],
    );
  }

  static Widget checkBoxField(
    String title,
    bool value,
    Function(bool? value) onChanged,
  ) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        AppText(
          title,
          color: Colors.black,
          fontSize: 18,
          fontWeight: FontWeight.w600,
        ),
        const SizedBox(width: 5),
        Transform.scale(
          scale: 0.9,
          child: Checkbox(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(3),
            ),
            activeColor: Colors.black,
            checkColor: Colors.white,
            value: value,
            onChanged: onChanged,
          ),
        ),
      ],
    );
  }
  static Widget descriptionBox({
    required String hint,
    required TextEditingController controller,
    int minLines = 3,
    int maxLines = 5,
  }) {
    return TextFormField(
      controller: controller,
      minLines: minLines,
      maxLines: maxLines,
      keyboardType: TextInputType.multiline,
      style: const TextStyle(fontSize: 14, color: Colors.black),
      decoration: InputDecoration(
        hintText: hint,
        hintStyle: const TextStyle(color: Colors.black),
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 12,
          vertical: 10,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: Colors.black),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(color: Colors.black, width: 1.2),
        ),
      ),
    );
  }



}

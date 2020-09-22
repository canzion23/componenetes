import 'package:flutter/material.dart';

final _icons = <String, IconData>{
  'add_alert': Icons.add_alert,
  'account_circle': Icons.account_circle,
  'filter_center_focus': Icons.filter_center_focus,
  'input': Icons.input,
  'donut_large': Icons.donut_large,
  'call': Icons.call,
};

Icon getIcon(String nombreIcono) {
  return Icon(_icons[nombreIcono], color: Colors.blue);
}

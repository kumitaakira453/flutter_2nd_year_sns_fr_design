import 'package:flutter/material.dart';
import 'package:flutter_2nd_year_sns_fr_design/components/app_bar.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<SettingsPage> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: MyAppBar(
        title: 'Settings',
        hasAutoLeading: true,
      ),
    );
  }
}

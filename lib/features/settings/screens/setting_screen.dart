import 'package:flutter/material.dart';

import '../../../core/utils/app_colors.dart';
import '../../class/data/data_class.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Paramètres'),
        backgroundColor: AppColors.primaryGreen,
      ),
      body: ListView.builder(
        itemCount: DataClass.settingsContent.length,
        itemBuilder: (context, index) {
          final setting = DataClass.settingsContent[index];
          return ListTile(
            leading: Icon(Icons.settings, color: AppColors.secondaryGreen),
            title: Text(
              setting['title']!,
              style: TextStyle(color: AppColors.black),
            ),
            subtitle: Text(
              setting['description']!,
              style: TextStyle(color: AppColors.grey),
            ),
          );
        },
      ),
    );
  }
}

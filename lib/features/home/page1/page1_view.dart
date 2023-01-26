import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../product/manager/theme_manager.dart';

class Page1View extends StatelessWidget {
  const Page1View({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ElevatedButton(
          onPressed: () => context.read<ThemeManager>().changeTheme(),
          child: const Text('Change Theme')),
    );
  }
}

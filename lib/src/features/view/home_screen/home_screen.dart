import 'package:flutter/material.dart';
import '../../../common_widgets/background_widget.dart';
import '../../../common_widgets/custom_floating_button.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: BackgroundWidget(child: Text('home'),),
        floatingActionButton: CustomFloatingButton(),
    );
  }
}

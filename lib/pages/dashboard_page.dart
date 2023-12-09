import 'package:flutter/material.dart';
import 'package:d_view/d_view.dart';

class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: DView.appBarLeft('Dashboard'),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:app/features/main/main.dart';
import 'package:app/features/main/widgets/widgets.dart';
import 'package:app/features/main/providers/providers.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<BottomNavProvider>(context);
    
    final pages = [
      const HomeScreen(),
      const RecordsScreen(), 
    ];

    return Scaffold(
      body: pages[provider.currentIndex],
      bottomNavigationBar: CustomBottomAppBar(
        currentIndex: provider.currentIndex,
        onTabSelected: (index) => provider.changeTab(index),
      ),
    );
  }
}
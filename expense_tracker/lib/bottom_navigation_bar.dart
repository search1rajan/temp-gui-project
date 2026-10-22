import 'package:flutter/material.dart';

import 'home_screen.dart';
import 'add_transaction.dart';
import 'transaction_details.dart';
import 'profile_or_settings.dart';
import 'categories_screen.dart';

class Navigation extends StatefulWidget {
  const Navigation({super.key});

  @override
  State<Navigation> createState() {
    return _MainNavigationState();
  }
}

class _MainNavigationState extends State<Navigation> {

  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: IndexedStack(
        index: currentIndex,
        children: [
          HomeScreen(),
          TransactionDetails(),
          AddTransaction(),
          CategoriesScreen(),
          ProfileScreen(),
        ],
      ),

      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,

        type: BottomNavigationBarType.fixed,

        selectedItemColor: Colors.green,
        unselectedItemColor: Colors.grey,

        onTap: (index) {
          setState(() {
            currentIndex = index;
          });
        },

        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined),
            label: 'Home',
          ),

          BottomNavigationBarItem(
            icon: Icon(Icons.receipt_long_outlined),
            label: 'Transactions',
          ),

          BottomNavigationBarItem(
            icon: Icon(Icons.add_circle_outline_rounded),
            label: 'Add',
          ),

          BottomNavigationBarItem(
            icon: Icon(Icons.grid_view_rounded),
            label: 'Categories',
          ),

          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}
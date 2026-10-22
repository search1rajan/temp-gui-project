import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

// import 'bottom_navigation_bar.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  IconData getTransactionIcon(String category, bool isIncome) {
    switch (category.toLowerCase()) {
      case 'food':
        return Icons.restaurant;

      case 'salary':
      case 'job':
        return Icons.account_balance_wallet;

      case 'shopping':
        return Icons.shopping_cart;

      case 'travel':
        return Icons.flight;

      case 'bills':
        return Icons.receipt_long;

      case 'other':
        return Icons.grid_4x4;

      default:
        return isIncome ? Icons.currency_rupee_sharp : Icons.receipt_long;
    }
  }

  Color getTransactionIconBackground(String category, bool isIncome) {
    switch (category.toLowerCase()) {
      case 'food':
      case 'shopping':
      case 'bills':
        return Colors.red.shade100;

      case 'salary':
      case 'job':
        return Colors.green.shade100;

      case 'travel':
        return Colors.blue.shade100;

      default:
        return isIncome ? Colors.green.shade100 : Colors.red.shade100;
    }
  }

  Color getTransactionIconColor(String category, bool isIncome) {
    switch (category.toLowerCase()) {
      case 'food':
      case 'shopping':
      case 'bills':
        return Colors.red;

      case 'salary':
      case 'job':
        return Colors.green;

      case 'travel':
        return Colors.blue;

      default:
        return isIncome ? Colors.green : Colors.red;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Hello,\nWelcome Back! ',
          style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
        ),

        actions: [
          Padding(
            padding: EdgeInsets.only(right: 20),
            child: Icon(Icons.notifications_outlined),
          ),
        ],
      ),

      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Column(
              children: [
                SizedBox(height: 20),

                Container(
                  margin: EdgeInsets.all(5),
                  height: 150,
                  width: 400,

                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.green,
                  ),

                  child: Padding(
                    padding: EdgeInsets.all(20),

                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Total Balance',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),

                            Icon(
                              Icons.visibility_outlined,
                              color: Colors.white,
                            ),
                          ],
                        ),

                        SizedBox(height: 10),

                        // Balance
                        Text(
                          '₹25,250.00',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 20),
                Row(
                  children: [
                    // Total Income
                    Expanded(
                      child: Container(
                        height: 120,

                        margin: EdgeInsets.only(left: 20, right: 10),
                        padding: EdgeInsets.all(15),
                        decoration: BoxDecoration(
                          color: Color(0xFFE8F8EF),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Icon(Icons.work, color: Colors.green, size: 30),

                            SizedBox(height: 5),

                            Text(
                              'Total Income',
                              style: TextStyle(
                                color: Colors.green,
                                fontSize: 18,
                              ),
                            ),

                            Text(
                              '₹ 40,000',
                              style: TextStyle(
                                color: Colors.green,
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),

                    Expanded(
                      child: Container(
                        height: 120,

                        margin: EdgeInsets.only(left: 10, right: 20),
                        padding: EdgeInsets.all(15),
                        decoration: BoxDecoration(
                          color: Color(0xFFFCEBED),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              width: 25,
                              height: 25,
                              decoration: BoxDecoration(
                                color: Colors.red,
                                borderRadius: BorderRadius.circular(6),
                              ),
                              child: Icon(
                                Icons.add,
                                color: Colors.white,
                                size: 20,
                              ),
                            ),

                            SizedBox(height: 5),

                            Text(
                              'Total Expense',
                              style: TextStyle(color: Colors.red, fontSize: 18),
                            ),

                            Text(
                              '₹ 14,750',
                              style: TextStyle(
                                color: Colors.red,
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 15),

                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 30),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Recent Transactions',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),

                      Text(
                        'View All',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: Colors.green,
                        ),
                      ),
                    ],
                  ),
                ),

                SizedBox(height: 10),

                StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
                  stream: FirebaseFirestore.instance
                      .collection('transactions')
                      .snapshots(),

                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const Center(child: CircularProgressIndicator());
                    }

                    if (snapshot.hasError) {
                      return const Center(
                        child: Text('Transactions load failed'),
                      );
                    }

                    if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
                      return const Center(child: Text('No Transactions Found'));
                    }

                    final transactions = snapshot.data!.docs;

                    return Column(
                      children: transactions.map((transaction) {
                        final data = transaction.data();

                        final title = data['title']?.toString() ?? '';
                        final category = data['category']?.toString() ?? '';
                        final type = data['type']?.toString() ?? '';
                        final amount = data['amount'] ?? 0;

                        final isIncome = type.toLowerCase() == 'income';

                        return Container(
                          margin: const EdgeInsets.symmetric(
                            horizontal: 15,
                            vertical: 5,
                          ),
                          padding: const EdgeInsets.all(12),

                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(12),
                          ),

                          child: Row(
                            children: [
                              Container(
                                width: 45,
                                height: 45,

                                decoration: BoxDecoration(
                                  color: getTransactionIconBackground(
                                    category,
                                    isIncome,
                                  ),
                                  borderRadius: BorderRadius.circular(10),
                                ),

                                child: Icon(
                                  getTransactionIcon(category, isIncome),
                                  color: getTransactionIconColor(
                                    category,
                                    isIncome,
                                  ),
                                  size: 30,
                                ),
                              ),

                              const SizedBox(width: 12),

                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      title,
                                      style: const TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),

                                    const SizedBox(height: 4),

                                    Text(
                                      category,
                                      style: const TextStyle(
                                        fontSize: 12,
                                        color: Colors.grey,
                                      ),
                                    ),
                                  ],
                                ),
                              ),

                              const SizedBox(width: 8),

                              Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Text(
                                    '${isIncome ? '+' : '-'} ₹$amount',
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                      color: isIncome
                                          ? Colors.green
                                          : Colors.red,
                                    ),
                                  ),

                                  const SizedBox(height: 4),

                                  Text(
                                    type,
                                    style: TextStyle(
                                      fontSize: 12,
                                      color: isIncome
                                          ? Colors.green
                                          : Colors.red,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        );
                      }).toList(),
                    );
                  },
                ),
              ],
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: Colors.indigo,
        child: Icon(Icons.add, color: Colors.white),
      ),
    );
  }
}

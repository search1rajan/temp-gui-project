import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class TransactionDetails extends StatelessWidget {
  const TransactionDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Transaction Details'),
      ),

      body: StreamBuilder(
        stream: FirebaseFirestore.instance
            .collection('transactions')
            .snapshots(),

        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
            return const Center(
              child: Text('No Transactions Found'),
            );
          }

          final transactions = snapshot.data!.docs;
          

          return ListView.builder(
            itemCount: transactions.length,

            itemBuilder: (context, index) {
              final data = transactions[index].data();

              return Card(
                margin: const EdgeInsets.all(10),

                child: ListTile(
                  leading: const Icon(Icons.receipt_long),

                  title: Text(data['title'] ?? ''),

                  subtitle: Text(
                    '${data['category'] ?? ''} • ${data['type'] ?? ''}',
                  ),

                  trailing: Text(
                    '₹${data['amount'] ?? 0}',
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
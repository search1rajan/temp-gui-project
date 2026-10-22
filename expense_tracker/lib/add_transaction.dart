import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'bottom_navigation_bar.dart';

class AddTransaction extends StatefulWidget {
  const AddTransaction({super.key});

  @override
  State<AddTransaction> createState() => _AddTransactionState();
}

class _AddTransactionState extends State<AddTransaction> {
  final TextEditingController titleController = TextEditingController();

  final TextEditingController amountController = TextEditingController();

  final TextEditingController notesController = TextEditingController();

  final FirebaseFirestore firestore = FirebaseFirestore.instance;

  String? selectedCategory;
  String? selectedType;
  DateTime? selectedDate;

  bool isLoading = false;

  final List<String> categories = [
    'Food',
    'Shopping',
    'Travel',
    'Salary',
    'Bills',
    'Education',
    'Health',
    'Other',
    'Test',
  ];

  @override
  void dispose() {
    titleController.dispose();
    amountController.dispose();
    notesController.dispose();

    super.dispose();
  }

  // Date Picker
  Future<void> selectTransactionDate() async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: selectedDate ?? DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
    );

    if (pickedDate != null && mounted) {
      setState(() {
        selectedDate = pickedDate;
      });
    }
  }

  // Save Transaction to Firestore
  Future<void> addTransaction() async {
    // 1. Title validation
    final String title = titleController.text.trim();

    if (title.isEmpty) {
      showMessage('Please enter title');
      return;
    }

    // 2. Amount validation
    final String amountText = amountController.text.trim();

    final double? amount = double.tryParse(amountText);

    if (amount == null || !amount.isFinite || amount <= 0) {
      showMessage('Please enter a valid amount');
      return;
    }

    // 3. Category validation
    if (selectedCategory == null) {
      showMessage('Please select category');
      return;
    }

    // 4. Type validation
    if (selectedType == null) {
      showMessage('Please select Income or Expense');
      return;
    }

    // 5. Date validation
    if (selectedDate == null) {
      showMessage('Please select date');
      return;
    }

    if (isLoading) return;

    setState(() {
      isLoading = true;
    });

    try {
      // Data to be saved
      final Map<String, dynamic> transactionData = {
        'title': title,
        'amount': amount,
        'category': selectedCategory,
        'type': selectedType,
        'date': Timestamp.fromDate(selectedDate!),
        'notes': notesController.text.trim(),
        'createdAt': FieldValue.serverTimestamp(),
      };

      // Save data to Firestore
      await firestore.collection('transactions').add(transactionData);

      await firestore.collection("TransectionData").add(transactionData);

      if (!mounted) return;

      showMessage('Transaction added successfully!');

      // Clear form after successful save
      titleController.clear();
      amountController.clear();
      notesController.clear();

      setState(() {
        selectedCategory = null;
        selectedType = null;
        selectedDate = null;
      });
    } on FirebaseException catch (e) {
      if (!mounted) return;

      showMessage('Firebase Error: ${e.message ?? e.code}');
    } catch (e) {
      if (!mounted) return;

      showMessage('Something went wrong: $e');
    } finally {
      if (mounted) {
        setState(() {
          isLoading = false;
        });
      }
    }
  }

  // Snackbar
  void showMessage(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message), behavior: SnackBarBehavior.floating),
    );
  }

  // Income / Expense Selection Card
  Widget buildTypeCard({
    required String type,
    required IconData icon,
    required Color color,
  }) {
    final bool isSelected = selectedType == type;

    return Expanded(
      child: InkWell(
        onTap: () {
          setState(() {
            selectedType = type;
          });
        },
        borderRadius: BorderRadius.circular(10),
        child: Container(
          height: 75,
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: isSelected ? color : Colors.white,
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: color, width: 1.5),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(icon, color: isSelected ? Colors.white : color),
              const SizedBox(width: 8),
              Flexible(
                child: Text(
                  type,
                  style: TextStyle(
                    color: isSelected ? Colors.white : color,
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => Navigation()),
            );
          },
        ),
        title: const Text(
          'Add Transaction',
          style: TextStyle(
            color: Colors.black,
            fontSize: 25,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),

      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Title
              const Text(
                'Title',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),

              const SizedBox(height: 8),

              TextField(
                controller: titleController,
                textCapitalization: TextCapitalization.sentences,
                decoration: InputDecoration(
                  prefixIcon: const Icon(Icons.description_outlined),
                  hintText: 'Enter Title',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),

              const SizedBox(height: 18),

              // Amount
              const Text(
                'Amount',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),

              const SizedBox(height: 8),

              TextField(
                controller: amountController,
                keyboardType: const TextInputType.numberWithOptions(
                  decimal: true,
                ),
                decoration: InputDecoration(
                  prefixIcon: const Icon(Icons.currency_rupee),
                  hintText: 'Enter Amount',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),

              const SizedBox(height: 18),

              // Category
              const Text(
                'Category',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),

              const SizedBox(height: 8),

              DropdownButtonFormField<String>(
                initialValue: selectedCategory,
                decoration: InputDecoration(
                  prefixIcon: const Icon(Icons.grid_view_rounded),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                hint: const Text('Select Category'),
                items: categories.map((category) {
                  return DropdownMenuItem<String>(
                    value: category,
                    child: Text(category),
                  );
                }).toList(),
                onChanged: (value) {
                  setState(() {
                    selectedCategory = value;
                  });
                },
              ),

              const SizedBox(height: 18),

              // Transaction Type
              const Text(
                'Type',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),

              const SizedBox(height: 8),

              Row(
                children: [
                  buildTypeCard(
                    type: 'Income',
                    icon: Icons.add_circle_outline,
                    color: Colors.green,
                  ),

                  const SizedBox(width: 12),

                  buildTypeCard(
                    type: 'Expense',
                    icon: Icons.remove_circle_outline,
                    color: Colors.red,
                  ),
                ],
              ),

              const SizedBox(height: 18),

              // Date
              const Text(
                'Date',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),

              const SizedBox(height: 8),

              InkWell(
                onTap: selectTransactionDate,
                child: InputDecorator(
                  decoration: InputDecoration(
                    prefixIcon: const Icon(Icons.calendar_month),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: Text(
                    selectedDate == null
                        ? 'Select Date'
                        : '${selectedDate!.day}/'
                              '${selectedDate!.month}/'
                              '${selectedDate!.year}',
                  ),
                ),
              ),

              const SizedBox(height: 18),

              // Notes - Optional
              const Text(
                'Note (Optional)',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),

              const SizedBox(height: 8),

              TextField(
                controller: notesController,
                maxLines: 3,
                decoration: InputDecoration(
                  prefixIcon: const Icon(Icons.note_rounded),
                  hintText: 'Write Note',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),

              const SizedBox(height: 28),

              // Add Transaction Button
              SizedBox(
                width: double.infinity,
                height: 52,
                child: ElevatedButton(
                  onPressed: isLoading ? null : addTransaction,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green,
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: isLoading
                      ? const SizedBox(
                          height: 24,
                          width: 24,
                          child: CircularProgressIndicator(
                            color: Colors.white,
                            strokeWidth: 2,
                          ),
                        )
                      : const Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.add_circle_outline),
                            SizedBox(width: 10),
                            Text(
                              'Add Transaction',
                              style: TextStyle(
                                fontSize: 17,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

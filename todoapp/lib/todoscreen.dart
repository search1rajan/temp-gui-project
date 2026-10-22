import 'package:flutter/material.dart';

class Todoscreen extends StatefulWidget {
  const Todoscreen({super.key});

  @override
  State<Todoscreen> createState() => _TodoscreenState();
}

class _TodoscreenState extends State<Todoscreen> {
  // =========================
  // TASK LIST - OUR STATE
  // =========================

  List<Map<String, dynamic>> tasks = [
    {
      "title": "Learn Flutter",
      "description": "Complete Stateful Widget",
      "priority": "High",
      "completed": false,
    },
    {
      "title": "Create UI Design",
      "description": "Design Todo App screen",
      "priority": "Low",
      "completed": true,
    },
    {
      "title": "Practice Dart",
      "description": "Practice List and Map",
      "priority": "Medium",
      "completed": false,
    },
  ];

  // =========================
  // COMPLETE TASK
  // =========================

  void toggleTask(int index) {
    setState(() {
      tasks[index]["completed"] = !tasks[index]["completed"];
    });
  }

  // =========================
  // DELETE TASK
  // =========================

  void deleteTask(int index) {
    setState(() {
      tasks.removeAt(index);
    });

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text("Task deleted"),
        duration: Duration(seconds: 1),
      ),
    );
  }

  void showAddTaskDialog() {
    final titleController = TextEditingController();
    final descriptionController = TextEditingController();


    String selectedPriority = "Low"; 


    showDialog(
      context: context,
      builder: (BuildContext context) {
        return StatefulBuilder(
          builder: (context, setDialogState) {
            return AlertDialog(
              title: const Text("Add New Task"),

          

              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: const Text("Cancel"),
                ),
                ElevatedButton(
                  onPressed: () {
                    String title = titleController.text.trim();
                    String description = descriptionController.text.trim();

                    if (title.isNotEmpty && description.isNotEmpty) {
                      setState(() {
                        tasks.add({
                          "title": title,
                          "description": description,
                          "priority": selectedPriority,
                          "completed": false,
                        });
                      });

                      Navigator.of(context).pop();
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text("Please fill all fields")),
                      );
                    }
                  },
                  child: const Text("Add Task"),
                ),
              ],
              content:SingleChildScrollView(

              child:Column(
                mainAxisSize:MainAxisSize.min,
                children:[

                  TextField(
                    controller: titleController,
                    decoration: const InputDecoration(
                      labelText: "Task Title",
                      hintText: "Enter task title",
                      prefixIcon: Icon(Icons.task_alt),
                      border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(12))),
                    ),
                  ), 

                  const SizedBox(height: 10),

                  TextField(
                    controller: descriptionController,
                    maxLines: 3,
                    decoration: const InputDecoration(
                      labelText: "Task Description",
                      hintText: "Enter task description",
                      prefixIcon: Icon(Icons.description),
                      border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(12))),
                    ),
                  ),

                  const SizedBox(height: 10),

                  DropdownButtonFormField<String>(
                    initialValue: selectedPriority,
                    items: const [
                      DropdownMenuItem(value: "Low", child: Text("Low")),
                      DropdownMenuItem(value: "Medium", child: Text("Medium")),
                      DropdownMenuItem(value: "High", child: Text("High")),
                    ],
                    onChanged: (value) {
                      setDialogState(() {
                        selectedPriority = value!;
                      });
                    },
                    decoration: const InputDecoration(
                      labelText: "Priority",
                      prefixIcon: Icon(Icons.priority_high),
                      border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(12))),
                    ),
                  ),  

                
                ]
              ),

              

              
              )
            );
          },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    // Total tasks
    int totalTasks = tasks.length;

    // Completed tasks
    int completedTasks = tasks
        .where((task) => task["completed"] == true)
        .length;

    // Pending tasks
    int pendingTasks = totalTasks - completedTasks;

    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            // ==================================
            // HEADER
            // ==================================

            Padding(
              padding: const EdgeInsets.fromLTRB(20, 20, 20, 10),
              child: Row(
                children: [
                  // Profile Icon
                  Container(
                    height: 48,
                    width: 48,
                    decoration: BoxDecoration(
                      color: Colors.indigo,
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: const Icon(
                      Icons.check_rounded,
                      color: Colors.white,
                      size: 28,
                    ),
                  ),

                  const SizedBox(width: 12),

                  // Title
                  const Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "My Tasks",
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 3),
                        Text(
                          "Stay organized, stay productive",
                          style: TextStyle(color: Colors.grey, fontSize: 13),
                        ),
                      ],
                    ),
                  ),

                  // Notification
                  Container(
                    height: 45,
                    width: 45,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(14),
                      border: Border.all(color: Colors.grey.shade200),
                    ),
                    child: const Icon(
                      Icons.notifications_none_rounded,
                      color: Colors.black87,
                    ),
                  ),
                ],
              ),
            ),

            // ==================================
            // STATISTICS
            // ==================================
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Row(
                children: [
                  Expanded(
                    child: statCard(
                      title: "Total",
                      value: totalTasks.toString(),
                      icon: Icons.list_alt_rounded,
                      iconColor: Colors.indigo,
                    ),
                  ),

                  const SizedBox(width: 10),

                  Expanded(
                    child: statCard(
                      title: "Completed",
                      value: completedTasks.toString(),
                      icon: Icons.check_circle_outline_rounded,
                      iconColor: Colors.green,
                    ),
                  ),

                  const SizedBox(width: 10),

                  Expanded(
                    child: statCard(
                      title: "Pending",
                      value: pendingTasks.toString(),
                      icon: Icons.access_time_rounded,
                      iconColor: Colors.orange,
                    ),
                  ),
                ],
              ),
            ),

            // ==================================
            // SEARCH BAR
            // ==================================
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 5, 20, 15),
              child: Container(
                height: 52,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(color: Colors.grey.shade200),
                ),
                child: const TextField(
                  decoration: InputDecoration(
                    hintText: "Search tasks...",
                    hintStyle: TextStyle(color: Colors.grey),
                    prefixIcon: Icon(Icons.search_rounded, color: Colors.grey),
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.symmetric(vertical: 15),
                  ),
                ),
              ),
            ),

            // ==================================
            // TITLE
            // ==================================
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                children: [
                  const Text(
                    "Today's Tasks",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),

                  const Spacer(),

                  Text(
                    "$totalTasks Tasks",
                    style: const TextStyle(color: Colors.grey, fontSize: 13),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 10),

            // ==================================
            // TASK LIST
            // ==================================
            Expanded(
              child: tasks.isEmpty
                  ? const Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.task_alt_rounded,
                            size: 70,
                            color: Colors.grey,
                          ),

                          SizedBox(height: 15),

                          Text(
                            "No tasks available",
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),

                          SizedBox(height: 5),

                          Text(
                            "Add a new task to get started",
                            style: TextStyle(color: Colors.grey),
                          ),
                        ],
                      ),
                    )
                  : ListView.builder(
                      padding: const EdgeInsets.fromLTRB(20, 5, 20, 100),
                      itemCount: tasks.length,
                      itemBuilder: (context, index) {
                        final task = tasks[index];

                        return taskCard(
                          index: index,
                          title: task["title"],
                          description: task["description"],
                          priority: task["priority"],
                          completed: task["completed"],
                        );
                      },
                    ),
            ),
          ],
        ),
      ),

      // ==================================
      // ADD BUTTON
      // ==================================
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.indigo,
        foregroundColor: Colors.white,
        elevation: 4,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18)),
        onPressed: () {
          // Next step mein Add Task Screen open karenge

          showAddTaskDialog();

          // ScaffoldMessenger.of(context).showSnackBar(
          //   const SnackBar(content: Text("Add Task screen coming next")),
          // );
        },
        child: const Icon(Icons.add_rounded, size: 30),
      ),
    );
  }

  // ==================================
  // STAT CARD
  // ==================================

  Widget statCard({
    required String title,
    required String value,
    required IconData icon,
    required Color iconColor,
  }) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.grey.shade200),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, color: iconColor, size: 23),

          const SizedBox(height: 8),

          Text(
            value,
            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),

          const SizedBox(height: 2),

          Text(title, style: const TextStyle(fontSize: 11, color: Colors.grey)),
        ],
      ),
    );
  }

  // ==================================
  // TASK CARD
  // ==================================

  Widget taskCard({
    required int index,
    required String title,
    required String description,
    required String priority,
    required bool completed,
  }) {
    Color priorityColor;

    if (priority == "High") {
      priorityColor = Colors.red;
    } else if (priority == "Medium") {
      priorityColor = Colors.orange;
    } else {
      priorityColor = Colors.green;
    }

    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),
        border: Border.all(color: Colors.grey.shade200),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // ==================================
          // CHECKBOX
          // ==================================

          GestureDetector(
            onTap: () {
              toggleTask(index);
            },
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 200),
              height: 25,
              width: 25,
              decoration: BoxDecoration(
                color: completed ? Colors.indigo : Colors.transparent,
                borderRadius: BorderRadius.circular(8),
                border: Border.all(
                  color: completed ? Colors.indigo : Colors.grey,
                  width: 2,
                ),
              ),
              child: completed
                  ? const Icon(Icons.check, size: 17, color: Colors.white)
                  : null,
            ),
          ),

          const SizedBox(width: 12),

          // ==================================
          // TASK DETAILS
          // ==================================
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    decoration: completed
                        ? TextDecoration.lineThrough
                        : TextDecoration.none,
                    color: completed ? Colors.grey : Colors.black87,
                  ),
                ),

                const SizedBox(height: 5),

                Text(
                  description,
                  style: TextStyle(
                    fontSize: 13,
                    color: completed
                        ? Colors.grey.shade400
                        : Colors.grey.shade600,
                  ),
                ),

                const SizedBox(height: 10),

                Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 9,
                        vertical: 5,
                      ),
                      decoration: BoxDecoration(
                        color: priorityColor.withValues(alpha: 0.1),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Text(
                        priority,
                        style: TextStyle(
                          fontSize: 11,
                          fontWeight: FontWeight.w600,
                          color: priorityColor,
                        ),
                      ),
                    ),

                    const SizedBox(width: 8),

                    Icon(
                      Icons.calendar_today_outlined,
                      size: 13,
                      color: Colors.grey.shade500,
                    ),

                    const SizedBox(width: 4),

                    Text(
                      completed ? "Completed" : "Today",
                      style: TextStyle(
                        fontSize: 11,
                        color: Colors.grey.shade500,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),

          // ==================================
          // DELETE BUTTON
          // ==================================
          IconButton(
            onPressed: () {
              deleteTask(index);
            },
            icon: const Icon(Icons.delete_outline_rounded, color: Colors.grey),
          ),
        ],
      ),
    );
  }
}

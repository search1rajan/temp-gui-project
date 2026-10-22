import 'package:flutter/material.dart';

import 'mathmatical_logic.dart';

class Calculator extends StatefulWidget {
  const Calculator({super.key});
  @override
  State<Calculator> createState() => _Calculator();
}

class _Calculator extends State<Calculator> {
  final TextEditingController displayController = TextEditingController();
  final MathmaticalLogic logic = MathmaticalLogic();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.white70,
        title: Text(
          'Calculator',
          style: TextStyle(
            color: Colors.black,
            fontSize: 30,
            fontFamily: "Times New Roman",
          ),
        ),
      ),

      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsets.only(left: 20, right: 20),

              // yaha par  text field banaya hu
              child: TextField(
                controller: displayController,
                readOnly: true,

                textAlign: TextAlign.right,
                style: TextStyle(color: Colors.black, fontSize: 35),
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  focusedBorder: ShapedInputBorder(shape: CircleBorder()),
                ),
              ),
            ),
            SizedBox(height: 20),

            // yaha per button banaya hu clickable
            SizedBox(
              width: 330,

              child: GridView.count(
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                crossAxisCount: 4,
                shrinkWrap: true,
                children: [
                  // buttons
                  ElevatedButton(
                    onPressed: () {
                      displayController.clear();
                    },
                    child: Text(
                      "C",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 30,
                        fontFamily: "Times New Roman",
                      ),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      if (displayController.text.isNotEmpty) {
                        displayController.text = displayController.text
                            .substring(0, displayController.text.length - 1);
                      }
                    },
                    child: Text(
                      "«",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 30,
                        fontFamily: "Times New Roman",
                      ),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      if (displayController.text.isNotEmpty) {
                        displayController.text = displayController.text
                            .substring(0, displayController.text.length - 2);
                      }
                    },
                    child: Text(
                      "db",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                        fontFamily: "Times New Roman",
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      displayController.text += "/";
                    },

                    child: Text(
                      "/",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 30,
                        fontFamily: "Times New Roman",
                      ),
                    ),
                  ),

                  ElevatedButton(
                    onPressed: () {
                      displayController.text += "7";
                    },

                    child: Text(
                      "7",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 30,
                        fontFamily: "Times New Roman",
                      ),
                    ),
                  ),

                  ElevatedButton(
                    onPressed: () {
                      displayController.text += "8";
                    },
                    child: Text(
                      "8",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 30,
                        fontFamily: "Times New Roman",
                      ),
                    ),
                  ),

                  ElevatedButton(
                    onPressed: () {
                      displayController.text += "9";
                    },
                    child: Text(
                      "9",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 30,
                        fontFamily: "Times New Roman",
                      ),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      displayController.text += "×";
                    },
                    child: Text(
                      "×",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 30,
                        fontFamily: "Times New Roman",
                      ),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      displayController.text += "4";
                    },
                    child: Text(
                      "4",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 30,
                        fontFamily: "Times New Roman",
                      ),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      displayController.text += "5";
                    },
                    child: Text(
                      "5",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 30,
                        fontFamily: "Times New Roman",
                      ),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      displayController.text += "6";
                    },
                    child: Text(
                      "6",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 30,
                        fontFamily: "Times New Roman",
                      ),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      displayController.text += "-";
                    },
                    child: Text(
                      "-",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 30,
                        fontFamily: "Times New Roman",
                      ),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      displayController.text += "3";
                    },
                    child: Text(
                      "3",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 30,
                        fontFamily: "Times New Roman",
                      ),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      displayController.text += "2";
                    },
                    child: Text(
                      "2",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 30,
                        fontFamily: "Times New Roman",
                      ),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      displayController.text += "1";
                    },
                    child: Text(
                      "1",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 30,
                        fontFamily: "Times New Roman",
                      ),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      displayController.text += "+";
                    },

                    child: Text(
                      "+",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 30,
                        fontFamily: "Times New Roman",
                      ),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      displayController.text += "%";
                    },
                    child: Text(
                      "%",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 30,
                        fontFamily: "Times New Roman",
                      ),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      displayController.text += "0";
                    },
                    child: Text(
                      "0",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 30,
                        fontFamily: "Times New Roman",
                      ),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      displayController.text += ".";
                    },
                    child: Text(
                      ".",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 30,
                        fontFamily: "Times New Roman",
                      ),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      String expression = displayController.text;

                      if (expression.contains('+')) {
                        double result = logic.add(expression);
                        displayController.text = result.toString();
                      } else if (expression.contains('-')) {
                        double result = logic.sub(expression);
                        displayController.text = result.toString();
                      }
                      
                    },
                    child: Text(
                      "=",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 30,
                        fontFamily: "Times New Roman",
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

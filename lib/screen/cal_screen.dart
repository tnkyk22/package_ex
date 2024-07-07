import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class CalculationScreen extends StatefulWidget {
  const CalculationScreen({Key? key}) : super(key: key);

  @override
  State<CalculationScreen> createState() => _CalculationScreenState();
}

class _CalculationScreenState extends State<CalculationScreen> {
  double loanAmount = 0;
  double interestRate = 0;
  double result = 0;
  void calculate() {
    setState(
      () {
        result = loanAmount + (loanAmount * interestRate) / 100;
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('คำนวณ'),
      ),
      body: Container(
        child: Padding(
          padding: const EdgeInsets.all(60),
          child: Column(
            children: [
              Text("จำนวนเงินที่ต้องจ่าย ${result.toStringAsFixed(2)} บาท"),
              Form(
                child: Column(
                  children: [
                    TextFormField(
                      decoration: InputDecoration(
                        labelText: "วงเงินกู้",
                      ),
                      onChanged: (value) {
                        loanAmount = double.parse(value);
                      },
                      keyboardType: TextInputType.number,
                    ),
                    TextFormField(
                      decoration: InputDecoration(
                        labelText: "อัตราดอกเบี้ย (%)",
                      ),
                      onChanged: (value) {
                        interestRate = double.parse(value);
                      },
                      keyboardType: TextInputType.number,
                    ),
                    SizedBox(height: 20),
                    ElevatedButton.icon(
                      onPressed: () {
                        calculate();
                      },
                      icon: const Icon(Icons.calculate),
                      label: const Text('คำนวณ'),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

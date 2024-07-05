import 'package:flutter/material.dart';
import 'package:flutter_database/models/TransactionItem.dart';
import 'package:flutter_database/providers/TransactionProvider.dart';
import 'package:provider/provider.dart';

class FormScreen extends StatefulWidget {
  const FormScreen({super.key});

  @override
  State<FormScreen> createState() => _FormScreenState();
}

class _FormScreenState extends State<FormScreen> {
  final formKey = GlobalKey<FormState>();

  final nameController = TextEditingController();
  final amountController = TextEditingController();
  final benefittController = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text("Input"),
        
      ),
      body: Form(
        key: formKey,
        child: Column(
          children: [
            TextFormField(
              decoration: const InputDecoration(label: Text("รายชื่ออุปกรณ์ครัว")),
              autofocus: true,
              validator: (str) {
                if(str!.isEmpty){
                  return "กรุณาใส่ชื่ออุปกรณ์ครัว";
                }
                return null;
              },
              controller: nameController,
            ),
            TextFormField(
              decoration: const InputDecoration(label: Text("จำนวนชิ้น")),
              keyboardType: TextInputType.number,
              validator: (value) {
                try{
                  if(value!.isNotEmpty){
                    if(double.parse(value) >= 0){
                      return null;
                    }
                  }throw();
                }catch(e){
                  return "กรุณาใส่จำนวนชิ้นที่มี";
                }
              },
              controller: amountController,
            ),
            TextFormField(
              decoration: const InputDecoration(label: Text("ประโยชน์ของอุปกรณ์")),
              autofocus: true,
              validator: (str) {
                if(str!.isEmpty){
                  return "กรุณาใส่ประโยชน์ของอุปกรณ์";
                }
                return null;
              },
              controller: benefittController,
            ),
            TextButton(
              onPressed: (){
                if(formKey.currentState!.validate()){


                  //สร้าง ข้อมูล สำหรับ provider
                  TransactionItem transaction = TransactionItem(name: nameController.text, amount: double.parse(amountController.text), benefit: benefittController.text);
                  print("${transaction.name} ${transaction.amount} ${transaction.benefit}");

                  //ส่งข้อมูลให้ provider
                  var provider = Provider.of<TransactionProvider>(context, listen: false);
                  provider.addTransaction(transaction);

                  Navigator.pop(context);
                }
              }, 
              child: Text("เพิ่มข้อมูล", style: TextStyle(color: const Color.fromARGB(255, 245, 10, 10)),),
              
            )
          ],
        ),
      ),
      );
  }
}
import 'package:db_miner/db_miner/db_helper/db_miner_helper.dart';
import 'package:db_miner/db_miner/model/quotes_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import '../controller/db_miner_controller.dart';

class AddScreen extends StatefulWidget {
  const AddScreen({Key? key}) : super(key: key);

  @override
  State<AddScreen> createState() => _AddScreenState();
}

class _AddScreenState extends State<AddScreen> {

  DBMinerController controller=Get.put(DBMinerController());

  TextEditingController txtQuoets=TextEditingController();
  TextEditingController txtName=TextEditingController();
  TextEditingController txtImage=TextEditingController();
  TextEditingController txtCategory=TextEditingController();

  Map m1=Get.arguments;

  @override
  void initState() {
    super.initState();

    if (m1['l1'] == 1){
      txtQuoets=TextEditingController(text: controller.quotesList[m1['index']]['quote']);
      txtCategory=TextEditingController(text: controller.quotesList[m1['index']]['category']);

    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
      appBar: AppBar(centerTitle: true,title: Text("Add Quotes"),),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            const SizedBox(height: 20),
            TextField(
              controller: txtQuoets,
              textInputAction: TextInputAction.newline,
              maxLines: 6,
              decoration: InputDecoration(
                hintText: "Enter your quotes.....",
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15.sp),
                  borderSide: BorderSide(width: 2,color: Colors.purple)
                ),
                label: Text("Quotes",style: TextStyle(color: Colors.purple,fontWeight: FontWeight.w500),),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15.sp),
                  borderSide: BorderSide(width: 2),
                )
              ),
            ),
            SizedBox(height: 10),
            TextField(
              controller: txtCategory,
              decoration: InputDecoration(
                hintText: "Enter category....",
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15.sp),
                  borderSide: BorderSide(width: 2,color: Colors.purple)
                ),
                label: Text("Category",style: TextStyle(color: Colors.purple,fontWeight: FontWeight.w500),),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15.sp),
                  borderSide: BorderSide(width: 2),
                )
              ),
            ),
            SizedBox(height: 10),
            TextField(
              controller: txtName,
              decoration: InputDecoration(
                hintText: "Enter Author name",
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15.sp),
                  borderSide: BorderSide(width: 2,color: Colors.purple)
                ),
                label: Text("Name",style: TextStyle(color: Colors.purple,fontWeight: FontWeight.w500),),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15.sp),
                  borderSide: BorderSide(width: 2),
                )
              ),
            ),
            SizedBox(height: 30),
            InkWell(
              onTap: () {
                if(m1['l1']==0)
                  {
                    QuotesModel q=QuotesModel(
                      category: txtCategory.text,
                      name: txtName.text,
                      quotes: txtQuoets.text);
                    DB_MinerHelper.helper.insert(q);
                  }
                else
                {
                  QuotesModel q = QuotesModel(
                    quotes: controller.quotesList[m1['index']]['quotes'],
                    category: controller.quotesList[m1['index']]['category'],
                    name: controller.quotesList[m1['index']]['category'],
                    id: controller.quotesList[m1['index']]['id'],

                  );
                 // DB_MinerHelper.helper.u
                }
                controller.load();
                Get.offAllNamed('/');
              },
              child: Container(
                height: 30,
                width: 100,
                decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),color: Colors.indigoAccent),
                child: Center(child: Text("Add")),
              ),
            )
          ],
        ),
      ),
    ));
  }
}


// Expanded(
//   child: ListView.builder(itemBuilder: (context, index) {
//     return Container(
//       height: 200,
//       width: 100.w,
//       decoration: BoxDecoration(borderRadius: BorderRadius.circular(30),color: Colors.purpleAccent.shade100),
//       child: Column(
//         children: [
//           Text("${controller.tagList[index].tag}",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),)
//         ],
//       ),
//     );
//   },itemCount: controller.tagList.length),
// )
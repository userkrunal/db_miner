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
  DBMinerController controller = Get.put(DBMinerController());
  var txtkey = GlobalKey<FormState>();

  TextEditingController txtQuoets = TextEditingController();
  TextEditingController txtName = TextEditingController();
  TextEditingController txtImage = TextEditingController();
  TextEditingController txtCategory = TextEditingController();

  Map m1 = Get.arguments;

  @override
  void initState() {
    super.initState();
    controller.load();
    if (m1['l1'] == 1) {
      txtQuoets = TextEditingController(
          text: controller.quotesList[m1['index']]['quote']);
      txtCategory = TextEditingController(
          text: controller.quotesList[m1['index']]['category']);
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Form(
      key: txtkey,
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text("Add Quotes"),
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              const SizedBox(height: 20),
              TextFormField(
                validator: (value) {
                  if (value!.isEmpty) {
                    return "Enter the quotes";
                  }
                },
                controller: txtQuoets,
                textInputAction: TextInputAction.newline,
                maxLines: 6,
                decoration: InputDecoration(
                    hintText: "Enter your quotes.....",
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15.sp),
                        borderSide: BorderSide(width: 2, color: Colors.purple)),
                    label: Text(
                      "Quotes",
                      style: TextStyle(
                          color: Colors.purple, fontWeight: FontWeight.w500),
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15.sp),
                      borderSide: BorderSide(width: 2),
                    )),
              ),
              SizedBox(height: 10),
              // TextFormField(
              //
              //   controller: txtCategory,
              //   decoration: InputDecoration(
              //     hintText: "Enter category....",
              //     focusedBorder: OutlineInputBorder(
              //       borderRadius: BorderRadius.circular(15.sp),
              //       borderSide: BorderSide(width: 2,color: Colors.purple)
              //     ),
              //     label: Text("Category",style: TextStyle(color: Colors.purple,fontWeight: FontWeight.w500),),
              //     border: OutlineInputBorder(
              //       borderRadius: BorderRadius.circular(15.sp),
              //       borderSide: BorderSide(width: 2),
              //     )
              //   ),
              // ),
              SizedBox(height: 10),
              TextFormField(
                validator: (value) {
                  if (value!.isEmpty) {
                    return "Enter the auther";
                  }
                },
                controller: txtName,
                decoration: InputDecoration(
                    hintText: "Enter Author name",
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15.sp),
                        borderSide: BorderSide(width: 2, color: Colors.purple)),
                    label: Text(
                      "Name",
                      style: TextStyle(
                          color: Colors.purple, fontWeight: FontWeight.w500),
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15.sp),
                      borderSide: BorderSide(width: 2),
                    )),
              ),
              SizedBox(height: 30),
              Container(
                height: 6.5.h,
                width: 90.w,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.sp),
                    color: Colors.purpleAccent.shade100),
                child: Obx(
                  () => DropdownButton(
                    dropdownColor: Colors.purpleAccent.shade100,
                    isExpanded: true,
                    value: controller.selectItem.value,
                    underline: SizedBox(),
                    items: controller.categoryList
                        .asMap()
                        .entries
                        .map((e) => DropdownMenuItem(
                              child: Center(
                                  child: Text(
                                "${controller.categoryList[e.key]['category']}",
                                style: TextStyle(
                                    fontSize: 20, color: Colors.white),
                              )),
                              value: controller.categoryList[e.key]['category'],
                            ))
                        .toList(),
                    hint: Text("---------Select--------"),
                    onChanged: (value) {
                      controller.selectItem.value = value as String;
                    },
                  ),
                ),
              ),
              SizedBox(height: 20),
              InkWell(
                onTap: () {
                  // print(
                  //     '==========================================-------${controller.defaultCategoryList}================');
                  if (m1['l1'] == 0) {
                    QuotesModel q = QuotesModel(
                        category: controller.selectItem.value,
                        name: txtName.text,
                        quotes: txtQuoets.text);
                    DB_MinerHelper.helper.insert(q);
                  } else {
                    QuotesModel q = QuotesModel(
                      quotes: controller.quotesList[m1['index']]['quotes'],
                      category:  controller.selectItem.value,
                      name: controller.quotesList[m1['index']]['name'],
                      id: controller.quotesList[m1['index']]['id'],
                    );
                    // DB_MinerHelper.helper.u
                  }
                  controller.load();
                  //controller.selectItem.value='';
                  Get.offAllNamed('/');
                },
                child: Container(
                  height: 30,
                  width: 100,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.purpleAccent.shade200),
                  child: Center(child: Text("Add",style: TextStyle(color: Colors.white),)),
                ),
              )
            ],
          ),
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

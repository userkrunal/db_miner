import 'package:db_miner/db_miner/controller/db_miner_controller.dart';
import 'package:db_miner/db_miner/db_helper/db_miner_helper.dart';
import 'package:db_miner/db_miner/model/quotes_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

class AddCategory extends StatefulWidget {
  const AddCategory({super.key});

  @override
  State<AddCategory> createState() => _AddCategoryState();
}

class _AddCategoryState extends State<AddCategory> {
  TextEditingController txtCategory =TextEditingController();
  TextEditingController txtImage =TextEditingController();
  var txtkey = GlobalKey<FormState>();

  DBMinerController controller=Get.put(DBMinerController());
  Map m1=Get.arguments;
  void initState() {
    super.initState();
    controller.load();
    if (m1['l1'] == 1){
      txtImage=TextEditingController(text: controller.categoryList[m1['index']]['quote']);
      txtCategory=TextEditingController(text: controller.categoryList[m1['index']]['category']);
    }

  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Form(
      key: txtkey,
      child: Scaffold(
        appBar: AppBar(title: Text("Add Category"),centerTitle: true,backgroundColor: Colors.indigoAccent,),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              SizedBox(height: 40),
              TextFormField(
                validator: (value) {
                  if(value!.isEmpty)
                    {
                      return "Enter The Category";
                    }
                },
                controller: txtCategory,
                decoration: InputDecoration(
                    hintText: "Enter category....",
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15.sp),
                        borderSide: BorderSide(width: 2,color: Colors.indigoAccent)
                    ),
                    label: Text("Category",style: TextStyle(color: Colors.indigoAccent,fontWeight: FontWeight.w500),),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15.sp),
                      borderSide: BorderSide(width: 2),
                    )
                ),
              ),
              SizedBox(height: 10),
              TextFormField(
                controller: txtImage,
                decoration: InputDecoration(
                    hintText: "Enter Image....",
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15.sp),
                        borderSide: BorderSide(width: 2,color: Colors.indigoAccent)
                    ),
                    label: Text("Image",style: TextStyle(color: Colors.indigoAccent,fontWeight: FontWeight.w500),),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15.sp),
                      borderSide: BorderSide(width: 2),
                    )
                ),
              ),
              SizedBox(height: 20),
              InkWell(
                onTap: () {
                  if(m1['l1']==0&& txtkey.currentState!.validate())
                  {
                    CategoryModel q=CategoryModel(
                        category: txtCategory.text,
                       );
                    DB_MinerHelper.helper.categoryinsert(model:q);
                  }
                  else
                  {
                    CategoryModel q = CategoryModel(
                      category: controller.categoryList[m1['index']]['category'],
                      id: controller.categoryList[m1['index']]['id'],

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

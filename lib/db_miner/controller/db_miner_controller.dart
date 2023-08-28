import 'dart:typed_data';

import 'package:db_miner/db_miner/db_helper/db_miner_helper.dart';
import 'package:db_miner/db_miner/model/quotes_model.dart';
import 'package:get/get.dart';

class DBMinerController extends GetxController
{
  DB_MinerHelper dbhelper=DB_MinerHelper();

  RxList  categoryList=[].obs;
  RxString selectItem = ''.obs;
  List defaultCategoryList=["Love","Motivation","Sad"];
  RxList quotesList=[

  ].obs;


  List imgList=[
    "assets/bg/img.png",
    "assets/bg/img_1.png",
    "assets/bg/img_2.png",
    "assets/bg/img_3.png",
    "assets/bg/img_4.png",
    "assets/bg/img_5.png",
    "assets/bg/img_6.png",
    "assets/bg/img_7.png",
    "assets/bg/img_8.png",
  ];


  RxInt imgIndex = 3.obs;

  List bgList=[
    "assets/img/img.png",
    "assets/img/img_1.png",
    "assets/img/img_2.png",
    "assets/img/img_3.png",
    "assets/img/img_4.png",
    "assets/img/img_5.png",
    "assets/img/img_6.png",
    "assets/img/img_7.png",
  ];

  RxInt bgIndex=2.obs;

  Uint8List? imgByte;
  RxList<Map> catList = <Map>[

  ].obs;
  Future<void> load()
  async {
    categoryList.value=await dbhelper.categoryread_DB();
    if(categoryList.isNotEmpty)
      {
        selectItem.value=categoryList[0]['category'];
      }
  }


  Future<void> loadcat(category)
  async {
    quotesList.value= await DB_MinerHelper.helper.read_DB(category: category);
  }
}
import 'dart:typed_data';

import 'package:db_miner/db_miner/db_helper/db_miner_helper.dart';
import 'package:db_miner/db_miner/model/quotes_model.dart';
import 'package:get/get.dart';

class DBMinerController extends GetxController
{
  DB_MinerHelper dbhelper=DB_MinerHelper();

  RxList  categoryList=[].obs;
  RxList QuoList=[].obs;
  RxString selectItem = ''.obs;
  List defaultCategoryList=["Love","Motivation","Sad"];
  RxList <QuotesModel>quotesList=<QuotesModel>[

  ].obs;


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
    quotesList.value!=await DB_MinerHelper.helper.read_DB(category: category);
  }
}
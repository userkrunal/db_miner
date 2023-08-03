import 'dart:typed_data';

import 'package:db_miner/db_miner/db_helper/db_miner_helper.dart';
import 'package:db_miner/db_miner/model/quotes_model.dart';
import 'package:get/get.dart';

class DBMinerController extends GetxController
{
  DB_MinerHelper dbhelper=DB_MinerHelper();


  RxList quotesList=[
    {
      "quotes":"“We cannot solve problems with the kind of thinking we employed when we came up with them.”",
      "name":"Albert Einstein",
      "category":"motivational"
    },
    {
      "quotes":"“We cannot solve problems with the kind of thinking we employed when we came up with them.”",
      "name":"Albert Einstein",
      "category":"motivational"
    },
    {
      "quotes":"“We cannot solve problems with the kind of thinking we employed when we came up with them.”",
      "name":"Albert Einstein",
      "category":"motivation"
    },
  ].obs;
  RxList  categoryList=[].obs;

  Uint8List? imgByte;
  RxList<Map> catList = <Map>[

  ].obs;
  Future<void> load()
  async {
    quotesList.value!=await dbhelper.categoryread_DB();
  }


  Future<void> loadcat(category)
  async {
    quotesList.value!=await DB_MinerHelper.helper.read_DB(category: category);
  }
}
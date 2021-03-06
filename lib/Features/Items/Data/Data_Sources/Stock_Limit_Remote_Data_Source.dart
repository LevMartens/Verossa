import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:verossa/Core/Error/Exceptions.dart';
import 'package:meta/meta.dart';
import 'package:shared_preferences/shared_preferences.dart';



import 'package:verossa/Features/Items/Data/Models/Stock_Limit_Model.dart';

abstract class StockLimitRemoteDataSource {

  /// Throws [CacheException] if no data is present.
  Future<StockLimitModel> getStock();

  Future<void> saveStock(Map<int,int> map);
}

const CART_MAP = 'CART_MAP';


class StockLimitRemoteDataSourceImpl implements StockLimitRemoteDataSource {
  final FirebaseFirestore firestore;

  StockLimitRemoteDataSourceImpl({@required this.firestore});

  @override
  Future<StockLimitModel> getStock() async {


    final stockList = await firestore.collection('CurrentStock').get();

    Map<int,int> fsStockLimit;

    if (stockList != null) {

      for (var i in stockList.docs) {
        var a = Map<String, int>.from(i.data());
        fsStockLimit = a.map((a, b) => MapEntry(int.parse(a), b ));

      }

      return Future.value(StockLimitModel.fromFireStore(fsStockLimit));
    } else {
      throw CacheException();
    }
  }

  @override
  Future<void> saveStock(Map<int, int> map) async {

    Map<String,dynamic> linkedHashMap = map.map((a, b) => MapEntry(a.toString(), b as dynamic));
    firestore.collection("CurrentStock").doc('Items').set(linkedHashMap);

  }
}
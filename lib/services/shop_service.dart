import 'package:flutter/foundation.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_app_1/models/shop.dart';

class ShopService with ChangeNotifier {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  List<Shop> _shops = [];

  List<Shop> get shops => _shops;

  Future<void> fetchShops() async {
    try {
      final querySnapshot = await _firestore.collection('shops').get();
      _shops = querySnapshot.docs
          .map((doc) => Shop.fromMap(doc.data(), doc.id))
          .toList();
      notifyListeners();
    } catch (e) {
      if (kDebugMode) {
        print('Error fetching shops: $e');
      }
    }
  }

  Future<void> addShop(Shop shop) async {
    try {
      await _firestore.collection('shops').add(shop.toMap());
      await fetchShops();
    } catch (e) {
      if (kDebugMode) {
        print('Error adding shop: $e');
      }
    }
  }

  Future<void> updateShop(Shop shop) async {
    try {
      await _firestore.collection('shops').doc(shop.id).update(shop.toMap());
      await fetchShops();
    } catch (e) {
      if (kDebugMode) {
        print('Error updating shop: $e');
      }
    }
  }

  int get rentedCount => _shops.where((shop) => shop.isRented).length;
  int get freeCount => _shops.where((shop) => !shop.isRented).length;
}
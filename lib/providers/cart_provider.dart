import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../modles/store_modle.dart';

class CartProvider with ChangeNotifier {
  final List<CourseInCart> _cartItems = [];

  List<CourseInCart> get cartItems => _cartItems;

  CartProvider() {
    _loadCart();
  }

  bool addItem(CourseInCart item) {
    final exists = _cartItems.any((element) => element.id == item.id);
    if (!exists) {
      _cartItems.add(item);
      _saveCart();
      notifyListeners();
      return true;
    }
    return false;
  }

  void removeItem(CourseInCart item) {
    _cartItems.removeWhere((element) => element.id == item.id);
    _saveCart();
    notifyListeners();
  }

  void clearCart() {
    _cartItems.clear();
    _saveCart();
    notifyListeners();
  }

  void checkout(List<Course> allCourses) {
    for (var item in _cartItems) {
      final courseIndex = allCourses.indexWhere((c) => c.id == item.id);
      if (courseIndex != -1) {
        allCourses[courseIndex].soldQuantity += 1;
      }
    }
    clearCart();
  }

  void _saveCart() async {
    final prefs = await SharedPreferences.getInstance();
    final cartData = _cartItems.map((item) => item.toJson()).toList();
    await prefs.setString('cart', jsonEncode(cartData));
  }

  void updateCourseSoldQuantity(Course course) {
    course.soldQuantity += 1;
    notifyListeners();
  }

  void _loadCart() async {
    final prefs = await SharedPreferences.getInstance();
    final cartString = prefs.getString('cart');
    if (cartString != null) {
      final List<CourseInCart> cartData = (jsonDecode(cartString) as List)
          .map((item) => CourseInCart.fromJson(item))
          .toList();
      _cartItems.addAll(cartData);
      notifyListeners();
    }
  }
}

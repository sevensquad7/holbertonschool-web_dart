import 'dart:convert';
import '4-util.dart';

Future<dynamic> calculateTotal() async {
  try {
    var userData = await fetchUserData();
    var jsonUser = jsonDecode(userData);
    var userOrder = await fetchUserOrders(jsonUser["id"]);
    List orderList = jsonDecode(userOrder);
    var orderPrice;
    var price = 0.0;
    for (var i = 0; i < orderList.length; i++) {
      orderPrice = await fetchProductPrice(orderList[i]);
      price += num.parse(orderPrice);
    }
    return price;
  } catch (err) {
    return -1;
  }
}

import 'package:vodiy_petak_alpha_project/controller/LocalMemory.dart';

import '../Server/Api.dart';

class ServerController {
  static sendingOrder() {
    if (LocalMemory.getValue("order_takesDelivary") == "true") {
      Map data = LocalMemory.getOrderDeliveryInfo();

      Api.addOrderForDelivery(data);
    }

    if (LocalMemory.getValue("order_willTakePassenger") == "true") {
      Map data = LocalMemory.getOrderPassengerInfo();

      Api.addOrderForPassenger(data);
    }
  }
}

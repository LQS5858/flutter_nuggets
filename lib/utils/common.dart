import 'package:connectivity/connectivity.dart';
import 'package:flutter_nuggets/store/baseStore.dart';

class Common {
  static checkNetWork() async {
    var connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.mobile ||
        connectivityResult == ConnectivityResult.wifi) {
      return 'netWork';
    } else {
      return 'noNetwork';
    }
  }
}

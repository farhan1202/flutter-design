import 'package:app_design/app/data/models/Candidate.dart';
import 'package:app_design/app/data/providers/authProvider.dart';
import 'package:get/get.dart';

class ListUserController extends GetxController {
  //TODO: Implement ListUserController
  RxList<Datum> candidate = List<Datum>.empty().obs;

  Future<void> getAllCandidate() async {
    candidate.clear();

    var response = await AuthController().getAllCandidate();

    if (response!.data != null) {
      response.data?.forEach((element) {
        candidate.add(element);
      });
      candidate.refresh();
    }
  }
}

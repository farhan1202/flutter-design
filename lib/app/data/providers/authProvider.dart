import 'dart:io';

import 'package:app_design/app/data/models/Candidate.dart';
import 'package:get/get.dart';
import 'package:path/path.dart';

class AuthController extends GetConnect {
  final url = "http://192.168.100.134/pemilu/api/";

  Future<Response> signUp(String noId, String name, String password) {
    final form = FormData(
      {
        'nobp': noId,
        'nama': name,
        'password': password,
      },
    );

    return post(url + 'regUser.php', form);
  }

  Future<Response> signIn(String noId, String password) {
    final form = FormData({
      'nobp': noId,
      'password': password,
    });

    return post(url + 'login.php', form);
  }

  Future<Candidate?> getAllCandidate() async {
    final response = await get(url + "getAllCandidate.php");

    Candidate candidate;
    candidate = Candidate.fromJson(response.body);
    if (candidate.data == null) {
      return null;
    }

    return candidate;
  }

  Future<Response> uploadImage(File file) async {
    try {
      final form = FormData(
          {'image': MultipartFile(file, filename: basename(file.path))});
      final response = await post(url + "addImage.php", form);
      if (response.status.hasError) {
        return Future.error(response.body);
      } else {
        return response;
      }
    } catch (e) {
      return Future.error(e.toString());
    }
  }
}

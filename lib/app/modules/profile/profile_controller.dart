import 'dart:convert';
import 'dart:io';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mahati_mobile/app/core/data/profile_model.dart';
import 'package:mahati_mobile/app/core/network/rest_client.dart';
import 'package:mahati_mobile/app/routes/app_pages.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfileController extends GetxController {
  static ProfileController profileController = Get.find();
  final SharedPreferences _prefs = Get.find<SharedPreferences>();

  final _storage = GetStorage();
  final _picker = ImagePicker();
  RxBool isLoggedIn = false.obs;
  Rx<File?> image = Rx<File?>(null);
  Rx<List<ProfileModel>> profileModel = Rx<List<ProfileModel>>([]);

  late UserModel profileModelObj;
  var username = Rx<String>('');
  var itemCount = 0.obs;
  final storage = GetStorage();

  final List<Map<String, dynamic>> gridMap = [
    {
      "title": "Astro- psychological report",
      "subtitle": "Some short description of this type of report."
    },
    {
      "title": "Astro- psychological report",
      "subtitle": "Some short description of this type of report."
    },
    {
      "title": "Astro- psychological report",
      "subtitle": "Some short description of this type of report."
    },
    {
      "title": "Astro- psychological report",
      "subtitle": "Some short description of this type of report."
    },
    {
      "title": "Astro- psychological report",
      "subtitle": "Some short description of this type of report."
    },
    {
      "title": "Astro- psychological report",
      "subtitle": "Some short description of this type of report."
    },
    {
      "title": "Astro- psychological report",
      "subtitle": "Some short description of this type of report."
    },
    {
      "title": "Astro- psychological report",
      "subtitle": "Some short description of this type of report."
    },
    {
      "title": "Astro- psychological report",
      "subtitle": "Some short description of this type of report."
    },
  ];

  Future<void> pickImage(ImageSource source) async {
    final pickedFile = await _picker.pickImage(source: source);
    if (pickedFile != null) {
      image.value = File(pickedFile.path);
      _storage.write('imagePath', pickedFile.path);
    } else {
      print('No image selected.');
    }
  }

  @override
  void onInit() {
    getUserProfile();
    super.onInit();
    // Load stored image path if available
    String? savedImagePath = _storage.read('imagePath');
    if (savedImagePath != null) {
      image.value = File(savedImagePath);
    }
  }

  void logout() {
    _prefs.remove('user_token');
    Get.offAllNamed(Routes.signin);
  }

  Future<void> getUserProfile() async {
    final token = await getToken();
    final restClient = Get.find<RestClient>();

    final result = await restClient.requestWithToken(
        "/profile", HttpMethod.GET, null, token.toString());

    print(result.body);
    var responseData = UserModel.fromJson(jsonDecode(result.body));
    print(responseData.username);

    username.value = responseData.username;
  }

  addNewProfile(String name, String bio) async {
    profileModelObj = UserModel(
      id: "",
      email: "",
      number: "",
      password: "",
      photo: "",
      // imageFile == null ? imageDefault : imageFile!.path,
      username: "",
    );
    // UserModel.value.add(profileModelObj);
    await storage.write("nama", name);
    itemCount.value = profileModel.value.length;
    storage.write("totalItem", itemCount.value);
  }

  removeProfile(int index) {
    profileModel.value.removeAt(index);
    itemCount.value = profileModel.value.length;
  }

  // pickImageFileFromGallery() async {
  //   try {
  //     imageFile = await ImagePicker().pickImage(source: ImageSource.gallery);

  //     if (imageFile != null) {
  //       Get.snackbar("Profile Image", "Berhasil upload image dari gallery");
  //     }

  //     pickFile = Rx<File?>(File(imageFile!.path));
  //   } catch (err) {
  //     Get.snackbar("Profile Image", "anda tidak memilih gambar!");
  //   }
  // }

  // pickImageFileFromCamera() async {
  //   try {
  //     imageFile = await ImagePicker().pickImage(source: ImageSource.camera);

  //     if (imageFile != null) {
  //       Get.snackbar("Profile Image", "Berhasil upload image dari kamera");
  //     }

  //     // pickFile = Rx<File?>(File(imageFile!.path));
  //   } catch (err) {
  //     Get.snackbar("Profile Image", "anda tidak memilih gambar!");
  //   }
  // }

  Future<String?> getToken() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString('authToken');
  }
}

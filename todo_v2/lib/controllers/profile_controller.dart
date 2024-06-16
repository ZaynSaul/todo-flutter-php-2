import 'dart:convert';
import 'dart:io';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:logger/logger.dart';
import 'package:open_file/open_file.dart';
import 'package:todo_v2/core/constants/app_colors.dart';
import 'package:todo_v2/core/services/api_service_client.dart';
import 'package:todo_v2/core/services/global_services.dart';
import 'package:todo_v2/model/user_model.dart';
import 'package:todo_v2/screens/change_profile.dart';

import '../core/services/message.alert.dart';

class ProfileController extends GetxController {
  static ProfileController get instance => Get.find();

  final localStorage = GetStorage();

  late Map<String, dynamic> jsonData;

  Rx<File?> selectedImage = Rx<File?>(null);
  final Rx<String> imageData = "".obs;
  final Rx<String> profileName = "".obs;

  final ImagePicker _imagePicker = ImagePicker();

  final userData =
      UserModel(id: '', name: '', email: '', password: '', profile: '').obs;

  final logger = Logger();

  @override
  void onInit() {
    super.onInit();

    _fetchUser();
  }

  Future<void> _fetchUser() async {
    final localStorage = GetStorage();
    try {
      final userId = localStorage.read('userId');

      final Map<String, String> data = {
        "id": userId,
      };

      HttpResponse response = await ApiServicesClient().post(
        endpoint: showProfileEndPoint,
        data: data,
      );

      final responseData = await json.decode(response.body);

      printInfo(info: 'User details: ${responseData["data"]}');
      if (responseData['status'] == 'success') {
        userData.value =
            UserModel.fromJson(responseData['data'] as Map<String, dynamic>);
      } else if (responseData['status'] == 'error') {
        MessageAlert.errorSnackBar(responseData['message']);
      }
    } catch (e) {
      logger.e(e);
    }
  }

  // Pick image from gallery
  Future<void> pickImageFromGallery() async {
    final XFile? image = await _imagePicker.pickImage(
      source: ImageSource.gallery,
      imageQuality: 50,
    );
    if (image != null) {
      _cropImage(image);
    }
  }

  // Pick image from camera
  Future<void> pickImageFromCamera() async {
    final XFile? image = await _imagePicker.pickImage(
      source: ImageSource.camera,
      imageQuality: 50,
    );
    if (image != null) {
      _cropImage(image);
    }
  }

  // Crop the selected image
  Future<void> _cropImage(XFile image) async {
    final croppedFile = await ImageCropper().cropImage(
      sourcePath: image.path,
      aspectRatioPresets: [
        CropAspectRatioPreset.square,
        CropAspectRatioPreset.ratio3x2,
        CropAspectRatioPreset.original,
        CropAspectRatioPreset.ratio4x3,
        CropAspectRatioPreset.ratio16x9,
      ],
      uiSettings: [
        AndroidUiSettings(
          toolbarTitle: 'Crop Image',
          toolbarColor: TAppColors.secondaryColor,
          toolbarWidgetColor: TAppColors.primaryColor,
          backgroundColor: TAppColors.lightColor,
          initAspectRatio: CropAspectRatioPreset.original,
          lockAspectRatio: false,
        ),
        IOSUiSettings(
          title: 'Crop Image',
          showCancelConfirmationDialog: true,
          showActivitySheetOnDone: true,
          cancelButtonTitle: "Cancel",
          doneButtonTitle: "Done",
          minimumAspectRatio: 1.0,
        ),
      ],
    );
    if (croppedFile != null) {
      _setImageData(File(croppedFile.path));
    }
  }

  // Set image data
  void _setImageData(File image) {
    selectedImage.value = image;
    imageData.value = base64Encode(image.readAsBytesSync());
    profileName.value = image.path.split('/').last;
  }

  // Upload profile image
  Future<void> uploadProfile() async {
    try {
      final localStorage = GetStorage();
      final userId = localStorage.read('userId');

      final Map<String, String> data = {
        "profile": profileName.value,
        "profileData": imageData.value,
        "user_id": userId,
      };

      HttpResponse response = await ApiServicesClient().post(
        endpoint: uploadEndPoint,
        data: data,
      );

      final responseData = await json.decode(response.body);
      if (responseData['status'] == 'success') {
        Get.to(() => const ChangeProfile());
        _fetchUser();
        MessageAlert.showSuccessMessage(responseData['message']);
      } else if (responseData['status'] == 'error') {
        MessageAlert.errorSnackBar(responseData['message']);
      }
    } catch (e) {
      logger.e(e);
    }
  }

  // Open a file
  void openFile(XFile file) async {
    await OpenFile.open(file.path);
  }
}

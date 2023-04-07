import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:leukemia_detection/view/widgets/custom_text_form.dart';
import 'package:sizer/sizer.dart';
import 'package:tflite/tflite.dart';
import '../resources/color_manager.dart';

class TestScreen extends StatefulWidget {
  TestScreen({Key? key}) : super(key: key);

  @override
  State<TestScreen> createState() => _TestScreenState();
}

bool _loading = true;
File? _image;
List? _output;
final picker = ImagePicker();

class _TestScreenState extends State<TestScreen> {

  TextEditingController nameCtrl = TextEditingController();
  TextEditingController ageCtrl = TextEditingController();
  TextEditingController dateCtrl = TextEditingController();
  TextEditingController timeCtrl = TextEditingController();
  String? gender;

  @override
  void initState() {
    super.initState();
    loadModel().then((value) {
      setState(() {});
    });
  }

  @override
  void dispose() {
    super.dispose();
    Tflite.close();
  }

  classifyImage(File image) async {
    var output = await Tflite.runModelOnImage(
      path: image.path,
    );
    setState(() {
      _output = output;
      _loading = false;
    });
  }

  loadModel() async {
    await Tflite.loadModel(
        model: "assets/converted_model.tflite", labels: "assets/New_Text_Document.txt");
  }

  pickImageFromGallery() async {
    var image = await picker.getImage(source: ImageSource.gallery);
    if (image == null) return null;
    setState(() {
      _image = File(image.path);
    });
    classifyImage(_image!);
  }

  // void openFiles() async{
  //   FilePickerResult? resultFile = await FilePicker.platform.pickFiles();
  //   if(resultFile != null && resultFile.files.single.path!= null){
  //     PlatformFile file = resultFile.files.first;
  //     print(file.name);
  //     print(file.bytes);
  //     print(file.extension);
  //     print(file.path);
  //   }
  // }

  // pickImageFromCamera() async {
  //   var image = await picker.getImage(source: ImageSource.camera);
  //   if (image == null) return null;
  //   setState(() {
  //     image = File(_image.path) as PickedFile?;
  //   });
  //   classifyImage(image! as File);
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Test"),
        titleSpacing: 10.w,
        automaticallyImplyLeading: false,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 2.h),
          child: Column(
            children: [

              Text("Patient information",
                style: TextStyle(
                  color: ColorManager.primaryColor,
                  fontWeight: FontWeight.w500,
                  fontSize: 16.sp
                )
              ),

              SizedBox(height: 2.5.h,),

              CustomTextField(fieldCtrl: nameCtrl, fieldHint: "Patient name", keyBoardType: TextInputType.name, onlyRead: false),

              SizedBox(height: 2.5.h,),

              CustomTextField(fieldCtrl: ageCtrl, fieldHint: "Patient age", keyBoardType: TextInputType.number, onlyRead: false),

              SizedBox(height: 2.5.h,),

              RadioListTile(
                activeColor: ColorManager.secondaryColor,
                title: Text("Male"),
                value: "male",
                groupValue: gender,
                onChanged: (value){
                  setState(() {
                    gender = value.toString();
                  });
                },
              ),

              RadioListTile(
                activeColor: ColorManager.secondaryColor,
                title: Text("Female"),
                value: "female",
                groupValue: gender,
                onChanged: (value){
                  setState(() {
                    gender = value.toString();
                  });
                },
              ),

              SizedBox(height: 2.5.h,),

              CustomTextField(
                fieldCtrl: dateCtrl,
                fieldHint: "Test Date",
                onlyRead: true,
                doing: (() {
                  showDatePicker(
                      context: context,
                      initialDate: DateTime.now(), //get today's date
                      firstDate:DateTime(2000), //DateTime.now() - not to allow to choose before today.
                      lastDate: DateTime(2101)
                  ).then((value) {
                    dateCtrl.text =DateFormat.yMMMd().format(value!);
                  });
                  }
                ),
              ),

              SizedBox(height: 2.5.h,),

              CustomTextField(
                fieldCtrl: timeCtrl,
                fieldHint: "Test Time",
                onlyRead: true,
                doing: (() {
                    showTimePicker(context: context, initialTime: TimeOfDay.now()).then((value){
                    timeCtrl.text = value!.format(context).toString();
                    print(value.format(context));
                  });
                }
                ),
              ),

              SizedBox(height: 2.5.h,),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,

                children: [
                  ElevatedButton(
                      onPressed: ()async{
                        pickImageFromGallery();
                      },
                      child: Text("Pick the blood pic", style: TextStyle(fontSize: 12.sp)),
                      style: ElevatedButton.styleFrom(
                        primary: ColorManager.primaryColor,
                        padding: EdgeInsets.all(15),
                        elevation: 3,
                        shape: RoundedRectangleBorder( //to set border radius to button
                            borderRadius: BorderRadius.circular(15)
                        ),
                      )
                  ),
                  _loading
                      ? Text("No file picked", style: TextStyle(fontSize: 10.sp, color: ColorManager.secondaryColor),)
                      : Text("Image picked successfully", style: TextStyle(fontSize: 10.sp, color: Colors.green),)
                ],
              ),

              SizedBox(height: 5.h,),

              Container(
                child: Center(
                  child: _loading == true
                      ? const SizedBox() //show nothing if no picture selected
                      : Column(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(30),
                        child: Image.file(
                          _image!,
                          fit: BoxFit.fill,
                        ),
                      ),
                      _output != null
                          ? Padding(
                        padding: EdgeInsets.all(8.0.sp),
                          child: Text(
                            'The result is: ${_output![0]['label']} cell !',
                            style: const TextStyle(
                                color: ColorManager.primaryColor,
                                fontSize: 22,
                                fontWeight: FontWeight.bold),
                          ),
                      )
                          : Container(),
                    ],
                  ),
                ),
              ),

              _loading ? SizedBox() : ElevatedButton(
                  onPressed: (){
                    print(_output);
                  },
                  style: ElevatedButton.styleFrom(
                    primary: ColorManager.primaryColor,
                    padding: EdgeInsets.all(15),
                    elevation: 3,
                    shape: RoundedRectangleBorder( //to set border radius to button
                        borderRadius: BorderRadius.circular(15)
                    ),
                  ),
                  child: Text("Save Result", style: TextStyle(fontSize: 12.sp))
              ),
            ],
          ),
        ),
      ),
    );
  }
}
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:image_picker/image_picker.dart';
import 'package:model_gallery_app/screen/image_file.dart';
import '../assets/data_model.dart';

class PhotoPreviewScreen extends StatefulWidget {
  const PhotoPreviewScreen({Key? key}) : super(key: key);

  @override
  State<PhotoPreviewScreen> createState() => _PhotoPreviewScreenState();
}

class _PhotoPreviewScreenState extends State<PhotoPreviewScreen> {
  @override
  void initState() {
    createPath();
    super.initState();
  }

  ValueNotifier<bool> isDialOpen = ValueNotifier(false);
  int i = 0;
  XFile? img;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Gallery App'),
      ),
      body: ValueListenableBuilder(
          valueListenable: Hive.box<ImageItem>('imageitems').listenable(),
          builder: (context, Box<ImageItem> box, widget) {
            final List<ImageItem> obj = box.values.toList();
            if (box.values.isEmpty) {
              return const Center(
                child: Text('No Images to Shown'),
              );
            }
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: GridView.builder(
                itemCount: box.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  crossAxisSpacing: 5.0,
                  mainAxisSpacing: 5.0,
                ),
                itemBuilder: (BuildContext context, index) {
                  return Container(
                    decoration: BoxDecoration(
                      image: DecorationImage(
                          image: FileImage(File("${obj[index].image}"))),
                    ),
                  );
                },
              ),
            );
          }),
      floatingActionButton: IconButton(
        onPressed: () {
          pickImage();
        },
        icon: const Icon(
          Icons.camera,
          size: 50,
          color: Colors.black45,
        ),
      ),
    );
  }

  Future pickImage() async {
    final images = await ImagePicker().pickImage(source: ImageSource.camera);
    setState(() {
      img = images;
      Hive.box<ImageItem>('imageitems').add(ImageItem(image: img!.path));
    });
    File(img!.path).copy('${directory!.path}/images$i.jpeg');
    i++;
  }
}

// Dart imports:
import 'dart:io';

// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:dio/dio.dart';
import 'package:path_provider/path_provider.dart';
import 'package:share_plus/share_plus.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: PixabayPage(),
    );
  }
}

class PixabayPage extends StatefulWidget {
  const PixabayPage({super.key});

  @override
  State<PixabayPage> createState() => _PixabayPageState();
}

class _PixabayPageState extends State<PixabayPage> {
  List imageList = [];

  Future<void> fetchImages(String text) async {
    Response response = await Dio().get(
      'https://pixabay.com/api/?key=41361735-3ab314baf45aba7cf424fcd1f&q=$text&image_type=photo&pretty=true&per_page=100',
    );
    imageList = response.data['hits'];
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    fetchImages('花');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: TextFormField(
          decoration: const InputDecoration(
            fillColor: Colors.white,
            filled: true,
          ),
          onFieldSubmitted: (text) {
            print(text);
            fetchImages(text);
          },
        ),
      ),
      body: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3),
          itemCount: imageList.length,
          itemBuilder: (context, index) {
            Map<String, dynamic> image = imageList[index];
            return InkWell(
              onTap: () async {
                // まずは一時保存に使えるフォルダ情報を取得します。
                // Future 型なので await で待ちます
                Directory dir = await getTemporaryDirectory();

                Response response = await Dio().get(
                  // previewURL は荒いためより高解像度の webformatURL から画像をダウンロードします。
                  image['webformatURL'],
                  options: Options(
                    // 画像をダウンロードするときは ResponseType.bytes を指定します。
                    responseType: ResponseType.bytes,
                  ),
                );

                // フォルダの中に image.png という名前でファイルを作り、そこに画像データを書き込みます。
                File imageFile = await File('${dir.path}/image.png')
                    .writeAsBytes(response.data);
                // path を指定すると share できます。
                await Share.shareXFiles([XFile(imageFile.path)]);
              },
              child: Stack(
                fit: StackFit.expand,
                children: [
                  Image.network(image['previewURL'], fit: BoxFit.cover),
                  Align(
                    alignment: Alignment.bottomRight,
                    child: Container(
                        color: Colors.white,
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            const Icon(Icons.thumb_up_alt_outlined, size: 14),
                            Text(image['likes'].toString()),
                          ],
                        )),
                  ),
                ],
              ),
            );
          }),
    );
  }
}

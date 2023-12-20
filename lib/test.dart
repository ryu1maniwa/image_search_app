void main() {
  // data[ここにkeyを指定する] これで value を取り出せる。
  List hitList = data['hits'];

  // hitList[ここに取り出したい要素番号を指定する]。最初の要素を取り出したいなら0を指定する。
  Map<String, dynamic> firstHit = hitList[1];

  // ここで firstHit の中身は次のような Map になっている
  //  {
  //    "id": 2295434,
  //    "pageURL":
  //        "https://pixabay.com/photos/spring-bird-bird-tit-spring-blue-2295434/",
  //    "type": "photo",
  //    "tags": "spring bird, bird, tit",
  //    "previewURL":
  //        "https://cdn.pixabay.com/photo/2017/05/08/13/15/spring-bird-2295434_150.jpg",
  //    "previewWidth": 150,
  //    "previewHeight": 99,
  //    "webformatURL":
  //        "https://pixabay.com/get/gfcb512e812cd4d1add7785ee9eb7983fb4ddbccef35ae8640481f0a1f2ee48f9d2fa579971e471b4696c6fb46dd2d02af336bbf8beea94bdfb41cef5cded8c30_640.jpg",
  //    "webformatWidth": 640,
  //    "webformatHeight": 426,
  //    "largeImageURL":
  //        "https://pixabay.com/get/g0098484ca2b7aad6da7465f87ae325ed4539659a927ecd027f6df5b7f31c39948ff6b2ce16a995e03000ab5e8a9d5a3279bbc19b9ccc120a845172ba4ff3a202_1280.jpg",
  //    "imageWidth": 5363,
  //    "imageHeight": 3575,
  //    "imageSize": 2938651,
  //    "views": 488125,
  //    "downloads": 261832,
  //    "collections": 1911,
  //    "likes": 1846,
  //    "comments": 221,
  //    "user_id": 334088,
  //    "user": "JillWellington",
  //    "userImageURL":
  //        "https://cdn.pixabay.com/user/2018/06/27/01-23-02-27_250x250.jpg"
  //  }

  // 上記 Map から id の value を取り出す。
  print(firstHit['previewURL']);
}

Map<String, dynamic> data = {
  "total": 32340,
  "totalHits": 500,
  "hits": [
    {
      "id": 2295434,
      "pageURL":
          "https://pixabay.com/photos/spring-bird-bird-tit-spring-blue-2295434/",
      "type": "photo",
      "tags": "spring bird, bird, tit",
      "previewURL":
          "https://cdn.pixabay.com/photo/2017/05/08/13/15/spring-bird-2295434_150.jpg",
      "previewWidth": 150,
      "previewHeight": 99,
      "webformatURL":
          "https://pixabay.com/get/gfcb512e812cd4d1add7785ee9eb7983fb4ddbccef35ae8640481f0a1f2ee48f9d2fa579971e471b4696c6fb46dd2d02af336bbf8beea94bdfb41cef5cded8c30_640.jpg",
      "webformatWidth": 640,
      "webformatHeight": 426,
      "largeImageURL":
          "https://pixabay.com/get/g0098484ca2b7aad6da7465f87ae325ed4539659a927ecd027f6df5b7f31c39948ff6b2ce16a995e03000ab5e8a9d5a3279bbc19b9ccc120a845172ba4ff3a202_1280.jpg",
      "imageWidth": 5363,
      "imageHeight": 3575,
      "imageSize": 2938651,
      "views": 488125,
      "downloads": 261832,
      "collections": 1911,
      "likes": 1846,
      "comments": 221,
      "user_id": 334088,
      "user": "JillWellington",
      "userImageURL":
          "https://cdn.pixabay.com/user/2018/06/27/01-23-02-27_250x250.jpg"
    },
    {
      "id": 502973,
      "pageURL":
          "https://pixabay.com/photos/rape-blossom-rape-field-oilseed-rape-502973/",
      "type": "photo",
      "tags": "rape blossom, rape field, oilseed rape",
      "previewURL":
          "https://cdn.pixabay.com/photo/2014/10/25/19/24/rape-blossom-502973_150.jpg",
      "previewWidth": 150,
      "previewHeight": 99,
      "webformatURL":
          "https://pixabay.com/get/gec2870f46a4045ad7c17d5e67378794452625db001ecc964de2fdb5fc783e8ce8293854a8dea0aaad23ff6d0a1f14be7_640.jpg",
      "webformatWidth": 640,
      "webformatHeight": 426,
      "largeImageURL":
          "https://pixabay.com/get/gbba411f43a08e0ba52367247eda6e11ac997fa6d013caaa30e8af09adbd98cc0a0caf397b203fae849fc2bda9fee604b1b3d00413767a2110b072552bf6a93d7_1280.jpg",
      "imageWidth": 5472,
      "imageHeight": 3648,
      "imageSize": 6739001,
      "views": 51885,
      "downloads": 21464,
      "collections": 3557,
      "likes": 212,
      "comments": 47,
      "user_id": 52945,
      "user": "blickpixel",
      "userImageURL":
          "https://cdn.pixabay.com/user/2014/09/16/12-20-23-44_250x250.png"
    },
  ],
};

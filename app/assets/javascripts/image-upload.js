$(document).on('turbolinks:load', function() {
// 背景画像の方
//画像ファイルプレビュー表示のイベント追加 fileを選択時に発火するイベントを登録
  $('.js-input').on('change', function(e) {
    var file = e.target.files[0],
        reader = new FileReader(),
        $preview = $(".background__cover");
    // 画像ファイル以外の場合は何もしない
    if(file.type.indexOf("image") < 0){
      return false;
    }
    // ファイル読み込みが完了した際のイベント登録
    reader.onload = (function(file) {
      return function(e) {
        //既存のプレビューを削除
        $preview.empty();
        // .prevewの領域の中にロードした画像を表示するimageタグを追加
        $preview.append($('<img>').attr({
                  src: e.target.result,
                  class: "background-image-size"
        }));
      };
    })(file);
    reader.readAsDataURL(file);
  });
// アバターの方
  $('.js-avatar').on('change', function(e) {
    var file = e.target.files[0],
        reader = new FileReader(),
        $preview = $(".avatar-cover");
    // 画像ファイル以外の場合は何もしない
    if(file.type.indexOf("image") < 0){
      return false;
    }
    // ファイル読み込みが完了した際のイベント登録
    reader.onload = (function(file) {
      return function(e) {
        //既存のプレビューを削除
        $preview.empty();
        // .prevewの領域の中にロードした画像を表示するimageタグを追加
        $preview.append($('<img>').attr({
                  src: e.target.result,
                  class: "avatar-image"
        }));
      };
    })(file);
    reader.readAsDataURL(file);
  });
});

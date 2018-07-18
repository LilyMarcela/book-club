function loadBooks(){
var books=[];
var book={}
  $("img.book-img").each(function(i,d){
    book.title= d.getAttribute("data-title");
    book.author= d.getAttribute("data-author");
    console.log(book);
   getImg(book.title,book.author,i);

  });

}
String.prototype.allReplace = function(obj) {
    var retStr = this;
    for (var x in obj) {
        retStr = retStr.replace(new RegExp(x, 'g'), obj[x]);
    }
    return retStr;
};
function getImg(title,author,i) {

  $.ajax({
    url:'https://www.googleapis.com/books/v1/volumes?q=intitle:'+title.allReplace({" " : "+"})
    +"+inauthor:"+author.allReplace({" " : "+"})+"&key=AIzaSyAKZyMGNq-sfmyeq4UMob7hndanxiY-NHU&maxResults=1",

    success: function(json){
    var book={ img: "" };
    var j = 0
    book.img=json.items[j].volumeInfo.imageLinks.smallThumbnail;
    console.log(book.img);
  $("#"+i).attr("src",book.img);
  }
  });

}

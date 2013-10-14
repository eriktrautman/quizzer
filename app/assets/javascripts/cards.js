
// just an example of a top-level JS function, nothing more
function test(){
  console.log("Testing!");
}

// Namespace me under Card
var Card = {

  showBody: function(){
    $cardBody = $(".card-body");
    $cardBody.css("visibility","visible");
    $(".show-button").hide();
  }
};


// Kept around as an example of non-working JS for future generations
$(function(){
  var Card2 = function(){

    var cardBody = $(".card-body");
    var showBody = function(){
      console.log("WWOOO");
    }
  };

})
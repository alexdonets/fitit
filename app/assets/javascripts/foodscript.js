// $(document).on("page:change", function() {
//   var $dairy = $(".Dairy");
//   var $dairyContent = $(".Dairy-content");
//   var $sideMenu = $(".foods-content .side-menu");
//   var $mainForm = $(".foods-content .main-form");
//
//
//   $dairy.addClass('active');
//   $dairyContent.show();
//
//   $(".foods-content .side-menu li").click(function() {
//
//     var currentDiv = $(this).attr('data-content');
//
//     $(".side-menu li").removeClass('active');
//     $(this).addClass('active');
//
//     $(".foods-content .main-form div").hide();
//     $(currentDiv).show();
//
//   });
// });



$(function(){
  var $dairy = $(".Dairy");
  var $dairyContent = $(".Dairy-content");
  var $sideMenu = $(".foods-content .side-menu");
  var $mainForm = $(".foods-content .main-form");


  $dairy.addClass('active');

  $dairyContent.show();

  $(".foods-content .side-menu li").click(function() {

    var currentDiv = $(this).attr('data-content');

    $(".side-menu li").removeClass('active');
    $(this).addClass('active');

    $(".foods-content .main-form>div").hide();
    $(currentDiv).show();

  });

});

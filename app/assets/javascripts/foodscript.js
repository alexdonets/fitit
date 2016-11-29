//
// $(document).on('page:load',(function(){
//   var $dairy = $(".Dairy");
//   var $dairyContent = $(".Dairy-content");
//   var $sideMenu = $(".foods-content .side-menu");
//   var $mainForm = $(".foods-content .main-form");
//   var $showFood = $(".foods-content .food-field");
//   var $closeBtn = $showFood.find(".close-food-modal");
//
//   var $categories = $(".foods-content .side-menu li");
//
//
//   $dairy.addClass('active');
//
//   $dairyContent.show();
//
//   $categories.click(function() {
//
//     var currentDiv = $(this).attr('data-content');
//
//     $categories.removeClass('active');
//     $(this).addClass('active');
//
//     $(".foods-content .main-form>div").hide();
//     $(currentDiv).show();
//
//   });
//
//   $showFood.click(function(){
// //    alert("Clicked"+$(this));
//     $(this).find(".food-modal").show();
//     event.preventDefault();
//
//   });
//
//   $closeBtn.click(function(){
//     $(this).closest(".food-modal").hide();
//     event.preventDefault();
//   });
//
// });



$(function(){
  var $dairy = $(".Dairy");
  var $dairyContent = $(".Dairy-content");
  var $sideMenu = $(".foods-content .side-menu");
  var $mainForm = $(".foods-content .main-form");
  var $showFood = $(".foods-content .food-field");
  var $closeBtn = $showFood.find(".close-food-modal");

  var $categories = $(".foods-content .side-menu li");


  $dairy.addClass('active');

  $dairyContent.show();

  $categories.click(function() {

    var currentDiv = $(this).attr('data-content');

    $categories.removeClass('active');
    $(this).addClass('active');

    $(".foods-content .main-form>div").hide();
    $(currentDiv).show();

  });

  $showFood.click(function(){
//    alert("Clicked"+$(this));
    $(this).find(".food-modal").show();
    event.preventDefault();

  });

  $closeBtn.click(function(){
    alert("Alert");
    $(".food-modal").hide();
    //alert(JSON.stringify($(this).parent().parent().parent().parent().find(".food-modal")));
    event.preventDefault();
  });

});

$(function(){

  var $openMacros = $(".profile-form #open-macros");
  var $macrosModal = $(".profile-form .modal-macros");
  var $closeMacros = $macrosModal.find("#close-macros");

  var $caloriesField = $macrosModal.find("#calories");
  var $carbField = $macrosModal.find("#carbs");
  var $proteinField = $macrosModal.find("#protein");
  var $fatField = $macrosModal.find("#fat");

  var carb;
  var protein;
  var fat;
  var total;

  $carbField.add($proteinField).add($fatField).on("keyup", function(){
    carb = parseInt($carbField.val());
    protein = parseInt($proteinField.val());
    fat = parseInt($fatField.val());

    total = carb*4 + protein*4 + fat*9;

    $caloriesField.text(total);

  });

  $openMacros.click(function(){
    $macrosModal.show();
    event.preventDefault();

  });

  $closeMacros.click(function(){
    $macrosModal.hide();
    event.preventDefault();

  });




});

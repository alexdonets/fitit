$(function(){

  var $openMacros = $(".profile-form #open-macros");
  var $macrosModal = $(".profile-form .modal-macros");
  var $closeMacros = $macrosModal.find("#close-macros");

  $openMacros.click(function(){
    $macrosModal.show();
    event.preventDefault();

  });

  $closeMacros.click(function(){
    $macrosModal.hide();
    event.preventDefault();

  });

  window.click(function(){
    $macrosModal.hide();
    event.preventDefault();

  });


});

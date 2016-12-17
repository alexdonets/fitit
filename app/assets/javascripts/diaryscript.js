$(function(){
  var $monday = $(".Monday");
  var $mondayContent = $(".Monday-content");
  var $sideMenu = $(".diary-content .side-menu");
  var $mainForm = $(".diary-content .main-form");
  var $closeChangeAmount = $("#close-change-amount");

  var $amountModal = $(".change-amount-modal");

  var $changeAmountBtn = $(".diary-content .amount-link");

  $changeAmountBtn.click(function(){
    $amountModal.show();
    event.preventDefault();
  });

  $closeChangeAmount.click(function(){
    $amountModal.hide();
    event.preventDefault();
  });



  var currentDiv = $sideMenu.find(".active").attr('data-content');
  $(currentDiv).show();

  $sideMenu.find("li").click(function() {

    currentDiv = $(this).attr('data-content');

    $sideMenu.find("li").removeClass('active');
    $(this).addClass('active');

    $(".diary-content .main-form>div").hide();
    $(currentDiv).show();

  });



});

$("a").click(function() {
  $(this).toggleClass("active");
});

$(".master-btn").click(function() {
  $('.volume').toggleClass("dim");
});

$('.master').change(function () {                 
  var Width = $(this).val();
  $('.volume').val(Width);
}); 

$(function(){
  // $('#login-button').hover( function() {  
  //   $('#login-form').addClass("clicked")
  // }, function() {
  //   $('#login-form').removeClass("clicked")
  // });

  $('#login-button').on('click', function() {
    $('#login-form').addClass("clicked");
  });

  $('#filter').on('click', function() {
    $(this).removeClass("clicked");
  })
});



// $('#login-button').hover(
//   function() {
//     console.log('mouse enter')
//     // $( this ).addClass( "hover" );
//   }, function() {
//     console.log('mouse leave')
//     // $( this ).removeClass( "hover" );
//   }
// );
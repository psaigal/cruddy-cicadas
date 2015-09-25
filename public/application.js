$(document).ready(function(){
  addForm();
  submitForm();
  // foodInfo();
});

function addForm(){
  $("a.btn").on("click", function(event){
    event.preventDefault();
    $("a.btn").hide();
    var path = $(this).attr('href');
    var route = "GET";
    // var data = $(this).parent().serialize;

      $.ajax({
        url: path,
        type: route,
        dataType:'html',
        })

      .done(function(response){
        $("#addfoodtitle").prepend(response);
      })
  })
};

function submitForm(){
  $("#addfoodtitle").on('submit', '#login-form', function(event){
    event.preventDefault();

      var path = $(this).attr('action');
      var route = "POST";
      var userInfo = $(this).serialize();
      debugger
      $.ajax({
        url: path,
        type: route,
        dataType:'html',
        data: userInfo
        })

      .done(function(response){
        debugger
        console.log(response)
        $("#foods").append(response)
        $("#newfooditem").remove();
        $("a.btn").show();
      })
  })
}

// function foodInfo(){
//   $("a.specificfood").on("click", function(event){
//     event.preventDefault();

//       var path = $(this).attr('href');
//       var route = "GET";

//       $.ajax({
//         url: path,
//         type: route,
//         dataType:'html',
//         })

//       .done(function(response){
//         debugger
//         var id = $("a.specificfood").val('id')
//         // $(id).find('.points').append(response);
//         $(id).append(response);
//       })
//   })
// }

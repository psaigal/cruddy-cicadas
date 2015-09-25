$(id^=['food'])
$(document).ready(function(){
  $("#food" + id).hide();
  addForm();
  submitForm();
  foodInfo();
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
      $.ajax({
        url: path,
        type: route,
        dataType:'html',
        data: userInfo
        })

      .done(function(response){
        console.log(response)
        $(".foods").append(response)
        $("#newfooditem").remove();
        $("a.btn").show();
      })
  })
}

function foodInfo(){
  $(".foods").on("click", "a", function(event){
    event.preventDefault();
    var id = $(this).parent().attr("id")
    $("#food" + id).show();
      // var path = $(this).attr('href');
      // var route = "GET";
      // console.log(this)

      // $.ajax({
      //   url: path,
      //   type: route,
      //   dataType:'html',
      //   })


      // .done(function(response){
        // $("#" + id).show(".onefood");
        // $(response).slideToggle("slow");

      // })
  })
}





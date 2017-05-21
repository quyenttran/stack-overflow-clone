$(document).ready(function() {

    // voting for answers

  $(".answer-main").on("submit", "form", function(event){
    event.preventDefault();
    var formUrl = $(this).attr('action');

    $.ajax({
      method: "POST",
      url: formUrl,
      dataType: "json"
    })
    .done(function(response){
      $("#vote-count-" + response.answer_id).text(response.votecount);
      $("#answer-id-" + response.answer_id).find(".glyphicon-chevron-up").css("color", "red");
      return;
    })
  })

    $(".question-main").on("submit", "form", function(e){
      e.preventDefault();
      var formUrl = $(this).attr('action');
      var $rootDiv = $(this).closest('.question-votes');

      $.ajax({
        method: "post",
        url: formUrl,
        dataType: "json"
      })
      .done(function(postData){
        $rootDiv.find(".vote-count").text(postData.votecount);
        $rootDiv.find(".glyphicon-chevron-up").css("color", "red");
      })
  })

  //   $(".answer-main").on("submit", "form", function(event){
  //   event.preventDefault();
  //   var formUrl = $(this).attr('action');

  //   $.ajax({
  //     method: "POST",
  //     url: formUrl,
  //     dataType: "json"
  //   })
  //   .done(function(response){
  //     $("#vote-count-" + response.answer_id).text(response.votecount);
  //     $("#vote-count-" + response.answer_id).find(".glyphicon-chevron-down").css("color", "red");
  //     return;
  //   })
  // })


  $(".downvote-form").on("submit", function(e){
      e.preventDefault();
      var formUrl = $(this).attr('action');
      var $rootDiv = $(this).closest('div');
      $.ajax({
        method: "post",
        url: formUrl,
        dataType: "json"
      })
      .done(function(postData){
        $rootDiv.find(".vote-count").text(postData.votecount);
        $rootDiv.find(".glyphicon-chevron-down").css("color", "red");
      })
  })

  $("div.comment-on-commentable").on("click", "a", function(event){
      event.preventDefault();
      var button = $(this).closest("div").find("submit");
      $(this).siblings().first().removeClass("hidden")
  })

  $(".question-comments").on("submit", "form", function(event){
    event.preventDefault();
    var formUrl = $(this).attr('action');
    var formData = $(this).serialize();
    var myForm = $(this);
    $.ajax({
      method: "POST",
      url: formUrl,
      data: formData
    })
    .done(function(response){
      console.log("ok, so here we are ajaxing it up?!");
      $(myForm).addClass("hidden");
      var CommentList = $(myForm).closest(".question-comments").find("ul")
      CommentList.append(response);
    })
  })

  $(".comment-on-commentable").on("submit", "form", function(event){
    event.preventDefault();
    var formUrl = $(this).attr('action');
    var formData = $(this).serialize();
    var myForm = $(this);
    $.ajax({
      method: "POST",
      url: formUrl,
      data: formData,
      dataType: "json"
    })
    .done(function(response){
      console.log("ok, so here we are ajaxing it up!");
      $(myForm).addClass("hidden");
      var CommentList = $(myForm).closest("#answer-id-" + response.answer_id).find("ul");
      CommentList.append("<li>" + response.comment + "</li>");
    })
  })

});

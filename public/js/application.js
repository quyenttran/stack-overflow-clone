$(document).ready(function() {
  $(".upvote-form").on("submit", function(e){
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
      })
  })

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
      })
  })

  $("div.comment-on-commentable").on("click", "a", function(event){
      event.preventDefault();
      var button = $(this).closest("div").find("submit");
      $(this).siblings().first().removeClass("hidden")
  })

  $("div.comment-on-commentable").on("submit", "form", function(event){
    event.preventDefault();
    console.log(this);
    var formUrl = $(this).attr('action');
    var formData = $(this).serialize();
    var myForm = $(this);
    $.ajax({
      method: "post",
      url: formUrl,
      data: formData
    })
    .done(function(response){
      console.log("ok, so here we are ajaxing it up!");
      $(myForm).addClass("hidden");
      var CommentList = $(myForm).closest(".comment-on-commentable").siblings(".comments").find("ul");
      CommentList.append(response);
    })
  })

});

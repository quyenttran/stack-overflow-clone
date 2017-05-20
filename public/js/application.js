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
        $rootDiv.find(".glyphicon-chevron-up").css("color", "red");
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
        $rootDiv.find(".glyphicon-chevron-down").css("color", "red");
      })
  })

});

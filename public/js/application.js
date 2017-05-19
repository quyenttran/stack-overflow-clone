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
        method: "delete",
        url: formUrl,
        dataType: "json"
      })
      .done(function(postData){
        $rootDiv.find(".vote-count").text(postData.votecount);
      })
  })

});

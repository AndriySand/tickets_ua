$(document).ready(
  function() {
    var user_id = $('.user-id').text();
    setInterval(function() {
      $.ajax({
        url: "/admin/users/" + user_id.trim() + "/count_unread_messages",
        type: "GET"
      })
    }, 600000);
  }
);

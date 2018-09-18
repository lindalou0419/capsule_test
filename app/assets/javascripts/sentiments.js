document.addEventListener("DOMContentLoaded", function() {
  var form = document.querySelector("#new_sentiment");
  form.addEventListener("submit", function(e) {
    e.preventDefault();

    $.ajax({
      url: form.getAttribute("action"),
      method: form.getAttribute("method"),
      data: $(form).serialize(),
      dataType: "json"
    }).done(function(responseData) {
      form.reset();

      var texts = document.querySelector(".texts");
      var text = document.createElement("li");
      text.className = "text";

      var textMessage = document.createElement("p");
      var textMessageText = document.createTextNode(responseData.message);
      textMessage.appendChild(textMessageText);
      text.appendChild(textMessage);

      $(texts).prepend(text);
    });
  });
});
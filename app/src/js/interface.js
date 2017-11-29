var rental;

$(document).ready(function(){
  $.getJSON('https://obscure-spire-75698.herokuapp.com/rentals', function(rentals) {
    rental = rentals

    $(function() {
      var theTemplateScript = $("#property-template").html();
      var theTemplate = Handlebars.compile(theTemplateScript);

      var context = {
        rentals: rental
      };

      var theCompiledHtml = theTemplate(context);
      $(document.body).append(theCompiledHtml);
    });
  });
});

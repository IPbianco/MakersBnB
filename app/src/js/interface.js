
  // $.get()'/rentals', function (rentals) { };

$(document).ready(function(){
  var rental = [{"id":1,"price":0,"address":"nowhere"},{"id":2,"price":1000,"address":"nowhere"}]

  $(function () {
    // Grab the template script
    var theTemplateScript = $("#property-template").html();

   // Compile the template
    var theTemplate = Handlebars.compile(theTemplateScript);

   // This is the default context, which is passed to the template
    var context = {
      rentals: rental
    };

    var theCompiledHtml = theTemplate(context);


    $(document.body).append(theCompiledHtml);
  });
});

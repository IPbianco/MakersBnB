
  // $.get()'/rentals', function (rentals) { };

$(document).ready(function(){
  var rental = [{"id":1,"price":0,"address":"nowhere", "img-link":"https://i.pinimg.com/564x/c1/45/b4/c145b4fa6322048fce85cba6b2bcf0ed.jpg"},{"id":2,"price":1000,"address":"nowhere","img-link":"https://i.pinimg.com/564x/52/71/f6/5271f60f50441b0aebbc0204d8176354.jpg"}
, {"id":1,"price":0,"address":"nowhere", "img-link":"https://i.pinimg.com/564x/75/f7/d0/75f7d06a433fc20bea883fe6203ba70e.jpg"}, {"id":1,"price":0,"address":"nowhere", "img-link":"https://i.pinimg.com/564x/75/f7/d0/75f7d06a433fc20bea883fe6203ba70e.jpg"}
, {"id":4, "price":45, "address":"place", "img-link":"https://i.pinimg.com/564x/c7/c9/fb/c7c9fbdde85aaf2ce15cac4d0c45e9b6.jpg"}]

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

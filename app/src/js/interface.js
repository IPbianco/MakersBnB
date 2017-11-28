

var rental;
var id
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



        $(document).on('click', 'input#button', function(clickEvent) {
        var id = parseInt(clickEvent.target.value);
        $(function() {
          var theTemplateScript = $("#property").html();
          var theTemplate = Handlebars.compile(theTemplateScript);

          var context = rental[id-1];
          console.log(rental[id-1])
          var theCompiledHtml = theTemplate(context);


          $(document.body).append(theCompiledHtml);

        });



     });
   });


})






//   var rental = [{"id":1,"price":0,"address":"nowhere", "img-link":"https://i.pinimg.com/564x/c1/45/b4/c145b4fa6322048fce85cba6b2bcf0ed.jpg"},{"id":2,"price":1000,"address":"nowhere","img-link":"https://i.pinimg.com/564x/52/71/f6/5271f60f50441b0aebbc0204d8176354.jpg"}
// , {"id":3,"price":0,"address":"nowhere", "img-link":"https://i.pinimg.com/564x/75/f7/d0/75f7d06a433fc20bea883fe6203ba70e.jpg"}, {"id":4,"price":0,"address":"nowhere", "img-link":"https://i.pinimg.com/564x/75/f7/d0/75f7d06a433fc20bea883fe6203ba70e.jpg"}
// , {"id":5, "price":45, "address":"place", "img-link":"https://i.pinimg.com/564x/c7/c9/fb/c7c9fbdde85aaf2ce15cac4d0c45e9b6.jpg"}]



});

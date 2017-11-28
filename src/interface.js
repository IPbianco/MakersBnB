
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
      // [
      //   {id: 1, price: 0, address :"nowhere" },
      //   { id :2 , price: 1000, address:"nowhere" }
      // ]
    };

    var theCompiledHtml = theTemplate(context);


    $(document.body).append(theCompiledHtml);
  });
});

  // rental.forEach(function(home){
  //   console.log(home)
  //   home.keys.forEach(function(key){
  //     Symbol(key)
  //     console.log(Symbol(key))
  //   })
  //
  // });

// var props = ['{"id": 1 , "price": 0 , "address": "nowhere"}' , '{"id":2 , "price": 1000 , "address": "nowhere"}']
// var props2 = []
//  props.forEach(function(prop){
//   props2.push(JSON.parse(prop))
// });

 // var rental = JSON.parse('{"id": 1 , "price": 0 , "address": "nowhere"}')
 // console.log(rental)

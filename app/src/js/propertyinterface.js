function getID() {
  return 1;
  return getParameterByName('id');
};

function startdate(){
  return $('#startdate').val();
};

function enddate(){
  return $('#enddate').val();
};

function getQuery() {
  return `?start=${startdate()}&end=${enddate()}`
}

var propertyInfo;

$.ajaxSetup({
  statusCode :{
    409: function() {
      alert('Was not able to book');
    };
  };
});


$(document).ready(function() {
  $.getJSON('https://obscure-spire-75698.herokuapp.com/rentals/' + getID(), function(data) {
    propertyInfo = data;

  });
});

propertyInfo = { image:"https://i.pinimg.com/564x/c7/c9/fb/c7c9fbdde85aaf2ce15cac4d0c45e9b6.jpg", location:'nowhere' }

$(function() {
  var theTemplateScript = $("#viewing-template").html();
  var theTemplate = Handlebars.compile(theTemplateScript);
  var theCompiledHtml = theTemplate(propertyInfo);
  $(document.body).append(theCompiledHtml);
});

$('#checkAvailability').click(function() {
  $.get(`/bookings/validate/${getID()}${getQuery()}`, function(data) {
    if(data.available === false){
      alert('Not available');
    } else {
      alert('Available');
    };
  });

  $('#book').click(function(){
    $.post(`/bookings/${getID()}`, {start: startdate(), end: enddate()}, function(){
      $('#booking-info').html('Congratulations you have booked');
    });


  });
});

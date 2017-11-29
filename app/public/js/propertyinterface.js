function getID() {
  var query = document.location.search;
  return query.match(/(?:id=)(\d+)/)[1];
};

function startDate(){
  return $('#startdate').val();
};

function endDate(){
  return $('#enddate').val();
};

function getQuery() {
  return `?start=${startDate()}&finish=${endDate()}`
}

var propertyInfo;

$.ajaxSetup({
  statusCode :{
    409: function() {
      alert('Was not able to book');
    }
  }
});

$(document).ready(function() {
  $.getJSON('/rental/' + getID(), function(data) {
    propertyInfo = data;

    $(function() {
      var theTemplateScript = $("#viewing-template").html();
      var theTemplate = Handlebars.compile(theTemplateScript);
      var theCompiledHtml = theTemplate(propertyInfo);
      $(document.body).append(theCompiledHtml);
    });
  });

  $(document).on('click', '#checkAvailability', function() {
    $.get(`/bookings/validate/${getID()}${getQuery()}`, function(data) {
      if(data.available === false){
        alert('Not available');
      } else {
        alert('Available');
      };
    });
  });

  $(document).on('click', '#book', function(){
    $.ajax({
      type: "POST",
      url: `/bookings/${getID()}`,
      data: {start: startDate(), finish: endDate()}, 
      success: function() {
        $('#booking-info').html('Congratulations you have booked');
      }
    });
  });
});

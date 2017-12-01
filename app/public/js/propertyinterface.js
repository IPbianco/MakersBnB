var propertyInfo;
var dates;

function getID() {
  var query = document.location.search;
  return query.match(/(?:id=)(\d+)/)[1];
};

function cycle(array) {
  array.unshift(array.pop());
};

function formatDate(string) {
  arr = string.split('/');
  cycle(arr);
  return arr.join('-');
};

function startDate(){
  return formatDate($('#startDate').val());
};

function endDate(){
  return formatDate($('#endDate').val());
};

function getQuery() {
  return `?start=${startDate()}&finish=${endDate()}`
};

function disableBookedDates(date) {
  var string = jQuery.datepicker.formatDate('dd-mm-yy', date);
  return [dates.indexOf(string) == -1];
};

function disableDates() {
  $.get(`/bookings/${getID()}`, function(data) {
    dates = data.map(function(obj) { return obj.date; });
    $('.datepick').datepicker({ 
      minDate: 0, 
      beforeShowDay: disableBookedDates,
    });
  });
};

$.ajaxSetup({
  statusCode :{
    409: function() {
      alert('Was not able to book');
    }
  }
});

$(document).ready(function() {

  $.getJSON('/rentals/' + getID(), function(data) {
    propertyInfo = data;

    $(function() {
      var templateScript = $("#viewing-template").html();
      var template = Handlebars.compile(templateScript);
      var compiledHTML = template(propertyInfo);
      $(document.body).append(compiledHTML);
      disableDates();
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
        $('.booking-info').html('Congratulations you have booked');
      }
    });
  });
});

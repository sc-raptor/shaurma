function oneIn(event){
  $.ajax({
    type: "POST",
    //data: {'event_id': event},
    url: '/events/'+event+'/attendee',
    success: function(data)
    {
     updateAttendees(event);
    },
    error: function(jqXHR, textStatus, errorMessage) {
      console.log(errorMessage);
    }
  });
}

function oneOut(event){
  $.ajax({
    type: "POST",
    //data: {'event_id': event},
    url: '/events/'+event+'/del_attendee',
    success: function(data)
    {
     updateAttendees(event);
    },
    error: function(jqXHR, textStatus, errorMessage) {
      console.log(errorMessage);
    }
  });
}


function updateAttendees(event){
  $.ajax({
    dataType: "json",
    url: 'events/'+event+'/attendees',
    success: function (data){
      $("#event_"+event).html(data.names.join(", "));
      $("#count_"+event).html(data.count);
    },
    error: function(jqXHR, textStatus, errorMessage) {
      console.log(errorMessage);
    }
  });
}

$(document).ready(function() {
  var pepe = $.fn.fullpage({
    slidesColor: ['#D1D0D0', '#CBCACA', '#D1D0D0', '#CBCACA', '#D1D0D0'],
    anchors: ['main', 'order', 'map', 'members', 'contacts'],
    menu: '#menu',
    verticalCentered: true,
    resize : true,
    scrollingSpeed: 300,
    easing: 'easeInQuart',
    loopBottom: false,
    loopTop: false,
    loopHorizontal: false,
    autoScrolling: true,
    scrollOverflow: true,
    css3: true,
    paddingTop: '3em',
    paddingBottom: '10px',
    touchSensitivity: 15,
    continuousVertical: false,
    animateAnchor: true
  });
});
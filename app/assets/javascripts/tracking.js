$(document).ready(function() {
  $("#myModal").on("show.bs.modal", function(e) {
  	if (typeof ga != "undefined") {
		ga('send', 'event', 'Videos', 'Play', 'Intro');
	}
  });
});
	


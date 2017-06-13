//= require jquery
//= require bootstrap.min
//= require jquery_ujs
//= require turbolinks
//= require_tree .

$(document).on('turbolinks:load', function() {
	$('#show_location_box').change(function() {
		$('#show_location').toggle(!this.checked);
	});

});


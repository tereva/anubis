$(document).on('turbolinks:load', function() {
	$('#show_location_box').change(function() {
		$('#show_location').toggle(!this.checked);
	});

});

alert('page loaded')
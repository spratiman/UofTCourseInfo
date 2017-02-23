$(document).on('turbolinks:load', function() {
	// hide the comment box at first
	$('.comment-entry').hide();

	$('#addComment').click(function() {
		$('#addComment').hide();
		$('.comment-entry').show();
	});
});
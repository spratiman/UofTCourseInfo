$(document).on('turbolinks:load', function() {
	// hide the comment box at first
	$('.comment-entry').hide();
	$('.hidden-comment').hide();

	$('#addComment').click(function() {
		$('#addComment').hide();
		$('.comment-entry').show();
	});

	$('#showAllComments').click(function() {
		$('#showAllComments').hide();
		$('.hidden-comment').show();
	})
});

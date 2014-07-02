jQuery ->
	$('#photo-preview-list').sortable
		axis: 'y'
		handle: '.drag-handle'
		update: ->
			$.post($(this).data('update-url'), $(this).sortable('serialize'))

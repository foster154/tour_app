jQuery ->
	$('#photo-preview-list').sortable
		handle: '.drag-handle'
		update: ->
			$.post($(this).data('update-url'), $(this).sortable('serialize'))

	$("#tour_price").payment "restrictNumeric"
	$('#modal_save_agent').click ->
		$('#newAgentModal').modal('hide')
		location.reload()
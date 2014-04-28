$(document).ready(function(){
	$("#info-icon").on('click', function(){
		$(".side-panel").hide();
		$("#property-info").fadeIn();
		$(".panel-label").text("Property Info")
	}); 
	$("#map-icon").on('click', function(){
		$(".side-panel").hide();
		$("#map").fadeIn();
		$(".panel-label").text("Map")
	});
	$("#mortgage-calc-icon").on('click', function(){
		$(".side-panel").hide();
		$("#mortgage-calc").fadeIn();
		$(".panel-label").text("Mortgage Calculator")
	});
	$("#school-info-icon").on('click', function(){
		$(".side-panel").hide();
		$("#school-info").fadeIn();
		$(".panel-label").text("School Info")
	});
});

$(document).ready(function() {
	$(".fancybox-button").fancybox({
		padding			: '0',
		prevEffect		: 'none',
		nextEffect		: 'none',
		autoPlay		: true,
		closeBtn		: true,
		arrows			: true,
		helpers		: {
			title	: { type : 'inside' },
			buttons	: { position : 'bottom' }
		}
	});

	$(".fancybox")

});
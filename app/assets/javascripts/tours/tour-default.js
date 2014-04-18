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
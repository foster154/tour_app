$(document).ready(function(){ 
	
	$("#map-icon").on('click', function(){
		$(".info-panel-switch").hide();
		$(this).siblings("li").removeClass("info_btn_active");
		$(this).siblings("li").addClass("info_btn_inactive");
		$(this).addClass("info_btn_active")
		$("#map-panel").fadeIn();
		$(".panel-label-switch").text("Map")
	});
	$("#mortgage-calc-icon").on('click', function(){
		$(".info-panel-switch").hide();
		$(this).siblings("li").removeClass("info_btn_active");
		$(this).siblings("li").addClass("info_btn_inactive");
		$(this).addClass("info_btn_active")
		$("#mortgage-calc").fadeIn();
		$(".panel-label-switch").text("Mortgage Calculator")
	});
	$("#school-info-icon").on('click', function(){
		$(".info-panel-switch").hide();
		$(this).siblings("li").removeClass("info_btn_active");
		$(this).siblings("li").addClass("info_btn_inactive");
		$(this).addClass("info_btn_active")
		$("#school-info").fadeIn();
		$(".panel-label-switch").text("School Info")
	});

	/* For the slide-down effect when clicking on the tour show info icon */
	$('a').click(function(){
    	$('html, body').animate({
        	scrollTop: $( $(this).attr('href') ).offset().top}, 700);
    	return false;
	});
});


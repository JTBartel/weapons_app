// Place your application-specific JavaScript functions and classes here
// This file is automatically included by javascript_include_tag :defaults

$(function() {
	$("#tabs").tabs({ fx: { opacity: 'toggle' } });
	$("#tabs2").tabs({ fx: { opacity: 'toggle' } });
	$("#tabs3").tabs({ fx: { opacity: 'toggle' } });
	$("#slider").slider();
	$("#accordion").accordion({ active: false, collapsible: true });
	/* 3 button types, element, submit and anchor */
	/* $( "input:submit, a, button", "#button" ).button();
	$( "a", ".demo" ).click(function() { return false; });
	$( "#dialog" ).dialog(); /* this one is used in Vinsol Calendar index page and #dialog and application.js*/
	$( "#draggable" ).draggable();
	$( "#resizable" ).resizable();
	$("#sspindexs th a, #sspindexs .pagination a").live("click", function() {
	   	$.getScript(this.href);
	   	return false;
	});
	$("#sspindexs_search input").keyup(function() {
		$.get($("#sspindexs_search").attr("action"), 		 $("#sspindexs_search").serialize(), null, "script");
	   	return false;
	});
	$('#add_favorite').click(function() {
		$("#favorite_weapon_form").toggle(this.clicked);
	});
});
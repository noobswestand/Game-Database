
$(document).ready(function(){
	
	/*$("div").delay( Math.floor(Math.random()*30) ).hide().fadeIn( 400)*/
	
	$("a").delay( Math.floor(Math.random()*150) ).hide().fadeIn( 400)
	$("p").delay( Math.floor(Math.random()*150) ).hide().fadeIn( 400)
	$("h1").delay( Math.floor(Math.random()*150) ).hide().fadeIn( 400)
});


$("#slideshow > div:gt(0)").hide();

setInterval(function() { 
  $('#slideshow > div:first')
    .fadeOut(1000)
    .next()
    .fadeIn(1000)
    .end()
    .appendTo('#slideshow');
},  3000);
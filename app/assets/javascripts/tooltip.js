function simple_tooltip(target_items, name){
 $(target_items).each(function(i,button){
			if($(button).is(':disabled')){
				$("body").append("<div class='"+name+"' id='"+name+i+"'><p>"+"Log in first."+"</p></div>");
				var my_tooltip = $("#"+name+i);	
				console.log("test");
				$(this).removeAttr("title").mouseover(function(){
						my_tooltip.css({opacity:0.8, display:"none"}).fadeIn(400);
				}).mousemove(function(kmouse){
						my_tooltip.css({left:kmouse.pageX+15, top:kmouse.pageY+15});
				}).mouseout(function(){
						my_tooltip.fadeOut(400);
				});
				}
			});

}
$(document).ready(function(){
	 simple_tooltip("input","tooltip");
});

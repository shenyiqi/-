$(function(){
	
	//回到顶部代码
	$("#toTop").click(function() {
		$('body,html').animate({ scrollTop: 0 }, 100);
	})
	
	
	
	
	var rPartH = $(".postingsTitle").offset().top;
	//滚动条事件
	$(window).scroll(function(){
		//获取滚动条的滑动距离
		var scroH=$(this).scrollTop();
		//滚动条的滑动距离大于等于定位元素距离浏览器顶部的距离，就固定，反之就不固定
		if(scroH>=rPartH){
		    $(".postingsTitlePart").css({ "position": "fixed", "top": "0" });
		}else if(scroH<rPartH){
		    $(".postingsTitlePart").css({ "position": "static" });
		}
	})
	
	var postingsRH=$(".postingsFloorRight").height();
    if(postingsRH>260){
    	$(".postingsFloorRight").css({"border-left":"1px solid RGB(229,229,229)"})
    }else{
    	$(".postingsFloorLeft").css({"border-right":"1px solid RGB(229,229,229)"})
    }
	
//	if(postingsRH>)
	
	
	
})
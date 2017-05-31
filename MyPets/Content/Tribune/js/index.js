$(function() {
	
    //回到顶部代码
    $("#toTop").click(function() {
        $('body,html').animate({ scrollTop: 0 }, 100);
    })


    //发帖
    $("#TribuneContent .Personal .publishPost").click(function() {
        $("#publishPart").css({"dispiay":"block"});
    })

	//获取要定位元素距离浏览器顶部的距离
//	var rPartH = $(".RightPart").offset().top;
//	//滚动条事件
//	$(window).scroll(function(){
//		//获取滚动条的滑动距离
//		var scroH=$(this).scrollTop();
//		//滚动条的滑动距离大于等于定位元素距离浏览器顶部的距离，就固定，反之就不固定
//		if(scroH>=rPartH){
//			$(".RightPart").css({"position":"fixed"});
//		}else if(scroH<rPartH){
//			$(".RightPart").css({"position":"static"});
//		}
//	})
})
//,"top":0,"left":"1078px"
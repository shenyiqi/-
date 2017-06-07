$(function(){

    //搜索框部分
   
    $(".searchType li").click(function () {
        $(this).addClass('beSelected').siblings().removeClass('beSelected');
        $(this).css({ "background": "RGB(238,85,51)", "color": "RGB(255,255,255)" }).siblings().css({ "background": "", "color": "" });
        if ($(this).text() == "店铺") {
            $("#searchTxtBox").prop('placeholder', '店铺1');
            $("#typeNum").prop('value', '2');
        }else {
            $("#searchTxtBox").prop('placeholder', '狗粮');
            $("#typeNum").prop('value', '1');
        } 
    })

    $("li.beSelected").siblings('li').mouseenter(function () {
        $(this).addClass('enter');
    })
    $("li.beSelected").siblings('li').mouseleave(function () {
        $(this).removeClass('enter');
    })
    
    var search = function () {
        
    }


    //搜索框部分结束




	
//	商品菜单部分
	$(".typeMenu>div").mouseenter(function(){
	    $(this).children(".details").css({ "display": "block", "border": "solid 2px RGB(205,44,11)" });
	    $(this).siblings().children(".details").css({"display":"none"});	  			
	})
	
	$(".typeMenu").mouseleave(function(){
	    $(".typeMenu .details").css({"display":"none"});
	})
	
	
//	商品菜单部分结束
//	轮播图部分
	var c = 0;
	//				控制自动轮播函数
	function run() {
		c++;

		if(c == 6) {
			$("#carousel .pic").css({ 'left': '0px' });
			c = 1;
		}
	//					计算大pic应该到达的left值
	var left = c * -800;

	$("#carousel .pic").stop().animate({ 'left': left + 'px' }, 500);
	    if(c == 5) {
			$("#carousel ul li").eq(0).css({ "background": "RGB(238,85,51)", "color": "RGB(243,243,243)" }).siblings().css({ "background": "RGB(243,243,243)", "color": "RGB(51,51,51)" });
		} else {
			$("#carousel ul li").eq(c).css({ "background": "RGB(238,85,51)", "color": "RGB(243,243,243)" }).siblings().css({ "background": "RGB(243,243,243)", "color": "RGB(51,51,51)" });
		}
	}
	//				设置定时器
	var timer = setInterval(run, 4000);
	//				设置鼠标移入事件
	$("#carousel ul li").mouseenter(function() {
		//					停止定时器
		clearInterval(timer);
		var jqthis = $(this);

		tt = setTimeout(function() {
			//					获得移入的li的序号
			c = jqthis.index();
			var left = c * -800;
			$("#carousel .pic").stop().animate({ 'left': left + 'px' }, 500);
			$("#carousel ul li").eq(c).css({ "background": "RGB(238,85,51)", "color": "RGB(243,243,243)" }).siblings().css({ "background": "RGB(243,243,243)", "color": "RGB(51,51,51)" });
		}, 500)
	})
	//				鼠标移出事件
	$("#carousel ul li").mouseleave(function() {
		//					清理定时炸弹
		clearTimeout(tt);
		//					恢复定时器
		timer = setInterval(run, 4000);

	})
//	轮播图部分结束	


//商品展示部分
	$(".ChoicePart li").mouseenter(function(){
		$(this).children(".choiceBlock").css({"display":"block"})
		$(this).siblings().children(".choiceBlock").css({ "display": "none" })
		$(this).addClass('beChoiced').siblings().removeClass('beChoiced');

	})

    //				给商品图片加鼠标移入事件
	$(".GoodsModel>img").mouseenter(function () {
	    $(this).stop().animate({ 'top': '-12px' }, 300)
	})
	$(".GoodsModel>.aContainer").mouseenter(function () {
	    $(this).siblings("img").stop().animate({'top':'-12px'},300);
	})

    //				给商品图片加鼠标移出事件
	$(".GoodsModel>img").mouseleave(function () {
	    $(this).stop().animate({ 'top': '0px' }, 300)
	})
	$(".GoodsModel>.aContainer").mouseleave(function () {
	    $(this).siblings("img").stop().animate({ 'top': '0px' }, 300);
	})

//商品展示部分结束
				
})
	$(function() {
					totl();
					adddel()
						//全选
					$("#all").click(function() {
							all = $(this).prop("checked")
							$(".Each").each(function() {
								$(this).prop("checked", all);
							})
						})
						//删除当前行
					$(".del").each(function() {
							$(this).click(function() {
							    $(this).parent().remove();
							    totl();
								if($(".imfor").length == 0) {
									$("#susum").text(0);
								}
								
							})
					})
		
						//全选删除										
					$(".foot_del").click(function() {
						$(".Each").each(function() {
							if($(this).prop('checked')) {
								$(this).parents(".imfor").remove();
								totl();
								if($(".imfor").length == 0) {
									$("#susum").text(0);
								}
							}
						})

					})

				})
				//合计
	function totl() {
				var sum = 0;
				$(".totle").each(function() {
					sum += parseFloat($(this).text());
					$("#susum").text(sum);
				})
			}
	function adddel(){
				//小计和加减
					//加
					$(".add").each(function() {
							$(this).click(function() {
								var $multi = 0;
								var vall = $(this).prev().val();
								vall++;
								$(this).prev().val(vall);
								$multi = parseFloat(vall) * parseFloat($(this).parent().prev().text());
								$(this).parent().next().text(Math.round($multi));
								totl();
							})

						})
						//减
					$(".reduc").each(function() {
							$(this).click(function() {
								var $multi1 = 0;
								var vall1 = $(this).next().val();
								vall1--;
								if(vall1 <= 0) {
									vall1 = 1;
								}
								$(this).next().val(vall1);
								$multi1 = parseFloat(vall1) * parseFloat($(this).parent().prev().text());
								$(this).parent().next().text(Math.round($multi1));
								totl();
							})

						})
			}

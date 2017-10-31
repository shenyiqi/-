using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using MyPets.Model;
using MyPets.IDAL;
using MyPets.DALFactory;
using MyPets.BLL;
using PagedList;

namespace MyPets.Controllers
{
    public class HomeController : Controller
    {
        IBLL.IUserInfoServices UserInfoService = new BLL.UserInfoServices();
        IBLL.IOrderDetailServices OrderDetailService = new BLL.OrderDetailServices();
        IBLL.ICollectServices CollectService = new BLL.CollectServices();
        IBLL.IGoodsServices goodsService = new BLL.GoodsServices();
        IBLL.IGoodsCommentServices GoodsCommentServices = new BLL.GoodsCommentServices();
        IBLL.IShopCartServices ShopCartServices = new BLL.ShopCartServices();
        IBLL.IOrderServices OrderServices = new BLL.OrderServices();
        IBLL.IOrderDetailServices OrderDeailServices = new BLL.OrderDetailServices();
        IBLL.IUserInfoServices UserInfoServices = new BLL.UserInfoServices();
        IBLL.IShopServices shopServices = new BLL.ShopServices();
        IDBSession db = new DBSession();

        public ActionResult Index()
        {
            //Session["UserName"] = "用户5";
            //火爆商品
            var hotGoods = goodsService.LoadEntities(g => g.SellNum > 0).OrderByDescending(g => g.SellNum).Take(6).ToList();
            //促销商品
            var discountGoods = goodsService.LoadEntities(g => g.IsDiscount == true).OrderBy(x => Guid.NewGuid()).Take(6).ToList();
            var randomGoods = goodsService.LoadEntities(g => true).OrderBy(x => Guid.NewGuid()).Take(6).ToList();
            //狗狗商品
            var dogFood = goodsService.LoadEntities(g => g.SeriesName == "狗狗商品" && g.TypeName == "粮食").OrderBy(x => Guid.NewGuid()).Take(10).ToList();
            var dogShiliang = goodsService.LoadEntities(g => g.SeriesName == "狗狗商品" && g.TypeName == "湿粮").OrderBy(x => Guid.NewGuid()).Take(10).ToList();
            var dogYiliao = goodsService.LoadEntities(g => g.SeriesName == "狗狗商品" && g.TypeName == "医疗").OrderBy(x => Guid.NewGuid()).Take(10).ToList();
            var dogBaojian = goodsService.LoadEntities(g => g.SeriesName == "狗狗商品" && g.TypeName == "保健").OrderBy(x => Guid.NewGuid()).Take(10).ToList();
            var dogRiyong = goodsService.LoadEntities(g => g.SeriesName == "狗狗商品" && g.TypeName == "日用品").OrderBy(x => Guid.NewGuid()).Take(10).ToList();

            ViewData["hotgoods"] = hotGoods;
            ViewData["discountgoods"] = discountGoods;
            ViewData["randomgoods"] = randomGoods;
            ViewData["dogfood"] = dogFood;
            ViewData["dogshiliang"] = dogShiliang;
            ViewData["dogyiliao"] = dogYiliao;
            ViewData["dogbaojian"] = dogBaojian;
            ViewData["dogriyong"] = dogRiyong;


            //猫猫商品
            var catFood = goodsService.LoadEntities(g => g.SeriesName == "猫猫商品" && g.TypeName == "零食").Take(10).ToList();
            ViewData["catfood"] = catFood;


            //奇趣小宠
            var smallPetFood = goodsService.LoadEntities(g => g.SeriesName == "奇趣小宠" && g.TypeName == "粮食").Take(10).ToList();
            ViewData["smallpetfood"] = smallPetFood;

            //水族市场
            var aquaticPetFood = goodsService.LoadEntities(g => g.SeriesName == "水族市场" && g.TypeName == "日用品").Take(10).ToList();
            ViewData["aquaticpetfood"] = aquaticPetFood;

            //爬虫用品
            var reptileFood = goodsService.LoadEntities(g => g.SeriesName == "爬虫用品" && g.TypeName == "日用品").Take(10).ToList();
            ViewData["reptilefood"] = reptileFood;

            //店铺部分
            var shop = shopServices.LoadEntities(s => true).Take(9).ToList();
            ViewData["shop"] = shop;


            return View();
        }

        public ActionResult Search(string typeNum, string searchInput)//搜索判断
        {
            if (typeNum == "1")
            {
                return RedirectToAction("SearchGoods", new { searchInput, typeNum });
            }
            else
            {
                return RedirectToAction("SearchShop", new { searchInput, typeNum });
            }
        }
        public ActionResult SearchGoods(string typeNum, string searchInput, int? page)//搜索商品展示页面
        {
            if (searchInput != null)
            {
                int pageSize = 15;
                int pageNumber = (page ?? 1);
                var searchGoods = goodsService.LoadEntities(g => g.GoodsName.Contains(searchInput) || g.TypeName.Contains(searchInput)).ToList();
                ViewBag.num = searchGoods.Count();
                ViewData["searchInput"] = searchInput;
                return View(searchGoods.ToPagedList(pageNumber, pageSize));
            }
            else return Content("<script>alert('搜索不能为空！');history.go(-1);</script>");

        }
        public ActionResult SearchShop(string typeNum, string searchInput, int? page)//搜索店铺展示页面
        {
            if (searchInput != null)
            {
                int pageSize = 5;
                int pageNumber = (page ?? 1);
                var searchShops = shopServices.LoadEntities(s => s.ShopName.Contains(searchInput)).ToList();
                ViewBag.num = searchShops.Count();
                //ViewData["searchShops"] = searchShops;
                ViewData["searchInput"] = searchInput;
                return View(searchShops.ToPagedList(pageNumber, pageSize));
            }
            else return Content("<script>alert('搜索不能为空！');history.go(-1);</script>");
        }

        public ActionResult Shangpin(string keyword, string type)
        {
            Session["sptype"] = type;
            var gougou = goodsService.LoadEntities(b => b.DetailName.Contains(keyword)).ToList();
            return View(gougou);
        }

        public ActionResult AddToCart(int id)//加入购物车
        {
            if (Session["UserName"] != null)
            {
                string name = Session["UserName"].ToString();
                var cart = ShopCartServices.LoadEntities(c => c.GoodsId == id).FirstOrDefault();

                if (cart == null)
                {
                    //string[] sum = Request.Params.GetValues("multil");//数量
                    //int m =Convert.ToInt32( Request["sum"]);       
                    int m = 1;
                    var good = goodsService.LoadEntities(g => g.GoodsId == id).FirstOrDefault();
                    ShopCartServices.AddEntity(new ShopCart
                    {
                        GoodsId = good.GoodsId,
                        GoodsSum = m,
                        UserName = name
                    });
                    db.SaveChanges();
                    return Content("<script>alert('商品成功加入购物车！');window.location.href=document.referrer;</script>");
                }
                else
                {
                    return Content("<script>alert('购物车已经有了此商品了！');history.go(-1);</script>");
                }

            }
            else return Content("<script>alert('您还未登陆！！');history.go(-1);</script>");
        }
        public ActionResult goumai(int id)
        {
            var wupin = goodsService.LoadEntities(b => b.GoodsId == id).FirstOrDefault();
            //好评数
            var goodCommentsa = GoodsCommentServices.LoadEntities(gc => gc.GoodsId == id && gc.ContentRange == "好评").ToList();
            ViewBag.goodComments = goodCommentsa.Count();
            //中评数
            var goodCommentsb = GoodsCommentServices.LoadEntities(gc => gc.GoodsId == id && gc.ContentRange == "中评").ToList();
            ViewBag.goodComments2 = goodCommentsb.Count();
            ////差评数
            var goodCommentsc = GoodsCommentServices.LoadEntities(gc => gc.GoodsId == id && gc.ContentRange == "差评").ToList();
            ViewBag.goodComments3 = goodCommentsc.Count();
            var Comment = GoodsCommentServices.LoadEntities(gc => gc.GoodsId == id).ToList();
            ViewData["GoodsComment"] = Comment;
            return View(wupin);
        }
        public ActionResult Buynow(int id)
        {
            string name = Session["UserName"].ToString();
            var x = UserInfoServices.LoadEntities(g => g.UserName == name).FirstOrDefault();
            var wuping = goodsService.LoadEntities(b => b.GoodsId == id).FirstOrDefault();
            //int v = Convert.ToInt32(sum);
            //ViewData["TotalPrice"] = v;
            //int price = v * del.GoodsSum;
            //ViewData["Price"] = price;
            var tel = x.UserPhone;
            ViewData["Tel"] = tel;
            return View(wuping);

        }
        public ActionResult zhifu()//支付成功
        {
            var name = Session["UserName"].ToString();
            var order = OrderServices.LoadEntities(r => r.UserInfo.UserName == name).OrderByDescending(r => r.OrderTime).FirstOrDefault();
            return View(order);
        }
        public ActionResult jiesuan() //购物车结算页面
        {

            if (Session["UserName"] != null)
            {
                var name = Session["UserName"].ToString();
                var wupin = ShopCartServices.LoadEntities(b => b.UserName == name).ToList();
                return View(wupin);
            }
            else return Content("<script>alert('您还未登录？');history.go(-1);</script>");
        }

        public ActionResult Delect(int id) //结算删除购物车商品
        {
            var del = ShopCartServices.LoadEntities(s => s.GoodsId == id).FirstOrDefault();
            ShopCartServices.DeleteEntity(del);
            return Content("<script>alert('删除成功');window.location.href=document.referrer;</script>");
        }
        [HttpPost]
        public ActionResult PayGoods(string address) //结算商品购买
        {
            if (Session["UserName"] != null)
            {
                var name = Session["UserName"].ToString();
                string[] goodsid = Request.Params.GetValues("goodsid"); //商品id
                string[] goodssum = Request.Params.GetValues("goodssum");//数量
                string[] check = Request.Params.GetValues("checkbox2");//判断是否选中
                var count = Convert.ToDecimal(Request["TotalPrice"]);
                var user = UserInfoServices.LoadEntities(u => u.UserName == name).FirstOrDefault(); //获取用户
                Random rd = new Random();
                var orderlength = 12;
                var ordernumber = "";
                for (var i = 0; i < orderlength; i++)
                {
                    ordernumber += rd.Next(10).ToString();
                }
                string number = ordernumber;//订单号
                OrderServices.AddEntity(new Order  //形成订单表
                {
                    UserId = user.UserId,
                    OrderAddress = "skdjf",
                    OrderTime = DateTime.Now,
                    OrderState = false,
                    OrderCount = count,
                    OrderNumber = ordernumber
                });
                db.SaveChanges();
                var orderid = OrderServices.LoadEntities(o => true).OrderByDescending(o => o.OrderId).Take(1).FirstOrDefault();
                for (int i = 0; i < goodsid.Length; i++)
                {
                    if (check[i] == "1")
                    {
                        int id = Convert.ToInt32(goodsid[i]);
                        var goods = goodsService.LoadEntities(g => g.GoodsId == id).FirstOrDefault();
                        decimal price; //商品价格
                        if (goods.IsDiscount)
                        {
                            price = (goods.DiscountPrice ?? 1);
                        }
                        else
                        {
                            price = goods.GoodsPrice;
                        }
                        int sum = Convert.ToInt32(goodssum[i]);
                        decimal countprice = price * sum;
                        OrderDeailServices.AddEntity(new OrderDetail  //订单明细表
                        {
                            GoodsId = id,
                            OrderId = orderid.OrderId,
                            DetailSum = sum,
                            UserId = user.UserId,
                            DetailCount = countprice,
                            OrderNumber = number,
                            OrderState = false
                        });
                    }
                    db.SaveChanges();

                }

                return Content("<script>alert('成功购买！');window.open('" + Url.Action("Clear", "Home", new { name = Session["UserName"] }) + "') ;</script>");

            }
            else return Content("<script>alert('您还未登陆！！');history.go(-1);</script>");
        }
        [HttpPost]
        public ActionResult Buy(int id) //立即购买
        {
            var name = Session["UserName"].ToString();
            var goods = goodsService.LoadEntities(g => g.GoodsId == id).FirstOrDefault();
            decimal price = goods.GoodsPrice; ; //商品价格                           
            var user = UserInfoServices.LoadEntities(u => u.UserName == name).FirstOrDefault(); //获取用户
            Random rd = new Random();
            var orderlength = 12;
            var ordernumber = "";
            for (var i = 0; i < orderlength; i++)
            {
                ordernumber += rd.Next(10).ToString();
            }
            string number = ordernumber;//订单号
            OrderServices.AddEntity(new Order  //形成订单表
            {
                UserId = user.UserId,
                OrderAddress = "2",
                OrderTime = DateTime.Now,
                OrderState = false,
                OrderCount = 1,
                OrderNumber = ordernumber
            });
            db.SaveChanges();
            var orderid = OrderServices.LoadEntities(o => true).OrderByDescending(o => o.OrderId).Take(1).FirstOrDefault();
            OrderDeailServices.AddEntity(new OrderDetail  //订单明细表
            {
                GoodsId = id,
                OrderId = orderid.OrderId,
                DetailSum = 1,
                UserId = user.UserId,
                DetailCount = price,
                OrderNumber = number,
                OrderState = false
            });
            db.SaveChanges();
            return RedirectToAction("zhifu");
        }
        public ActionResult LoginOff()  //退出登录
        {
            Session["UserName"] = null;
            return RedirectToAction("Index");
        }
        public ActionResult Comment(int id)//评价
        {
            var name = Session["UserName"].ToString();
            var comment = goodsService.LoadEntities(b => b.GoodsId == id).FirstOrDefault();
            return View(comment);
        }
        public ActionResult AddToCollect(int id, string type)//加入收藏表中
        {
            if (Session["UserName"] != null)
            {
                string name = Session["UserName"].ToString();
                var User = UserInfoService.LoadEntities(c => c.UserName == name).FirstOrDefault();
                var Table = CollectService.LoadEntities(c => c.ShopId == id).FirstOrDefault();
                if (Table == null)
                {
                    var good = goodsService.LoadEntities(g => g.GoodsId == id).FirstOrDefault();
                    CollectService.AddEntity(new Collect
                    {
                        ShopId = good.GoodsId,
                        UserId = User.UserId,
                    });
                    db.SaveChanges();
                    return Content("<script>alert('商品收藏成功！');history.go(-1);</script>");
                }
                else
                {
                    return Content("<script>alert('商品已经收藏了！');history.go(-1);</script>");
                }
            }
            else return Content("<script>alert('您还未登陆！！');history.go(-1);</script>");
        }
        public ActionResult Clear(string name) //购买完成后清空购物车
        {
            var cart = ShopCartServices.LoadEntities(s => s.UserName == name).ToList();
            for (int i = 0; i < cart.Count; i++)
            {
                ShopCartServices.DeleteEntity(cart[i]);
            }
            db.SaveChanges();
            //return Content(Url.Action("zhifu", "Home", new { name = Session["UserName"] }));
            return RedirectToAction("zhifu");
        }
        public ActionResult ClearCart(string name) //手动清空购物车
        {
            var cart = ShopCartServices.LoadEntities(s => s.UserName == name).ToList();
            for (int i = 0; i < cart.Count; i++)
            {
                ShopCartServices.DeleteEntity(cart[i]);
            }
            db.SaveChanges();
            return Content("<script>alert('清空成功！');history.go(-1);</script>");
        }
        [HttpPost]
        public ActionResult AddToGoodsComment(string id, string InputType, string content)//加入评论表中
        {
            string name = Session["UserName"].ToString();
            var x = UserInfoServices.LoadEntities(g => g.UserName == name).FirstOrDefault();
            int f = Convert.ToInt32(id);
            //var good = GoodsCommentServices.LoadEntities(g => g.GoodsId ==f).FirstOrDefault();

            GoodsCommentServices.AddEntity(new GoodsComment
            {
                ContentRange = InputType,
                CommentContent = content,
                CommentTime = DateTime.Now,
                GoodsId = f,
                UsersId = x.UserId,
                IsReply = false
            }
            );
            db.SaveChanges();

            return Content("<script>alert('评价成功');history.go(-1);</script>");
        }
        public ActionResult About()
        {
            ViewBag.Message = "Your application description page.";
            return View();
        }
        public ActionResult Contact()
        {
            ViewBag.Message = "Your contact page.";
            return View();
        }
    }
}
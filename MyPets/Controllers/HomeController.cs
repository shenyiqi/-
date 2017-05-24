using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using MyPets.Model;
using MyPets.IDAL;
using MyPets.DALFactory;

namespace MyPets.Controllers
{
    public class HomeController : Controller
    {
        IBLL.IGoodsServices goodsService = new BLL.GoodsServices();
        IBLL.IShopCartServices ShopCartServices = new BLL.ShopCartServices();
        IBLL.IOrderServices OrderServices = new BLL.OrderServices();
        IBLL.IOrderDetailServices OrderDeailServices = new BLL.OrderDetailServices();
        IBLL.IUserInfoServices UserInfoServices = new BLL.UserInfoServices();
        IDBSession db = new DBSession();
       
        public ActionResult Index()
        {
            Session["UserName"] = "用户1";
            //火爆商品
            var hotGoods = goodsService.LoadEntities(g => g.SellNum > 0).OrderByDescending(g => g.SellNum).Take(6).ToList();
            //促销商品
            var discountGoods = goodsService.LoadEntities(g => g.IsDiscount == true).Take(6).ToList();
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


            return View();
        }

        public ActionResult Search()
        {

            return View();
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
        public ActionResult Shangpin(string keyword, string type)
        {
            Session["sptype"] = type;
            var gougou = goodsService.LoadEntities(b => b.DetailName.Contains(keyword)).ToList();
            return View(gougou);
        }

        public ActionResult AddToCart(int id, int? sum)
        {
            if (Session["UserName"] != null)
            {
                string name = Session["UserName"].ToString();
                var cart = ShopCartServices.LoadEntities(c => c.GoodsId == id).FirstOrDefault();
                if (cart == null)
                {
                    var good = goodsService.LoadEntities(g => g.GoodsId == id).FirstOrDefault();
                    ShopCartServices.AddEntity(new ShopCart
                    {
                        GoodsId = good.GoodsId,
                        GoodsSum = (sum ?? 1),
                        UserName = name
                    });
                    db.SaveChanges();
                    return Content("<script>alert('商品成功加入购物车！');history.go(-1);</script>");
                }
                else
                {
                    return Content("<script>alert('商品已经加入购物车啦！');history.go(-1);</script>");
                }

            }
            else return Content("<script>alert('您还未登陆！！');history.go(-1);</script>");
        }
        public ActionResult goumai(int id)
        {
            var wupin = goodsService.LoadEntities(b => b.GoodsId == id).FirstOrDefault();
            return View(wupin);
        }
        public ActionResult jiesuan() //购物车结算
        {
            if (Session["UserName"] != null)
            {
                var name = Session["UserName"].ToString();
                var wupin = ShopCartServices.LoadEntities(b => b.UserName == name).ToList();
                return View(wupin);
            }
            else return Content("<script>alert('您还未登录？');history.go(-1);</script>");
        }
        public ActionResult Delect(int id) //删除购物车商品
        {
            var del = ShopCartServices.LoadEntities(s => s.GoodsId == id).FirstOrDefault();
            ShopCartServices.DeleteEntity(del);
            return RedirectToAction("jiesuan");
        }
        [HttpPost]
        public ActionResult PayGoods() //商品购买
        {
            var name = Session["UserName"].ToString();
            string[] goodsid = Request.Params.GetValues("goodsid");
            string[] goodssum = Request.Params.GetValues("goodssum");
            var count = Convert.ToInt32(Request["susum"]);
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
                OrderAddress = "带填",
                OrderTime = DateTime.Now,
                OrderState = false,
                OrderCount = count,
                OrderNumber = ordernumber
            });
            for (int i = 0; i < goodsid.Length; i++)
            {
                int id = Convert.ToInt32(goodsid[i]);
                int sum = Convert.ToInt32(goodssum[i]);
                int countprice = id * sum;
                OrderDeailServices.AddEntity(new OrderDetail  //订单明细表
                {
                    GoodsId=id,
                    DetailSum=sum,
                    UserId=user.UserId,
                    DetailCount=countprice,
                    OrderNumber=number
                });
               
            }
            db.SaveChanges();
            return Content("<script>alert('成功购买！');history.go(-1);</script>");
        }
        public ActionResult LoginOff()  //退出登录
        {
            Session["UserName"] = null;
            return RedirectToAction("Index");
        }
        public ActionResult Comment(int id)//评价
        {
            if (Session["UserName"] != null)
            {
                string name = Session["UserName"].ToString();
                var cart = ShopCartServices.LoadEntities(c => c.GoodsId == id).FirstOrDefault();
                
                    var good = goodsService.LoadEntities(g => g.GoodsId == id).FirstOrDefault();
                    ShopCartServices.AddEntity(new ShopCart
                    {
                        GoodsId = good.GoodsId,                      
                        UserName = name
                    });
                    db.SaveChanges();
                    return Content("<script>alert('评价成功');history.go(-1);</script>");
            }
            else return Content("<script>alert('您还未登陆！！');history.go(-1);</script>");
        }
    }
}
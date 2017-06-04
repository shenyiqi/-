using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using PagedList;
using MyPets.IDAL;
using MyPets.DALFactory;

namespace MyPets.Controllers
{
    public class StoreController : Controller
    {
        // GET: Store
        IBLL.IShopServices ShopServices = new BLL.ShopServices();
        IBLL.IGoodsServices GoodsService = new BLL.GoodsServices();
        IBLL.ICollectServices CollectService = new BLL.CollectServices();
        IBLL.IUserInfoServices UserInfoServices = new BLL.UserInfoServices();
        IBLL.IShopCartServices ShopCartServices = new BLL.ShopCartServices();
        IDBSession db = new DBSession();
        public ActionResult Index(int? shopid)
        {
            int id = (shopid ?? 1);
            var discountgoods = GoodsService.LoadEntities(g => g.IsDiscount == true && g.ShopId == id).ToList();
            ViewData["discountgoods"] = discountgoods; //促销商品
            ViewBag.shopid = id;
            Session["shopid"] = id;
            Session["hascollect"] = "no";  //判断是否收藏
            if (Session["UserName"] != null)
            {
                var name = Session["UserName"].ToString();
                var user = UserInfoServices.LoadEntities(u => u.UserName == name).FirstOrDefault();
                var collect = CollectService.LoadEntities(c => c.UserId == user.UserId).FirstOrDefault();
                if (collect == null)
                {
                    Session["hascollect"] = "no";
                }
                else Session["hascollect"] = "yes";
            }
            return View();
        }
        public ActionResult PartialAllGoods(int? page)//全部
        {
            int id = Convert.ToInt32(Session["shopid"]);
            int pageSize = 9;
            int pageNumber = (page ?? 1);
            var allgoods = GoodsService.LoadEntities(g => g.ShopId == id).ToList();
            ViewData["allgoods"] = allgoods;
            if (Request.IsAjaxRequest())
            {
                return PartialView("PartialAllGoods", allgoods.ToPagedList(pageNumber, pageSize));
            }
            else return View("PartialAllGoods", allgoods.ToPagedList(pageNumber, pageSize));
        }
        public ActionResult PartialDogGoods(int? page)//狗
        {
            int id = Convert.ToInt32(Session["shopid"]);
            var doggoods = GoodsService.LoadEntities(g => g.ShopId == id && g.SeriesName == "狗狗商品").ToList();
            ViewData["doggoods"] = doggoods;
            int pageSize = 9;
            int pageNumber = (page ?? 1);
            if (Request.IsAjaxRequest())
            {
                return PartialView("PartialDogGoods", doggoods.ToPagedList(pageNumber, pageSize));
            }
            else return View("PartialDogGoods", doggoods.ToPagedList(pageNumber, pageSize));
        }
        public ActionResult PartialCatGoods(int? page)//猫
        {
            int id = Convert.ToInt32(Session["shopid"]);
            var catgoods = GoodsService.LoadEntities(g => g.ShopId == id && g.SeriesName == "猫猫商品").ToList();
            ViewData["doggoods"] = catgoods;
            int pageSize = 9;
            int pageNumber = (page ?? 1);
            if (Request.IsAjaxRequest())
            {
                return PartialView("PartialCatGoods", catgoods.ToPagedList(pageNumber, pageSize));
            }
            else return View("PartialCatGoods", catgoods.ToPagedList(pageNumber, pageSize));
        }
        public ActionResult PartialLittleGoods(int? page)//小宠物
        {
            int id = Convert.ToInt32(Session["shopid"]);
            var littlegoods = GoodsService.LoadEntities(g => g.ShopId == id && (g.SeriesName == "奇趣小宠" || g.SeriesName == "爬虫用品")).ToList();
            ViewData["doggoods"] = littlegoods;
            int pageSize = 9;
            int pageNumber = (page ?? 1);
            if (Request.IsAjaxRequest())
            {
                return PartialView("PartialLittleGoods", littlegoods.ToPagedList(pageNumber, pageSize));
            }
            else return View("PartialLittleGoods", littlegoods.ToPagedList(pageNumber, pageSize));
        }
        public ActionResult PartialWaterGoods(int? page)//水族
        {
            int id = Convert.ToInt32(Session["shopid"]);
            var watergoods = GoodsService.LoadEntities(g => g.ShopId == id && g.SeriesName == "水族市场").ToList();
            ViewData["doggoods"] = watergoods;
            int pageSize = 9;
            int pageNumber = (page ?? 1);
            if (Request.IsAjaxRequest())
            {
                return PartialView("PartialWaterGoods", watergoods.ToPagedList(pageNumber, pageSize));
            }
            else return View("PartialWaterGoods", watergoods.ToPagedList(pageNumber, pageSize));
        }
        public ActionResult GoodsDetail(int goodsid)
        {
            int id = Convert.ToInt32(Session["shopid"]);
            var shopname = ShopServices.LoadEntities(s => s.ShopId == 1).FirstOrDefault();
            ViewBag.Title = shopname.ShopName;
            var discountgoods = GoodsService.LoadEntities(g => g.IsDiscount == true && g.ShopId == id).OrderBy(g => Guid.NewGuid()).Take(4).ToList();
            ViewData["discountgoods"] = discountgoods; //促销商品
            var goods = GoodsService.LoadEntities(g => g.GoodsId == goodsid).FirstOrDefault();
            var relatedgoods = GoodsService.LoadEntities(g => g.GoodsId == 1 && g.DetailName == goods.DetailName).ToList();
            ViewData["relatedgoods"] = relatedgoods;
            return View(goods);
        }
        public ActionResult CollectStore() //收藏店铺
        {
            if (Session["UserName"] == null)
            {
                return Content("<script>alert('登录后才能收藏店铺哦！');history.go(-1);</script>");
            }
            else
            {
                var id = Convert.ToInt32(Session["shopid"]);
                var name = Session["UserName"].ToString();
                var userid = UserInfoServices.LoadEntities(u => u.UserName == name).FirstOrDefault();
                CollectService.AddEntity(new Model.Collect
                {
                    ShopId = Convert.ToInt32(Session["shopid"]),
                    UserId = userid.UserId
                });
                db.SaveChanges();
                return Content("<script>alert('收藏成功！');window.location.href='/Store/Index'</script>");
            }
        }
        public ActionResult CancleCollect() //取消收藏
        {
            var name = Session["UserName"].ToString();
            var user = UserInfoServices.LoadEntities(u => u.UserName == name).FirstOrDefault();
            var del = CollectService.LoadEntities(c => c.UserId == user.UserId).FirstOrDefault();
            CollectService.DeleteEntity(del);
            Session["hascollect"] = "no";
            return RedirectToAction("Index");
        }
        public ActionResult SearchShopGoods(string searchthing,int? page) //店内搜索
        {
            var id = Convert.ToInt32(Session["shopid"]);
            var goods = GoodsService.LoadEntities(g => g.ShopId == id && g.GoodsName.Contains(searchthing)).ToList();
            int pageSize = 15;
            int pageNumber = (page ?? 1);
            ViewBag.goods = searchthing;
            return View(goods.ToPagedList(pageNumber, pageSize));
            
        }
        public ActionResult PartialCart()
        {
            var name = Session["UserName"].ToString();
            int countsum = 0;
            var cart = ShopCartServices.LoadEntities(s => s.UserName == name).ToList();
            ViewBag.sum = cart.Count(); //统计购物车数量
            for (int i = 0; i < cart.Count(); i++)
            {
                int a = cart[i].GoodsId;
                var goods = GoodsService.LoadEntities(g => g.GoodsId == a).FirstOrDefault();
                if (goods.IsDiscount)
                {
                    countsum = countsum + cart[i].GoodsSum * Convert.ToInt32(goods.DiscountPrice);
                }
                else countsum = countsum + cart[i].GoodsSum * Convert.ToInt32(goods.GoodsPrice);

            }
            ViewBag.count = countsum;
            return PartialView();
        }


        public ActionResult LoginOff()
        {
            Session["UserName"] = null;
            return RedirectToAction("Index", "Home");
        }
    }
}
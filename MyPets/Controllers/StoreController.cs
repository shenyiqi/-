using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using PagedList;
namespace MyPets.Controllers
{
    public class StoreController : Controller
    {
        // GET: Store
        IBLL.IShopServices ShopServices = new BLL.ShopServices();
        IBLL.IGoodsServices GoodsService = new BLL.GoodsServices(); 
        public ActionResult Index(int? shopid)
        {
            int id = (shopid ?? 1);
            var discountgoods = GoodsService.LoadEntities(g => g.IsDiscount == true && g.ShopId == id).ToList();
            ViewData["discountgoods"] = discountgoods; //促销商品
            ViewBag.shopid = id;
            Session["shopid"] = id;
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
        public ActionResult SearchGoods(string goods,int? page)
        {
            int id = Convert.ToInt32(Session["shopid"]);
            var shopgoods = GoodsService.LoadEntities(g => g.ShopId == id && g.GoodsName.Contains(goods)).ToList();
            int pageSize = 9;
            int pageNumber = (page ?? 1);
            ViewBag.goods = goods;
            return View(shopgoods.ToPagedList(pageNumber, pageSize));
        }

    }
}
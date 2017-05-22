using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace MyPets.Controllers
{
    public class HomeController : Controller
    {
        IBLL.IGoodsServices goodsService = new BLL.GoodsServices();

        public ActionResult Index()
        {
            //火爆商品
            var hotGoods = goodsService.LoadEntities(g=>g.SellNum>0).OrderByDescending(g=>g.SellNum).Take(6).ToList();
            //促销商品
            var discountGoods = goodsService.LoadEntities(g => g.IsDiscount == true).Take(6).ToList();
            var randomGoods = goodsService.LoadEntities(g=>true).OrderBy(x => Guid.NewGuid()).Take(6).ToList();
            //狗狗商品
            var dogFood=goodsService.LoadEntities(g=>g.SeriesName=="狗狗商品" && g.TypeName == "粮食").OrderBy(x => Guid.NewGuid()).Take(10).ToList();
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
       public ActionResult Shangpin(string keyword,string type, string txttype, int? page)
        {
            Session["sptype"] = type;
            var gougou =goodsService.LoadEntities(b=>b.DetailName.Contains(keyword)).ToList();
            return View(gougou);


            //int pageSize =10;
            //int pageNumber = (page ?? 1);
            //ViewBag.num = baike.Count();
            //ViewData["type"] = txttype;
            //return View(baike.ToPagedList(pageNumber, pageSize));

        }
        public ActionResult goumai(int id)
        {
            var wupin = goodsService.LoadEntities(b => b.GoodsId == id).FirstOrDefault();
            return View(wupin);
        }
        public ActionResult jiesuan()
        {
            return View();
        }
    }
}
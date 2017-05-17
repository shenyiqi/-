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
            var hotGoods = goodsService.LoadEntities(g=>g.SellNum>0).OrderByDescending(g=>g.SellNum).Take(6).ToList();
            var randomGoods = goodsService.LoadEntities(g=>true).OrderBy(x => Guid.NewGuid()).Take(6).ToList();
            ViewData["hotgoods"] = hotGoods;
            ViewData["randomgoods"] = randomGoods;
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
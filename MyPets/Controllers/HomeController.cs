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
            var randomGoods = goodsService.LoadEntities(g=>true).OrderBy(x => Guid.NewGuid()).Take(6);
            ViewData["hotgoods"] = hotGoods;
            //ViewData["randomgoods"] = randomGoods;
            return View(randomGoods);
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
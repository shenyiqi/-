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
            var goods = goodsService.LoadEntities(g=>g.SellNum>0).OrderByDescending(g=>g.SellNum).ToList();
            return View(goods);
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
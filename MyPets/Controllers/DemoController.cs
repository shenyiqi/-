using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace MyPets.Controllers
{
    public class DemoController : Controller
    {
        // GET: Default
        public ActionResult Index() //视频播放
        {
            return View();
        }

        public ActionResult ShareDataDemo()
        {
            ViewBag.datetime = DateTime.Now;
            return View();
        }
        public ActionResult DateTimePartialViewDate()
        {
            return View();
        }
        [ChildActionOnly]
        public ActionResult PartialViewDate()
        {
            ViewBag.datetime = DateTime.Now.AddMinutes(5);
            return View("DateTimePartialViewDate");
        }
        public ActionResult Demo()
        { 
            return View();
        }
    }
}
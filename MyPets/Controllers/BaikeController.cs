using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using MyPets.Model;
namespace MyPets.Controllers
{
    public class BaikeController : Controller
    {
        // GET: Baike
        MyPets.IBLL.IBaikeServices BaikeServices=new MyPets.BLL.BaikeServices();
        MyPetsEntities db = new MyPetsEntities();
        public ActionResult Index()
        {
            var dogBaike= BaikeServices.LoadEntities(b =>b.BaikeSeries=="狗系列").Take(6).ToList(); 
            var dogTitle = db.Baike.OrderBy(b => b.BaikeSeries == "狗系列").Skip(6).Take(6).ToList();

            var catBaike = BaikeServices.LoadEntities(b =>b.BaikeSeries=="猫系列").Take(6).ToList();
            var catTitle = db.Baike.OrderBy(b => b.BaikeSeries == "猫系列").Skip(6).Take(6).ToList();

            var littlepet = BaikeServices.LoadEntities(b => b.BaikeSeries == "小宠系列").Take(6).ToList();
            var littleTitle= db.Baike.OrderBy(b => b.BaikeSeries == "小宠系列").Skip(6).Take(6).ToList();

            var waterpet = BaikeServices.LoadEntities(b => b.BaikeSeries == "水族系列").Take(6).ToList();
            var waterTitle= db.Baike.OrderBy(b => b.BaikeSeries == "水族系列").Skip(6).Take(6).ToList();
            ViewData["dog"] = dogBaike;   ViewData["dogtitle"] = dogTitle;

            ViewData["cat"] = catBaike;   ViewData["cattitle"] = catTitle;

            ViewData["littlepet"] = littlepet;  ViewData["littletitle"] = littleTitle;

            ViewData["water"] = waterpet;    ViewData["watertitle"] = waterTitle;
            return View();
        }
        public ActionResult Show(int id) //显示单个百科
        { 
            var baike = BaikeServices.LoadEntities(b => b.BaikeId == id).FirstOrDefault();
            return View(baike);
        }
       
        public ActionResult Search(string txtBaikeTitle)//显示搜索的百科
        {
            //||b.BaikeType.Contains(txtBaikeTitle)||b.BaikeSeries.Contains(txtBaikeTitle)
            ViewBag.search = txtBaikeTitle;
            var baike = BaikeServices.LoadEntities(b => b.BaikeTitle.Contains(txtBaikeTitle) || b.BaikeType.Contains(txtBaikeTitle) || b.BaikeSeries.Contains(txtBaikeTitle)).ToList();
            ViewBag.num = baike.Count();
            return View(baike);
        }

    }
}
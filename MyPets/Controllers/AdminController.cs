using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using MyPets.Models;
using MyPets.Model;

namespace MyPets.Controllers
{
    public class AdminController : Controller
    {
        // GET: Admin
        MyPets.IBLL.IUserInfoServices UserInfoServices = new MyPets.BLL.UserInfoServices();
        MyPets.IBLL.IGoodsServices GoodsServices = new MyPets.BLL.GoodsServices();
        public ActionResult Index()
        {
            return View();
        }
        [HttpGet]
        public ActionResult Baike()
        {
           return View();
        }
        [HttpPost]
        [ValidateInput(false)]
        public ActionResult Baike(string txttitle,string txtseries,string id_select,string txtdescribe, FormCollection fc)
        {
            MyPetsEntities db = new MyPetsEntities();
            var content=fc["Bcontent"];
            HttpPostedFileBase postimg = Request.Files["txtimg"];
            string filepath = postimg.FileName;
            if (filepath == "")
            {
                return Content("<script>; alert('用户名密码有误，或该账号不存在!'); history.go(-1) </ script >");
            }
            string filename = filepath.Substring(filepath.LastIndexOf("//") + 1);
            string serverpath = Server.MapPath("~/Content/Admin/Baike/img/upload/") + filename;
            string relativepath = @"~/Content/Admin/Baike/img/upload/" + filename;
            db.Baike.Add(new MyPets.Model.Baike()
            {
                BaikeTitle = txttitle,
                BaikeSeries = txtseries,
                BaikeDescribe=txtdescribe,
                BaikeType = id_select,
                BaikeContent = content,
                BaikeTime=DateTime.Now
            });
            db.SaveChanges();
            return View();
        }
        public ActionResult UserManagement()
        {
            var userInfo = UserInfoServices.LoadEntities(u =>true).ToList();
            ViewData.Model = userInfo;
            return View();
        }
        public ActionResult Entry() 
        {
            return View();
        }
        public ActionResult GoodsEntry() 
        {
            var goods = GoodsServices.LoadEntities(g => true).ToList();
            return View(goods);
        }
    }
}
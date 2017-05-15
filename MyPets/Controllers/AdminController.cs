using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using MyPets.Models;
using MyPets.Model;
using MyPets.IDAL;
using MyPets.DALFactory;

namespace MyPets.Controllers
{
    public class AdminController : Controller
    {
        // GET: Admin
        IBLL.IUserInfoServices UserInfoServices = new BLL.UserInfoServices();
        IBLL.IGoodsServices GoodsServices = new BLL.GoodsServices();
        IBLL.IBaikeServices BaikeServices = new BLL.BaikeServices();
        IDBSession db = new DBSession();
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
        public ActionResult Baike(string txttitle, string txtseries, string id_select, string txtdescribe, FormCollection fc)
        {
            var content = fc["Bcontent"];
            HttpPostedFileBase postimg = Request.Files["txtimg"];
            string filepath = postimg.FileName;
            if (filepath == null)
            {
                return Content("<script>; alert('请选择图片！'); history.go(-1) </ script >");
            }
            else
            {

                string filename = filepath.Substring(filepath.LastIndexOf("//") + 1);
                string serverpath = Server.MapPath("~/Content/Admin/Baike/img/upload/") + filename;
                string relativepath = @"~/Content/Admin/Baike/img/upload/" + filename;
                BaikeServices.AddEntity(new Baike()
                {
                    BaikeTitle = txttitle,
                    BaikeSeries = txtseries,
                    BaikeDescribe = txtdescribe,
                    BaikeImg = relativepath,
                    BaikeType = id_select,
                    BaikeContent = content,
                    BaikeTime = DateTime.Now
                });
                db.SaveChanges();
                return View();
            }
        }
        public ActionResult UserManagement()
        {
            var userInfo = UserInfoServices.LoadEntities(u => true).ToList();
            return View(userInfo);
        }
        public ActionResult AdManagement() //店铺推荐
        {
            return View();
        }
        public ActionResult OrderManagement()
        {
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
       
        public ActionResult ShowGoods(string goodstitle)
        {
            var goods = GoodsServices.LoadEntities(g => g.GoodsName.Contains(goodstitle) || g.DetailName.Contains(goodstitle)).ToList();
            return View(goods);
        }
        public ActionResult EditGoods(int goodsid)
        { 
            var goods = GoodsServices.LoadEntities(g => g.GoodsId == goodsid).FirstOrDefault();
            return View(goods);
        }
        public ActionResult DeleteGoods(int id)
        {
            var goods = GoodsServices.LoadEntities(g => g.GoodsId == id).FirstOrDefault();
            var delgoods = GoodsServices.DeleteEntity(goods);
            if (delgoods)
            {
                db.SaveChanges();
                Content("<script>;alert('删除成功！');window.location.href='/Admin/GoodsEntry'</script>");
                return RedirectToAction("GoodsEntry");
            }
            return Content("<script>alert('删除失败！')</script>");
        }
    }
}
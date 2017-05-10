using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.ComponentModel.DataAnnotations;
using MyPets.Models;
using MyPets.Model;
using MyPets.IDAL;
using MyPets.DALFactory;

namespace MyPets.Controllers
{
    public class ShopController : Controller
    {
        // GET: Shop
        IBLL.IGoodsServices GoodsServices = new BLL.GoodsServices();
        IBLL.IShopServices ShopServices = new BLL.ShopServices();
        IDBSession db = new DBSession();
        public ActionResult Index(int? id)//int? id表示可以为空的整数=nullable<id>
        {
            return View();
        }
        [HttpGet]
        public ActionResult Register()
        {
            return View();
        }
        [HttpPost]
        public ActionResult Register(Shop shop)
        {
            if (ModelState.IsValid) 
            {
                HttpPostedFileBase shopimg = Request.Files["ShopImg"];
                string filepath = shopimg.FileName;
                string filename = filepath.Substring(filepath.LastIndexOf("//") + 1);
                string serverpath = Server.MapPath("~/Content/Shop/upload/Store/") + filename;
                string relativepath = @"~/Content/Shop/upload/Store/" + filename;
                shopimg.SaveAs(serverpath);
                shop.ShopImg = relativepath;
                ShopServices.AddEntity(shop);
                db.SaveChanges();
                return View();
            }
            return View();
        }
        [HttpGet]
        public ActionResult UpGoods()
        {
            return View();
        }
        [HttpPost]
        [ValidateInput(false)]
        public ActionResult UpGoods(string txtname, string txtprice, string txtdescribe, string txtstock, string selectseries, string selecttype, string selectdetailtype)
        {
            HttpPostedFileBase postimg1 = Request.Files["txtimg1"];//获取路径string txtname, string txtprice, string txtdescribe, string txtstock, string selectseries, string selecttype, string selectdetailtype, string txtimg1, string txtimg2, string txtimg3, string txtimg4
            string filepath1 = postimg1.FileName;
            string filename1=filepath1.Substring(filepath1.LastIndexOf("//")+1);
            string serverpath1 = Server.MapPath("~/Content/Shop/upload/Goods/") + filename1;//图片存储路径
            string relativepath1 = @"~/Content/Shop/upload/Goods/" + filename1;
            postimg1.SaveAs(serverpath1);

            HttpPostedFileBase postimg2 = Request.Files["txtimg2"];//获取图片2
            string filepath2 = postimg2.FileName;
            string filename2 = filepath2.Substring(filepath2.LastIndexOf("//") + 1);
            string serverpath2 = Server.MapPath("~/Content/Shop/upload/Goods/") + filename2;
            string relativepath2 = @"~/Content/Shop/upload/Goods/" + filename2;
            postimg2.SaveAs(serverpath2);

            HttpPostedFileBase postimg3 = Request.Files["txtimg3"];//获取图片3
            string filepath3 = postimg3.FileName;
            string filename3 = filepath3.Substring(filepath3.LastIndexOf("//") + 1);
            string serverpath3 = Server.MapPath("~/Content/Shop/upload/Goods/") + filename3;
            string relativepath3 = @"~/Content/Shop/upload/Goods/" + filename3;
            postimg3.SaveAs(serverpath3);

            HttpPostedFileBase postimg4 = Request.Files["txtimg4"];//获取图片4
            string filepath4 = postimg4.FileName;
            string filename4 = filepath4.Substring(filepath4.LastIndexOf("//") + 1);
            string serverpath4 = Server.MapPath("~/Content/Shop/upload/Goods/") + filename4;
            string relativepath4 = @"~/Content/Shop/upload/Goods/" + filename4;
            postimg4.SaveAs(serverpath4);
            GoodsServices.AddEntity(new Goods()
            {
                GoodsName = txtname,
                SeriesName = selectseries,
                TypeName = selecttype,
                DetailName = selectdetailtype,
                GoodsPrice = Convert.ToDecimal(txtprice),
                GoodsDescribe = txtdescribe,
                GoodsStock = Convert.ToInt32(txtstock),
                SellNum = 0,
                IsDiscount = false,
                ShopId = 1,
                GoodsImg1 = relativepath1,
                GoodsImg2 = relativepath2,
                GoodsImg3 = relativepath3,
                GoodsImg4 = relativepath4
            });
            db.SaveChanges();
            return View();
        }
        public ActionResult Order()
        {
            return View();
        }
        public ActionResult UpDiscountGoods()
        {
            return View();
        }
    }
}
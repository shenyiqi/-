using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using MyPets.Models;
using MyPets.Model;
using MyPets.IDAL;
using PagedList;
using MyPets.DALFactory;
using MyPets.DAL;

namespace MyPets.Controllers
{
    public class AdminController : Controller
    {
        // GET: Admin
        IBLL.IUserInfoServices UserInfoServices = new BLL.UserInfoServices();
        IBLL.IGoodsServices GoodsServices = new BLL.GoodsServices();
        IBLL.IGoodsCommentServices GoodsCommentServices = new BLL.GoodsCommentServices();
        IBLL.IShopServices ShopServices = new BLL.ShopServices();
        IBLL.IBaikeServices BaikeServices = new BLL.BaikeServices();
        IBLL.ICollectServices CollectServices = new BLL.CollectServices();
        IBLL.IBaikeAnswerServices BaikeAnswerServices = new BLL.BaikeAnswerServices();
        IBLL.IBaikeQuestionServices BaikeQuestionServices = new BLL.BaikeQuestionServices();
        IBLL.IOrderDetailServices OrderDetailServices = new BLL.OrderDetailServices();
        IBLL.IOrderServices OrderServices = new BLL.OrderServices();
        IBLL.IPostServices PostServices = new BLL.PostServices();
        IBLL.IResponseServices ResponseServices = new BLL.ResponseServices();
        IBLL.IBaikeActivityServices BaikeActivityServices = new BLL.BaikeActivityServices();
        IDBSession db = new DBSession();
        public ActionResult Index()
        {
            return View();
        }
        [HttpGet]
        public ActionResult Baike() //百科
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
            if (filepath == "")
            {
                return Content("<script>; alert('请选择图片！'); history.go(-1) </ script >");
            }
            else
            {

                string filename = filepath.Substring(filepath.LastIndexOf("//") + 1);
                string serverpath = Server.MapPath("~/Content/Admin/Baike/img/upload/") + filename;
                string relativepath = @"~/Content/Admin/Baike/img/upload/" + filename;
                postimg.SaveAs(serverpath);
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
        public ActionResult UserManagement() //用户管理
        {
            var userInfo = UserInfoServices.LoadEntities(u => true).ToList();
            return View(userInfo);
        }
        public bool DeleteUser(string id)
        {
            int userid = Convert.ToInt32(id);
            var user = UserInfoServices.LoadEntities(u => u.UserId == userid).FirstOrDefault();
            var deluser = UserInfoServices.DeleteEntity(user);
            return true;
        }
        public ActionResult ShopManagement(int? page) //店铺管理
        {
            int PageSize = 6;
            int PageNumber = (page ?? 1);
            var shop = ShopServices.LoadEntities(s => true).ToList();
            return View(shop.ToPagedList(PageNumber, PageSize));
        }
        public ActionResult EditShop(int id) //店铺管理 
        {
            var shop = ShopServices.LoadEntities(s => s.ShopId == id).FirstOrDefault();
            var goods = GoodsServices.LoadEntities(g => g.ShopId == id).ToList();
            ViewBag.goods = goods.Count();
            var disgoods = GoodsServices.LoadEntities(g => g.ShopId == id && g.IsDiscount == true).ToList();
            ViewBag.disgoods = disgoods.Count();
            ViewBag.norgoods = goods.Count() - disgoods.Count();
            return View(shop);
        }
        public ActionResult EditShopGoods(int id,int ? page) //店铺商品管理 局部分页
        {
            int PageSize = 6;
            int PageNumber = (page ?? 1);
            ViewBag.id = id;
            var goods = GoodsServices.LoadEntities(g => g.ShopId == id).ToList();
            if (Request.IsAjaxRequest())
            {
                return PartialView("EditShopGoods", goods.ToPagedList(PageNumber, PageSize));
            }
            else
            {
                return View("EditShopGoods",goods.ToPagedList(PageNumber, PageSize));
            }
        }
        public ActionResult AdManagement() //百科轮播图片
        {
            var ad = BaikeActivityServices.LoadEntities(b => true).ToList();
            return View(ad);
        }
        public ActionResult EditAd(int id)//编辑
        {
            var ad = BaikeActivityServices.LoadEntities(b => b.ActivedId == id).FirstOrDefault();
            return View(ad);
        }
        [HttpPost]
        [ValidateInput(false)]
        public ActionResult EditAd(string ActivedId,string ActivedTitle,string ActivedContent) //编辑
        {
            int id = Convert.ToInt32(ActivedId);
            HttpPostedFileBase postimg = Request.Files["activeimg"];
            string filepath1 = postimg.FileName;
            HttpPostedFileBase postdetail = Request.Files["activedetail"];
            string filepath2 = postdetail.FileName;
            var baike = BaikeActivityServices.LoadEntities(b => b.ActivedId == id).FirstOrDefault();
            if (filepath1 == "")
            {
                baike.ActivedImg = baike.ActivedImg;
            }
            else
            {
                string filename1 = filepath1.Substring(filepath1.LastIndexOf("//") + 1);
                string serverpath1 = Server.MapPath("~/Content/Baike/img/") + filename1;
                string relativepath1 = @"~/Content/Baike/img/" + filename1;
                postimg.SaveAs(serverpath1);
                baike.ActivedImg = relativepath1;
            }
            if (filepath2 == "")
            {
                baike.ActicedDetail = baike.ActicedDetail;
            }
            else
            {
                string filename2 = filepath2.Substring(filepath2.LastIndexOf("//") + 1);
                string serverpath2 = Server.MapPath("~/Content/Baike/img/") + filename2;
                string relativepath2 = @"~/Content/Baike/img/" + filename2;
                postimg.SaveAs(serverpath2);
                baike.ActicedDetail = relativepath2;
            }
            baike.ActivedTitle = ActivedTitle;
            baike.ActivedContent = ActivedContent;
            BaikeActivityServices.EditEntity(baike);
            db.SaveChanges();
            return Content("<script>alert('编辑成功');window.location.href='/Admin/AdManagement';</script>");
        }
        public ActionResult CreateAd()
        {
            return View();
        }
        [HttpPost]
        [ValidateInput(false)]
        public ActionResult CreateAd(BaikeActivity baike)
        {
            HttpPostedFileBase postimg = Request.Files["activeimg"];
            HttpPostedFileBase postdetail = Request.Files["activedetail"];
            string filepath1 = postimg.FileName;
            string filepath2 = postdetail.FileName;
            if (filepath1 == "" || filepath2 == "")
            {
                return Content("<script>;alert('图片和海报不能为空！');history.go(-1)</script >");
            }
            else
            {
                string filename1 = filepath1.Substring(filepath1.LastIndexOf("//") + 1);
                string filename2 = filepath2.Substring(filepath2.LastIndexOf("//") + 1);
                string serverpath1 = Server.MapPath("~/Content/Baike/img/") + filename1;
                string serverpath2 = Server.MapPath("~/Content/Baike/img/") + filename2;
                string relativepath1 = @"~/Content/Baike/img/" + filename1;
                string relativepath2 = @"~/Content/Baike/img/" + filename2;
                postimg.SaveAs(serverpath1);
                postdetail.SaveAs(serverpath2);
                baike.ActivedImg = relativepath1;
                baike.ActicedDetail = relativepath2;
                BaikeActivityServices.AddEntity(baike);
                return Content("<script>alert('发布成功');window.location.href='/Admin/AdManagement';</script>");
            }
          
        }
        public ActionResult DeleteAd(int id)
        {
            var ad = BaikeActivityServices.LoadEntities(b => b.ActivedId == id).FirstOrDefault();
            BaikeActivityServices.DeleteEntity(ad);
            return Content("<script>alert('删除成功');window.location.href=document.referrer;</script>");
        }
        public ActionResult BaikeManagement(int? page)
        {
            int PageSize = 8;
            int PageNumber = (page ?? 1);
            var baike = BaikeServices.LoadEntities(b => true).ToList();
            return View(baike.ToPagedList(PageNumber, PageSize));
        }
        public ActionResult DeleteBaike(int id)
        {
            var baike = BaikeServices.LoadEntities(b => b.BaikeId == id).FirstOrDefault();
            return Content("<script>alert('删除成功');window.location.href=document.referrer;</script>");
        }
        public ActionResult EditBaike(int id)
        {
            var baike = BaikeServices.LoadEntities(b => b.BaikeId == id).FirstOrDefault();
            return View(baike);
        }
        [HttpPost]
        [ValidateInput(false)]
        public ActionResult EditBaike(string BaikeId, string BaikeTitle, string BaikeDescribe, FormCollection fc)
        {
            int id = Convert.ToInt32(BaikeId);
            var baike = BaikeServices.LoadEntities(b => b.BaikeId == id).FirstOrDefault();
            var content = fc["Bcontent"];
            baike.BaikeTitle = BaikeTitle;
            baike.BaikeDescribe = BaikeDescribe;
            baike.BaikeContent = content;
            BaikeServices.EditEntity(baike);
            return Content("<script>alert('修改成功');window.location.href='/Admin/BaikeManagement';</script>");
        }
        public ActionResult DetailsBaike(int id)
        {
            var baike = BaikeServices.LoadEntities(b => b.BaikeId == id).FirstOrDefault();
            return View(baike);
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
        public ActionResult PostManagement()
        {
            var post = PostServices.LoadEntities(p => true).ToList();
            return View(post);
        }
        public ActionResult DetailsPost(int id) //删除帖子
        {
            var post = PostServices.LoadEntities(p => p.PostId == id).FirstOrDefault();
            return View(post);
        }
        public ActionResult DeletePost(int id)
        {
            var post = PostServices.LoadEntities(p => p.PostId == id).FirstOrDefault();
            var reply = ResponseServices.LoadEntities(R => R.PostId == id).ToList();
            foreach(var r in reply)
            {
                var item = ResponseServices.LoadEntities(R => R.ResponseId == r.ResponseId).FirstOrDefault();
                ResponseServices.DeleteEntity(item);
            }
            PostServices.DeleteEntity(post);
            return Content("<script>alert('删除成功');window.location.href=document.referrer;</script>");
        }

    }
}
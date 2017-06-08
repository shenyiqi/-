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
using PagedList;
namespace MyPets.Controllers
{
    public class ShopController : Controller
    {
        // GET: Shop
        IBLL.IGoodsServices GoodsServices = new BLL.GoodsServices();
        IBLL.IShopServices ShopServices = new BLL.ShopServices();
        IBLL.IUserInfoServices UserServices = new BLL.UserInfoServices();
        IBLL.IOrderDetailServices OrderDetailServices = new BLL.OrderDetailServices();
        IBLL.IOrderServices OrderServices = new BLL.OrderServices();
        IBLL.IGoodsCommentServices GoodsCommentServices = new BLL.GoodsCommentServices();
        IBLL.IGoodsResponseCommentServices GoodsResponseCommentServices = new BLL.GoodsResponseCommentServices();
        IDBSession db = new DBSession();
        public ActionResult Index(string user)
        {
            var id = UserServices.LoadEntities(u => u.UserName == user).FirstOrDefault();
            if (id.IsSeller == true)
            {
                var shop = ShopServices.LoadEntities(s => s.UserId == id.UserId).FirstOrDefault();
                Session["ShopId"] = shop.ShopId;
                return View(shop);
            }
            else
            {
                return RedirectToAction("Register", "Shop");
            }

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
                string user = Session["UserName"].ToString();
                var id = UserServices.LoadEntities(u => u.UserName == user).FirstOrDefault();
                if (filepath != "")
                {
                    if (ModelState.IsValid)
                    {
                        string filename = filepath.Substring(filepath.LastIndexOf("//") + 1);
                        string serverpath = Server.MapPath("~/Content/Shop/upload/Store/") + filename;
                        string relativepath = @"~/Content/Shop/upload/Store/" + filename;
                        shopimg.SaveAs(serverpath);
                        shop.ShopImg = relativepath;
                        ShopServices.AddEntity(new Shop()
                        {
                            ShopName = shop.ShopName,
                            ShopImg = shop.ShopImg,
                            SellerIdCard = shop.SellerIdCard,
                            CustomerService = shop.CustomerService,
                            UserId = id.UserId,
                            StarLevel = "0"
                        });
                        id.IsSeller = true;
                        UserServices.EditEntity(id);
                        db.SaveChanges();
                        return Content("<script>;alert('注册成功!');window.open('"+Url.Action("Index","Shop",new {user=Session["UserName"].ToString() })+"','_self');</script>");
                       
                    }
                    else return Content("<script>;alert('注册失败!')</script>");
                }
                else return Content("<script>;alert('请上传图片!')</script>");
            }
            return View(shop);
        }
        [HttpGet]
        public ActionResult UpGoods()
        {
            return View();
        }
        [HttpPost]
        [ValidateInput(false)]
        public ActionResult UpGoods(Goods goods, string txtprice, string txtstock, string selectseries, string selecttype, string selectdetailtype)
        {
            HttpPostedFileBase postimg1 = Request.Files["txtimg1"];//获取路径
            string filepath1 = postimg1.FileName;
            HttpPostedFileBase postimg2 = Request.Files["txtimg2"];//获取图片2
            string filepath2 = postimg2.FileName;
            HttpPostedFileBase postimg3 = Request.Files["txtimg3"];//获取图片3
            string filepath3 = postimg3.FileName;
            HttpPostedFileBase postimg4 = Request.Files["txtimg4"];//获取图片4
            string filepath4 = postimg4.FileName;
            if (filepath1 != "" && filepath2 != "" && filepath3 != "" && filepath4 != "")
            {
                string filename1 = filepath1.Substring(filepath1.LastIndexOf("//") + 1);
                string serverpath1 = Server.MapPath("~/Content/Shop/upload/Goods/") + filename1;//图片存储路径
                string relativepath1 = @"~/Content/Shop/upload/Goods/" + filename1;
                postimg1.SaveAs(serverpath1);


                string filename2 = filepath2.Substring(filepath2.LastIndexOf("//") + 1);
                string serverpath2 = Server.MapPath("~/Content/Shop/upload/Goods/") + filename2;
                string relativepath2 = @"~/Content/Shop/upload/Goods/" + filename2;
                postimg2.SaveAs(serverpath2);

                string filename3 = filepath3.Substring(filepath3.LastIndexOf("//") + 1);
                string serverpath3 = Server.MapPath("~/Content/Shop/upload/Goods/") + filename3;
                string relativepath3 = @"~/Content/Shop/upload/Goods/" + filename3;
                postimg3.SaveAs(serverpath3);


                string filename4 = filepath4.Substring(filepath4.LastIndexOf("//") + 1);
                string serverpath4 = Server.MapPath("~/Content/Shop/upload/Goods/") + filename4;
                string relativepath4 = @"~/Content/Shop/upload/Goods/" + filename4;
                postimg4.SaveAs(serverpath4);
                GoodsServices.AddEntity(new Goods()
                {
                    GoodsName = goods.GoodsName,
                    SeriesName = selectseries,
                    TypeName = selecttype,
                    DetailName = selectdetailtype,
                    GoodsPrice = Convert.ToDecimal(txtprice),
                    GoodsDescribe = goods.GoodsDescribe,
                    GoodsStock = Convert.ToInt32(txtstock),
                    SellNum = 0,
                    IsDiscount = false,
                    ShopId = Convert.ToInt32(Session["ShopId"]),
                    GoodsImg1 = relativepath1,
                    GoodsImg2 = relativepath2,
                    GoodsImg3 = relativepath3,
                    GoodsImg4 = relativepath4
                });
                db.SaveChanges();
                return View();
            }
            else
            {
                return Content("<script>;alert('请不要漏掉图片哦!')</script>");
            }
        }
        public ActionResult Order() //显示订单
        {
            var shopid = Convert.ToInt32(Session["ShopId"]);
            var order = OrderDetailServices.LoadEntities(o => o.Goods.ShopId == shopid && o.OrderState == false).ToList();
            ViewData["order"] = order;
            var deliver = OrderDetailServices.LoadEntities(o => o.Goods.ShopId == shopid && o.OrderState == true).ToList();
            ViewData["deliver"] = deliver;
            return View();
        }
        public ActionResult AcceptOrder(int id)
        {
            var state = OrderDetailServices.LoadEntities(o => o.GoodsId == id).FirstOrDefault();
            state.OrderState = true;
            OrderDetailServices.EditEntity(state);
            return RedirectToAction("Order");
        }
        public ActionResult UpDiscountGoods()
        {
            string user = Session["UserName"].ToString();
            //MyPetsEntities db1 = new MyPetsEntities();
            //var shop = (from s in db1.Shop
            //            join u in db1.UserInfo on s.UserId equals u.UserId
            //            where u.UserName == user
            //            select s).FirstOrDefault();
            //int id = shop.ShopId;
            int id = Convert.ToInt32(Session["ShopId"]);
            List<Goods> goods = GoodsServices.LoadEntities(g => g.ShopId == id && g.IsDiscount == false).ToList();
            ViewData["setgoods"] = new SelectList(goods, "GoodsId", "GoodsName");
            return View();
        }
        [HttpPost]
        public ActionResult UpDiscountGoods(string choicegoods, string txtdisprice, FormCollection fc)
        {
            int shopid = Convert.ToInt32(Session["ShopId"]);
            var des = fc["txtdesc"];
            var goods = GoodsServices.LoadEntities(g => g.GoodsName == choicegoods && g.ShopId == shopid).FirstOrDefault();
            int price = Convert.ToInt32(txtdisprice);
            if (price < goods.GoodsPrice)
            {
                var setgoods = GoodsServices.EditEntity(new Goods
                {
                    GoodsId = goods.GoodsId,
                    IsDiscount = true,
                    GoodsName = choicegoods,
                    SeriesName = goods.SeriesName,
                    TypeName = goods.TypeName,
                    GoodsImg1 = goods.GoodsImg1,
                    GoodsImg2 = goods.GoodsImg2,
                    GoodsImg3 = goods.GoodsImg3,
                    GoodsImg4 = goods.GoodsImg4,
                    DetailName = goods.DetailName,
                    GoodsStock = goods.GoodsStock,
                    GoodsPrice = goods.GoodsPrice,
                    GoodsDescribe = des,
                    DiscountPrice = Convert.ToInt32(txtdisprice)
                });
                if (setgoods)
                {
                    db.SaveChanges();
                    return View();
                }
                else return Content("<script>;alert('发布失败!');history.go(-1)</script>");
            }
            else return Content("<script>;alert('促销价不能大于原价!')</script>");

        }
        public ActionResult GoodsType(string type, int? page)
        {
            string user = Session["UserName"].ToString();
            int PageSize = 6;
            int PageNumber = (page ?? 1);
            //MyPetsEntities db1 = new MyPetsEntities();
            //var shop = (from s in db1.Shop
            //            join u in db1.UserInfo on s.UserId equals u.UserId
            //            where u.UserName == "用户2"
            //            select s).FirstOrDefault();
            //int id = shop.ShopId;
            int id = Convert.ToInt32(Session["ShopId"]);
            var goods = GoodsServices.LoadEntities(g => g.SeriesName.Contains(type) && g.ShopId == id).ToList();
            ViewBag.num = goods.Count();
            ViewBag.type = type;
            return View(goods.ToPagedList(PageNumber, PageSize));
        }
        [HttpGet]
        public ActionResult EditGoods(int id)
        {
            var good = GoodsServices.LoadEntities(g => g.GoodsId == id).FirstOrDefault();
            return View(good);
        }
        [HttpPost]
        public ActionResult EditGoods(Goods goods)
        {
            var Good = GoodsServices.LoadEntities(g => g.GoodsId == goods.GoodsId).FirstOrDefault();
            Good.GoodsName = goods.GoodsName;
            Good.GoodsPrice = goods.GoodsPrice;
            Good.GoodsDescribe = goods.GoodsDescribe;
            Good.DiscountPrice = goods.DiscountPrice;
            GoodsServices.EditEntity(Good);
            return Content("<script>;alert('更改成功');window.location.href=document.referrer;</script>");
        }
        [HttpPost]
        [ValidateInput(false)]
        public ActionResult UpdateImg(string id, string img)
        {
            int goodsid = Convert.ToInt32(id);
            var goods = GoodsServices.LoadEntities(g => g.GoodsId == goodsid).FirstOrDefault();
            switch (img)
            {
                case "img1":
                    HttpPostedFileBase postimg1 = Request.Files["goodsimg1"];//获取路径
                    string filepath1 = postimg1.FileName;
                    if (filepath1 != "")
                    {
                        string filename1 = filepath1.Substring(filepath1.LastIndexOf("//") + 1);
                        string serverpath1 = Server.MapPath("~/Content/Shop/upload/Goods/") + filename1;//图片存储路径
                        string relativepath1 = @"~/Content/Shop/upload/Goods/" + filename1;
                        postimg1.SaveAs(serverpath1);
                        goods.GoodsImg1 = relativepath1;
                        GoodsServices.EditEntity(goods);
                        db.SaveChanges();
                        return Content("<script>;alert('更改成功');window.location.href=document.referrer;</script>");
                    }
                    else return Content("<script>;alert('请选择图片');history.go(-1);</script>");
                case "img2":
                    HttpPostedFileBase postimg2 = Request.Files["goodsimg2"];//获取路径
                    string filepath2 = postimg2.FileName;
                    if (filepath2 != "")
                    {
                        string filename2 = filepath2.Substring(filepath2.LastIndexOf("//") + 1);
                        string serverpath2 = Server.MapPath("~/Content/Shop/upload/Goods/") + filename2;//图片存储路径
                        string relativepath2 = @"~/Content/Shop/upload/Goods/" + filename2;
                        postimg2.SaveAs(serverpath2);
                        goods.GoodsImg2 = relativepath2;
                        GoodsServices.EditEntity(goods);
                        db.SaveChanges();
                        return Content("<script>;alert('更改成功');window.location.href=document.referrer;</script>");
                    }
                    else return Content("<script>;alert('请选择图片');history.go(-1);</script>");
                case "img3":
                    HttpPostedFileBase postimg3 = Request.Files["goodsimg3"];//获取路径
                    string filepath3 = postimg3.FileName;
                    if (filepath3 != "")
                    {
                        string filename3 = filepath3.Substring(filepath3.LastIndexOf("//") + 1);
                        string serverpath3 = Server.MapPath("~/Content/Shop/upload/Goods/") + filename3;//图片存储路径
                        string relativepath3 = @"~/Content/Shop/upload/Goods/" + filename3;
                        postimg3.SaveAs(serverpath3);
                        goods.GoodsImg3 = relativepath3;
                        GoodsServices.EditEntity(goods);
                        db.SaveChanges();
                        return Content("<script>;alert('更改成功');window.location.href=document.referrer;</script>");
                    }
                    else return Content("<script>;alert('请选择图片');history.go(-1);/script>");
                case "img4":
                    HttpPostedFileBase postimg4 = Request.Files["goodsimg4"];//获取路径
                    string filepath4 = postimg4.FileName;
                    if (filepath4 != "")
                    {
                        string filename4 = filepath4.Substring(filepath4.LastIndexOf("//") + 1);
                        string serverpath4 = Server.MapPath("~/Content/Shop/upload/Goods/") + filename4;//图片存储路径
                        string relativepath4 = @"~/Content/Shop/upload/Goods/" + filename4;
                        postimg4.SaveAs(serverpath4);
                        goods.GoodsImg4 = relativepath4;
                        GoodsServices.EditEntity(goods);
                        return Content("<script>;alert('更改成功');window.location.href=document.referrer;</script>");
                    }
                    else return Content("<script>;alert('请选择图片');history.go(-1);</script>");
            }
            return Content("<script>;alert('更改成功!')</script>");
        }
        public ActionResult Message() //回复留言
        {
            return View();
        }
        public ActionResult AnswerComment()
        {
            int id = Convert.ToInt32(Session["ShopId"]);
            var comment = GoodsCommentServices.LoadEntities(c => c.Goods.ShopId == id && c.IsReply == false).ToList();
            return View(comment);
        }
        [HttpPost]
        public ActionResult AnswerComment(string commentId, string replycontent)
        {
            var name = Session["UserName"].ToString();
            int comid = Convert.ToInt32(commentId);
            if (replycontent != "")
            {
                GoodsResponseCommentServices.AddEntity(new GoodsResponseComment()
                {
                    CommentId = comid,
                    AnswerContent = replycontent,
                    AnswerTime = DateTime.Now,
                    UserName = name
                });
                var comment = GoodsCommentServices.LoadEntities(g => g.CommentId == comid).FirstOrDefault();
                comment.IsReply = true;
                GoodsCommentServices.EditEntity(comment);
                return Content("<script>;alert('回复成功');window.location.href=document.referrer;</script>");
            }
            else return Content("<script>;alert('回复内容不能为空!');history.go(-1);</script>");

        }
        public ActionResult LoginOff()
        {
            Session["UserName"] = null;
            return RedirectToAction("Index", "Home");
        }
    }
}
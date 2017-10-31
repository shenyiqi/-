using MyPets.DALFactory;
using MyPets.IDAL;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using MyPets.Model;
using MyPets.BLL;
using System.Reflection;

namespace MyPets.Controllers
{
    public class PersonalCenterController : Controller
    {
        //
        // GET: /PersonalCenter/
        IBLL.IUserInfoServices UserInfo = new BLL.UserInfoServices();
        IBLL.IOrderDetailServices OrderDetail = new BLL.OrderDetailServices();
        IBLL.IOrderServices Order = new BLL.OrderServices();
        IBLL.IGoodsCommentServices GoodsCommentServices = new BLL.GoodsCommentServices();
        IDBSession db = new DBSession();
        public ActionResult Index(string user)
        {
            var userinfo = UserInfo.LoadEntities(u => u.UserName == user).FirstOrDefault();
            return View();
        }

        public ActionResult myorder()
        {
            MyPetsEntities db = new MyPetsEntities();
            IEnumerable<Order> model = from s in db.Order select s;
            //ViewBag.Order = model;
            return View(model);
        }
        public ActionResult Comment()
        {
            string name = Session["UserName"].ToString();
            var x = UserInfo.LoadEntities(g => g.UserName == name).FirstOrDefault();
            var Detail = OrderDetail.LoadEntities(g => g.UserId == x.UserId).ToList();
            return View(Detail);
        }
        public ActionResult basicinformation()
        {
            BLL.UserInfoServices server = new BLL.UserInfoServices();
            string userName = Session["UserName"].ToString();
            var model = server.LoadEntities(o => o.UserName == userName).FirstOrDefault();
            return View(model);

        }
        public ActionResult goodsreview()
        {
            MyPetsEntities db = new MyPetsEntities();
            var mypet = db.Goods.Select(x => x);
            int goodid = mypet.FirstOrDefault().GoodsId;
            var myComment = db.GoodsComment.Select(x => x);
            ViewBag.Comment = myComment;
            ViewBag.MyPet = mypet;
            return View();
        }
        [HttpPost]
        public ActionResult goodsComment()
        {
            int id = int.Parse(Request["id"]);//获取前台隐藏标签的value值，即商品Id
            //var gc=GoodsCommentServices.LoadEntities(g=>g.C)
            //MyPetsEntities db = new MyPetsEntities();
            string name = Session["UserName"].ToString();//用户登录成功后，进行存储的用户名
            var x = UserInfo.LoadEntities(g => g.UserName == name).FirstOrDefault();
            GoodsCommentServices.AddEntity(new GoodsComment
            {
                CommentTime = System.DateTime.Now,
                CommentContent = Request["content"],
                GoodsId = id,
                UsersId = x.UserId,
                IsReply = true
            });

            //db.GoodsComment.Add(gc);
            db.SaveChanges();
            return Content("<script>alert('评论成功！');window.location.href='/PersonalCenter/goodsreview';</script>");

        }
        public ActionResult myshop()
        {
            return View();
        }
        public ActionResult privatenews()
        {
            return View();
        }
        //修改密码
        public ActionResult AlterUserPassword()
        {
            string userNameSession = Session["UserName"].ToString();
            string userPassword = Request["userPassword"];
            BLL.UserInfoServices userInfoService = new UserInfoServices();
            var model = userInfoService.LoadEntities(o => o.UserName == userNameSession).FirstOrDefault();
            model.UserPwd = userPassword;
            model.ConfirmPwd = userPassword;
            userInfoService.EditEntity(model);
            return Json("ok", JsonRequestBehavior.AllowGet);
        }
        //修改电话
        public ActionResult AlterUserPhone()
        {
            string userNameSession = Session["UserName"].ToString();
            string userPhone = Request["userPhone"];
            BLL.UserInfoServices userInfoService = new UserInfoServices();
            var model = userInfoService.LoadEntities(o => o.UserName == userNameSession).FirstOrDefault();
            model.UserPhone = userPhone;
            userInfoService.EditEntity(model);
            return Json("ok", JsonRequestBehavior.AllowGet);
        }
        //修改邮箱
        public ActionResult AlterUserEmail()
        {
            string userNameSession = Session["UserName"].ToString();
            string userEmail = Request["userEmail"];
            BLL.UserInfoServices userInfoService = new UserInfoServices();
            var model = userInfoService.LoadEntities(o => o.UserName == userNameSession).FirstOrDefault();
            model.UserEmail = userEmail;
            userInfoService.EditEntity(model);
            return Json("ok", JsonRequestBehavior.AllowGet);
        }
    }
}

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
        IDBSession db = new DBSession();
        public ActionResult Index(string user)
        {
            var userinfo = UserInfo.LoadEntities(u => u.UserName == user).FirstOrDefault();
            return View();
        }

        public ActionResult myorder() 
        {
            return View();
        }
        public ActionResult Comment()
        {
              string name = Session["UserName"].ToString();
              var x = UserInfo.LoadEntities(g => g.UserName == name).FirstOrDefault();
              var Detail = OrderDetail.LoadEntities(g => g.UserId ==x.UserId ).ToList();
              return View(Detail);
          

          
        }
        public ActionResult basicinformation()
        {
            BLL.UserInfoServices server = new BLL.UserInfoServices();
            string userName=Session["UserName"].ToString();
            // 查询数据库
            //if (userName != null)
            //{
                var model = server.LoadEntities(o => o.UserName == userName).FirstOrDefault();
            
                return View(model);
           // }
            //else
            //{
            //    return Redirect("Home/Index");
            //}

        }
        public ActionResult goodsreview()
        {
            return View();
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

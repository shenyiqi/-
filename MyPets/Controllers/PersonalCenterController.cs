using MyPets.DALFactory;
using MyPets.IDAL;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

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
            return View();
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
    }
}
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
	}
}
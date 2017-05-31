using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace MyPets.Controllers
{
    public class TribuneController : Controller
    {
        IBLL.IPostServices postServices = new BLL.PostServices();
        IBLL.IResponseServices responseServices = new BLL.ResponseServices(); 
        // GET: Tribune
        public ActionResult Index()
        {

            return View();
        }

        public ActionResult Postings()
        {
            return View();
        }
        public ActionResult Publish() //发帖
        {
            if (Session["UserName"] != null)
            {
                return View();
            }
            else return Content("<script>if(confirm('要登录才能发帖,要去登录吗？')){ window.location.href = '/Register/Login'}else {history.go(-1);}</script>");
        }
        //[HttpPost]
        //[ValidateInput(false)]
        //public ActionResult Publish(string InputTitle, string InputType, FormCollection fc) //发帖
        //{
        //    var content = fc["AreaDescribe"];
        //     var addposting = postServices.AddEntity(new Post
        //    {
        //        PostTitle = InputTitle,
        //        PostType = InputType,
        //    //  IsChoose = false,
        //        PostContent = content,
        //        PostTime = DateTime.Now,
        //        UserId = 1
        //    });
        //    if (addposting != null)
        //    {
        //        db.SaveChanges();
        //        return View("Index");
        //    }
        //    else return Content("<script>alert('提交失败');history(-1)</script>");

        //}
    }
}
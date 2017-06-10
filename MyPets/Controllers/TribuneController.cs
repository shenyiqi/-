using MyPets.DALFactory;
using MyPets.IDAL;
using MyPets.Model;
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
        IBLL.IUserInfoServices userInfoServices = new BLL.UserInfoServices();
        IDBSession db = new DBSession();
        // GET: Tribune
        public ActionResult Index()
        {
            var goodPostings = postServices.LoadEntities(p => p.IsChoose == true).Take(10).ToList();
            ViewData["goodPostings"] = goodPostings;
            var topPostings = postServices.LoadEntities(p => p.IsTop == true).ToList();
            ViewData["topPostings"] = topPostings;
            var newPostings = postServices.LoadEntities(p => p.IsChoose == false && p.IsTop == false).OrderByDescending(p => p.PostTime).ToList();
            ViewData["newPostings"] = newPostings;
            return View();
        }

        public ActionResult Postings(int id)
        {
            return View();
        }
        [HttpPost]
        public ActionResult Postings(string postTitle, string postType, FormCollection fc)
        {
            var content = fc["AreaDescribe"];
            string userName = Session["UserName"].ToString();
            var userId = userInfoServices.LoadEntities(u => u.UserName == userName).FirstOrDefault().UserId;
            var addquestion = postServices.AddEntity(new Post
            {
                PostTitle = postTitle,
                PostType = postType,
                IsChoose = false,
                IsTop=false,
                PostContent = content,
                PostTime = DateTime.Now,
                UserId = userId
            });
            if (addquestion != null)
            {
                db.SaveChanges();
                return View("Index");
            }
            else return Content("<script>alert('提交失败');history(-1)</script>");
        }
        //public ActionResult Publish() //发帖
        //{
        //    if (Session["UserName"] != null)
        //    {
        //        return View();
        //    }
        //    else return Content("<script>if(confirm('要登录才能发帖,要去登录吗？')){ window.location.href = '/Register/Login'}else {history.go(-1);}</script>");
        //}
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
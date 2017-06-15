using MyPets.DALFactory;
using MyPets.IDAL;
using MyPets.Model;
using PagedList;
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
        public ActionResult Index(int? page)
        {
            if (Session["UserName"] != null)
            {
                var goodPostings = postServices.LoadEntities(p => p.IsChoose == true).Take(10).ToList();
                ViewData["goodPostings"] = goodPostings;
                var topPostings = postServices.LoadEntities(p => p.IsTop == true).ToList();
                ViewData["topPostings"] = topPostings;

                string userName = Session["UserName"].ToString();
                int userId = Convert.ToInt32(userInfoServices.LoadEntities(u => u.UserName == userName).FirstOrDefault().UserId);
                var postingsNum = postServices.LoadEntities(p => p.UserId == userId).ToList();
                ViewBag.postingsNum = postingsNum.Count();
                //分页控制最新发布的帖子
                int pageSize = 5;
                int pageNumber = (page ?? 1);
                var newPostings = postServices.LoadEntities(p => p.IsChoose == false && p.IsTop == false).OrderByDescending(p => p.PostTime).ToList();
                //ViewData["newPostings"] = newPostings;
                return View(newPostings.ToPagedList(pageNumber, pageSize));
            }
            else return Content("<script>alert('您还未登陆！！');history.go(-1);</script>");

        }

        public ActionResult Postings(int id, int? page)
        {

            var postFloor = responseServices.LoadEntities(r => r.PostId == id).ToList();
            ViewBag.replyNum = postFloor.Count();
            ViewBag.postId = id;
            //楼主信息
            var postTitle = postServices.LoadEntities(p => p.PostId == id).FirstOrDefault().PostTitle;
            var postContent = postServices.LoadEntities(p => p.PostId == id).FirstOrDefault().PostContent;
            var userId = postServices.LoadEntities(p => p.PostId == id).FirstOrDefault().UserId;
            var userImg = userInfoServices.LoadEntities(u => u.UserId == userId).FirstOrDefault().UserImg;
            var userName = userInfoServices.LoadEntities(u => u.UserId == userId).FirstOrDefault().UserName;

            ViewBag.postTitle = postTitle;
            ViewBag.postContent = postContent;
            ViewBag.userImg = userImg;
            ViewBag.userName = userName;

            //ViewData["postFloor"] = postFloor;
            int pageSize = 6;//每六条一页
            int pageNumber = (page ?? 1);
            return View(postFloor.ToPagedList(pageNumber, pageSize));
        }
        [HttpPost]
        public ActionResult Postings(string postTitle, string postType, FormCollection fc)
        {
            var content = fc["AreaDescribe"];
            if (Session["UserName"] != null)
            {
                string userName = Session["UserName"].ToString();
                var userId = userInfoServices.LoadEntities(u => u.UserName == userName).FirstOrDefault().UserId;
                var addquestion = postServices.AddEntity(new Post
                {
                    PostTitle = postTitle,
                    PostType = postType,
                    IsChoose = false,
                    IsTop = false,
                    PostContent = content,
                    PostTime = DateTime.Now,
                    UserId = userId
                });
                if (addquestion != null)
                {
                    db.SaveChanges();
                    return RedirectToAction("Index");
                }
                else return Content("<script>alert('提交失败');history(-1)</script>");
            }
            else return Content("<script>alert('您还未登录呢？！');history.go(-1);</script>");
        }


        //回复帖子
        [HttpPost]
        public ActionResult ResponsePost(int id, FormCollection fc)
        {
            if (Session["UserName"] != null)//判定用户是否已登录
            {
                var postId = Convert.ToInt32(id);
                var responseContent = fc["AreaDescribe"];
                var receiverId = postServices.LoadEntities(p => p.PostId == id).FirstOrDefault().UserId;

                //设置楼层数
                var postFloor = responseServices.LoadEntities(r => r.PostId == id).ToList();
                var floorNum = postFloor.Count() + 1;

                if (responseContent != "")
                {
                    string userName = Session["UserName"].ToString();
                    var senderId = userInfoServices.LoadEntities(u => u.UserName == userName).FirstOrDefault().UserId;
                    var addRespon = responseServices.AddEntity(new Response
                    {
                        PostId = postId,
                        ResponseContent = responseContent,
                        ResponseTime = DateTime.Now,
                        SenderId = senderId,
                        ReceiverId = receiverId,
                        ResponseFloor = floorNum
                    });
                    db.SaveChanges();
                    return RedirectToAction("Postings", new { id = postId });
                }
                else return Content("<script>alert('内容不能为空！');history.go(-1);</script>");
            }
            else return Content("<script>alert('您还未登录呢？！');history.go(-1);</script>");
        }


    }
}
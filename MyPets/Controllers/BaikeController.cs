﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using MyPets.Model;
using PagedList;
using MyPets.IDAL;
using MyPets.DALFactory;

namespace MyPets.Controllers
{
    public class BaikeController : Controller
    {
        // GET: Baike
        IBLL.IBaikeServices BaikeServices = new BLL.BaikeServices();
        IBLL.IBaikeQuestionServices BaikeQuestionServices = new BLL.BaikeQuestionServices();
        IBLL.IBaikeAnswerServices BaikeAnswerServices = new BLL.BaikeAnswerServices();
        IBLL.IUserInfoServices UserInfoServices = new BLL.UserInfoServices();
        IDBSession db = new DBSession();
        public ActionResult Index()
        {
            //var s = (from b in db.Baike
            //        where b.BaikeSeries == "狗系列"
            //        select b).Skip(6).Take(6);
            var dogBaike = BaikeServices.LoadEntities(b => b.BaikeSeries == "狗系列").Take(6).ToList();
            var dogTitle = BaikeServices.LoadEntities(b => b.BaikeSeries == "狗系列").OrderBy(b => Guid.NewGuid()).Skip(6).Take(6).ToList();
            ViewData["dog"] = dogBaike; ViewData["dogtitle"] = dogTitle;
            return View();
        }
        public ActionResult Show(int id) //显示单个百科
        {
            var baike = BaikeServices.LoadEntities(b => b.BaikeId == id).FirstOrDefault();
            return View(baike);
        }
        public ActionResult GetType(string txttype, int? page) //传递百科类别分页参数
        {
            return RedirectToAction("ShowType", new { txttype, page });
        }
        public ActionResult ShowType(string txttype, int? page) //显示类别百科
        {
            int pageSize = 5;
            int pageNumber = (page ?? 1);
            var baike = BaikeServices.LoadEntities(b => b.BaikeType.Contains(txttype)).ToList();
            ViewBag.num = baike.Count();
            ViewData["type"] = txttype;
            return View(baike.ToPagedList(pageNumber, pageSize));

        }
        public ActionResult GetSearch(string txtBaikeTitle, int? page)
        {
            return RedirectToAction("Search", new { txtBaikeTitle, page });
        }
        public ActionResult Search(string txtBaikeTitle, int? page)//显示搜索的百科
        {
            int pageSize = 5;
            int pageNumber = (page ?? 1);
            ViewBag.search = txtBaikeTitle;
            var baike = BaikeServices.LoadEntities(b => b.BaikeTitle.Contains(txtBaikeTitle)).ToList();
            ViewBag.num = baike.Count();
            ViewData["search"] = txtBaikeTitle;
            return View(baike.ToPagedList(pageNumber, pageSize));
        }
        public ActionResult ShowAd1()
        {
            return View();
        }
        public ActionResult ShowAd2()
        {
            return View();
        }
        public ActionResult ShowAd3()
        {
            return View();
        }
        public ActionResult ShowAd4() 
        {
            return View();
        }
        public ActionResult Answer() //问答专区
        {
            return View();
        }
        public ActionResult ParticalAnswer(int? type, int? page) //局部刷新分页
        {
            int t = (type ?? 1);
            int pageSize = 6;
            int pageNumber = (page ?? 1);
            var allBaike = BaikeQuestionServices.LoadEntities(b => true).ToList();
            var goodsBaike = BaikeQuestionServices.LoadEntities(b => b.isChoiceness == true).ToList();
            switch (t)
            {
                case 1:
                    ViewBag.type = type;
                    if (Request.IsAjaxRequest())
                    {
                        return PartialView("ParticalAnswer", allBaike.ToPagedList(pageNumber, pageSize));
                    }
                    else
                    {
                        return View("ParticalAnswer", allBaike.ToPagedList(pageNumber, pageSize));
                    }
                case 2:
                    ViewBag.type = type;
                    if (Request.IsAjaxRequest())
                    {
                        return PartialView("ParticalAnswer", goodsBaike.ToPagedList(pageNumber, pageSize));
                    }
                    else
                    {
                        return View("ParticalAnswer", goodsBaike.ToPagedList(pageNumber, pageSize));
                    }
                default:
                    return View();
            }
        }
        public ActionResult SearchAnswer(string txtBaikeQuestion,int ? page)
        {
            int pageSize = 6;
            int pageNumber = (page ?? 1);
            ViewBag.question = txtBaikeQuestion;
            var question = BaikeQuestionServices.LoadEntities(q => q.QuestionTitle.Contains(txtBaikeQuestion)).ToList();
            return View(question.ToPagedList(pageNumber,pageSize));
        }
        public ActionResult Quiz() //提问
        {
            return View();
        }
        [HttpPost]
        [ValidateInput(false)]
        public ActionResult Quiz(string InputTitle,string InputType, FormCollection fc) //提问
        {
            var content = fc["AreaDescribe"];
           var addquestion= BaikeQuestionServices.AddEntity(new BaikeQuestion
            {
                QuestionTitle = InputTitle,
                QuestionType = InputType,
                isChoiceness = false,
                QuestionDescribe = content,
                QuestionTime = DateTime.Now,
                UserId=1
            });
            if (addquestion != null)
            {
                db.SaveChanges();
                return View("Answer");
            }
            else return Content("<script>alert('提交失败');history(-1)</script>");
           
        }
        public ActionResult ShowQuiz(int id)
        {
            //ViewModel.BaikeViewModel baikeViewModel = new ViewModel.BaikeViewModel();
            var ques = BaikeQuestionServices.LoadEntities(a => a.QuestionId == id).FirstOrDefault();
            ViewBag.head = ques.QuestionTitle; //问题标题
            ViewBag.desc = ques.QuestionDescribe; //问题描述
            ViewBag.time = ques.QuestionTime; //提问时间
          
            //MyPetsEntities db1 = new MyPetsEntities();
            //var answer = (from q in db1.BaikeAnswer
            //               join a in db1.BaikeQuestion on q.QuestionId equals a.QuestionId
            //               where q.QuestionId==id
            //               select q).ToList();

            var answer = BaikeAnswerServices.LoadEntities(b => b.QuestionId == id).OrderByDescending(b=>b.AnswerTime).ToList(); 
            ViewBag.num = answer.Count();//回答人数
            var name = UserInfoServices.LoadEntities(u => u.UserId == ques.UserId).FirstOrDefault();
            ViewBag.username = name.UserName;//提问人
            var goodsanswer = BaikeAnswerServices.LoadEntities(a => true).Take(3).OrderBy(a=>Guid.NewGuid()).ToList();
            ViewData["goodsanswer"] = goodsanswer;
            Session["QuestionId"] = id;
            ViewData["answer"] = answer;
            return View();
        }
        [HttpPost]
        [ValidateInput(false)]
        public ActionResult ShowQuiz(FormCollection fc)  
        {
            string name = Session["UserName"].ToString();
            var id = UserInfoServices.LoadEntities(u => u.UserName == name).FirstOrDefault();
            int userid = id.UserId;
            var answercontent = fc["AreaDescribe"];
            var addAnswer = BaikeAnswerServices.AddEntity(new BaikeAnswer
            {
               
                QuestionId = Convert.ToInt32(Session["QuestionId"]),
                UserId=userid,
                AnswerContent=answercontent,
                AnswerTime=DateTime.Now

            });
            if (addAnswer != null)
            {
                db.SaveChanges();
                return RedirectToAction("ShowQuiz", new { id = Convert.ToInt32(Session["QuestionId"])});
            }
            else return Content("<script>;alert('提交失败！');history.go(-1)</script>");
        }
        public ActionResult LoginOff()  //退出登录
        {
            Session["UserName"] = null;
            return RedirectToAction("Index");
        }
    }
}
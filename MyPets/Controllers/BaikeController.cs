using System;
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
        IDBSession db = new DBSession();
        public ActionResult Index()
        { 
            //var s = (from b in db.Baike
            //        where b.BaikeSeries == "狗系列"
            //        select b).Skip(6).Take(6);
            var dogBaike = BaikeServices.LoadEntities(b => b.BaikeSeries == "狗系列").Take(6).ToList();
            var dogTitle = BaikeServices.LoadEntities(b => b.BaikeSeries == "狗系列").Skip(6).Take(6).ToList();

            var catBaike = BaikeServices.LoadEntities(b => b.BaikeSeries == "猫系列").Take(6).ToList();
            var catTitle = BaikeServices.LoadEntities(b => b.BaikeSeries == "猫系列").Skip(6).Take(6).ToList();

            var littlepet = BaikeServices.LoadEntities(b => b.BaikeSeries == "小宠系列").Take(6).ToList();
            var littleTitle = BaikeServices.LoadEntities(b => b.BaikeSeries == "小宠系列").Skip(6).Take(6).ToList();

            var waterpet = BaikeServices.LoadEntities(b => b.BaikeSeries == "水族系列").Take(6).ToList();
            var waterTitle = BaikeServices.LoadEntities(b => b.BaikeSeries == "水族系列").Skip(6).Take(6).ToList();
            ViewData["dog"] = dogBaike; ViewData["dogtitle"] = dogTitle;
            ViewData["cat"] = catBaike; ViewData["cattitle"] = catTitle;
            ViewData["littlepet"] = littlepet; ViewData["littletitle"] = littleTitle;
            ViewData["water"] = waterpet; ViewData["watertitle"] = waterTitle;
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
        public ActionResult Answer(int ? type,int ? page) //问答专区
        {
            int t = (type ?? 1);
            int pageSize = 5;
            int pageNumber = (page ?? 1);
            var allBaike = BaikeQuestionServices.LoadEntities(b => true).ToList();
            var goodsBaike = BaikeQuestionServices.LoadEntities(b => b.isChoiceness == true).ToList();
            switch (t)
            {
                case 1:
                    ViewBag.type = type;
                    return View(allBaike.ToPagedList(pageNumber, pageSize));
                case 2:
                    ViewBag.type = type;
                    return View(goodsBaike.ToPagedList(pageNumber, pageSize));
            }
            return View();
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
                return View();
            }
            else return Content("<script>alert('提交失败');history(-1)</script>");
           
        }
    }
}
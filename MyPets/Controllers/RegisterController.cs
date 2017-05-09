using MyPets.Model;
using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using MyPets.DALFactory;
using MyPets.DAL;
using System.Data.Entity.Validation;
using MyPets.IDAL;
using System.IO;
namespace MyPets.Controllers
{
    public class RegisterController : Controller
    {
        // GET: Register
        IBLL.IUserInfoServices UserInfoServices = new BLL.UserInfoServices();
        
        IDBSession db = new DBSession();
        
        
        [AllowAnonymous]
        public ActionResult Login() //登录
        {
            return View();
        }
        [HttpPost]
        [AllowAnonymous]
        [ValidateAntiForgeryToken]
        public ActionResult Login(UserInfo user,string ReturnUrl)   
        {
            string ValidateCode = Request["txtverifcode"];

            if (ValidateCode != Session["ValidateCode"].ToString())
            {
                return Content("<script>;alert('验证码错误！');history.go(-1)</script>");
            }
            try
            {
                //if (ModelState.IsValid)
                //{
                var users = UserInfoServices.LoadEntities(o => o.UserName == user.UserName && o.UserPwd == user.UserPwd).FirstOrDefault();
                if (users != null)
                {
                    Session["UserName"] = users.UserName;//Url.IsLocalUrl(ReturnUrl) && ReturnUrl.Length > 1 && ReturnUrl.StartsWith("/") && !ReturnUrl.StartsWith("//") && !ReturnUrl.StartsWith("/\\")
                    if (ReturnUrl != null)
                    {
                        return Redirect(ReturnUrl);
                    }
                    else
                    {
                        return RedirectToAction("Index", "Home");
                    }
                }
                else
                {
                    return Content("<script>;alert('用户名密码有误，或该账号不存在!');history.go(-1)</script>");
                }
            }
            catch (Exception ex)
            {
                return Content(ex.Message);
            }
        }
        [HttpGet]
        public ActionResult Register() //注册
        {
            return View();
        }
        [HttpPost]
        public ActionResult Register(UserInfo user)
        {
            var chk_member = UserInfoServices.LoadEntities(o => o.UserName == user.UserName).FirstOrDefault();
            if (chk_member != null)
            {
                return Content("<script>;alert('该账号已经有人注册了！');history.go(-1)</script>");

            }
            try
            {
                if (Request.Files["file"] != null)
                {
                    HttpPostedFileBase file = Request.Files["file"];
                    string filepath = file.FileName;
                    string filename = filepath.Substring(filepath.LastIndexOf("//") + 1);
                    string serverpath = Server.MapPath("~/Content/Register/img/headphoto/") + filename;
                    string relativepath = @"~/Content/Register/img/headphoto/" + filename;
                    file.SaveAs(serverpath);
                    user.UserImg = relativepath;
                    user.IsSeller = false;
                    UserInfoServices.AddEntity(user);
                    db.SaveChanges();
                    Session["UserName"] = user.UserName;
                    RedirectToAction("Index", "Home");//跳到商城首页，还在弄
                }
                else
                {
                    return Content("<script>;alert('请先上传图片！');history.go(-1)</script>");
                }
            }
            catch (DbEntityValidationException ex)
            {
                return Content(ex.Message);
            }
            return View();
        }
        [HttpGet]
        public ActionResult RebackPwdStep1()
        {
            return View();
        }

        [HttpPost]
        public ActionResult RebackPwdStep1(UserInfo user) //找回密码
        {
            string ValidateCode = Request["txtverifcode"];
            if (ValidateCode != Session["ValidateCode"].ToString())
            {
                return Content("<script>;alert('验证码错误！');history.go(-1)</script>");
            }
            var name = UserInfoServices.LoadEntities(u => u.UserName == user.UserName).FirstOrDefault();
            if (name == null)
            {
                return Content("<script>alert('该用户不存在！');history.go(-1)</script>");
            }
            else
            {
                Session["ValidateUserName"] = user.UserName;
                return RedirectToAction("RebackPwdStep2", "Register");
            }
        }
        [HttpGet]
        public ActionResult RebackPwdStep2() //找回密码
        {
            string name = Session["ValidateUserName"].ToString();
            var user = UserInfoServices.LoadEntities(u => u.UserName == name).FirstOrDefault();
            return View(user);
        }
        [HttpPost]
        public ActionResult RebackPwdStep2(UserInfo user) //找回密码
        {
            if (Session["code"] != null)
            {
                var compareCode = Request["email"];
                if (compareCode == Session["code"].ToString())
                {
                    return RedirectToAction("RebackPwdStep3", "Register");
                }
                else return Content("<script>alert('验证不成功');history.go(-1)</script>");
            }
            else return Content("<script>alert('请输入验证码');history.go(-1)</script>");
        }
        [HttpGet]
        public ActionResult RebackPwdStep3() //找回密码
        {
            return View();
        }
        [HttpPost]
        public ActionResult RebackPwdStep3(string pwd, string confirmpwd)
        {
            string name = Session["ValidateUserName"].ToString();
            if (pwd != confirmpwd)
            {
                return Content("<script>alert('密码不一致');history.go(-1)</script>");
            }
            else
            {
                var update = UserInfoServices.SetPwd(name, pwd, confirmpwd);
                if (update > 0)
                {
                    return Content(";<script>alert('密码修改成功');window.location.href='/Register/RebackPwdStep4'</script>");
                }
                else return Content("<script>alert('密码重置失败');history.go(-1)</script>");
            }

        }
        public ActionResult RebackPwdStep4() //找回密码 
        {
            return View();
        }
        public ActionResult SendEmail()
        {
            Random rd = new Random();
            string name = Session["ValidateUserName"].ToString();
            var user = UserInfoServices.LoadEntities(u => u.UserName == name).FirstOrDefault();
            var emailto = user.UserEmail;
            var code = ""; //验证码    
            var codeLength = 6;//验证码长度 
            for (var i = 0; i < codeLength; i++)
            {
                code += rd.Next(10).ToString();
            }
            Session["code"] = code; //把验证码存入session
            bool flag = MailHelper.SendEmail(emailto, "您的验证码为：", code);
            if (flag)
            {
                return Content("<script>alert('验证码发送成功，请耐心等待');history.go(-1)</script>");
            }
            else return Content("<script>alert('验证码发送失败，请重新发送');history.go(-1)</script>");
        }
    }
}
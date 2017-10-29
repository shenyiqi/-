using MyPets.IDAL;
using MyPets.Model;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.ServiceModel.Channels;
using System.Text;
using System.Threading.Tasks;

namespace MyPets.DAL
{
    public class UserInfoDal : BaseDal<UserInfo>,IUserInfoDal //先继承后实现，两个都得必须写
    {
        //实现自己特有的方法
        MyPetsEntities db = new MyPetsEntities();
        public int SetPwd(string username,string newpwd, string confirmpwd)
        {
            //UserInfo user = new UserInfo();
            var name = db.UserInfo.Where(u => u.UserName == username).FirstOrDefault();
            if (name != null)
            {
                name.UserId = name.UserId;
                name.UserName = name.UserName;
                name.IsSeller = name.IsSeller;
                name.UserPwd = newpwd;
                name.ConfirmPwd = confirmpwd;                
            }
            db.Entry(name).State = EntityState.Modified;
            return db.SaveChanges();
        }

    }
}

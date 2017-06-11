using MyPets.BLL;
using MyPets.DAL;
using MyPets.DALFactory;
using MyPets.IBLL;
using MyPets.IDAL;
using MyPets.Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace MyPets.BLL
{
    public class UserInfoServices : BaseServices<UserInfo>,IUserInfoServices //先继承后实现
    {
        public static IUserInfoDal iuserinfo = AbstractFactory.CreateUserInfoDal();
        public override void SetCurrentDal()
        {
            CurrentDal = this.GetCurrentDbSession.UserInfoDal; //把UserInfoDal赋值给BaseSerices的Currentdal
        }
        public int SetPwd(string name, string pwd, string confirmpwd)
        {
            return iuserinfo.SetPwd(name, pwd, confirmpwd);
        }

    }
}
 
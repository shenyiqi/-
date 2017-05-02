using MyPets.Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace MyPets.IDAL
{
    public interface IUserInfoDal : IBaseDal<UserInfo>
    {
        //定义自己特有的方法
        int SetPwd(string username,string newpwd,string confirmpwd);
    }
}

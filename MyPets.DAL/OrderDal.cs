using MyPets.IDAL;
using MyPets.Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace MyPets.DAL
{
    public class OrderDal : BaseDal<Order>, IOrderDal //先继承后实现，两个都得必须写
    {
        //实现自己特有的方法
    }
}

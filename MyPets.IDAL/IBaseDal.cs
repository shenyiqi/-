using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace MyPets.IDAL
{
    public interface IBaseDal<T> where T : class, new() //能够被new的，就是指class
    {
        //封装公共的增删改查方法
        IQueryable<T> LoadEntities(System.Linq.Expressions.Expression<Func<T, bool>>
            whereLambda);
        IQueryable<T> LoadPageEntities<s>(int pageIndex, int pageSize, out int totalCount,
            System.Linq.Expressions.Expression<Func<T, bool>> whereLambda,
            System.Linq.Expressions.Expression<Func<T, s>> orderbyLambda, bool isAsc);
        bool DeleteEntity(T entity);
        bool EditEntity(T entity);

        T AddEntity(T entity);
    }
}

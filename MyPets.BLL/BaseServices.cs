using MyPets.DALFactory;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Linq.Expressions;
using System.Text;
using System.Threading.Tasks;

namespace MyPets.BLL
{
   public abstract class BaseServices<T>where T:class,new()
    {
        public IDAL.IDBSession GetCurrentDbSession
       {
           get
            {
                //return new DBSession();//造成多线程，每调用一下就new一下
                return DALFactory.DBSessionFactory.CreateDbSession();
            }
        }
        public IDAL.IBaseDal<T> CurrentDal { get; set; } //最后CurrentDal==BaseDal的方法
        public abstract void SetCurrentDal();
        public BaseServices()
        {
            SetCurrentDal();
        }
        /// <summary>
        /// 以下方法引用的是BaseDal的方法 
        /// </summary>
        /// <param name="whereLambda"></param>
        /// <returns></returns>查询
        public IQueryable<T> LoadEntities(Expression<Func<T, bool>> whereLambda)//查
        {
            return CurrentDal.LoadEntities(whereLambda);
        }
        //分页
        public IQueryable<T> LoadPageEntities<s>(int pageIndex, int pageSize, out int totalCount, Expression<Func<T, bool>> whereLambda, Expression<Func<T, s>> orderbyLambda, bool isAsc)
        {
            return CurrentDal.LoadPageEntities<s>(pageIndex, pageSize, out totalCount, whereLambda, orderbyLambda, isAsc);
        }
       public T AddEntity(T entity)//增
        {
            CurrentDal.AddEntity(entity);
            this.GetCurrentDbSession.SaveChanges();     //这里调用了DBsession的方法，往上看代码第一行
            return entity;

        }

        public bool DeleteEntity(T entity)//删
        {
            CurrentDal.DeleteEntity(entity);
            return this.GetCurrentDbSession.SaveChanges(); //这里调用了DBsession的方法，往上看代码第一行

        }

        public bool EditEntity(T entity)//改
        {
            CurrentDal.EditEntity(entity);
            return this.GetCurrentDbSession.SaveChanges(); //这里调用了DBsession的方法，往上看代码第一行
        }
    }
}

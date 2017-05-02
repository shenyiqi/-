using MyPets.Model;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Linq.Expressions;
using System.Text;
using System.Threading.Tasks;

namespace MyPets.DAL
{
    public class BaseDal<T> where T : class, new()
    {
        DbContext db = DbContextFactory.CreateDbContext();
        public IQueryable<T> LoadEntities(Expression<Func<T, bool>> whereLambda)//查
        {
            return db.Set<T>().Where<T>(whereLambda);
        }

        public IQueryable<T> LoadPageEntities<s>(int pageIndex, int pageSize, out int totalCount, Expression<Func<T, bool>> whereLambda, Expression<Func<T, s>> orderbyLambda, bool isAsc)
        {
            var temp = db.Set<T>().Where<T>(whereLambda);
            totalCount = temp.Count();//统计个数
            if (isAsc)//升序
            {
                temp = temp.OrderBy<T, s>(orderbyLambda).Skip<T>((pageIndex - 1) * pageSize).Take<T>(pageSize);
            }
            else
            {
                temp = temp.OrderByDescending<T, s>(orderbyLambda).Skip<T>((pageIndex - 1) * pageSize).Take<T>(pageSize);
            }
            return temp;
        }
        public T AddEntity(T entity)//增
        {
            db.Set<T>().Add(entity);
            //db.SaveChanges();
            return entity;

        }

        public bool DeleteEntity(T entity)//删
        {
            db.Entry<T>(entity).State = EntityState.Deleted;
            //return db.SaveChanges() > 0;
            return true;
        }

        /// <summary>
        /// 
        /// </summary>
        /// <param name="entity"></param>
        /// <returns></returns>
        public bool EditEntity(T entity)//改
        {
            db.Entry<T>(entity).State = EntityState.Modified;
            //return db.SaveChanges() > 0;
            return true;
        }
    }
}

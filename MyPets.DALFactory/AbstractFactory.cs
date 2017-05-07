using MyPets.IDAL;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Reflection;
using System.Text;
using System.Threading.Tasks;
using System.Configuration;
namespace MyPets.DALFactory
{
    public class AbstractFactory
    {
        private readonly static string DalAssemblyPath = ConfigurationManager.AppSettings["DalAssemblyPath"];
        private readonly static string NameSpace = ConfigurationManager.AppSettings["NameSpace"];
        public static IUserInfoDal CreateUserInfoDal()
        {
            string fullClassName = NameSpace + ".UserInfoDal";//构建类的全名称
            return CreateInstance(fullClassName) as IUserInfoDal;
        }
        public static IAdminstratorDal CreateAdminstratorDal()
        {
            string fullClassName = NameSpace + ".AdminstratorDal";
            return CreateInstance(fullClassName) as IAdminstratorDal;
        }
        public static IBaikeDal CreateBaikeDal()
        {
            string fullClassName = NameSpace + ".BaikeDal";
            return CreateInstance(fullClassName) as IBaikeDal; 
        }
        public static IBaikeQuestionDal CreateBaikeQuestionDal()
        {
            string fullClassName = NameSpace + ".BaikeQuestionDal";
            return CreateInstance(fullClassName) as IBaikeQuestionDal;
        }
        public static IBaikeAnswerDal CreateBaikeAnswerDal()
        {
            string fullClassName = NameSpace + ".BaikeAnswerDal";
            return CreateInstance(fullClassName) as IBaikeAnswerDal;
        }
        public static ICollectDal CreateCollectDal()
        {
            string fullClassName = NameSpace + ".CollectDal";
            return CreateInstance(fullClassName) as ICollectDal;
        }
        public static IGoodsDal CreateGoodsDal()
        {
            string fullClassName = NameSpace + ".GoodsDal";
            return CreateInstance(fullClassName) as IGoodsDal;
        }
        public static IGoodsCommentDal CreateGoodsCommentDal()
        {
            string fullClassName = NameSpace + ".GoodsCommentDal";
            return CreateInstance(fullClassName) as IGoodsCommentDal;
        }
        public static IOrderDal CreateOrderDal()
        {
            string fullClassName = NameSpace + ".OrderDal";
            return CreateInstance(fullClassName) as IOrderDal;
        }
        public static IOrderDetailDal CreateOrderDetailDal()
        {
            string fullClassName = NameSpace + ".OrderDetailDal";
            return CreateInstance(fullClassName) as IOrderDetailDal;
        }
        public static IPostDal CreatePostDal()
        {
            string fullClassName = NameSpace + ".PostDal";
            return CreateInstance(fullClassName) as IPostDal;
        }
        public static IPrivateMsgDal CreatePrivateMsgDal()
        {
            string fullClassName = NameSpace + ".PrivateMsgDal";
            return CreateInstance(fullClassName) as IPrivateMsgDal;
        }
        public static IResponseDal CreateResponseDal()
        {
            string fullClassName = NameSpace + ".ResponseDal";
            return CreateInstance(fullClassName) as IResponseDal;
        }
        public static IShopDal CreateShopDal()
        {
            string fullClassName = NameSpace + ".ShopDal";
            return CreateInstance(fullClassName) as IShopDal;
        }
        public static IShopRecommendDal CreateShopRecommendDal()
        {
            string fullClassName = NameSpace + ".ShopRecommendDal";
            return CreateInstance(fullClassName) as IShopRecommendDal;
        }
        public static object CreateInstance(string fullClassName)
        {
            var assembly = Assembly.Load(DalAssemblyPath);//加载程序集
            return assembly.CreateInstance(fullClassName);
        }
    }
}

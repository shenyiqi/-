using MyPets.DAL;
using MyPets.IDAL;
using MyPets.Model;
using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace MyPets.DALFactory
{
    /// <summary>
    /// 数据会话层，创建数据操作类的实例，业务层通过DBsession调用对应的数据操作实例，将业务层与数据层接偶
    /// 将业务层数据层解耦
    /// </summary>

    public class DBSession : IDBSession
    {
        public DbContext db
        {
            get { return DbContextFactory.CreateDbContext(); }
        }
        /// <summary>
        /// 创建数据操作类UserInfoDal的实例
        /// </summary>
        private IUserInfoDal _UserInfoDal;
        public IUserInfoDal UserInfoDal
        {
            get
            {
                if (_UserInfoDal == null)
                {
                    _UserInfoDal = AbstractFactory.CreateUserInfoDal();
                }
                return _UserInfoDal;
            }
            set { _UserInfoDal = value; }
        }
        /// <summary>
        /// 创建数据操作类AdminstratorDal的实例
        /// </summary>
        private IAdminstratorDal _AdminstratorDal;
        public IAdminstratorDal AdminstratorDal
        {
            get
            {
                if (_AdminstratorDal == null)
                {
                    _AdminstratorDal = AbstractFactory.CreateAdminstratorDal();
                }
                return _AdminstratorDal;
            }
            set { _AdminstratorDal = value; }
        }
        /// <summary>
        /// 创建数据操作类BaikeDal的实例
        /// </summary>
        private IBaikeDal _BaikeDal;
        public IBaikeDal BaikeDal
        {
            get
            {
                if (_BaikeDal == null)
                {
                    _BaikeDal = AbstractFactory.CreateBaikeDal();
                }
                return _BaikeDal;
            }
            set { _BaikeDal = value; }
        }
        /// <summary>
        /// 百科轮播图
        /// </summary>
        private IBaikeActivityDal _BaikeActivityDal;
        public IBaikeActivityDal BaikeActivityDal
        {
            get
            {
                if (_BaikeActivityDal == null)
                {
                    _BaikeActivityDal = AbstractFactory.CreateBaikeActivityDal();
                }
                return _BaikeActivityDal;
            }
            set { _BaikeActivityDal = value; }
        }
        /// <summary>
        /// 创建数据操作类IBaikeQuestionDal的实例
        /// </summary>
        private IBaikeQuestionDal _BaikeQuestionDal;
        public IBaikeQuestionDal BaikeQuestionDal
        {
            get
            {
                if (_BaikeQuestionDal == null)
                {
                    _BaikeQuestionDal = AbstractFactory.CreateBaikeQuestionDal();
                }
                return _BaikeQuestionDal;
            }
            set { _BaikeQuestionDal = value; }
        }
        /// <summary>
        /// 创建数据操作类IBaikeAnswerDal的实例
        /// </summary>
        private IBaikeAnswerDal _BaikeAnswerDal;
        public IBaikeAnswerDal BaikeAnswerDal
        {
            get
            {
                if (_BaikeAnswerDal == null)
                {
                    _BaikeAnswerDal = AbstractFactory.CreateBaikeAnswerDal();
                }
                return _BaikeAnswerDal;
            }
            set { _BaikeAnswerDal = value; }
        }
        /// <summary>
        /// 创建数据操作类百科问答回复评论的实例
        /// </summary>
        private IResponAnswerDal _ResponAnswerDal;
        public IResponAnswerDal ResponAnswerDal
        {
            get
            {
                if (_ResponAnswerDal == null)
                {
                    _ResponAnswerDal = AbstractFactory.CreateResponAnswerDal();
                }
                return _ResponAnswerDal;
            }
            set { _ResponAnswerDal = value; }
        }
        /// <summary>
        /// 创建数据操作类CollectDal的实例
        /// </summary>
        private ICollectDal _CollectDal;
        public ICollectDal CollectDal
        {
            get
            {
                if (_CollectDal == null)
                {
                    _CollectDal = AbstractFactory.CreateCollectDal();
                }
                return _CollectDal;
            }
            set{ _CollectDal = value;}
        }
        /// <summary>
        /// 创建数据操作类GoodsDal的实例
        /// </summary>
        private IGoodsDal _GoodsDal;
        public IGoodsDal GoodsDal
        {
            get
            {
                if (_GoodsDal == null)
                {
                    _GoodsDal = AbstractFactory.CreateGoodsDal();
                }
                return _GoodsDal;
            }
            set { _GoodsDal = value; }
        }
        /// <summary>
        /// 购物车
        /// </summary>
        private IShopCartDal _ShopCartDal;
        public IShopCartDal ShopCartDal
        {
            get
            {
                if (_ShopCartDal == null)
                {
                    _ShopCartDal = AbstractFactory.CreateShopCartDal();
                }
                return _ShopCartDal;
            }
            set { _ShopCartDal = value; }
        }
        /// <summary>
        /// 创建数据操作类GoodscommentDal的实例
        /// </summary>
        private IGoodsCommentDal _GoodsCommentDal;
        public IGoodsCommentDal GoodsCommentDal
        {
            get
            {
                if (_GoodsCommentDal == null)
                {
                    _GoodsCommentDal = AbstractFactory.CreateGoodsCommentDal();
                }
                return _GoodsCommentDal;
            }
            set { _GoodsCommentDal = value; }
        }
        /// <summary>
        /// 商品评论回复
        /// </summary>
        private IGoodsResponseCommentDal _GoodsResponseCommentDal;
        public IGoodsResponseCommentDal GoodsResponseCommentDal
        {
            get
            {
                if (_GoodsResponseCommentDal == null)
                {
                    _GoodsResponseCommentDal = AbstractFactory.CreateGoodsResponseCommentDal();
                }
                return _GoodsResponseCommentDal;
            }
            set { _GoodsResponseCommentDal = value; }
        }
        /// <summary>
        /// 创建数据操作类OrderDal的实例
        /// </summary>
        private IOrderDal _OrderDal;
        public IOrderDal OrderDal
        {
            get
            {
                if (_OrderDal == null)
                {
                    _OrderDal = AbstractFactory.CreateOrderDal();
                }
                return _OrderDal;
            }
            set { _OrderDal = value; }
        }
        /// <summary>
        /// 创建数据操作类OrderDetailDal的实例
        /// </summary>
        private IOrderDetailDal _OrderDetailDal;
        public IOrderDetailDal OrderDetailDal
        {
            get
            {
                if (_OrderDetailDal == null)
                {
                    _OrderDetailDal = AbstractFactory.CreateOrderDetailDal();
                }
                return _OrderDetailDal;
            }
            set { _OrderDetailDal = value; }
        }
        /// <summary>
        /// 创建数据操作类PostDal的实例
        /// </summary>
        private IPostDal _PostDal;
        public IPostDal PostDal
        {
            get
            {
                if (_PostDal == null)
                {
                    _PostDal = AbstractFactory.CreatePostDal();
                }
                return _PostDal;
            }
            set { _PostDal = value; }
        }
        /// <summary>
        /// 创建数据操作类PrivateDal的实例
        /// </summary>
        private IPrivateMsgDal _PrivateMsgDal;
        public IPrivateMsgDal PrivateMsgDal 
        {
            get
            {
                if (_PrivateMsgDal == null)
                {
                    _PrivateMsgDal = AbstractFactory.CreatePrivateMsgDal();
                }
                return _PrivateMsgDal;
            }
            set { _PrivateMsgDal = value; }
        }
        /// <summary>
        /// 创建数据操作类ResponseDal的实例
        /// </summary>
        private IResponseDal _ResponseDal;
        public IResponseDal ResponseDal
        {
            get
            {
                if (_ResponseDal == null)
                {
                    _ResponseDal = AbstractFactory.CreateResponseDal();
                }
                return _ResponseDal;
            }
            set { _ResponseDal = value; }
        }
        /// <summary>
        /// 创建数据操作类ShopDal的实例
        /// </summary>
        private IShopDal _ShopDal;
        public IShopDal ShopDal
        {
            get
            {
                if (_ShopDal == null)
                {
                    _ShopDal = AbstractFactory.CreateShopDal();
                }
                return _ShopDal;
            }
            set { _ShopDal = value; }
        }
        /// <summary>
        /// 创建数据操作类ShopDal的实例
        /// </summary>
        private IShopRecommendDal _ShopRecommendDal;
        public IShopRecommendDal ShopRecommendDal 
        {
            get
            {
                if (_ShopRecommendDal == null)
                {
                    _ShopRecommendDal = AbstractFactory.CreateShopRecommendDal();
                }
                return _ShopRecommendDal;
            }
            set { _ShopRecommendDal = value; }
        }
        //一个业务中可能涉及到多张表的操作，那么可以将操作的数据，传递到数据层中相应的方法，打上相应的标记，
        //将数据一次性提交到数据库中，避免了多次连接数据库。
        public bool SaveChanges()
        {
            //db.Configuration.ValidateOnSaveEnabled = false;
            db.SaveChanges();
            //db.Configuration.ValidateOnSaveEnabled = true;
            return true;

        }
    }
}

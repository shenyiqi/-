using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace MyPets.IDAL
{
    public interface IDBSession
    {
        IUserInfoDal UserInfoDal { get; set; }
        IAdminstratorDal AdminstratorDal { get; set; }
        IBaikeDal BaikeDal { get; set; }
        ICollectDal CollectDal { get; set; }
        IGoodsDal GoodsDal { get; set; } 
        IGoodsCommentDal GoodsCommentDal { get; set; }
        IOrderDal OrderDal { get; set; }
        IOrderDetailDal OrderDetailDal { get; set; }
        IPostDal PostDal { get; set; }
        IShopDal ShopDal { get; set; }
        IShopRecommendDal ShopRecommendDal { get; set; }
        IPrivateMsgDal PrivateMsgDal { get; set; }
        IResponseDal ResponseDal { get; set; }
        IBaikeAnswerDal BaikeAnswerDal { get; set; }
        IBaikeQuestionDal BaikeQuestionDal { get; set; } 
        IResponAnswerDal ResponAnswerDal { get; set; }
        IShopCartDal ShopCartDal { get; set; }
        IGoodsResponseCommentDal GoodsResponseCommentDal { get; set; }
        IBaikeActivityDal BaikeActivityDal { get; set; }
        bool SaveChanges();
    }
}

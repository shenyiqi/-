using MyPets.IBLL;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using MyPets.Model;
namespace MyPets.BLL
{
    public class BaikeQuestionServices : BaseServices<BaikeQuestion>, IBaikeQuestionServices
    {
        public override void SetCurrentDal()
        {
            CurrentDal = this.GetCurrentDbSession.BaikeQuestionDal;
        }
    }
}

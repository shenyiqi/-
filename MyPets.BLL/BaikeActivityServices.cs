using MyPets.IBLL;
using MyPets.Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace MyPets.BLL
{
    public class BaikeActivityServices : BaseServices<BaikeActivity>, IBaikeActivityServices
    {
        public override void SetCurrentDal()
        {
            CurrentDal = this.GetCurrentDbSession.BaikeActivityDal;
        }
    }
}

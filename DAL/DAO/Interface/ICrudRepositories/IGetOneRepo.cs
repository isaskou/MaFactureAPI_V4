using System;
using System.Collections.Generic;
using System.Text;

namespace DAL.DAO.Interface.ICrudRepositories
{
    public interface IGetOneRepository<Tentity, Tid> where Tentity : class where Tid : struct
    {
        Tentity GetOne(Tid id);
    }
}

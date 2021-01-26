using System;
using System.Collections.Generic;
using System.Text;

namespace DAL.DAO.Interface.ICrudRepositories
{
    public interface IInsertRepository<Tentity, Tid> where Tentity : class where Tid : struct
    {
        Tid Insert(Tentity entity);
    }
}

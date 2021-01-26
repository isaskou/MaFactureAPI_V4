using DAL.DAO.Interface.ICrudRepositories;
using System;
using System.Collections.Generic;
using System.Text;

namespace DAL.DAO.Interface
{
    public interface IRepository<Tentity, Tid> :
        IInsertRepository<Tentity, Tid>,
        IGetAllRepository<Tentity>,
        IGetOneRepository<Tentity, Tid>,
        IUpdateRepository<Tentity>,
        IDeleteRepository<Tid>


        where Tentity : class
        where Tid : struct
    {
    }
}

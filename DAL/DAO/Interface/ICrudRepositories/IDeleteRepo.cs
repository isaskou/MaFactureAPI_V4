using System;
using System.Collections.Generic;
using System.Text;

namespace DAL.DAO.Interface.ICrudRepositories
{
    public interface IDeleteRepository<Tid> where Tid : struct
    {
        bool Delete(Tid id);
    }
}

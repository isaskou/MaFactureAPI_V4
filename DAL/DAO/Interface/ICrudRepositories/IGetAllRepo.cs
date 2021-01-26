using System;
using System.Collections.Generic;
using System.Text;

namespace DAL.DAO.Interface.ICrudRepositories
{
    public interface IGetAllRepository<Tentity> where Tentity : class
    {
        IEnumerable<Tentity> GetAll();
    }
}

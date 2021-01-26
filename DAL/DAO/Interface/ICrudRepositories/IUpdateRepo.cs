using System;
using System.Collections.Generic;
using System.Text;

namespace DAL.DAO.Interface.ICrudRepositories
{
    public interface IUpdateRepository<Tentity> where Tentity : class
    {
        void Update(Tentity entity);
    }
}

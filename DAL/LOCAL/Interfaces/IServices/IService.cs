using System;
using System.Collections.Generic;
using System.Text;

namespace DAL.LOCAL.Interfaces.IServices
{
    public interface IService<T> where T : class
    {
        IEnumerable<T> GetAll();
        T GetById(int id);
        int Insert(T entity);
        void Update(T entity);
        bool Delete(int id);
    }
}

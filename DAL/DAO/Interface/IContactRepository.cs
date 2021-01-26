using DAL.DAO.DTO.Contact;
using System;
using System.Collections.Generic;
using System.Text;

namespace DAL.DAO.Interface
{
    public interface IContactRepository : IRepository<ContactDTO, int>
    {
        ContactDTO GetByName(string name);
        ContactDTO GetByFirstName(string firstName);
        ContactDTO GetBySurname(string surname);
        ContactDTO GetByMail(string email);
    }
}

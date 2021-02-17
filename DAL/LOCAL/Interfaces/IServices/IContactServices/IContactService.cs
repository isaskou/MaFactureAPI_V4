using DAL.LOCAL.Models;
using System;
using System.Collections.Generic;
using System.Text;

namespace DAL.LOCAL.Interfaces.IServices.IContactServices
{
    public interface IContactService : IService<ContactModel>
    {
        ContactModel GetByName(string name);
        ContactModel GetByFirstName(string firstName);
        ContactModel GetBySurname(string surname);
        ContactModel GetByMail(string email);
    }
}

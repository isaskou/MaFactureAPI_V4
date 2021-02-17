using DAL.DAO.Interface;
using DAL.LOCAL.Interfaces.IServices.IContactServices;
using DAL.LOCAL.Mapper;
using DAL.LOCAL.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace DAL.LOCAL.Services.ContactServices
{
    public class ContactService : IContactService
    {
        private IContactRepository _contactRepo;

        public ContactService(IContactRepository contactRepo)
        {
            _contactRepo = contactRepo;
        }

        public bool Delete(int id)
        {
            return _contactRepo.Delete(id);
        }

        public IEnumerable<ContactModel> GetAll()
        {
            return _contactRepo.GetAll().Select(x => x.toLocal());
        }

        public ContactModel GetByFirstName(string firstName)
        {
            return _contactRepo.GetByFirstName(firstName).toLocal();
        }

        public ContactModel GetById(int id)
        {
            return _contactRepo.GetOne(id).toLocal();
        }

        public ContactModel GetByMail(string email)
        {
            return _contactRepo.GetByMail(email).toLocal();
        }

        public ContactModel GetByName(string name)
        {
            return _contactRepo.GetByName(name).toLocal();
        }

        public ContactModel GetBySurname(string surname)
        {
            return _contactRepo.GetBySurname(surname).toLocal();
        }

        public int Insert(ContactModel entity)
        {
            return _contactRepo.Insert(entity.toDao());
        }

        public void Update(ContactModel entity)
        {
            _contactRepo.Update(entity.toDao());
        }
    }
}

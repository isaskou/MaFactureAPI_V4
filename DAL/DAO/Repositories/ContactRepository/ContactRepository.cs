using DAL.DAO.DTO.Contact;
using DAL.DAO.Interface;
using DAL.DAO.Tools;
using Microsoft.Extensions.Configuration;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Toolbox;

namespace DAL.DAO.Repositories.ContactRepository
{
    public class ContactRepository : RepositoryBase, IContactRepository
    {
        public ContactRepository(IConfiguration config) : base(config)
        {

        }
        public bool Delete(int contactId)
        {
            Command cmd = new Command("DELETE FROM Contact WHERE ContactId=@ContactId", false);
            cmd.AddParameters("ContactId", contactId);
            return _connection.ExecuteNonQuery(cmd) == 1;

        }

        public IEnumerable<ContactDTO> GetAll()
        {
            Command cmd = new Command("SELECT * FROM Contact", false);
            return _connection.ExecuteReader(cmd, ContactConverter.ContactConvert);
        }

        public ContactDTO GetByFirstName(string firstName)
        {
            Command cmd = new Command("SP_GetByFirstName", true);
            cmd.AddParameters("Prenom", firstName);
            return _connection.ExecuteReader(cmd, ContactConverter.ContactConvert).FirstOrDefault();
        }

        public ContactDTO GetByMail(string email)
        {
            Command cmd = new Command("SP_GetByMail", true);
            cmd.AddParameters("Email", email);
            return _connection.ExecuteReader(cmd, ContactConverter.ContactConvert).FirstOrDefault();
        }

        public ContactDTO GetByName(string nom)
        {
            Command cmd = new Command("SP_GetByName", true);
            cmd.AddParameters("Nom", nom);
            return _connection.ExecuteReader(cmd, ContactConverter.ContactConvert).FirstOrDefault();
        }

        public ContactDTO GetBySurname(string surnom)
        {
            Command cmd = new Command("SP_GetBySurname", true);
            cmd.AddParameters("Surnom", surnom);
            return _connection.ExecuteReader(cmd, ContactConverter.ContactConvert).FirstOrDefault();
        }

        public ContactDTO GetOne(int id)
        {
            Command cmd = new Command("SP_GetById", true);
            cmd.AddParameters("id", id);
            return _connection.ExecuteReader(cmd, ContactConverter.ContactConvert).FirstOrDefault();

        }

        public int Insert(ContactDTO entity)
        {
            Command cmd = new Command("SP_AddContact", true);
            cmd.AddParameters("Prenom", entity.Prenom);
            cmd.AddParameters("Nom", entity.Nom);
            cmd.AddParameters("Surnom", entity.Surnom);
            cmd.AddParameters("Tel", entity.Tel);
            cmd.AddParameters("Email", entity.Email);
            cmd.AddParameters("Rue", entity.Rue);
            cmd.AddParameters("Num", entity.Num);
            cmd.AddParameters("CodePostal", entity.CodePostal);
            cmd.AddParameters("Ville", entity.Ville);
            cmd.AddParameters("Pays", entity.Pays);

            return (int)_connection.ExecuteScalar(cmd);
        }

        public void Update(ContactDTO entity)
        {
            Command cmd = new Command("SP_UpdateContact", true);
            cmd.AddParameters("ContactId", entity.ContactId);
            cmd.AddParameters("Prenom", entity.Prenom);
            cmd.AddParameters("Nom", entity.Nom);
            cmd.AddParameters("Surnom", entity.Surnom);
            cmd.AddParameters("Tel", entity.Tel);
            cmd.AddParameters("Email", entity.Email);
            cmd.AddParameters("Rue", entity.Rue);
            cmd.AddParameters("Num", entity.Num);
            cmd.AddParameters("CodePostal", entity.CodePostal);
            cmd.AddParameters("Ville", entity.Ville);
            cmd.AddParameters("Pays", entity.Pays);

            _connection.ExecuteNonQuery(cmd);
        }

    }
}

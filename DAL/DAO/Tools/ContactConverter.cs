using DAL.DAO.DTO.Contact;
using System;
using System.Collections.Generic;
using System.Data;
using System.Text;

namespace DAL.DAO.Tools
{
    public static class ContactConverter
    {
        public static ContactDTO Convert(IDataReader reader)
        {
            return new ContactDTO
            {
                ContactId = (int)reader["ContactId"],
                Prenom = reader["Prenom"].ToString(),
                Nom = reader["Nom"].ToString(),
                Surnom = reader["Surnom"].ToString(),
                Tel = reader["Tel"].ToString(),
                Email = reader["Email"].ToString(),
                Rue = reader["Rue"].ToString(),
                Num = reader["Num"].ToString(),
                CodePostal = reader["CodePostal"].ToString(),
                Ville = reader["Ville"].ToString(),
                Pays = reader["Pays"].ToString()
            };
        }
    }
}

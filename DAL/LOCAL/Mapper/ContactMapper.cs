using System;
using System.Collections.Generic;
using System.Text;
using dao = DAL.DAO.DTO.Contact;
using local = DAL.LOCAL.Models;

namespace DAL.LOCAL.Mapper
{
    public static class ContactMapper
    {
        public static local.ContactModel toLocal(this dao.ContactDTO c)
        {
            if (c == null) return null;

            return new local.ContactModel
            {
                ContactId = c.ContactId,
                Prenom = c.Prenom,
                Nom = c.Nom,
                Surnom = c.Surnom,
                Tel = c.Tel,
                Email = c.Email,
                Rue = c.Rue,
                Num = c.Num,
                CodePostal = c.CodePostal,
                Ville = c.Ville,
                Pays = c.Pays
            };
        }

        public static dao.ContactDTO toDao(this local.ContactModel c)
        {
            return new dao.ContactDTO
            {
                ContactId = c.ContactId,
                Prenom = c.Prenom,
                Nom = c.Nom,
                Surnom = c.Surnom,
                Tel = c.Tel,
                Email = c.Email,
                Rue = c.Rue,
                Num = c.Num,
                CodePostal = c.CodePostal,
                Ville = c.Ville,
                Pays = c.Pays
            };
        }
    }
}

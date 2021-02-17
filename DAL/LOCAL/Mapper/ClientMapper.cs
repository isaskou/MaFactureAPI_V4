using System;
using System.Collections.Generic;
using System.Text;
using dao = DAL.DAO.DTO.Contact;
using local = DAL.LOCAL.Models;

namespace DAL.LOCAL.Mapper
{
    public static class ClientMapper
    {
        public static local.ClientModel toLocal(this dao.ClientDTO cl)
        {
            if (cl == null) return null;
            return new local.ClientModel
            {
                ClientId = cl.ClientId,
                Societe = cl.NomSociete,
                NumTVA = cl.NumTva,
                Contact = new local.ContactModel()
                
            };
        }

        public static dao.ClientDTO toDao(this local.ClientModel cl)
        {
            return new dao.ClientDTO
            {
                ClientId = cl.ClientId,
                NomSociete = cl.Societe,
                NumTva = cl.NumTVA,
                ContactId = cl.Contact.ContactId
            };
        }
    }
}

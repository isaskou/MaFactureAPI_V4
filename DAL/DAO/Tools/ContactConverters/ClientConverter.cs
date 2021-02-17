using DAL.DAO.DTO.Contact;
using System;
using System.Collections.Generic;
using System.Data;
using System.Text;

namespace DAL.DAO.Tools
{
    public static class ClientConverter
    {
        public static ClientDTO ClientConvert(IDataReader reader)
        {
            return new ClientDTO
            {
                ClientId = (int)reader["ClientId"],
                NomSociete = reader["NomSociete"].ToString(),
                NumTva = reader["NumTva"].ToString(),
                ContactId = (int)reader["ContactId"]
            };
        }
    }
}

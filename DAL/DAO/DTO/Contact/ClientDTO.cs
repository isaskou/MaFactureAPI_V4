using System;
using System.Collections.Generic;
using System.Text;

namespace DAL.DAO.DTO.Contact
{
    public class ClientDTO
    {
        public int ClientId { get; set; }
        public string NomSociete { get; set; }
        public string NumTva { get; set; }
        public int ContactId { get; set; }
    }
}

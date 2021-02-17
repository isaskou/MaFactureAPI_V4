using System;
using System.Collections.Generic;
using System.Text;

namespace DAL.DAO.DTO.Contact
{
    public class FournisseurDTO
    {
        public int FournisseurId { get; set; }
        public string Societe { get; set; }
        public string NumTVA { get; set; }
        public int ContactId { get; set; }
    }
}

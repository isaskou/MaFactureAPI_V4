using System;
using System.Collections.Generic;
using System.Text;

namespace DAL.LOCAL.Models
{
    public class Fournisseur
    {
        public int FournisseurId { get; set; }
        public string Societe { get; set; }
        public string NumTVA { get; set; }
        public ContactModel Contact { get; set; }
    }
}

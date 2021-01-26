using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace DAL.LOCAL.Models
{
    public class ContactModel
    {
        public int ContactId { get; set; }
        public string Prenom { get; set; }
        public string Nom { get; set; }
        public string Surnom { get; set; }
        public string Tel { get; set; }
        public string Email { get; set; }
        public string Rue { get; set; }
        public string Num { get; set; }
        public string CodePostal { get; set; }
        public string Ville { get; set; }
        public string Pays { get; set; }
    }
}

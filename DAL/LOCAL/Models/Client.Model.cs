using System;
using System.Collections.Generic;
using System.Text;

namespace DAL.LOCAL.Models
{
    public class ClientModel
    {

        public int ClientId { get; set; }
        public string Societe { get; set; }
        public string NumTVA { get; set; }
        public ContactModel Contact { get; set; }

        //public ClientModel(int clientId, string societe, string numTVA, ContactModel contact)
        //{
        //    ClientId = clientId;
        //    Societe = societe;
        //    NumTVA = numTVA;
        //    Contact = contact;
        //}
    }
}

using DAL.DAO.DTO.Contact;
using System;
using System.Collections.Generic;
using System.Text;

namespace DAL.DAO.Interface.IContactRepositories
{
    public interface IClientRepository : IRepository<ClientDTO, int>
    {
        ClientDTO GetClientByContactId(int contactId);
        ClientDTO GetClientById(int clientId);
        ClientDTO GetClientBySociete(string societe);
        ClientDTO GetClientByTVA(string tva);

    }
}

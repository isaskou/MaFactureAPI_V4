using DAL.LOCAL.Models;
using System;
using System.Collections.Generic;
using System.Text;

namespace DAL.LOCAL.Interfaces.IServices.IContactServices
{
    public interface IClientService: IService<ClientModel>
    {
        ClientModel GetClientByContactId(int contactId);
        ClientModel GetClientById(int clientId);
        ClientModel GetClientBySociete(string societe);
        ClientModel GetClientByTVA(string tva);
    }
}

using DAL.DAO.Interface;
using DAL.DAO.Interface.IContactRepositories;
using DAL.LOCAL.Interfaces.IServices.IContactServices;
using DAL.LOCAL.Mapper;
using DAL.LOCAL.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace DAL.LOCAL.Services.ContactServices
{
    public class ClientService : IClientService
    {
        private IClientRepository _clientRepository;
        private IContactRepository _contactRepository;

        public ClientService(IClientRepository clientRepository, IContactRepository contactRepository)
        {
            _clientRepository = clientRepository;
            _contactRepository = contactRepository;
        }

        public bool Delete(int id)
        {
            return _clientRepository.Delete(id);
        }

        public IEnumerable<ClientModel> GetAll()
        {
            return _clientRepository.GetAll().Select(x => x.toLocal());
        }

        public ClientModel GetById(int id)
        {
            return _clientRepository.GetClientById(id).toLocal();
        }

        public ClientModel GetClientByContactId(int contactId)
        {
            return _clientRepository.GetClientByContactId(contactId).toLocal();
        }

        public ClientModel GetClientById(int clientId)
        {
            return _clientRepository.GetClientById(clientId).toLocal();

        }

        public ClientModel GetClientBySociete(string societe)
        {
            return _clientRepository.GetClientBySociete(societe).toLocal();
        }

        public ClientModel GetClientByTVA(string tva)
        {
            return _clientRepository.GetClientByTVA(tva).toLocal();
        }

        public int Insert(ClientModel entity)
        {
            return _clientRepository.Insert(entity.toDao());
        }

        public void Update(ClientModel entity)
        {
            _clientRepository.Update(entity.toDao());
        }
    }
}

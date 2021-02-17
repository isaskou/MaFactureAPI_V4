using DAL.DAO.DTO.Contact;
using DAL.DAO.Interface.IContactRepositories;
using DAL.DAO.Tools;
using Microsoft.Extensions.Configuration;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Toolbox;

namespace DAL.DAO.Repositories.ContactRepository
{
    public class ClientRepository : RepositoryBase, IClientRepository
    {
        public ClientRepository(IConfiguration config) : base(config)
        {
        }

        public bool Delete(int clientid)
        {
            Command cmd = new Command("DELETE FROM ClientModel WHERE ClientId=@ClientId", false);
            cmd.AddParameters("ClientId", clientid);
            return _connection.ExecuteNonQuery(cmd) == 1;
        }

        public IEnumerable<ClientDTO> GetAll()
        {
            Command cmd = new Command("SP_GetAllClientWithContact", true);
            return _connection.ExecuteReader(cmd, ClientConverter.ClientConvert);
        }

        public ClientDTO GetClientByContactId(int contactId)
        {
            Command cmd = new Command("SP_GetClientByContactId", true);
            cmd.AddParameters("ContactId", contactId);
            return _connection.ExecuteReader(cmd, ClientConverter.ClientConvert).FirstOrDefault();
        }

        public ClientDTO GetClientById(int clientId)
        {
            Command cmd = new Command("SP_GetClientById", true);
            cmd.AddParameters("ClientId", clientId);
            return _connection.ExecuteReader(cmd, ClientConverter.ClientConvert).FirstOrDefault();
        }

        public ClientDTO GetClientBySociete(string societe)
        {
            Command cmd = new Command("SP_GetClientBySociete", true);
            cmd.AddParameters("NomSociete", societe);
            return _connection.ExecuteReader(cmd, ClientConverter.ClientConvert).FirstOrDefault();
        }

        public ClientDTO GetClientByTVA(string tva)
        {
            Command cmd = new Command("SP_GetClientByTVA", true);
            cmd.AddParameters("NumTVA", tva);
            return _connection.ExecuteReader(cmd, ClientConverter.ClientConvert).FirstOrDefault();
        }

        public ClientDTO GetOne(int id)
        {
            Command cmd = new Command("SP_GetClientById", true);
            cmd.AddParameters("ClientId", id);
            return _connection.ExecuteReader(cmd, ClientConverter.ClientConvert).FirstOrDefault();
        }

        public int Insert(ClientDTO entity)
        {
            Command cmd = new Command("SP_AddClient", true);
            cmd.AddParameters("NomSociete", entity.NomSociete);
            cmd.AddParameters("NumTVA", entity.NumTva);
            cmd.AddParameters("ContactId", entity.ContactId);

            return (int)_connection.ExecuteScalar(cmd);
        }

        public void Update(ClientDTO entity)
        {
            Command cmd = new Command("SP_UpdateClient", true);
            cmd.AddParameters("ClientId", entity.ClientId);
            cmd.AddParameters("NomSociete", entity.NomSociete);
            cmd.AddParameters("NumTVA", entity.NumTva);
            cmd.AddParameters("ContactId", entity.ContactId);

            _connection.ExecuteNonQuery(cmd);
        }
    }
}

using DAL.DAO.DTO.Contact;
using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.Configuration;
using System;
using System.Collections.Generic;
using System.Text;
using Toolbox;

namespace DAL.DAO.Repositories
{
    public abstract class RepositoryBase
    {
        internal Connection _connection;

        IConfiguration _config;

        public RepositoryBase(IConfiguration config)
        {
            _config = config;
            _connection = new Connection(_config.GetConnectionString("default"));
        }

        public DbSet<ContactDTO> Contact { get; set; }
    }
}

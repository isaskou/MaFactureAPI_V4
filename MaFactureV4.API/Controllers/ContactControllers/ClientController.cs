using DAL.LOCAL.Interfaces.IServices.IContactServices;
using DAL.LOCAL.Models;
using Microsoft.AspNetCore.Mvc;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;


namespace MaFactureV4.API.Controllers.ContactControllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class ClientController : ControllerBase
    {
        private IClientService _clientService;

        public ClientController(IClientService clientService)
        {
            _clientService = clientService;
        }



        // GET: api/<ClientController>
        [HttpGet]
        public IActionResult GetAll()
        {
            return Ok(_clientService.GetAll());
        }

        // GET api/<ClientController>/5
        [HttpGet("{id}")]
        public IActionResult GetById(int id)
        {
            return Ok(_clientService.GetById(id));
        }

        // POST api/<ClientController>
        [HttpPost]
        public IActionResult Post([FromBody] ClientModel client)
        {
            return Ok(_clientService.Insert(client));
        }

        // PUT api/<ClientController>/5
        [HttpPut("{id}")]
        public IActionResult Put(int id, [FromBody] ClientModel client)
        {
            try
            {
                client.ClientId = id;
                _clientService.Update(client);
                return Ok();
            }
            catch (Exception)
            {
                return BadRequest("Echec de la mise à jour");
            }
        }

        // DELETE api/<ClientController>/5
        [HttpDelete("{id}")]
        public IActionResult Delete(int id)
        {
            return Ok(_clientService.Delete(id));
        }
    }
}

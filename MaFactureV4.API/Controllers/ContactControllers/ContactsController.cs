using DAL.LOCAL.Interfaces.IServices;
using DAL.LOCAL.Interfaces.IServices.IContactServices;
using DAL.LOCAL.Models;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace MaFactureV4.API.Controllers.ContactControllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class ContactsController : ControllerBase
    {
        private IContactService _contactService;

        public ContactsController(IContactService contactService)
        {
            _contactService = contactService;
        }

        // GET: api/<ContactController>
        [HttpGet]
        public IActionResult GetAll()
        {
            return Ok(_contactService.GetAll());
        }

        // GET api/<ContactController>/5
        [HttpGet("{id}")]
        public IActionResult GetById(int id)
        {
            return Ok(_contactService.GetById(id));
        }

        // POST api/<ContactController>
        [HttpPost]
        public IActionResult Post([FromBody] ContactModel contact)
        {
            return Ok(_contactService.Insert(contact));
        }

        // PUT api/<ContactController>/5
        [HttpPut("{id}")]
        public IActionResult Put(int id, [FromBody] ContactModel contact)
        {
            try
            {
                contact.ContactId = id;
                _contactService.Update(contact);
                return Ok();
            }
            catch (Exception)
            {

                return BadRequest("Echec de la mis à jour");
            }
            
        }

        // DELETE api/<ContactController>/5
        [HttpDelete("{id}")]
        public IActionResult Delete(int id)
        {
            return Ok(_contactService.Delete(id));
        }
    }
}

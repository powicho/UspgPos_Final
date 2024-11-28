using Microsoft.AspNetCore.Mvc;
using UspgPOS.Data;

namespace UspgPOS.Controllers
{
    public class PosController : Controller
    {
        private readonly AppDbContext _context;

        public PosController(AppDbContext context)
        {
            _context = context;
        }

        public ActionResult Index()
        {

            var productos = _context.Productos.ToList();

			ViewBag.Clientes = _context.Clientes.ToList();
			return View(productos);
	
        }
    }
}
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Rendering;
using Microsoft.EntityFrameworkCore;
using QuestPDF.Fluent;
using QuestPDF.Helpers;
using QuestPDF.Infrastructure;
using UspgPOS.Data;
using UspgPOS.DTOs;
using UspgPOS.Models;

namespace UspgPOS.Controllers
{
    public class VentasController : Controller
    {
        private readonly AppDbContext _context;

        public VentasController(AppDbContext context)
        {
            _context = context;
        }

        // GET: Ventas
        public async Task<IActionResult> Index()
        {
            var appDbContext = _context.Ventas.Include(v => v.Cliente).Include(v => v.Sucursal);
            return View(await appDbContext.ToListAsync());
        }

        // GET: Ventas/Details/5
        // GET: Ventas/Details/5
        public async Task<IActionResult> Details(long? id)
        {
            if (id == null)
            {
                return NotFound();
            }

            var venta = await _context.Ventas
                .Include(v => v.Cliente)
                .Include(v => v.Sucursal)
                .FirstOrDefaultAsync(m => m.Id == id);
            if (venta == null)
            {
                return NotFound();
            }

            // Redirigir al controlador Detalle_Ventas para mostrar los detalles de la venta
            return RedirectToAction("Index", "DetalleVentas", new { ventaId = venta.Id });
        }

        // GET: Ventas/Create
        public IActionResult Create()
        {
            ViewData["ClienteId"] = new SelectList(_context.Clientes, "Id", "Nombre");
            ViewData["SucursalId"] = new SelectList(_context.Sucursales, "Id", "Nombre", HttpContext.Session.GetString("SucursalId"));
            return View();
        }


        // POST: Ventas/Create
        // To protect from overposting attacks, enable the specific properties you want to bind to.
        // For more details, see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Create([Bind("Id,Fecha,Total,ClienteId,SucursalId")] Venta venta)
        {
            if (ModelState.IsValid)
            {
                _context.Add(venta);
                await _context.SaveChangesAsync();
                return RedirectToAction(nameof(Index));
            }
            ViewData["ClienteId"] = new SelectList(_context.Clientes, "Id", "Nombre", venta.ClienteId);
            ViewData["SucursalId"] = new SelectList(_context.Sucursales, "Id", "Nombre", venta.SucursalId);
            return View(venta);
        }

        // GET: Ventas/Edit/5
        public async Task<IActionResult> Edit(long? id)
        {
            if (id == null)
            {
                return NotFound();
            }

            var venta = await _context.Ventas.FindAsync(id);
            if (venta == null)
            {
                return NotFound();
            }
            ViewData["ClienteId"] = new SelectList(_context.Clientes, "Id", "Nombre", venta.ClienteId);
            ViewData["SucursalId"] = new SelectList(_context.Sucursales, "Id", "Nombre", venta.SucursalId);
            return View(venta);
        }

        // POST: Ventas/Edit/5
        // To protect from overposting attacks, enable the specific properties you want to bind to.
        // For more details, see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Edit(long? id, [Bind("Id,Fecha,Total,ClienteId,SucursalId")] Venta venta)
        {
            if (id != venta.Id)
            {
                return NotFound();
            }

            if (ModelState.IsValid)
            {
                try
                {
                    _context.Update(venta);
                    await _context.SaveChangesAsync();
                }
                catch (DbUpdateConcurrencyException)
                {
                    if (!VentaExists(venta.Id))
                    {
                        return NotFound();
                    }
                    else
                    {
                        throw;
                    }
                }
                return RedirectToAction(nameof(Index));
            }
            ViewData["ClienteId"] = new SelectList(_context.Clientes, "Id", "Nombre", venta.ClienteId);
            ViewData["SucursalId"] = new SelectList(_context.Sucursales, "Id", "Nombre", venta.SucursalId);
            return View(venta);
        }

        // GET: Ventas/Delete/5
        public async Task<IActionResult> Delete(long? id)
        {
            if (id == null)
            {
                return NotFound();
            }

            var venta = await _context.Ventas
                .Include(v => v.Cliente)
                .Include(v => v.Sucursal)
                .FirstOrDefaultAsync(m => m.Id == id);
            if (venta == null)
            {
                return NotFound();
            }

            return View(venta);
        }

        // POST: Ventas/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> DeleteConfirmed(long? id)
        {
            var venta = await _context.Ventas.FindAsync(id);
            if (venta != null)
            {
                _context.Ventas.Remove(venta);
            }

            await _context.SaveChangesAsync();
            return RedirectToAction(nameof(Index));
        }

        private bool VentaExists(long? id)
        {
            return _context.Ventas.Any(e => e.Id == id);
        }

        public IActionResult ImprimirFactura(long id)
        {
            QuestPDF.Settings.License = LicenseType.Community;

            var venta = _context.Ventas
                .Include(v => v.Cliente)
                .Include(v => v.Sucursal)
                .Include(v => v.DetallesVenta)
                    .ThenInclude(d => d.Producto)
                .FirstOrDefault(v => v.Id == id);

            if (venta == null)
            {
                return NotFound();
            }

            var logo = Path.Combine(Directory.GetCurrentDirectory(), "wwwroot/icons/apple-touch-icon-180x180.png");
            var monedaGuatemala = new System.Globalization.CultureInfo("es-GT");

            var document = Document.Create(container =>
            {
                container.Page(page =>
                {
                    page.Size(PageSizes.A4);
                    page.Margin(1, Unit.Centimetre);

                    // Encabezado
                    page.Header().Row(header =>
                    {
                        header.RelativeItem().Column(column =>
                        {
                            column.Item().Text("Factura Comercial").FontSize(20).Bold();
                            column.Item().Text($"Fecha: {venta.Fecha:dd/MM/yyyy}");
                            column.Item().Text($"No. Factura: {venta.Id}");
                            column.Item().Text($"Cliente: {venta.Cliente?.Nombre ?? "N/A"}");
                            column.Item().Text($"NIT: {venta.Cliente?.Nit ?? "N/A"}");
                        });

                        header.ConstantItem(100).Image(logo, ImageScaling.FitArea); // Espacio para el logo
                    });

                    // Contenido principal
                    page.Content().Column(column =>
                    {
                        // Espaciado vertical antes de la tabla
                        column.Item().PaddingVertical(1, Unit.Centimetre);

                        // Tabla de productos
                        column.Item().Table(table =>
                        {
                            table.ColumnsDefinition(columns =>
                            {
                                columns.ConstantColumn(60); // Cantidad
                                columns.RelativeColumn();  // Descripción
                                columns.ConstantColumn(100); // Precio Unitario
                                columns.ConstantColumn(100); // Subtotal
                            });

                            // Encabezado de la tabla
                            table.Header(header =>
                            {
                                header.Cell().Element(EstiloCelda).Text("Cantidad").FontSize(12).Bold();
                                header.Cell().Element(EstiloCelda).Text("Descripción").FontSize(12).Bold();
                                header.Cell().Element(EstiloCelda).Text("Precio Unitario").FontSize(12).Bold();
                                header.Cell().Element(EstiloCelda).Text("Subtotal").FontSize(12).Bold();

                                static IContainer EstiloCelda(IContainer container)
                                {
                                    return container.Background("#e0e0e0").Border(1).Padding(5).AlignCenter();
                                }
                            });

                            // Cuerpo de la tabla
                            foreach (var detalle in venta.DetallesVenta)
                            {
                                table.Cell().Border(1).Padding(5).AlignCenter().Text(detalle.Cantidad.ToString());
                                table.Cell().Border(1).Padding(5).Text(detalle.Producto?.Nombre ?? "N/A");
                                table.Cell().Border(1).Padding(5).AlignRight().Text(detalle.PrecioUnitario.ToString("C", monedaGuatemala));
                                table.Cell().Border(1).Padding(5).AlignRight().Text((detalle.Cantidad * detalle.PrecioUnitario).ToString("C", monedaGuatemala));
                            }

                            // Total
                            table.Cell().ColumnSpan(3).Background("#f0f0f0").Border(1).Padding(5).AlignRight().Text("TOTAL").FontSize(12).Bold();
                            table.Cell().Background("#f0f0f0").Border(1).Padding(5).AlignRight().Text(venta.Total.ToString("C", monedaGuatemala));
                        });

                        // Información adicional debajo de la tabla
                        column.Item().Row(row =>
                        {
                            // Información de contacto
                            row.RelativeItem().Column(contactColumn =>
                            {
                                contactColumn.Item().Text("Dirección: Calle cualquiera 123, cualquier lugar").FontSize(10);
                                contactColumn.Item().Text("Correo: Hola@sitioincreible.com").FontSize(10);
                                contactColumn.Item().Text("Teléfono: (55) 1234-5678").FontSize(10);
                                contactColumn.Item().Text("Web: @sitioincreible").FontSize(10);
                            });

                            // Espacio para firma
                            row.ConstantItem(120).Element(container =>
                            {
                                container.PaddingTop(1, Unit.Centimetre).AlignCenter().Text("FIRMA CLIENTE").FontSize(10);
                            });
                        });
                    });

                });
            });

            var stream = new MemoryStream();
            document.GeneratePdf(stream);
            stream.Position = 0;

            return File(stream, "application/pdf", $"Factura_{id}.pdf");
        }

		[HttpPost]
		public async Task<IActionResult> CrearVenta([FromBody] VentaDTO ventaDto)
		{
			if (ventaDto == null || ventaDto.Detalles == null || !ventaDto.Detalles.Any())
			{
				return BadRequest("Datos de la venta invalidos");
			}

			var sucursalId = HttpContext.Session.GetString("SucursalId");
			if (string.IsNullOrEmpty(sucursalId))
			{
				return BadRequest("No se encontró la sucursal en la sesión");
			}

			var cliente = await _context.Clientes.FindAsync(ventaDto.ClienteId);
			if (cliente == null)
			{
				return BadRequest("El cliente seleccionado no existe");
			}

			Venta nuevaVenta = new Venta
			{
				Fecha = DateTime.Now,
				ClienteId = ventaDto.ClienteId,
				SucursalId = long.Parse(sucursalId),
				Total = ventaDto.Detalles.Sum(d => d.Cantidad * d.PrecioUnitario)
			};

			_context.Ventas.Add(nuevaVenta);
			await _context.SaveChangesAsync();

			foreach (DetalleVentaDTO detalleDto in ventaDto.Detalles)
			{
				var detalle = new DetalleVenta
				{
					VentaId = nuevaVenta.Id.Value,
					ProductoId = detalleDto.ProductoId,
					Cantidad = detalleDto.Cantidad,
					PrecioUnitario = detalleDto.PrecioUnitario
				};

				_context.DetallesVenta.Add(detalle);
			}

			await _context.SaveChangesAsync();

			return Ok(new { VentaId = nuevaVenta.Id });
		}
	}
}

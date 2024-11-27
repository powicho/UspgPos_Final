﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using CloudinaryDotNet;
using CloudinaryDotNet.Actions;
using ExcelDataReader;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Rendering;
using Microsoft.EntityFrameworkCore;
using UspgPOS.Data;
using UspgPOS.Models;

namespace UspgPOS.Controllers
{
    public class ProductosController : Controller
    {
        private readonly AppDbContext _context;
        private readonly Cloudinary _cloudinary;

        public ProductosController(AppDbContext context, Cloudinary cloudinary)
        {
            _context = context;
            _cloudinary = cloudinary;
        }

        // GET: Productos
        public async Task<IActionResult> Index()
        {
            var appDbContext = _context.Productos.Include(p => p.Clasificacion).Include(p => p.Marca);
            return View(await appDbContext.ToListAsync());
        }

        // GET: Productos/Details/5
        public async Task<IActionResult> Details(long? id)
        {
            if (id == null)
            {
                return NotFound();
            }

            var producto = await _context.Productos
                .Include(p => p.Clasificacion)
                .Include(p => p.Marca)
                .FirstOrDefaultAsync(m => m.Id == id);
            if (producto == null)
            {
                return NotFound();
            }

            return View(producto);
        }

        // GET: Productos/Create
        public IActionResult Create()
        {
            ViewData["ClasificacionId"] = new SelectList(_context.Clasificaciones, "Id", "Nombre", "ImgUrl");
            ViewData["MarcaId"] = new SelectList(_context.Marcas, "Id", "Nombre", "ImgUrl");
            return View();
        }

        // POST: Productos/Create
        // To protect from overposting attacks, enable the specific properties you want to bind to.
        // For more details, see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Create([Bind("Id,Nombre,MarcaId,ClasificacionId,Precio,Cantidad")] Producto producto, IFormFile imageFile)
        {
            if (ModelState.IsValid)
            {
                if (imageFile != null)
                {
                    var uploadParams = new ImageUploadParams()
                    {
                        File = new FileDescription(imageFile.FileName, imageFile.OpenReadStream()),
                        Transformation = new Transformation().Width(500).Height(500).Crop("fill")
                    };

                    var uploadResult = await _cloudinary.UploadAsync(uploadParams);
                    producto.ImgUrl = uploadResult.SecureUrl.ToString();

                    var thumbnailParams = new Transformation().Width(150).Height(150).Crop("thumb");
                    producto.UrlThumbnailMarca = _cloudinary.Api.UrlImgUp.Transform(thumbnailParams).BuildUrl(uploadResult.PublicId);
                }
                _context.Add(producto);
                await _context.SaveChangesAsync();
                return RedirectToAction(nameof(Index));
            }
            ViewData["ClasificacionId"] = new SelectList(_context.Set<Clasificacion>(), "Id", "Nombre", producto.ClasificacionId);
            ViewData["MarcaId"] = new SelectList(_context.Set<Marca>(), "Id", "Nombre", producto.MarcaId);
            return View(producto);
        }

        // GET: Productos/Edit/5
        public async Task<IActionResult> Edit(long? id)
        {
            if (id == null)
            {
                return NotFound();
            }

            var producto = await _context.Productos.FindAsync(id);
            if (producto == null)
            {
                return NotFound();
            }
            ViewData["ClasificacionId"] = new SelectList(_context.Clasificaciones, "Id", "Nombre", producto.ClasificacionId);
            ViewData["MarcaId"] = new SelectList(_context.Marcas, "Id", "Nombre", producto.MarcaId);
            return View(producto);
        }

        // POST: Productos/Edit/5
        // To protect from overposting attacks, enable the specific properties you want to bind to.
        // For more details, see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Edit(long? id, [Bind("Id,Nombre,MarcaId,ClasificacionId,Precio,Cantidad")] Producto producto, IFormFile imageFile)
        {
            if (id != producto.Id)
            {
                return NotFound();
            }

            if (ModelState.IsValid)
            {
                // Si se ha subido una nueva imagen
                if (imageFile != null && imageFile.Length > 0)
                {
                    var uploadParams = new ImageUploadParams()
                    {
                        File = new FileDescription(imageFile.FileName, imageFile.OpenReadStream()),
                        Transformation = new Transformation().Width(500).Height(500).Crop("fill")
                    };

                    var uploadResult = await _cloudinary.UploadAsync(uploadParams);
                    producto.ImgUrl = uploadResult.SecureUrl.ToString();

                    // Crear miniatura
                    var thumbnailParams = new Transformation().Width(150).Height(150).Crop("thumb");
                    producto.UrlThumbnailMarca = _cloudinary.Api.UrlImgUp.Transform(thumbnailParams).BuildUrl(uploadResult.PublicId);
                }

                // Actualiza el producto en la base de datos
                _context.Update(producto);
                await _context.SaveChangesAsync();

                return RedirectToAction(nameof(Index));
            }

            // Si hubo errores de validación, cargar las listas de marcas y clasificaciones para la vista
            ViewData["ClasificacionId"] = new SelectList(_context.Set<Clasificacion>(), "Id", "Nombre", producto.ClasificacionId);
            ViewData["MarcaId"] = new SelectList(_context.Set<Marca>(), "Id", "Nombre", producto.MarcaId);
            return View(producto);
        }

        // GET: Productos/Delete/5
        public async Task<IActionResult> Delete(long? id)
        {
            if (id == null)
            {
                return NotFound();
            }

            var producto = await _context.Productos
                .Include(p => p.Clasificacion)
                .Include(p => p.Marca)
                .FirstOrDefaultAsync(m => m.Id == id);
            if (producto == null)
            {
                return NotFound();
            }

            return View(producto);
        }

        // POST: Productos/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> DeleteConfirmed(long? id)
        {
            var producto = await _context.Productos.FindAsync(id);
            if (producto != null)
            {
                _context.Productos.Remove(producto);
            }

            await _context.SaveChangesAsync();
            return RedirectToAction(nameof(Index));
        }

        private bool ProductoExists(long? id)
        {
            return _context.Productos.Any(e => e.Id == id);
        }
        //logica para manejo de archivo xls
            [HttpPost]
            public async Task<IActionResult> CargarArchivo(IFormFile file)
            {
                if (file == null || file.Length == 0)
                {
                    return BadRequest("Por favor, seleccione un archivo de Excel");
                }

                if (!file.FileName.EndsWith(".xlsx"))
                {
                    return BadRequest("Por favor, seleccione un archivo de Excel");
                }

                using (var stream = file.OpenReadStream())
                {
                    using (var reader = ExcelReaderFactory.CreateReader(stream))
                    {
                        var dataTable = reader.AsDataSet().Tables[0];

                        for (int fila = 1; fila < dataTable.Rows.Count; fila++)
                        {
                            string codigo = dataTable.Rows[fila][0].ToString();
                            string nombre = dataTable.Rows[fila][1].ToString();
                            string nombreMarca = dataTable.Rows[fila][2].ToString();
                            string nombreClasificacion = dataTable.Rows[fila][3].ToString();
                            decimal precio = decimal.Parse(dataTable.Rows[fila][4].ToString());
                            int cantidad = int.Parse(dataTable.Rows[fila][5].ToString());
                            string urlImagenMarca = dataTable.Rows[fila][6].ToString(); // Imagen de Marca
                            string urlThumbnailMarca = dataTable.Rows[fila][7].ToString(); // Thumbnail de Marca
                            string urlImagenClasificacion = dataTable.Rows[fila][8].ToString(); // Imagen de Clasificación
                            string urlThumbnailClasificacion = dataTable.Rows[fila][9].ToString(); // Thumbnail de Clasificación

                        Producto? producto = await _context.Productos.FirstOrDefaultAsync(p => p.Codigo == codigo);

                        Marca? marca = await _context.Marcas.FirstOrDefaultAsync(m => m.Nombre == nombreMarca);

                        if(marca == null)
                        {
                            marca = new Marca { Nombre = nombreMarca, ImgUrlMarca = urlImagenMarca, UrlThumbnailMarca = urlThumbnailMarca };
                            _context.Marcas.Add(marca);
                            await _context.SaveChangesAsync(); // Guardar para asignar un Id válido
                        }
                        else
                        {

                            marca.UrlThumbnailMarca = urlThumbnailMarca;
                            marca.ImgUrlMarca = urlImagenMarca;
                            _context.Marcas.Update(marca);
                        }


                        Clasificacion? clasificacion = await _context.Clasificaciones.FirstOrDefaultAsync(c => c.Nombre == nombreClasificacion);

                        if (clasificacion == null)
                        {
                            clasificacion = new Clasificacion { Nombre = nombreClasificacion, UrlImagenClasificacion = urlImagenClasificacion, UrlThumbnailClasificacion = urlThumbnailClasificacion };
                            _context.Clasificaciones.Add(clasificacion);
                            await _context.SaveChangesAsync(); // Guardar para asignar un Id válido
                        }
                        else
                        {

                            clasificacion.UrlImagenClasificacion = urlThumbnailMarca;
                            clasificacion.UrlThumbnailClasificacion = urlImagenMarca;
                            _context.Clasificaciones.Update(clasificacion);
                        }


                        if (producto == null)
                            {
                                //Crear el producto
                                Producto nuevoProducto = new Producto
                                {
                                    Codigo = codigo,
                                    Nombre = nombre,
                                    Precio = precio,
                                    Cantidad = cantidad,
                                    MarcaId = marca != null ? marca.Id : -1,
                                    ClasificacionId = clasificacion != null ? clasificacion.Id : -1,
                                };

                                _context.Productos.Add(nuevoProducto);
                            }
                            else
                            {
                                //Editar el producto
                                producto.Nombre = nombre;
                                producto.MarcaId = marca != null ? marca.Id : -1;
                                producto.ClasificacionId = clasificacion != null ? clasificacion.Id : -1;
                                producto.Precio = precio;
                                producto.Cantidad = cantidad;

                                _context.Productos.Update(producto);
                            }
                        }


                    }
                }

                await _context.SaveChangesAsync();

                return RedirectToAction("Index");
            }

        }
    }

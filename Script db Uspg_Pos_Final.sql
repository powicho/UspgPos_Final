USE [uspg_pos]
GO
/****** Object:  Table [dbo].[AspNetRoleClaims]    Script Date: 11/30/2024 1:34:56 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetRoleClaims](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[RoleId] [nvarchar](450) NOT NULL,
	[ClaimType] [nvarchar](max) NULL,
	[ClaimValue] [nvarchar](max) NULL,
 CONSTRAINT [PK_AspNetRoleClaims] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetRoles]    Script Date: 11/30/2024 1:34:56 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetRoles](
	[Id] [nvarchar](450) NOT NULL,
	[Name] [nvarchar](256) NULL,
	[NormalizedName] [nvarchar](256) NULL,
	[ConcurrencyStamp] [nvarchar](max) NULL,
 CONSTRAINT [PK_AspNetRoles] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUserClaims]    Script Date: 11/30/2024 1:34:56 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserClaims](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [nvarchar](450) NOT NULL,
	[ClaimType] [nvarchar](max) NULL,
	[ClaimValue] [nvarchar](max) NULL,
 CONSTRAINT [PK_AspNetUserClaims] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUserLogins]    Script Date: 11/30/2024 1:34:56 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserLogins](
	[LoginProvider] [nvarchar](450) NOT NULL,
	[ProviderKey] [nvarchar](450) NOT NULL,
	[ProviderDisplayName] [nvarchar](max) NULL,
	[UserId] [nvarchar](450) NOT NULL,
 CONSTRAINT [PK_AspNetUserLogins] PRIMARY KEY CLUSTERED 
(
	[LoginProvider] ASC,
	[ProviderKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUserRoles]    Script Date: 11/30/2024 1:34:56 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserRoles](
	[UserId] [nvarchar](450) NOT NULL,
	[RoleId] [nvarchar](450) NOT NULL,
 CONSTRAINT [PK_AspNetUserRoles] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC,
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUsers]    Script Date: 11/30/2024 1:34:56 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUsers](
	[Id] [nvarchar](450) NOT NULL,
	[Nombre] [nvarchar](max) NOT NULL,
	[Rol] [nvarchar](max) NOT NULL,
	[UserName] [nvarchar](256) NULL,
	[NormalizedUserName] [nvarchar](256) NULL,
	[Email] [nvarchar](256) NULL,
	[NormalizedEmail] [nvarchar](256) NULL,
	[EmailConfirmed] [bit] NOT NULL,
	[PasswordHash] [nvarchar](max) NULL,
	[SecurityStamp] [nvarchar](max) NULL,
	[ConcurrencyStamp] [nvarchar](max) NULL,
	[PhoneNumber] [nvarchar](max) NULL,
	[PhoneNumberConfirmed] [bit] NOT NULL,
	[TwoFactorEnabled] [bit] NOT NULL,
	[LockoutEnd] [datetimeoffset](7) NULL,
	[LockoutEnabled] [bit] NOT NULL,
	[AccessFailedCount] [int] NOT NULL,
 CONSTRAINT [PK_AspNetUsers] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUserTokens]    Script Date: 11/30/2024 1:34:56 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserTokens](
	[UserId] [nvarchar](450) NOT NULL,
	[LoginProvider] [nvarchar](450) NOT NULL,
	[Name] [nvarchar](450) NOT NULL,
	[Value] [nvarchar](max) NULL,
 CONSTRAINT [PK_AspNetUserTokens] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC,
	[LoginProvider] ASC,
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[clasificaciones]    Script Date: 11/30/2024 1:34:56 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[clasificaciones](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[nombre] [nvarchar](255) NOT NULL,
	[urlImagenClasificacion ] [varchar](500) NULL,
	[urlThumbnailClasificacion] [varchar](500) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[clientes]    Script Date: 11/30/2024 1:34:56 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[clientes](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[nombre] [nvarchar](255) NOT NULL,
	[nit] [nvarchar](50) NOT NULL,
	[correo] [nvarchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[detalles_venta]    Script Date: 11/30/2024 1:34:56 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[detalles_venta](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[venta_id] [bigint] NULL,
	[producto_id] [bigint] NULL,
	[cantidad] [int] NOT NULL,
	[precio_unitario] [decimal](10, 2) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[marcas]    Script Date: 11/30/2024 1:34:56 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[marcas](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[nombre] [nvarchar](255) NOT NULL,
	[urlImagenMarca] [varchar](500) NULL,
	[urlThumbnailMarca] [varchar](500) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[productos]    Script Date: 11/30/2024 1:34:56 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[productos](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[nombre] [nvarchar](255) NOT NULL,
	[marca_id] [bigint] NULL,
	[clasificacion_id] [bigint] NULL,
	[precio] [decimal](10, 2) NOT NULL,
	[cantidad] [int] NOT NULL,
	[img_url] [varchar](500) NULL,
	[thumbnail_url] [varchar](500) NULL,
	[codigo] [varchar](100) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[sucursales]    Script Date: 11/30/2024 1:34:56 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[sucursales](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[nombre] [nvarchar](255) NOT NULL,
	[area] [nvarchar](255) NULL,
	[ciudad] [nvarchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Usuario]    Script Date: 11/30/2024 1:34:56 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Usuario](
	[Id] [nvarchar](450) NOT NULL,
	[Nombre] [nvarchar](max) NOT NULL,
	[Rol] [nvarchar](max) NOT NULL,
	[UserName] [nvarchar](max) NULL,
	[NormalizedUserName] [nvarchar](max) NULL,
	[Email] [nvarchar](max) NULL,
	[NormalizedEmail] [nvarchar](max) NULL,
	[EmailConfirmed] [bit] NOT NULL,
	[PasswordHash] [nvarchar](max) NULL,
	[SecurityStamp] [nvarchar](max) NULL,
	[ConcurrencyStamp] [nvarchar](max) NULL,
	[PhoneNumber] [nvarchar](max) NULL,
	[PhoneNumberConfirmed] [bit] NOT NULL,
	[TwoFactorEnabled] [bit] NOT NULL,
	[LockoutEnd] [datetimeoffset](7) NULL,
	[LockoutEnabled] [bit] NOT NULL,
	[AccessFailedCount] [int] NOT NULL,
 CONSTRAINT [PK_Usuario] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ventas]    Script Date: 11/30/2024 1:34:56 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ventas](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[fecha] [datetime] NOT NULL,
	[total] [decimal](10, 2) NOT NULL,
	[cliente_id] [bigint] NULL,
	[sucursal_id] [bigint] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[AspNetRoles] ([Id], [Name], [NormalizedName], [ConcurrencyStamp]) VALUES (N'91a7d9b8-dc89-40e4-b927-292b8a8e499a', N'Admin', N'ADMIN', NULL)
INSERT [dbo].[AspNetRoles] ([Id], [Name], [NormalizedName], [ConcurrencyStamp]) VALUES (N'b0709fde-aea1-4bd6-b67e-9792068c443c', N'User', N'USER', NULL)
GO
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'96534cbd-aa99-45fe-a036-87b0233765b3', N'91a7d9b8-dc89-40e4-b927-292b8a8e499a')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'bf00f7c8-3928-47d9-aebb-d956a694ff60', N'b0709fde-aea1-4bd6-b67e-9792068c443c')
GO
INSERT [dbo].[AspNetUsers] ([Id], [Nombre], [Rol], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount]) VALUES (N'96534cbd-aa99-45fe-a036-87b0233765b3', N'Juan Perez ', N'Admin', N'juan.perez', N'JUAN.PEREZ', N'Juanperez@gmail.com', N'JUANPEREZ@GMAIL.COM', 0, N'AQAAAAIAAYagAAAAEMJQJlpLOGSm2GvhIRo1VHDTHu4/4KAyiQBfGcGvffA7KpDMShUX90KxcSZh0tYN7g==', N'UIG2Y2P2OPZDSSWEZ22E7O6FF75WAS26', N'd779f02b-5213-4cef-a0b3-501b791f7dc1', NULL, 0, 0, NULL, 1, 0)
INSERT [dbo].[AspNetUsers] ([Id], [Nombre], [Rol], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount]) VALUES (N'bf00f7c8-3928-47d9-aebb-d956a694ff60', N'Powicho Avila', N'User', N'powicho.avila', N'POWICHO.AVILA', N'powi@gmail.com', N'POWI@GMAIL.COM', 0, N'AQAAAAIAAYagAAAAEBrkSLcOcB+rHgPZOt6U2xHl7a/2heTnVU8x6H5/eaz5Xy+XoXZnu9gzqNnNeAXZuw==', N'4GDGZW4ZPYGC5XDOWKKQ4C7TLWXGJJMR', N'7fed9209-12a5-49f5-a3cb-8de4143a7698', NULL, 0, 0, NULL, 1, 0)
GO
SET IDENTITY_INSERT [dbo].[clasificaciones] ON 

INSERT [dbo].[clasificaciones] ([id], [nombre], [urlImagenClasificacion ], [urlThumbnailClasificacion]) VALUES (42, N'Audífonos', N'https://res.cloudinary.com/dl2vcwict/image/upload/c_thumb,w_200,g_face/v1732319411/download_xrscqo.png', N'https://res.cloudinary.com/dl2vcwict/image/upload/v1732319411/download_xrscqo.png')
INSERT [dbo].[clasificaciones] ([id], [nombre], [urlImagenClasificacion ], [urlThumbnailClasificacion]) VALUES (43, N'Teclados', N'https://res.cloudinary.com/dl2vcwict/image/upload/c_thumb,w_200,g_face/v1732319411/images_e255cz.jpg', N'https://res.cloudinary.com/dl2vcwict/image/upload/v1732319411/images_e255cz.jpg')
INSERT [dbo].[clasificaciones] ([id], [nombre], [urlImagenClasificacion ], [urlThumbnailClasificacion]) VALUES (44, N'Auriculares', N'https://res.cloudinary.com/dl2vcwict/image/upload/c_thumb,w_200,g_face/v1732319411/JBL_logo.svg_rosvpc.png', N'https://res.cloudinary.com/dl2vcwict/image/upload/v1732319411/JBL_logo.svg_rosvpc.png')
INSERT [dbo].[clasificaciones] ([id], [nombre], [urlImagenClasificacion ], [urlThumbnailClasificacion]) VALUES (45, N'Accesorios PC', N'https://res.cloudinary.com/dl2vcwict/image/upload/c_thumb,w_200,g_face/v1732319411/0a8gvr_37mb_j833mo.png', N'https://res.cloudinary.com/dl2vcwict/image/upload/v1732319411/0a8gvr_37mb_j833mo.png')
INSERT [dbo].[clasificaciones] ([id], [nombre], [urlImagenClasificacion ], [urlThumbnailClasificacion]) VALUES (46, N'Monitores', N'https://res.cloudinary.com/dl2vcwict/image/upload/c_thumb,w_200,g_face/v1732319411/oJngzEVZ_400x400_ij9d0k.jpg', N'https://res.cloudinary.com/dl2vcwict/image/upload/v1732319411/oJngzEVZ_400x400_ij9d0k.jpg')
INSERT [dbo].[clasificaciones] ([id], [nombre], [urlImagenClasificacion ], [urlThumbnailClasificacion]) VALUES (47, N'Cámaras', N'https://res.cloudinary.com/dl2vcwict/image/upload/c_thumb,w_200,g_face/v1732319412/images_l9sb94.png', N'https://res.cloudinary.com/dl2vcwict/image/upload/v1732319412/images_l9sb94.png')
INSERT [dbo].[clasificaciones] ([id], [nombre], [urlImagenClasificacion ], [urlThumbnailClasificacion]) VALUES (48, N'Parlantes', N'https://res.cloudinary.com/dl2vcwict/image/upload/c_thumb,w_200,g_face/v1732319412/bose_g5vtwz.png', N'https://res.cloudinary.com/dl2vcwict/image/upload/v1732319412/bose_g5vtwz.png')
INSERT [dbo].[clasificaciones] ([id], [nombre], [urlImagenClasificacion ], [urlThumbnailClasificacion]) VALUES (49, N'Almacenamiento', N'https://res.cloudinary.com/dl2vcwict/image/upload/c_thumb,w_200,g_face/v1732319411/channels4_profile_wniq4h.jpg', N'https://res.cloudinary.com/dl2vcwict/image/upload/v1732319411/channels4_profile_wniq4h.jpg')
SET IDENTITY_INSERT [dbo].[clasificaciones] OFF
GO
SET IDENTITY_INSERT [dbo].[clientes] ON 

INSERT [dbo].[clientes] ([id], [nombre], [nit], [correo]) VALUES (1, N'Juan Pérez', N'123456-7', N'juan.perez@example.com')
INSERT [dbo].[clientes] ([id], [nombre], [nit], [correo]) VALUES (2, N'María López', N'234567-8', N'maria.lopez@example.com')
INSERT [dbo].[clientes] ([id], [nombre], [nit], [correo]) VALUES (3, N'Carlos García', N'345678-9', N'carlos.garcia@example.com')
INSERT [dbo].[clientes] ([id], [nombre], [nit], [correo]) VALUES (4, N'asdsa', N'asd', N'ddad@gmail.com')
SET IDENTITY_INSERT [dbo].[clientes] OFF
GO
SET IDENTITY_INSERT [dbo].[detalles_venta] ON 

INSERT [dbo].[detalles_venta] ([id], [venta_id], [producto_id], [cantidad], [precio_unitario]) VALUES (10010, 1, 10035, 2, CAST(200.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_venta] ([id], [venta_id], [producto_id], [cantidad], [precio_unitario]) VALUES (10011, 1, 10036, 1, CAST(500.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_venta] ([id], [venta_id], [producto_id], [cantidad], [precio_unitario]) VALUES (10012, 1, 10037, 5, CAST(120.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_venta] ([id], [venta_id], [producto_id], [cantidad], [precio_unitario]) VALUES (20002, 20001, 10037, 1, CAST(120.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_venta] ([id], [venta_id], [producto_id], [cantidad], [precio_unitario]) VALUES (20003, 20001, 10036, 1, CAST(500.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_venta] ([id], [venta_id], [producto_id], [cantidad], [precio_unitario]) VALUES (20004, 20001, 10035, 1, CAST(200.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_venta] ([id], [venta_id], [producto_id], [cantidad], [precio_unitario]) VALUES (20005, 20002, 10035, 1, CAST(200.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_venta] ([id], [venta_id], [producto_id], [cantidad], [precio_unitario]) VALUES (20006, 20002, 10036, 1, CAST(500.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_venta] ([id], [venta_id], [producto_id], [cantidad], [precio_unitario]) VALUES (20007, 20002, 10037, 1, CAST(120.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_venta] ([id], [venta_id], [producto_id], [cantidad], [precio_unitario]) VALUES (20008, 20003, 10035, 1, CAST(200.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_venta] ([id], [venta_id], [producto_id], [cantidad], [precio_unitario]) VALUES (20009, 20003, 10036, 1, CAST(500.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_venta] ([id], [venta_id], [producto_id], [cantidad], [precio_unitario]) VALUES (20010, 20003, 10037, 1, CAST(120.00 AS Decimal(10, 2)))
SET IDENTITY_INSERT [dbo].[detalles_venta] OFF
GO
SET IDENTITY_INSERT [dbo].[marcas] ON 

INSERT [dbo].[marcas] ([id], [nombre], [urlImagenMarca], [urlThumbnailMarca]) VALUES (41, N'Sony', N'https://res.cloudinary.com/dl2vcwict/image/upload/v1732319411/download_xrscqo.png', N'https://res.cloudinary.com/dl2vcwict/image/upload/c_thumb,w_200,g_face/v1732319411/download_xrscqo.png')
INSERT [dbo].[marcas] ([id], [nombre], [urlImagenMarca], [urlThumbnailMarca]) VALUES (42, N'Logitech', N'https://res.cloudinary.com/dl2vcwict/image/upload/v1732319411/images_e255cz.jpg', N'https://res.cloudinary.com/dl2vcwict/image/upload/c_thumb,w_200,g_face/v1732319411/images_e255cz.jpg')
INSERT [dbo].[marcas] ([id], [nombre], [urlImagenMarca], [urlThumbnailMarca]) VALUES (43, N'JBL', N'https://res.cloudinary.com/dl2vcwict/image/upload/v1732319411/JBL_logo.svg_rosvpc.png', N'https://res.cloudinary.com/dl2vcwict/image/upload/c_thumb,w_200,g_face/v1732319411/JBL_logo.svg_rosvpc.png')
INSERT [dbo].[marcas] ([id], [nombre], [urlImagenMarca], [urlThumbnailMarca]) VALUES (44, N'Razer', N'https://res.cloudinary.com/dl2vcwict/image/upload/v1732319411/0a8gvr_37mb_j833mo.png', N'https://res.cloudinary.com/dl2vcwict/image/upload/c_thumb,w_200,g_face/v1732319411/0a8gvr_37mb_j833mo.png')
INSERT [dbo].[marcas] ([id], [nombre], [urlImagenMarca], [urlThumbnailMarca]) VALUES (45, N'Samsung', N'https://res.cloudinary.com/dl2vcwict/image/upload/v1732319411/oJngzEVZ_400x400_ij9d0k.jpg', N'https://res.cloudinary.com/dl2vcwict/image/upload/c_thumb,w_200,g_face/v1732319411/oJngzEVZ_400x400_ij9d0k.jpg')
INSERT [dbo].[marcas] ([id], [nombre], [urlImagenMarca], [urlThumbnailMarca]) VALUES (46, N'Ezviz', N'https://res.cloudinary.com/dl2vcwict/image/upload/v1732319412/images_l9sb94.png', N'https://res.cloudinary.com/dl2vcwict/image/upload/c_thumb,w_200,g_face/v1732319412/images_l9sb94.png')
INSERT [dbo].[marcas] ([id], [nombre], [urlImagenMarca], [urlThumbnailMarca]) VALUES (47, N'Bose', N'https://res.cloudinary.com/dl2vcwict/image/upload/v1732319412/bose_g5vtwz.png', N'https://res.cloudinary.com/dl2vcwict/image/upload/c_thumb,w_200,g_face/v1732319412/bose_g5vtwz.png')
INSERT [dbo].[marcas] ([id], [nombre], [urlImagenMarca], [urlThumbnailMarca]) VALUES (48, N'Crucial', N'https://res.cloudinary.com/dl2vcwict/image/upload/v1732319411/channels4_profile_wniq4h.jpg', N'https://res.cloudinary.com/dl2vcwict/image/upload/c_thumb,w_200,g_face/v1732319411/channels4_profile_wniq4h.jpg')
SET IDENTITY_INSERT [dbo].[marcas] OFF
GO
SET IDENTITY_INSERT [dbo].[productos] ON 

INSERT [dbo].[productos] ([id], [nombre], [marca_id], [clasificacion_id], [precio], [cantidad], [img_url], [thumbnail_url], [codigo]) VALUES (10035, N'Teclado de membrana K400+', 42, 43, CAST(200.00 AS Decimal(10, 2)), 10, N'https://res.cloudinary.com/dl2vcwict/image/upload/v1732747356/ajf80biqvnlesno7dusz.png', N'http://res.cloudinary.com/dl2vcwict/image/upload/c_thumb,h_150,w_150/ajf80biqvnlesno7dusz', NULL)
INSERT [dbo].[productos] ([id], [nombre], [marca_id], [clasificacion_id], [precio], [cantidad], [img_url], [thumbnail_url], [codigo]) VALUES (10036, N'Bocina', 41, 42, CAST(500.00 AS Decimal(10, 2)), 500, N'https://res.cloudinary.com/dl2vcwict/image/upload/v1732747380/knrbadzmfzqgr4f0z5ye.png', N'http://res.cloudinary.com/dl2vcwict/image/upload/c_thumb,h_150,w_150/knrbadzmfzqgr4f0z5ye', NULL)
INSERT [dbo].[productos] ([id], [nombre], [marca_id], [clasificacion_id], [precio], [cantidad], [img_url], [thumbnail_url], [codigo]) VALUES (10037, N'Auriculares Xtreme Bass', 43, 44, CAST(120.00 AS Decimal(10, 2)), 50, N'https://res.cloudinary.com/dl2vcwict/image/upload/v1732747395/l6hvooret7c35zjeau8j.png', N'http://res.cloudinary.com/dl2vcwict/image/upload/c_thumb,h_150,w_150/l6hvooret7c35zjeau8j', NULL)
INSERT [dbo].[productos] ([id], [nombre], [marca_id], [clasificacion_id], [precio], [cantidad], [img_url], [thumbnail_url], [codigo]) VALUES (10043, N'Mouse Ergonómico Pro', 44, 45, CAST(80.00 AS Decimal(10, 2)), 30, N'https://res.cloudinary.com/dl2vcwict/image/upload/v1732747404/cwt0pwneugikf69n47r5.png', N'http://res.cloudinary.com/dl2vcwict/image/upload/c_thumb,h_150,w_150/cwt0pwneugikf69n47r5', NULL)
INSERT [dbo].[productos] ([id], [nombre], [marca_id], [clasificacion_id], [precio], [cantidad], [img_url], [thumbnail_url], [codigo]) VALUES (10044, N'Monitor Ultra HD Curve', 45, 46, CAST(300.00 AS Decimal(10, 2)), 20, N'https://res.cloudinary.com/dl2vcwict/image/upload/v1732747412/fvz0gahrj4bnroncjkxz.png', N'http://res.cloudinary.com/dl2vcwict/image/upload/c_thumb,h_150,w_150/fvz0gahrj4bnroncjkxz', NULL)
INSERT [dbo].[productos] ([id], [nombre], [marca_id], [clasificacion_id], [precio], [cantidad], [img_url], [thumbnail_url], [codigo]) VALUES (10045, N'Cámara de Seguridad Indoor', 46, 47, CAST(200.00 AS Decimal(10, 2)), 15, N'https://res.cloudinary.com/dl2vcwict/image/upload/v1732747477/eyfxx6ofctf1ei3h58fr.png', N'http://res.cloudinary.com/dl2vcwict/image/upload/c_thumb,h_150,w_150/eyfxx6ofctf1ei3h58fr', NULL)
INSERT [dbo].[productos] ([id], [nombre], [marca_id], [clasificacion_id], [precio], [cantidad], [img_url], [thumbnail_url], [codigo]) VALUES (10046, N'Parlante Portátil PartyBoost', 47, 48, CAST(250.00 AS Decimal(10, 2)), 25, N'https://res.cloudinary.com/dl2vcwict/image/upload/v1732747491/y0fbxvdegtb1x0hyerxq.png', N'http://res.cloudinary.com/dl2vcwict/image/upload/c_thumb,h_150,w_150/y0fbxvdegtb1x0hyerxq', NULL)
INSERT [dbo].[productos] ([id], [nombre], [marca_id], [clasificacion_id], [precio], [cantidad], [img_url], [thumbnail_url], [codigo]) VALUES (10047, N'Disco SSD 1TB', 48, 49, CAST(100.00 AS Decimal(10, 2)), 40, N'https://res.cloudinary.com/dl2vcwict/image/upload/v1732747326/hlfxkcwcnmygltk9evfx.png', N'http://res.cloudinary.com/dl2vcwict/image/upload/c_thumb,h_150,w_150/hlfxkcwcnmygltk9evfx', NULL)
SET IDENTITY_INSERT [dbo].[productos] OFF
GO
SET IDENTITY_INSERT [dbo].[sucursales] ON 

INSERT [dbo].[sucursales] ([id], [nombre], [area], [ciudad]) VALUES (1, N'Sucursal Centro', N'Centro', N'Ciudad de Guatemala')
INSERT [dbo].[sucursales] ([id], [nombre], [area], [ciudad]) VALUES (2, N'Sucursal Norte', N'Norte', N'Quetzaltenango')
INSERT [dbo].[sucursales] ([id], [nombre], [area], [ciudad]) VALUES (3, N'Sucursal Sur', N'Sur', N'Antigua Guatemala')
SET IDENTITY_INSERT [dbo].[sucursales] OFF
GO
SET IDENTITY_INSERT [dbo].[ventas] ON 

INSERT [dbo].[ventas] ([id], [fecha], [total], [cliente_id], [sucursal_id]) VALUES (1, CAST(N'2024-11-20T00:00:00.000' AS DateTime), CAST(1000.50 AS Decimal(10, 2)), 1, 1)
INSERT [dbo].[ventas] ([id], [fecha], [total], [cliente_id], [sucursal_id]) VALUES (10001, CAST(N'2024-11-26T20:44:00.000' AS DateTime), CAST(11501.00 AS Decimal(10, 2)), 1, 1)
INSERT [dbo].[ventas] ([id], [fecha], [total], [cliente_id], [sucursal_id]) VALUES (10002, CAST(N'2024-11-26T20:57:00.000' AS DateTime), CAST(11500.00 AS Decimal(10, 2)), 3, 1)
INSERT [dbo].[ventas] ([id], [fecha], [total], [cliente_id], [sucursal_id]) VALUES (20001, CAST(N'2024-11-27T17:48:43.077' AS DateTime), CAST(820.00 AS Decimal(10, 2)), 3, 2)
INSERT [dbo].[ventas] ([id], [fecha], [total], [cliente_id], [sucursal_id]) VALUES (20002, CAST(N'2024-11-27T19:27:11.440' AS DateTime), CAST(820.00 AS Decimal(10, 2)), 1, 2)
INSERT [dbo].[ventas] ([id], [fecha], [total], [cliente_id], [sucursal_id]) VALUES (20003, CAST(N'2024-11-27T23:16:10.673' AS DateTime), CAST(820.00 AS Decimal(10, 2)), 2, 1)
SET IDENTITY_INSERT [dbo].[ventas] OFF
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_AspNetRoleClaims_RoleId]    Script Date: 11/30/2024 1:34:56 AM ******/
CREATE NONCLUSTERED INDEX [IX_AspNetRoleClaims_RoleId] ON [dbo].[AspNetRoleClaims]
(
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [RoleNameIndex]    Script Date: 11/30/2024 1:34:56 AM ******/
CREATE UNIQUE NONCLUSTERED INDEX [RoleNameIndex] ON [dbo].[AspNetRoles]
(
	[NormalizedName] ASC
)
WHERE ([NormalizedName] IS NOT NULL)
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_AspNetUserClaims_UserId]    Script Date: 11/30/2024 1:34:56 AM ******/
CREATE NONCLUSTERED INDEX [IX_AspNetUserClaims_UserId] ON [dbo].[AspNetUserClaims]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_AspNetUserLogins_UserId]    Script Date: 11/30/2024 1:34:56 AM ******/
CREATE NONCLUSTERED INDEX [IX_AspNetUserLogins_UserId] ON [dbo].[AspNetUserLogins]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_AspNetUserRoles_RoleId]    Script Date: 11/30/2024 1:34:56 AM ******/
CREATE NONCLUSTERED INDEX [IX_AspNetUserRoles_RoleId] ON [dbo].[AspNetUserRoles]
(
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [EmailIndex]    Script Date: 11/30/2024 1:34:56 AM ******/
CREATE NONCLUSTERED INDEX [EmailIndex] ON [dbo].[AspNetUsers]
(
	[NormalizedEmail] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UserNameIndex]    Script Date: 11/30/2024 1:34:56 AM ******/
CREATE UNIQUE NONCLUSTERED INDEX [UserNameIndex] ON [dbo].[AspNetUsers]
(
	[NormalizedUserName] ASC
)
WHERE ([NormalizedUserName] IS NOT NULL)
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[ventas] ADD  DEFAULT (getdate()) FOR [fecha]
GO
ALTER TABLE [dbo].[AspNetRoleClaims]  WITH CHECK ADD  CONSTRAINT [FK_AspNetRoleClaims_AspNetRoles_RoleId] FOREIGN KEY([RoleId])
REFERENCES [dbo].[AspNetRoles] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetRoleClaims] CHECK CONSTRAINT [FK_AspNetRoleClaims_AspNetRoles_RoleId]
GO
ALTER TABLE [dbo].[AspNetUserClaims]  WITH CHECK ADD  CONSTRAINT [FK_AspNetUserClaims_AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserClaims] CHECK CONSTRAINT [FK_AspNetUserClaims_AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[AspNetUserLogins]  WITH CHECK ADD  CONSTRAINT [FK_AspNetUserLogins_AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserLogins] CHECK CONSTRAINT [FK_AspNetUserLogins_AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[AspNetUserRoles]  WITH CHECK ADD  CONSTRAINT [FK_AspNetUserRoles_AspNetRoles_RoleId] FOREIGN KEY([RoleId])
REFERENCES [dbo].[AspNetRoles] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserRoles] CHECK CONSTRAINT [FK_AspNetUserRoles_AspNetRoles_RoleId]
GO
ALTER TABLE [dbo].[AspNetUserRoles]  WITH CHECK ADD  CONSTRAINT [FK_AspNetUserRoles_AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserRoles] CHECK CONSTRAINT [FK_AspNetUserRoles_AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[AspNetUserTokens]  WITH CHECK ADD  CONSTRAINT [FK_AspNetUserTokens_AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserTokens] CHECK CONSTRAINT [FK_AspNetUserTokens_AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[detalles_venta]  WITH CHECK ADD FOREIGN KEY([producto_id])
REFERENCES [dbo].[productos] ([id])
GO
ALTER TABLE [dbo].[detalles_venta]  WITH CHECK ADD FOREIGN KEY([venta_id])
REFERENCES [dbo].[ventas] ([id])
GO
ALTER TABLE [dbo].[productos]  WITH CHECK ADD FOREIGN KEY([clasificacion_id])
REFERENCES [dbo].[clasificaciones] ([id])
GO
ALTER TABLE [dbo].[productos]  WITH CHECK ADD FOREIGN KEY([marca_id])
REFERENCES [dbo].[marcas] ([id])
GO
ALTER TABLE [dbo].[ventas]  WITH CHECK ADD FOREIGN KEY([cliente_id])
REFERENCES [dbo].[clientes] ([id])
GO
ALTER TABLE [dbo].[ventas]  WITH CHECK ADD FOREIGN KEY([sucursal_id])
REFERENCES [dbo].[sucursales] ([id])
GO

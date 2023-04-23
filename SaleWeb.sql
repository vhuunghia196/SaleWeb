USE [SaleWeb]
GO
/****** Object:  Table [dbo].[__MigrationHistory]    Script Date: 4/23/2023 3:23:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[__MigrationHistory](
	[MigrationId] [nvarchar](150) NOT NULL,
	[ContextKey] [nvarchar](300) NOT NULL,
	[Model] [varbinary](max) NOT NULL,
	[ProductVersion] [nvarchar](32) NOT NULL,
 CONSTRAINT [PK_dbo.__MigrationHistory] PRIMARY KEY CLUSTERED 
(
	[MigrationId] ASC,
	[ContextKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Categories]    Script Date: 4/23/2023 3:23:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Categories](
	[CategoryID] [int] IDENTITY(1,1) NOT NULL,
	[CategoryName] [nvarchar](max) NULL,
	[Description] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_dbo.Categories] PRIMARY KEY CLUSTERED 
(
	[CategoryID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Comment]    Script Date: 4/23/2023 3:23:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Comment](
	[IDComment] [int] IDENTITY(1,1) NOT NULL,
	[Content] [nvarchar](max) NOT NULL,
	[ProductId] [int] NOT NULL,
	[IDReplyComment] [int] NOT NULL,
	[UserID] [int] NULL,
 CONSTRAINT [PK_dbo.Comment] PRIMARY KEY CLUSTERED 
(
	[IDComment] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OrderDetail]    Script Date: 4/23/2023 3:23:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderDetail](
	[DayOfCreate] [int] IDENTITY(1,1) NOT NULL,
	[OrderID] [int] NOT NULL,
	[ProductID] [int] NOT NULL,
	[Price] [float] NOT NULL,
	[Quantity] [int] NULL,
	[Status] [int] NULL,
 CONSTRAINT [PK_dbo.OrderDetail] PRIMARY KEY CLUSTERED 
(
	[DayOfCreate] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Orders]    Script Date: 4/23/2023 3:23:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Orders](
	[OrderID] [int] IDENTITY(1,1) NOT NULL,
	[UserID] [int] NOT NULL,
	[OrderDate] [datetime] NOT NULL,
 CONSTRAINT [PK_dbo.Orders] PRIMARY KEY CLUSTERED 
(
	[OrderID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Products]    Script Date: 4/23/2023 3:23:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Products](
	[ProductID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](max) NOT NULL,
	[Image] [nvarchar](max) NOT NULL,
	[Price] [float] NOT NULL,
	[Quantity] [int] NOT NULL,
	[Detail] [nvarchar](max) NOT NULL,
	[SupplierID] [int] NOT NULL,
	[CategoryID] [int] NOT NULL,
 CONSTRAINT [PK_dbo.Products] PRIMARY KEY CLUSTERED 
(
	[ProductID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Role]    Script Date: 4/23/2023 3:23:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Role](
	[RoleID] [int] IDENTITY(1,1) NOT NULL,
	[RoleName] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_dbo.Role] PRIMARY KEY CLUSTERED 
(
	[RoleID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Supplier]    Script Date: 4/23/2023 3:23:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Supplier](
	[SupplierID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](max) NOT NULL,
	[PhoneNumber] [nvarchar](max) NOT NULL,
	[Address] [nvarchar](max) NULL,
	[CompanyName] [nvarchar](max) NULL,
 CONSTRAINT [PK_dbo.Supplier] PRIMARY KEY CLUSTERED 
(
	[SupplierID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 4/23/2023 3:23:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[UserID] [int] IDENTITY(1,1) NOT NULL,
	[Username] [nvarchar](max) NOT NULL,
	[Password] [nvarchar](max) NOT NULL,
	[Name] [nvarchar](max) NOT NULL,
	[PhoneNumber] [nvarchar](max) NOT NULL,
	[Address] [nvarchar](max) NOT NULL,
	[Email] [nvarchar](max) NOT NULL,
	[RoleID] [int] NOT NULL,
 CONSTRAINT [PK_dbo.Users] PRIMARY KEY CLUSTERED 
(
	[UserID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Categories] ON 

INSERT [dbo].[Categories] ([CategoryID], [CategoryName], [Description]) VALUES (2, N'Decor', N'With decorative products, you can effortlessly create a beautiful and impressive living space without spending too much money or time on decoration.')
INSERT [dbo].[Categories] ([CategoryID], [CategoryName], [Description]) VALUES (3, N'Chair', N'Chairs are made from many different materials and come in a variety of designs. They are a great decorative accessory to add style and aesthetic appeal to your living space.')
INSERT [dbo].[Categories] ([CategoryID], [CategoryName], [Description]) VALUES (4, N'Light', N'With the diversity in style and function, lights are an essential accessory in any living space or office.')
INSERT [dbo].[Categories] ([CategoryID], [CategoryName], [Description]) VALUES (5, N'Plant', N'Plants can be chosen to create a refreshing atmosphere or to enhance the interior style of your living space.')
SET IDENTITY_INSERT [dbo].[Categories] OFF
GO
SET IDENTITY_INSERT [dbo].[Comment] ON 

INSERT [dbo].[Comment] ([IDComment], [Content], [ProductId], [IDReplyComment], [UserID]) VALUES (3, N'This chair is very soft and very comfortable to sit on when I work !!!', 6, 3, 2)
INSERT [dbo].[Comment] ([IDComment], [Content], [ProductId], [IDReplyComment], [UserID]) VALUES (15, N'The Metallic table lamp has a beautiful design with shiny metal material, creating a luxurious and modern space for my room.', 10, 17, 5)
INSERT [dbo].[Comment] ([IDComment], [Content], [ProductId], [IDReplyComment], [UserID]) VALUES (16, N'Bedroom mirror with beautiful design and material will definitely create a luxurious and modern bedroom space for my bedroom.', 2, 18, 6)
INSERT [dbo].[Comment] ([IDComment], [Content], [ProductId], [IDReplyComment], [UserID]) VALUES (17, N'With its unique shape and verdant foliage, it adds a touch of nature to any space in my home.', 8, 16, 8)
INSERT [dbo].[Comment] ([IDComment], [Content], [ProductId], [IDReplyComment], [UserID]) VALUES (18, N'Wooden picture frames are a classic and timeless way to express my cherished memories.', 11, 15, 9)
SET IDENTITY_INSERT [dbo].[Comment] OFF
GO
SET IDENTITY_INSERT [dbo].[OrderDetail] ON 

INSERT [dbo].[OrderDetail] ([DayOfCreate], [OrderID], [ProductID], [Price], [Quantity], [Status]) VALUES (1, 3, 7, 600, 3, NULL)
INSERT [dbo].[OrderDetail] ([DayOfCreate], [OrderID], [ProductID], [Price], [Quantity], [Status]) VALUES (3, 5, 3, 700, 2, 1)
INSERT [dbo].[OrderDetail] ([DayOfCreate], [OrderID], [ProductID], [Price], [Quantity], [Status]) VALUES (4, 1, 10, 800, 1, 0)
INSERT [dbo].[OrderDetail] ([DayOfCreate], [OrderID], [ProductID], [Price], [Quantity], [Status]) VALUES (5, 1, 2, 400, 1, 1)
INSERT [dbo].[OrderDetail] ([DayOfCreate], [OrderID], [ProductID], [Price], [Quantity], [Status]) VALUES (6, 9, 13, 200, 5, 0)
INSERT [dbo].[OrderDetail] ([DayOfCreate], [OrderID], [ProductID], [Price], [Quantity], [Status]) VALUES (8, 4, 6, 500, 1, 1)
INSERT [dbo].[OrderDetail] ([DayOfCreate], [OrderID], [ProductID], [Price], [Quantity], [Status]) VALUES (9, 4, 7, 600, 1, 0)
INSERT [dbo].[OrderDetail] ([DayOfCreate], [OrderID], [ProductID], [Price], [Quantity], [Status]) VALUES (10, 9, 11, 300, 4, 1)
SET IDENTITY_INSERT [dbo].[OrderDetail] OFF
GO
SET IDENTITY_INSERT [dbo].[Orders] ON 

INSERT [dbo].[Orders] ([OrderID], [UserID], [OrderDate]) VALUES (1, 2, CAST(N'2023-05-04T00:00:00.000' AS DateTime))
INSERT [dbo].[Orders] ([OrderID], [UserID], [OrderDate]) VALUES (2, 9, CAST(N'2023-12-03T00:00:00.000' AS DateTime))
INSERT [dbo].[Orders] ([OrderID], [UserID], [OrderDate]) VALUES (3, 6, CAST(N'2022-10-12T00:00:00.000' AS DateTime))
INSERT [dbo].[Orders] ([OrderID], [UserID], [OrderDate]) VALUES (4, 10, CAST(N'2023-01-02T00:00:00.000' AS DateTime))
INSERT [dbo].[Orders] ([OrderID], [UserID], [OrderDate]) VALUES (5, 5, CAST(N'2023-04-30T00:00:00.000' AS DateTime))
INSERT [dbo].[Orders] ([OrderID], [UserID], [OrderDate]) VALUES (6, 8, CAST(N'2023-01-23T00:00:00.000' AS DateTime))
INSERT [dbo].[Orders] ([OrderID], [UserID], [OrderDate]) VALUES (9, 8, CAST(N'2023-04-23T00:00:00.000' AS DateTime))
SET IDENTITY_INSERT [dbo].[Orders] OFF
GO
SET IDENTITY_INSERT [dbo].[Products] ON 

INSERT [dbo].[Products] ([ProductID], [Name], [Image], [Price], [Quantity], [Detail], [SupplierID], [CategoryID]) VALUES (2, N'Bedroom mirror', N'https://lh3.googleusercontent.com/mabwqj9gz0mWsdetmXgNRNiJwnQM5QK94NS8SxOMTzjF_cQEBG0IXKZJW0gNyLG6bcEFurVaJPNPn9OlpPTcA6uQEqbd_Ee7QR1atOpcGUvgN3WjD7ozqLuG38qu9oE2EpW8rdi-yp91UthikNHSHoGmm7BPuj52XawrhpWuRBaknccrtJ9kIchz7D57NGk505pwt7ym2koheZvkcYhke2aP3IJa9wvr7P4l7Iv2igEVIDPG9S3AKYYL84l2p2oNA63qVHgArAt10tYgD5j5s0aSPDE1GYWNgqwVvhw2T3FKdCAz5FTNVTQAZ2RHVyESwvM5QRvTr1LAgeopmtmEekLoZTPZkiSA59tTEc9YZDc5X4XsyalxQ6LAG9aJcCAiW5mQA5Qv6WlrWA3FiBYs3klS7bGzh86HhTHNHjvLXxbPdQnjiilUz6gzgqYVfT2F32P6LVzUlxopOIpMVH4oFc8dvLR2PEPV3lr1gtH_tspolodT8zuccNSFywGXISm3xn9VpkYUiLkKwBKT3D2rw8_omXmXb8KCick_VpFqClZh7DNWwuBczVy1AiS-ZStP9WZS2hyrgz86DBECYClMEz6OPKpx7et79U9lqwPoOl3nZMbnRbX7nt1rf1ermM1vmX3KsveKAAZNx6-NDd3ilQmRVpdpo9r5TcpmBHIkatTK1h9CD4LbdFQ0Wdzuk17DzIpEU513Emy7kKOc5MlRrRh7L6I-qPu4KsYdHEc7EuUNFsbcYr9mbVLFL6sn0A2RlUpEQY2vecmos65tn0gpLeg9JIvwrFaHyV5SkyNr9ViMIU7MN3-VFytZdxturAFsCHYSp_LDVzFjuFbM6qN88_BLynZswIB_LbWv-oHLQdxgsaBEpgMUo8oQGWewehnXwcxfhCNJGa7MhtUzPz6eWgYV5YNNMwJLYkqH8yY=w730-h933-s-no?authuser=0', 400, 200, N'Bedroom mirrors can be designed in various sizes and shapes to fit the size and style of your bedroom. Additionally, if you choose a mirror with a frame, the frame can also be designed to match the style of your bedroom. With many functional and aesthetic benefits, a bedroom mirror is an essential accessory for creating the perfect and beautiful bedroom space.', 1, 2)
INSERT [dbo].[Products] ([ProductID], [Name], [Image], [Price], [Quantity], [Detail], [SupplierID], [CategoryID]) VALUES (3, N'Decorative pillow', N'https://lh3.googleusercontent.com/V1k-MmBMcC2t3Jmozi6X8BJK8k98zfxkU5Dxq8sxNq2ZymOgP6pDsgO19aKRIJLq9HTF9WMmXERdajspByZHZX5y-w7Y315OLmEyepS2-sI3xnsMx3t1Orq48KTEsdDb02wGVZ-gQVesFKW9smk8-eBxJtA_1-QEI_yeoojCpU_Bqg-CELGRY9MOVOZH_qP1nmAsIKXzEiVk11oxTp6eqdFnGCkOrhtwz7zghsOqCpbtbVG26JmGkPJU7ognCZBLkHsdtY3dtWxuQawya4LxBvHSKaYA9U0IxSNTu-CdPxObFpvULU83V5jwFLfWIT4T8OENXb3ZWoUCVJPvkYRJ6myj05jrEAG_9jec9J46h5_SC6jBdtHb9FG6brVqavE3bQlfsxl0wyTwrXtFkBc8hxFC7-vKbMorRGNpbKIka6iv25rK3n3usyQM3izEb00JiVhS470uLdbeDhOX-IgO__cvGhZt1D8Vayp9NMF6tW7tJpxbfw4b7nBKouMEI-354Dn4B25I7WLUnNy-Ia2HHKMhHiwVeJYuJMTQExwqDBZiC0VUoYf5suNnTx0oFa_pCDC_Ttej2vLEasOzVoK97WfPs0VHbOf7U_ezrWlIA_0pWBME02vZyAPoWC2wYuNOEc9Sx-KcKkxL4gwrexvTELEqwKyTVjmhoZa0uHCLwixMrJxXISEoFrAGJ-RPtiLujvgzI_JyvtYqbRCVCaFxtMLV7zOUR_WAtMNZgy8_ZI76mqXNXhrTYGc1TI_Ehx_n9XB5wNImmWdKv3cZTTk72-FgP2zLjy0qAKG36zmXfcPskHfvN9I0B2z4qKMurtKQ_m6qMakG7xYKb-nQ_VMxiM9Egaa0ELnWBHRFGJ66RavYM60yfD7bBZXToQcLmB6jMFUboUT5UhiTns_Rius0SnUBw9nfmXzL3kPpIkg=w730-h933-s-no?authuser=0', 700, 300, N'Decorative pillows are an indispensable decorative item in any interior space, offering diversity in design, material, and pattern, while also providing comfort, warmth, and a focal point for your space.', 3, 2)
INSERT [dbo].[Products] ([ProductID], [Name], [Image], [Price], [Quantity], [Detail], [SupplierID], [CategoryID]) VALUES (6, N'Milimalastic chair', N'https://lh3.googleusercontent.com/R_Qkjukpo4nPJND3_RqImalDvIZznkLll4Wp7Z9u8B92ppXqnaaRUuqhzaZx-hfFT7TKqpTqyHSFcFIMVcy8mAt5Ma5kn0fBAr0pOaMhusvhov2y80nZv9DiByMnByQYhC2uhnRbpwCUi3KY78c3q9m7SzlV6MGq480CVgspNIsdLjqDwwPSebqeex3DXDdipHD3hQISdsya08K0uA5j-Htynp8TZppMm-l4_puVFEefT1aF1Wl729yOq0Oty__wLPdRhqj90eoLxCUOp61KlGnfg8ol2eoTGCtM9HrggmK5Uqv_u2Nj13OExDoIa2KisvDjDcxfQ6HbnJtjsE81fuOkEIVfjTe4ozzcI-0d9JF-w8fSxAgUoXwEsPREc93keoxCNs-11jIvNtjef4LIgLnb_4mj_Yaek0exJNUuBu-pMyW-3dwf3KoELU9XIYSp9F4YUHQH5HkkrnD9f8fvVeqejTxNfo_DjYGLOYhkNy1RFPBHcyT8FKDfuZXteVpVbVP5DXrRPP2oKWRe7K01BNLGOOCUbz3muIbATQVhJJgmFTBDFh0NY3aDI9pNPB6khfSKovT65qYgxiGDNx5Ano6HbN4OVAP94jUOjFmUnImed-2HC-dRCMCu_ciD78ytd8upoD4hA4ohqZVbmkuVid5ruk_Xemv7lUxpik5MhberPirtBNivrGPOCm_ac5r7HFW64322a3dGOPtAM6EHD7-AHLRZxa5gTqWh04j7SZjJFaU-Tdt0-z7mGiV6G-3wEm4g8YlzNG4S7Uu1-VsMwhi2BPsI8RlozWyyyj6ay9A2AEX8YWkR8wNneRZZs6y_sLae9tDnjZUZXBUIW13jCSwvbRa611Sm9Qh-tmxehPH2oFMYz-X8hcj3hbQVC899OLxt-UWNxxpHZ-n6jvDQI06aXxzilMd61PdhjdI=w730-h933-s-no?authuser=0', 500, 300, N'Milimalastic chair is a popular choice for modern interior design due to its sleek, minimalist design and excellent comfort and support. Made of durable and flexible polypropylene, these chairs are available in various colors and styles, making them versatile and suitable for a wide range of spaces.', 2, 3)
INSERT [dbo].[Products] ([ProductID], [Name], [Image], [Price], [Quantity], [Detail], [SupplierID], [CategoryID]) VALUES (7, N'Cactus succulent', N'https://lh3.googleusercontent.com/NVSnzbT1GiXmjKbe6HRAPFhDuxx3_xIxY6Y6FAvL6oYS08z7JSeVlDvcijtqfqWv-Wirri0Uq37mFOQZexAz0L0zRo7zp8OYOetq-MKG8y2KbWRzyloP8S2x9u3FJx4EtMoTYcDewneATcIzDipTELJKecaU2lKQ6mgXpQ2Yyga3bZ2H8MCXjTc5fNIEj3F_Axs6YLY4tq9X7-2WdgXlvJDvLQWsu-z5ARHbOHDBXTDNRyF3eeXyDrb6ljBMxYub5w4XnpyFkpzoqbeRdZ4tqo5b36PYlUVi1Vos_tq-2C3CuiJ75t_QFEkb-tUB9KgjZoKqoMe6I0K2spqiPPhzUK-fKHrZgJ3Z0Oh7ZZoFOIvLW071lvQ3dPFQDmrlDQdxD3OHwiYDTk_lTvPKzeoaheQjQgRbTQ2z759grjtnPm2R_6RELRGkSw8Q8rF14vU6VVr6g2saaprLtE4zfrWbchp2CkggbLAqy-hFdRylmQPSpnovtTcjEfxMdRxdRZoCnPmj84-AJ_4k0_E29wpgKKJFrHCcXCIrnqs-bRVmiyFjfnBYFeWcYq9IagUyoTKVJOdBQv2bqNlv4yINGtbLKZhv86FSkWQI2zqCRWCdiWHZivi_7thiMbfAiTxOrzzNAjpb0i38uOl0Btu5g_pRcDMJPmk3vV4QrNl6vZUtS4VomoavHpsKVo1LdoxH0xtD4QD19ET7FfiechwWQt6SKj-FpWlG_dR4F4GfTGsyWiahvx-ICtDYCeayfeCxeGT9F0OAK_ucAY44RnDaTj1KMnYNZmAheqpctS1ZPPVOCzbCD1-nT0_kkFUSDCd7qGiBrt_A0slwUDKVy5-hcO7b9id77xiKD59qDDq_tm6DrS1wprdwM0QTsgi04QyYeF3BM7-zbmxT_mpfGESeo6iGTzjMpqvN62EVzWK9X3g=w730-h933-s-no?authuser=0', 600, 100, N'Cactus succulents are a trendy and popular plant choice for modern interior design. They are available in a variety of shapes and sizes, require little maintenance, and offer a range of benefits, from air purification to customization. Whether used as a standalone plant or part of a larger arrangement, cactus succulents add a unique and interesting element to any interior space.', 2, 5)
INSERT [dbo].[Products] ([ProductID], [Name], [Image], [Price], [Quantity], [Detail], [SupplierID], [CategoryID]) VALUES (8, N'Table scullent plant
', N'https://lh3.googleusercontent.com/p4NmTkBqYb2mvaZrSrE3JhbHlF5AXN45xJOxGNqDIb-Tbl9DlfScXzfzb7UwjQhyx29sv2_g0yzA-JU7ogRf1tFhacmr-tLubMDHSXS6JsHIju0KfQ9pEbqj9HcRsIsjAdKitvgBunAqSVMC-ov9ceUzZSKxpuCEI0tMfBOM6pC9_8yqrd6YoqSLzPNDQ5v_BUq0algiXJStGcupQZlsXNHpyZ0oJNhgFNBhzIFxcVOgPahJM-XOpQDLHg5Kwpn4wWiRPIWv26_rmGKyMfrWKFM3m5nhj8E64MRZbq2fYpnD7ND47AVYLiVjj-Ojc45NS7J8qEyMmzA4piOEsinzUnL34YbvXrvICmpAyud82kS0HJV0hDrwX31v-TJbOuEaTfOAFbg8_fRfNfmjKJidBfQInbSmP25-6kZZHyToUTkKXO1FVviBUSDx4VNWsPviNWlCtIf8GpXemMx3RikSxUOeAW7n1yT1KCvWakucvMeowa6-lQF-KlNHBJRC2oPLwP-zbD7s-meA1LHUTY6PScPj9ULzHNkhneMrEtTZmpXh8xdx4LL-FS25GIq5ralhtemkumAZAYh_h1-cAeML1ohzrudritdE7MKCDeZHnsL8lNuAPldzRrQRcTvspf6ENutQd94wAlk5TcgzdKosXBbPzikoO9src2NUgM49lal6MKgLqLXlJLOp-QC14MHu6nJQqS9uN0bRDxpM4SwM4AHuRuYFt_krEJrlz32Ux3B-P0JFv1_b01GtniugSu24H7BCGQ1HPDr7Pw7edtzNxyKP1GECbrp3qChk2TOpVlHLI3_XOjM9OUSZwYt5I6xNxmDwfpyUzH6_IXMXIcOs4EVdX1feicCT3oOH2yUFYAc45PKGFRqZQrutP0rul6U3tIHltH4p2M10rDKg3WABgwaWyv4FT9f1-d26y_8=w730-h933-s-no?authuser=0', 100, 200, N'Table succulent plants are a popular and versatile plant choice for interior design. They come in a variety of shapes, colors, and textures, and are ideal for adding natural beauty to any space. With minimal maintenance and care requirements, they are an easy way to bring the outdoors inside and create a more relaxing and comfortable environment.', 1, 5)
INSERT [dbo].[Products] ([ProductID], [Name], [Image], [Price], [Quantity], [Detail], [SupplierID], [CategoryID]) VALUES (10, N'Metallic table lamp', N'https://lh3.googleusercontent.com/YDCKhmVTUCKMQFFTL9XGPWEaMm_6_YFX-KUO4HrqsPGUNTGFIT2k-N06wq20oAvVmj7Xiur-9GFqNdeSYoIZ8GtCLAhzG3Wz531bUWtdE5ChzF2zt6jKElc_QA5DO5JojmzFr-h35pdrWsiTjwUIAXankA7WSD_mJaA8FeE4QEvv_czDOhRIq3mTigxSW5RLtPH-eMHBaQroo3JniH8j4d_OLvLnvDmsfc3At9KtuAE0-7nj-7ro1Dx9-Uz0-dThlxsDr4HUrLCJI2zUGdmv7-yZf2P6icQUOr-GvsXUSvLnE1QQ_STrZy7vATrLBY-Lp9Ar1JuojnEN6lniISvqsNSiiuzLZZ6Ql_4CyKJ_t39KTHp-zDMGf_674dFxdoWz9Vi6QDwSa6G3D6cJkakEzu3lGSXdgm4aGqqECW7gZLwbVOQl6l89t9TFocH8dLxE2RpyWkCJa9NvVM8OHb-sl-ZblEd05LzD3QeNIGYdGKWF4FZPHidsqK4wD7Hc5UBy3JeJ2NdRerv4EuZcrHldfAkYHDeg2A92Zpm4Nf7pwO0dkb6fhvKOLeMpOhh2hPcRAbFLr8f8VXHMnrLTSmk0OYpfGxpWnzpc7kqTRiVaDs9QJe9r5zGOfECr0MmZBfkehu8zC8jBtw42eL19zh-tOCdak29wdZPeavSTYNgT-Q4_vWYOGxbVIYki1twVUMN71xJY_XMBZeiHVg5SJVyOKIjawkadz-ipPKNHGJY95NtII6Ff2ow7sCXxDmlEudgt3QdNUlnzasnMuuW3olGJ4ndi0SKr3OSL9bTIUGtShrRAHSmM-o1RuFit1uUZceC7b4CHK1one0Ysq4lzX_CAVXMHe3icRxXHNgWFBt6QjAYPYKCLIQj4edb68XKpdkAj1Tmu5t5Vbuhy6G2s5SFcaAZInatOHPS9oU7tfbE=w730-h933-s-no?authuser=0', 800, 200, N'Metallic table lamps are a stylish and versatile lighting option that can add a touch of elegance and sophistication to any space. They come in a range of shapes and sizes, and their metallic finish makes them a popular choice for a variety of interior design styles. With their adjustable arms and dimmer switches, they are a practical and functional choice for any room, and their durability ensures that they will provide reliable lighting for years to come.', 3, 4)
INSERT [dbo].[Products] ([ProductID], [Name], [Image], [Price], [Quantity], [Detail], [SupplierID], [CategoryID]) VALUES (11, N'Wooden picture frame', N'https://lh3.googleusercontent.com/cuLe58gUOsvJqqVOqVXq8RFz3W_AVYurx22oqBJ_aDKIp97hmAAYJNSu-DTSxAQG1GHlY_7xTZ1UCp3XsuuvQ5t--Qal2MgbE-aySnoPW58xFuYlDj1nTlaaVLf4J2RaUQ9An0GMq-Lz5BiMp_Ua3QIO3CPZVrTeFC7k1gHNHVJQwqMhVtIcocnH-ihB9ayzxBbzR2doimONZ4d5_AfzJZS4zbSPXEKqGwzewj4WsoRgbCvqXBxcNzMU9iEOXogCw4h5YT5mJmOhOVFLfNfak03EeaLiApLf4qvF7pqSD8qw9G_rEbe3wgasRyqcr9M0cqmF2Bg3GYKadjGNVLhkhyunaqYPHIYtBMXjcNO27pVKmTYLol87Fr8927-ZVLDlZFVBtfuu0h-fU2N6Cv3Ubu3v_gb6_mFG-yB19la2R9h03Pb5tZ3U4fFmR2UTEOIFyOr-ibG5JXpQmA697Qh5rpatMGeVau5d5zx8RG-eS7AON0emj_iR7zgCJlwkzJk58e8AmPvc_ZXx3tN9KM4Y4bl3yIa69iCsKf92Fnck7L9d3BY0473bDARNsSe7_tXG7PMvz74_qTd2gqPL-hMZuUnf-VBjiD_5uIpS_eUUFcYH22HGW9aGaMU0gZ608bpyDvgblvBHmoyz2sSKOuYMQWyTjyz4l6SdCwFfIXzWLJpZ8a1Qm5uwcOzXV2iw41vrY3ABTIUp17iYnhaUi3zzPH5-iP6K2qspeVj6TckX2ugNENO6-cYicTHBG0qqrGcNC_Rt_vaMCxBdg5pimnBoQCEAh2HQxC3x8EiNa1sqcEgEULSv-4-3zkTIZ4WX15j4ezwfkaiK7a-tA3JDzpuGQJJw1ONL8xtSEzf9L5F58tiLflfeTcd4secEGewnPCHj2NxxRLuL_-Ln6Ghv55OZ_F8ij2C4iTrScFw_cDU=w600-h767-s-no?authuser=0', 300, 150, N'A wooden picture frame is a classic and timeless way to display your cherished memories or artwork. They are durable, beautiful, and eco-friendly, and they come in a range of styles and sizes to fit any decor. Whether you prefer a simple and traditional design or something more elaborate and ornate, a wooden picture frame can add a touch of elegance and warmth to any room in the home.', 3, 2)
INSERT [dbo].[Products] ([ProductID], [Name], [Image], [Price], [Quantity], [Detail], [SupplierID], [CategoryID]) VALUES (12, N'Concrete flower pot', N'https://lh3.googleusercontent.com/Rmm3eoWz4b6JDeECWWvxgqeFEjPjFjcxXlVp4HSUyAYawjqBkTMHuOxfOJRpkdUbU1BXymd-CvuuixhPsNnouPYDiBTvRKEbnUIrFbh7QQF1hdC-I-eJJxrAatsiW7Qo3ELMkwspAbe4ND3ZO-gxSj4b--SeMp6tYiOVcJJ6s0Eg3ALMpKZIf6cfBWXhX-2DZZDgVirGNRLHknwBNCJpFGkngnEDqZYBRutAdrjqlnW_siMzyrAA2VXonrd5n4kvnhN_hRagxs-Dg27k65CdNrXrsXBpZazYbWQ1Yu1N1yuQqJbe1U_njkAT1Rq5RO675Db_eUjjpITTycJKwUPinlHOqbQlsUjd2hsw4izD4kfeLyuamWKihBaHUO9vHXpcSvGhDxgRzlSrCajHAslKKPAnsXpQ3PKPaYutPd7Fzu7lRBH01KN3EgqR0EZ8uR-I2p6STu_RBKA98R0aAwa7TmrCpc7KjM2tiuCM5CMhq8oMwPrM42OdGTl9q6tTy72diO1PIUDHNyz9vYKv4XEIF7iiN9mD_00w5sVeEqbDPflFtjEfsXx6RxJw_XCctC3JX1d8iSQd2inGpbNddtdiFNaQi_-Qs1sMey6I4BtjBGkO_nN2XgYnyj6NtMC1Z9eSGKiUFJJMJZM3LWJuv2dyBv2eLNeEppxGEjgYzILUSwdrH5aHvzhp3OTxzkvUqRN0hDTg0ZPxylL0HPyGJuGeavxa9biYmr1AdBULBroRfR7qYb7TBF5MWDwm7ze9PYhiRmXfcSkZZXjhbTH2pkjMcQ1RB-mX3XymbYjplaJVjpGxlwpdkrIweJu60z9azH6l4akGqKA3Rn5BRWHJ4xVVNBvws_glLFmqSdUf0TZlcAE2F8G4HLAVbOrxyNxcgDEdPzy9vkU9ajlZkLAU0o-ibXhh8SWCWScZtfDy1aw=w730-h933-s-no?authuser=0', 900, 250, N'A concrete flower pot is a versatile and practical option for plant display. They are available in a range of styles and sizes, complement a variety of plant colors and textures, and ', 2, 5)
INSERT [dbo].[Products] ([ProductID], [Name], [Image], [Price], [Quantity], [Detail], [SupplierID], [CategoryID]) VALUES (13, N'Metallic sidetable lamp', N'https://lh3.googleusercontent.com/lTR174voMlY4BrPJKkr0a6pMiWilSxw1a9juliT23dc3jQa309IraMOYJnw53kmR2mDEJgqHTux5oQ3UPfOzrUGc6ZiZXzVU4Eewgosy2_SxVlD7Pw4ftXwfrLL0Xfcu-2kFHvw36ZR7AfoQx5x9xCJnc7TrmZGeneG0WsbWhg1GofNDRPOpJhCxSrKVIB7ZrvsRniV8ddLRFjrTfU-twNR9jj6sQmFgRJKinHn4xu61HtZ8wy5kfxnpQXWPLGNsWxa1MRBAw7TazMhuh5T4pXfaO6ZauJcniOh0uamzN6YhmTmIxIyPAKUD8P0ylSF__emXvT5aEzj5hiyR_Pry3OzOTeVtIubEjXX3eFQL_8qyzekXeP1flr6TXHaNClgwLPAkfyv8kERWN_qNDon1Jh4-2jUFGj_uphRQvT2n0P0doKPhmEc6WhoIf-3aqrnMNk0aKdonXNsCddXcI-w2o6oOkaOEyvLJQVHZQZbY09la4kr_AAFJLpVsp9mgyiWdwP25wf6sO6SOOXVJZx0d7oKHi1n11fbX2qQUgrsmNean4IvGLbqbGkQCe2YX9tsfasyCNEIyYzqGl4cd8Sfb5CZ5lndwZ1CDTdeVQIR56CUY_9Y3s1B29pbVb-IJzHI-JDnZJ029tyZ04vjSjR-C8BavHRwU44htPjPyeJKdahZhVbCPV95Q1ZWehpgWFMsgJRH5msI_HZX6_9LTTtvSPqnrLzBNqZP0oVtCsJB5FYGaXfpj--Hhw3Pf7uyyFpQQmdbzH0NpHv3scUL_gI-5VhJloultAObfu27EWf74eFGjJ0LjJ_-eV6Bv_0usHLeVz5wkvWYcN5P3dKXczL__m47f4MksseWAlR3GlDaubte5ifF4L48rm_5AsP6Ncd9WTkZVBXbz4n9OAP-KbnStk-W0QLPFynxmHiQJd4I=w730-h933-s-no?authuser=0', 200, 300, N'A metallic side table lamp is a functional and stylish lighting fixture that can elevate the look of any room. Whether you''re looking to create a cozy reading nook or add some ambiance to your living room, a metallic side table lamp is a great choice for any home.', 1, 4)
SET IDENTITY_INSERT [dbo].[Products] OFF
GO
SET IDENTITY_INSERT [dbo].[Role] ON 

INSERT [dbo].[Role] ([RoleID], [RoleName]) VALUES (1, N'Admin')
INSERT [dbo].[Role] ([RoleID], [RoleName]) VALUES (2, N'Cus')
SET IDENTITY_INSERT [dbo].[Role] OFF
GO
SET IDENTITY_INSERT [dbo].[Supplier] ON 

INSERT [dbo].[Supplier] ([SupplierID], [Name], [PhoneNumber], [Address], [CompanyName]) VALUES (1, N'Võ Hữu Nghĩa', N'0777777777', N'Gia Lai', N'Ni''Vi')
INSERT [dbo].[Supplier] ([SupplierID], [Name], [PhoneNumber], [Address], [CompanyName]) VALUES (2, N'Nguyễn Văn Hậu', N'0888888888', N'Bình Phước', N'Ni''Vi')
INSERT [dbo].[Supplier] ([SupplierID], [Name], [PhoneNumber], [Address], [CompanyName]) VALUES (3, N'Trần Nguyễn Hồng Ân', N'0999999999', N'TPHCM', N'Ni''Vi')
SET IDENTITY_INSERT [dbo].[Supplier] OFF
GO
SET IDENTITY_INSERT [dbo].[Users] ON 

INSERT [dbo].[Users] ([UserID], [Username], [Password], [Name], [PhoneNumber], [Address], [Email], [RoleID]) VALUES (2, N'hongAn', N'123', N'Hồng Ân', N'0111111111', N'TPHCM', N'HONGAN123@gmail.com', 2)
INSERT [dbo].[Users] ([UserID], [Username], [Password], [Name], [PhoneNumber], [Address], [Email], [RoleID]) VALUES (5, N'TranAn', N'pass12345', N'Trần Ân', N'0222222222', N'Hà Nội', N'AnTran369@gmail.com', 2)
INSERT [dbo].[Users] ([UserID], [Username], [Password], [Name], [PhoneNumber], [Address], [Email], [RoleID]) VALUES (6, N'Hau', N'hau123456', N'Nguyễn Hậu', N'0333333333', N'Gia Lai', N'hauNguyen@gmail.com', 2)
INSERT [dbo].[Users] ([UserID], [Username], [Password], [Name], [PhoneNumber], [Address], [Email], [RoleID]) VALUES (8, N'VanHau', N'VanHau@123', N'Văn Hậu', N'0444444444', N'Nha Trang', N'vanHau123@gmail.com', 2)
INSERT [dbo].[Users] ([UserID], [Username], [Password], [Name], [PhoneNumber], [Address], [Email], [RoleID]) VALUES (9, N'nghia', N'123', N'Hữu Nghĩa', N'0555555555', N'Bình Thuận', N'voNghia2023@gmail.com', 2)
INSERT [dbo].[Users] ([UserID], [Username], [Password], [Name], [PhoneNumber], [Address], [Email], [RoleID]) VALUES (10, N'HuuNghia', N'HuuNghia123', N'Hữu Nghĩa', N'0666666666', N'Hải Phòng', N'huuNghia2002@gmail.com', 2)
SET IDENTITY_INSERT [dbo].[Users] OFF
GO
ALTER TABLE [dbo].[Comment]  WITH CHECK ADD  CONSTRAINT [FK_Comment_Products] FOREIGN KEY([ProductId])
REFERENCES [dbo].[Products] ([ProductID])
GO
ALTER TABLE [dbo].[Comment] CHECK CONSTRAINT [FK_Comment_Products]
GO
ALTER TABLE [dbo].[Comment]  WITH CHECK ADD  CONSTRAINT [FK_Comment_Users] FOREIGN KEY([UserID])
REFERENCES [dbo].[Users] ([UserID])
GO
ALTER TABLE [dbo].[Comment] CHECK CONSTRAINT [FK_Comment_Users]
GO
ALTER TABLE [dbo].[Comment]  WITH CHECK ADD  CONSTRAINT [FK_dbo.Comment_dbo.Comment_IDReplyComment] FOREIGN KEY([IDReplyComment])
REFERENCES [dbo].[Comment] ([IDComment])
GO
ALTER TABLE [dbo].[Comment] CHECK CONSTRAINT [FK_dbo.Comment_dbo.Comment_IDReplyComment]
GO
ALTER TABLE [dbo].[OrderDetail]  WITH CHECK ADD  CONSTRAINT [FK_dbo.OrderDetail_dbo.Orders_OrderID] FOREIGN KEY([OrderID])
REFERENCES [dbo].[Orders] ([OrderID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[OrderDetail] CHECK CONSTRAINT [FK_dbo.OrderDetail_dbo.Orders_OrderID]
GO
ALTER TABLE [dbo].[OrderDetail]  WITH CHECK ADD  CONSTRAINT [FK_dbo.OrderDetail_dbo.Products_ProductID] FOREIGN KEY([ProductID])
REFERENCES [dbo].[Products] ([ProductID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[OrderDetail] CHECK CONSTRAINT [FK_dbo.OrderDetail_dbo.Products_ProductID]
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD  CONSTRAINT [FK_dbo.Orders_dbo.Users_UserID] FOREIGN KEY([UserID])
REFERENCES [dbo].[Users] ([UserID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Orders] CHECK CONSTRAINT [FK_dbo.Orders_dbo.Users_UserID]
GO
ALTER TABLE [dbo].[Products]  WITH CHECK ADD  CONSTRAINT [FK_dbo.Products_dbo.Categories_CategoryID] FOREIGN KEY([CategoryID])
REFERENCES [dbo].[Categories] ([CategoryID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Products] CHECK CONSTRAINT [FK_dbo.Products_dbo.Categories_CategoryID]
GO
ALTER TABLE [dbo].[Products]  WITH CHECK ADD  CONSTRAINT [FK_dbo.Products_dbo.Supplier_SupplierID] FOREIGN KEY([SupplierID])
REFERENCES [dbo].[Supplier] ([SupplierID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Products] CHECK CONSTRAINT [FK_dbo.Products_dbo.Supplier_SupplierID]
GO
ALTER TABLE [dbo].[Users]  WITH CHECK ADD  CONSTRAINT [FK_dbo.Users_dbo.Role_RoleID] FOREIGN KEY([RoleID])
REFERENCES [dbo].[Role] ([RoleID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Users] CHECK CONSTRAINT [FK_dbo.Users_dbo.Role_RoleID]
GO

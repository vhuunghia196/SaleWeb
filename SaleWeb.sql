USE [master]
GO
/****** Object:  Database [SaleWeb]    Script Date: 4/27/2023 9:12:06 PM ******/
CREATE DATABASE [SaleWeb]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'SaleWeb', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.VOHUUNGHIA\MSSQL\DATA\SaleWeb.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'SaleWeb_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.VOHUUNGHIA\MSSQL\DATA\SaleWeb_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [SaleWeb] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [SaleWeb].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [SaleWeb] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [SaleWeb] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [SaleWeb] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [SaleWeb] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [SaleWeb] SET ARITHABORT OFF 
GO
ALTER DATABASE [SaleWeb] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [SaleWeb] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [SaleWeb] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [SaleWeb] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [SaleWeb] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [SaleWeb] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [SaleWeb] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [SaleWeb] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [SaleWeb] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [SaleWeb] SET  DISABLE_BROKER 
GO
ALTER DATABASE [SaleWeb] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [SaleWeb] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [SaleWeb] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [SaleWeb] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [SaleWeb] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [SaleWeb] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [SaleWeb] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [SaleWeb] SET RECOVERY FULL 
GO
ALTER DATABASE [SaleWeb] SET  MULTI_USER 
GO
ALTER DATABASE [SaleWeb] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [SaleWeb] SET DB_CHAINING OFF 
GO
ALTER DATABASE [SaleWeb] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [SaleWeb] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [SaleWeb] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [SaleWeb] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'SaleWeb', N'ON'
GO
ALTER DATABASE [SaleWeb] SET QUERY_STORE = OFF
GO
USE [SaleWeb]
GO
/****** Object:  Table [dbo].[__MigrationHistory]    Script Date: 4/27/2023 9:12:06 PM ******/
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
/****** Object:  Table [dbo].[Categories]    Script Date: 4/27/2023 9:12:06 PM ******/
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
/****** Object:  Table [dbo].[Comment]    Script Date: 4/27/2023 9:12:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Comment](
	[IDComment] [int] IDENTITY(1,1) NOT NULL,
	[Content] [nvarchar](max) NOT NULL,
	[ProductId] [int] NOT NULL,
	[UserID] [int] NULL,
	[DayComment] [datetime] NULL,
 CONSTRAINT [PK_dbo.Comment] PRIMARY KEY CLUSTERED 
(
	[IDComment] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OrderDetail]    Script Date: 4/27/2023 9:12:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderDetail](
	[OrderDetailId] [int] IDENTITY(1,1) NOT NULL,
	[OrderID] [int] NOT NULL,
	[ProductID] [int] NOT NULL,
	[Price] [float] NOT NULL,
	[Quantity] [int] NULL,
 CONSTRAINT [PK_dbo.OrderDetail] PRIMARY KEY CLUSTERED 
(
	[OrderDetailId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Orders]    Script Date: 4/27/2023 9:12:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Orders](
	[OrderID] [int] IDENTITY(1,1) NOT NULL,
	[UserID] [int] NOT NULL,
	[OrderDate] [datetime] NOT NULL,
	[isPaid] [int] NULL,
	[isReceived] [int] NULL,
 CONSTRAINT [PK_dbo.Orders] PRIMARY KEY CLUSTERED 
(
	[OrderID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Products]    Script Date: 4/27/2023 9:12:06 PM ******/
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
/****** Object:  Table [dbo].[Role]    Script Date: 4/27/2023 9:12:06 PM ******/
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
/****** Object:  Table [dbo].[Supplier]    Script Date: 4/27/2023 9:12:06 PM ******/
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
/****** Object:  Table [dbo].[Users]    Script Date: 4/27/2023 9:12:06 PM ******/
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

INSERT [dbo].[Comment] ([IDComment], [Content], [ProductId], [UserID], [DayComment]) VALUES (3, N'This chair is very soft and very comfortable to sit on when I work !!!', 6, 2, CAST(N'2023-05-04T00:00:00.000' AS DateTime))
INSERT [dbo].[Comment] ([IDComment], [Content], [ProductId], [UserID], [DayComment]) VALUES (15, N'The Metallic table lamp has a beautiful design with shiny metal material, creating a luxurious and modern space for my room.', 10, 5, CAST(N'2023-05-04T00:00:00.000' AS DateTime))
INSERT [dbo].[Comment] ([IDComment], [Content], [ProductId], [UserID], [DayComment]) VALUES (16, N'Bedroom mirror with beautiful design and material will definitely create a luxurious and modern bedroom space for my bedroom.', 2, 6, CAST(N'2023-05-04T00:00:00.000' AS DateTime))
INSERT [dbo].[Comment] ([IDComment], [Content], [ProductId], [UserID], [DayComment]) VALUES (17, N'With its unique shape and verdant foliage, it adds a touch of nature to any space in my home.', 8, 8, CAST(N'2023-05-04T00:00:00.000' AS DateTime))
INSERT [dbo].[Comment] ([IDComment], [Content], [ProductId], [UserID], [DayComment]) VALUES (18, N'Wooden picture frames are a classic and timeless way to express my cherished memories.', 10, 9, CAST(N'2023-05-16T00:00:00.000' AS DateTime))
INSERT [dbo].[Comment] ([IDComment], [Content], [ProductId], [UserID], [DayComment]) VALUES (22, N'Wooden picture frames are a classic and timeless way to express my cherished memories.', 10, 2, CAST(N'2023-05-04T00:00:00.000' AS DateTime))
INSERT [dbo].[Comment] ([IDComment], [Content], [ProductId], [UserID], [DayComment]) VALUES (25, N'With its unique shape and verdant foliage, it adds a touch of nature to any space in my home.', 10, 22, CAST(N'2023-05-17T00:00:00.000' AS DateTime))
INSERT [dbo].[Comment] ([IDComment], [Content], [ProductId], [UserID], [DayComment]) VALUES (33, N'123', 10, 22, CAST(N'2023-04-27T17:22:07.260' AS DateTime))
INSERT [dbo].[Comment] ([IDComment], [Content], [ProductId], [UserID], [DayComment]) VALUES (37, N'nghiapro12344', 6, 22, CAST(N'2023-04-27T17:41:46.363' AS DateTime))
SET IDENTITY_INSERT [dbo].[Comment] OFF
GO
SET IDENTITY_INSERT [dbo].[OrderDetail] ON 

INSERT [dbo].[OrderDetail] ([OrderDetailId], [OrderID], [ProductID], [Price], [Quantity]) VALUES (1, 3, 7, 600, 3)
INSERT [dbo].[OrderDetail] ([OrderDetailId], [OrderID], [ProductID], [Price], [Quantity]) VALUES (4, 1, 10, 800, 1)
INSERT [dbo].[OrderDetail] ([OrderDetailId], [OrderID], [ProductID], [Price], [Quantity]) VALUES (5, 1, 2, 400, 1)
INSERT [dbo].[OrderDetail] ([OrderDetailId], [OrderID], [ProductID], [Price], [Quantity]) VALUES (6, 9, 13, 200, 5)
INSERT [dbo].[OrderDetail] ([OrderDetailId], [OrderID], [ProductID], [Price], [Quantity]) VALUES (8, 4, 6, 500, 1)
INSERT [dbo].[OrderDetail] ([OrderDetailId], [OrderID], [ProductID], [Price], [Quantity]) VALUES (9, 4, 7, 600, 1)
INSERT [dbo].[OrderDetail] ([OrderDetailId], [OrderID], [ProductID], [Price], [Quantity]) VALUES (10, 9, 11, 300, 4)
INSERT [dbo].[OrderDetail] ([OrderDetailId], [OrderID], [ProductID], [Price], [Quantity]) VALUES (11, 10, 6, 500, 1)
INSERT [dbo].[OrderDetail] ([OrderDetailId], [OrderID], [ProductID], [Price], [Quantity]) VALUES (12, 10, 7, 600, 1)
INSERT [dbo].[OrderDetail] ([OrderDetailId], [OrderID], [ProductID], [Price], [Quantity]) VALUES (14, 11, 10, 800, 1)
INSERT [dbo].[OrderDetail] ([OrderDetailId], [OrderID], [ProductID], [Price], [Quantity]) VALUES (15, 11, 11, 300, 1)
INSERT [dbo].[OrderDetail] ([OrderDetailId], [OrderID], [ProductID], [Price], [Quantity]) VALUES (16, 14, 13, 200, 1)
INSERT [dbo].[OrderDetail] ([OrderDetailId], [OrderID], [ProductID], [Price], [Quantity]) VALUES (17, 15, 14, 200, 1)
SET IDENTITY_INSERT [dbo].[OrderDetail] OFF
GO
SET IDENTITY_INSERT [dbo].[Orders] ON 

INSERT [dbo].[Orders] ([OrderID], [UserID], [OrderDate], [isPaid], [isReceived]) VALUES (1, 2, CAST(N'2023-05-04T00:00:00.000' AS DateTime), 0, 0)
INSERT [dbo].[Orders] ([OrderID], [UserID], [OrderDate], [isPaid], [isReceived]) VALUES (2, 9, CAST(N'2023-12-03T00:00:00.000' AS DateTime), 0, 0)
INSERT [dbo].[Orders] ([OrderID], [UserID], [OrderDate], [isPaid], [isReceived]) VALUES (3, 6, CAST(N'2022-10-12T00:00:00.000' AS DateTime), 0, 0)
INSERT [dbo].[Orders] ([OrderID], [UserID], [OrderDate], [isPaid], [isReceived]) VALUES (4, 10, CAST(N'2023-01-02T00:00:00.000' AS DateTime), 0, 0)
INSERT [dbo].[Orders] ([OrderID], [UserID], [OrderDate], [isPaid], [isReceived]) VALUES (5, 5, CAST(N'2023-04-30T00:00:00.000' AS DateTime), 0, 0)
INSERT [dbo].[Orders] ([OrderID], [UserID], [OrderDate], [isPaid], [isReceived]) VALUES (6, 8, CAST(N'2023-01-23T00:00:00.000' AS DateTime), 0, 0)
INSERT [dbo].[Orders] ([OrderID], [UserID], [OrderDate], [isPaid], [isReceived]) VALUES (9, 8, CAST(N'2023-04-23T00:00:00.000' AS DateTime), 0, 0)
INSERT [dbo].[Orders] ([OrderID], [UserID], [OrderDate], [isPaid], [isReceived]) VALUES (10, 9, CAST(N'2023-04-26T16:09:00.943' AS DateTime), 0, 0)
INSERT [dbo].[Orders] ([OrderID], [UserID], [OrderDate], [isPaid], [isReceived]) VALUES (11, 22, CAST(N'2023-04-26T22:13:37.783' AS DateTime), 1, 0)
INSERT [dbo].[Orders] ([OrderID], [UserID], [OrderDate], [isPaid], [isReceived]) VALUES (14, 22, CAST(N'2023-04-26T23:32:57.113' AS DateTime), 1, 0)
INSERT [dbo].[Orders] ([OrderID], [UserID], [OrderDate], [isPaid], [isReceived]) VALUES (15, 22, CAST(N'2023-04-27T12:17:28.630' AS DateTime), 1, 0)
SET IDENTITY_INSERT [dbo].[Orders] OFF
GO
SET IDENTITY_INSERT [dbo].[Products] ON 

INSERT [dbo].[Products] ([ProductID], [Name], [Image], [Price], [Quantity], [Detail], [SupplierID], [CategoryID]) VALUES (2, N'Bedroom mirror', N'https://res.cloudinary.com/dup9wlfhh/image/upload/v1682530830/vfqdpa4hvbkfwnigp5aa.jpg', 400, 200, N'Bedroom mirrors can be designed in various sizes and shapes to fit the size and style of your bedroom. Additionally, if you choose a mirror with a frame, the frame can also be designed to match the style of your bedroom. With many functional and aesthetic benefits, a bedroom mirror is an essential accessory for creating the perfect and beautiful bedroom space.', 1, 2)
INSERT [dbo].[Products] ([ProductID], [Name], [Image], [Price], [Quantity], [Detail], [SupplierID], [CategoryID]) VALUES (6, N'Milimalastic chair', N'https://res.cloudinary.com/dup9wlfhh/image/upload/v1682530833/tvklci00bqnluimnzft0.jpg', 500, 300, N'Milimalastic chair is a popular choice for modern interior design due to its sleek, minimalist design and excellent comfort and support. Made of durable and flexible polypropylene, these chairs are available in various colors and styles, making them versatile and suitable for a wide range of spaces.', 2, 3)
INSERT [dbo].[Products] ([ProductID], [Name], [Image], [Price], [Quantity], [Detail], [SupplierID], [CategoryID]) VALUES (7, N'Cactus succulent', N'https://res.cloudinary.com/dup9wlfhh/image/upload/v1682530835/chlg2ebm3dix8vphdbzr.jpg', 600, 100, N'Cactus succulents are a trendy and popular plant choice for modern interior design. They are available in a variety of shapes and sizes, require little maintenance, and offer a range of benefits, from air purification to customization. Whether used as a standalone plant or part of a larger arrangement, cactus succulents add a unique and interesting element to any interior space.', 2, 5)
INSERT [dbo].[Products] ([ProductID], [Name], [Image], [Price], [Quantity], [Detail], [SupplierID], [CategoryID]) VALUES (8, N'Table scullent plant
', N'https://res.cloudinary.com/dup9wlfhh/image/upload/v1682530836/uzejtq9q5xhh5qrq8to8.jpg', 100, 200, N'Table succulent plants are a popular and versatile plant choice for interior design. They come in a variety of shapes, colors, and textures, and are ideal for adding natural beauty to any space. With minimal maintenance and care requirements, they are an easy way to bring the outdoors inside and create a more relaxing and comfortable environment.', 1, 5)
INSERT [dbo].[Products] ([ProductID], [Name], [Image], [Price], [Quantity], [Detail], [SupplierID], [CategoryID]) VALUES (10, N'Metallic table lamp', N'https://res.cloudinary.com/dup9wlfhh/image/upload/v1682530837/j2sey4z3e2y9rogjvsbb.jpg', 800, 200, N'Metallic table lamps are a stylish and versatile lighting option that can add a touch of elegance and sophistication to any space. They come in a range of shapes and sizes, and their metallic finish makes them a popular choice for a variety of interior design styles. With their adjustable arms and dimmer switches, they are a practical and functional choice for any room, and their durability ensures that they will provide reliable lighting for years to come.', 3, 4)
INSERT [dbo].[Products] ([ProductID], [Name], [Image], [Price], [Quantity], [Detail], [SupplierID], [CategoryID]) VALUES (11, N'Wooden picture frame', N'https://res.cloudinary.com/dup9wlfhh/image/upload/v1682530838/ybsxxj5ijsuthuagf8jn.jpg', 300, 150, N'A wooden picture frame is a classic and timeless way to display your cherished memories or artwork. They are durable, beautiful, and eco-friendly, and they come in a range of styles and sizes to fit any decor. Whether you prefer a simple and traditional design or something more elaborate and ornate, a wooden picture frame can add a touch of elegance and warmth to any room in the home.', 3, 2)
INSERT [dbo].[Products] ([ProductID], [Name], [Image], [Price], [Quantity], [Detail], [SupplierID], [CategoryID]) VALUES (12, N'Concrete flower pot', N'https://res.cloudinary.com/dup9wlfhh/image/upload/v1682530839/zpe0nlzhdjbemqjo83bv.jpg', 900, 250, N'A concrete flower pot is a versatile and practical option for plant display. They are available in a range of styles and sizes, complement a variety of plant colors and textures, and ', 2, 5)
INSERT [dbo].[Products] ([ProductID], [Name], [Image], [Price], [Quantity], [Detail], [SupplierID], [CategoryID]) VALUES (13, N'Metallic sidetable lamp', N'https://res.cloudinary.com/dup9wlfhh/image/upload/v1682530840/djutg1rhjmvlwfgrkepy.jpg', 200, 300, N'A metallic side table lamp is a functional and stylish lighting fixture that can elevate the look of any room. Whether you''re looking to create a cozy reading nook or add some ambiance to your living room, a metallic side table lamp is a great choice for any home.', 1, 4)
INSERT [dbo].[Products] ([ProductID], [Name], [Image], [Price], [Quantity], [Detail], [SupplierID], [CategoryID]) VALUES (14, N'Decorative pillow', N'https://res.cloudinary.com/dup9wlfhh/image/upload/v1682572578/hmiip4srkvktyxn5n2ik.jpg', 200, 100, N'Decorative pillow is so beutiful', 1, 2)
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
INSERT [dbo].[Users] ([UserID], [Username], [Password], [Name], [PhoneNumber], [Address], [Email], [RoleID]) VALUES (5, N'TranAn', N'pass12345', N'Trần Ân', N'0222222222', N'Hà Nội', N'AnTran369@gmail.com', 1)
INSERT [dbo].[Users] ([UserID], [Username], [Password], [Name], [PhoneNumber], [Address], [Email], [RoleID]) VALUES (6, N'Hau', N'hau123456', N'Nguyễn Hậu', N'0333333333', N'Gia Lai', N'hauNguyen@gmail.com', 1)
INSERT [dbo].[Users] ([UserID], [Username], [Password], [Name], [PhoneNumber], [Address], [Email], [RoleID]) VALUES (8, N'VanHau', N'VanHau@123', N'Văn Hậu', N'0444444444', N'Nha Trang', N'vanHau123@gmail.com', 2)
INSERT [dbo].[Users] ([UserID], [Username], [Password], [Name], [PhoneNumber], [Address], [Email], [RoleID]) VALUES (9, N'nghia', N'123', N'Hữu Nghĩa', N'0555555555', N'Bình Thuận', N'voNghia2023@gmail.com', 1)
INSERT [dbo].[Users] ([UserID], [Username], [Password], [Name], [PhoneNumber], [Address], [Email], [RoleID]) VALUES (10, N'HuuNghia', N'HuuNghia123', N'Hữu Nghĩa', N'0666666666', N'Hải Phòng', N'huuNghia2002@gmail.com', 2)
INSERT [dbo].[Users] ([UserID], [Username], [Password], [Name], [PhoneNumber], [Address], [Email], [RoleID]) VALUES (13, N'nghia123', N'123', N'Võ Hữu Nghĩa', N'0123636366', N'Gia Lai', N'vhuunghia@gmail.com', 2)
INSERT [dbo].[Users] ([UserID], [Username], [Password], [Name], [PhoneNumber], [Address], [Email], [RoleID]) VALUES (19, N'nghia1', N'$2a$11$Y21nuO6x6lnWFwasKZIDYOOIDJ0TDdY2WecGGYOh7eW18biMaYjMe', N'Võ Hữu Nghĩa', N'0123456789', N'123', N'nghiabongda2@gmail.com', 1)
INSERT [dbo].[Users] ([UserID], [Username], [Password], [Name], [PhoneNumber], [Address], [Email], [RoleID]) VALUES (20, N'nghia133', N'$2a$11$lzF7FY4A9x9I/riNKTwGl.s/G7TxOGw.z6KRiRLJi1E5KQ0G20fCq', N'Võ Hữu Nghĩa', N'0123456788', N'26 Street', N'nghiabongda2@gmail.com', 2)
INSERT [dbo].[Users] ([UserID], [Username], [Password], [Name], [PhoneNumber], [Address], [Email], [RoleID]) VALUES (21, N'nghia12345', N'$2a$11$MG5OwH13dxZpcgQwqPPQvelI89Rh1cr3QYD4LItfG0NlHxColQz9q', N'Võ Hữu Nghĩa', N'0123456799', N'26 Street', N'nghiabongda2@gmail.com', 2)
INSERT [dbo].[Users] ([UserID], [Username], [Password], [Name], [PhoneNumber], [Address], [Email], [RoleID]) VALUES (22, N'vhuunghia', N'$2a$11$.mYEeRJkeRFBWMcj4u806.Ld7qAgCwJMvaXK6FnvZnYuItFabnNIi', N'Võ Hữu Nghĩa', N'0123456779', N'26 Street', N'nghiabongda2@gmail.com', 1)
INSERT [dbo].[Users] ([UserID], [Username], [Password], [Name], [PhoneNumber], [Address], [Email], [RoleID]) VALUES (25, N'vhuuhau', N'$2a$11$b/DumoVySGtj7lewusCfn.N94WpZCg5Cqr8tyjDxA4IzX4.MvWxaG', N'Võ Hữu Nghĩa', N'0123255788', N'26 Street', N'nghiabongda2@gmail.com', 2)
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
USE [master]
GO
ALTER DATABASE [SaleWeb] SET  READ_WRITE 
GO

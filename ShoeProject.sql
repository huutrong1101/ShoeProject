USE [master]
GO
/****** Object:  Database [QuanLyBanGiay]    Script Date: 1/29/2023 10:47:42 PM ******/
CREATE DATABASE [QuanLyBanGiay]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'QuanLyBanGiay', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\QuanLyBanGiay.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'QuanLyBanGiay_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\QuanLyBanGiay_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [QuanLyBanGiay] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [QuanLyBanGiay].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [QuanLyBanGiay] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [QuanLyBanGiay] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [QuanLyBanGiay] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [QuanLyBanGiay] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [QuanLyBanGiay] SET ARITHABORT OFF 
GO
ALTER DATABASE [QuanLyBanGiay] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [QuanLyBanGiay] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [QuanLyBanGiay] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [QuanLyBanGiay] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [QuanLyBanGiay] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [QuanLyBanGiay] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [QuanLyBanGiay] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [QuanLyBanGiay] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [QuanLyBanGiay] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [QuanLyBanGiay] SET  DISABLE_BROKER 
GO
ALTER DATABASE [QuanLyBanGiay] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [QuanLyBanGiay] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [QuanLyBanGiay] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [QuanLyBanGiay] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [QuanLyBanGiay] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [QuanLyBanGiay] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [QuanLyBanGiay] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [QuanLyBanGiay] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [QuanLyBanGiay] SET  MULTI_USER 
GO
ALTER DATABASE [QuanLyBanGiay] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [QuanLyBanGiay] SET DB_CHAINING OFF 
GO
ALTER DATABASE [QuanLyBanGiay] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [QuanLyBanGiay] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [QuanLyBanGiay] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [QuanLyBanGiay] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [QuanLyBanGiay] SET QUERY_STORE = OFF
GO
USE [QuanLyBanGiay]
GO
/****** Object:  Table [dbo].[Account]    Script Date: 1/29/2023 10:47:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Account](
	[uID] [int] IDENTITY(1,1) NOT NULL,
	[user] [nchar](10) NULL,
	[pass] [nchar](10) NULL,
	[isSell] [bit] NULL,
	[isAdmin] [bit] NULL,
	[isShipper] [bit] NULL,
	[email] [nvarchar](50) NULL,
	[images] [nvarchar](500) NULL,
	[code] [nchar](10) NULL,
 CONSTRAINT [PK_Account] PRIMARY KEY CLUSTERED 
(
	[uID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Blog]    Script Date: 1/29/2023 10:47:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Blog](
	[blog_id] [int] IDENTITY(1,1) NOT NULL,
	[title] [nvarchar](200) NULL,
	[content1] [nvarchar](1000) NULL,
	[content2] [nvarchar](1000) NULL,
	[content3] [nvarchar](1000) NULL,
	[content4] [nvarchar](1000) NULL,
	[image] [nvarchar](500) NULL,
	[date] [date] NULL,
 CONSTRAINT [PK_Blog] PRIMARY KEY CLUSTERED 
(
	[blog_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[BlogReview]    Script Date: 1/29/2023 10:47:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BlogReview](
	[accountID] [int] NULL,
	[blogID] [int] NULL,
	[contentReview] [nvarchar](500) NULL,
	[dateReview] [date] NULL,
	[maReview] [int] IDENTITY(1,1) NOT NULL,
 CONSTRAINT [PK_BlogReview] PRIMARY KEY CLUSTERED 
(
	[maReview] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Cart]    Script Date: 1/29/2023 10:47:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Cart](
	[accountID] [int] NOT NULL,
	[productID] [int] NOT NULL,
	[amount] [int] NULL,
	[maCart] [int] IDENTITY(1,1) NOT NULL,
	[size] [nvarchar](50) NULL,
 CONSTRAINT [PK_Cart] PRIMARY KEY CLUSTERED 
(
	[maCart] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Category]    Script Date: 1/29/2023 10:47:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Category](
	[cid] [int] NOT NULL,
	[cname] [nvarchar](50) NULL,
 CONSTRAINT [PK_Category] PRIMARY KEY CLUSTERED 
(
	[cid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Invoice]    Script Date: 1/29/2023 10:47:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Invoice](
	[maHD] [int] IDENTITY(1,1) NOT NULL,
	[accountID] [int] NULL,
	[tongGia] [float] NULL,
	[ngayXuat] [datetime] NULL,
	[status] [int] NULL,
	[email] [nvarchar](500) NULL,
	[name] [nvarchar](50) NULL,
	[phone] [nchar](50) NULL,
	[deliveryAddress] [nvarchar](1000) NULL,
 CONSTRAINT [PK_Invoice] PRIMARY KEY CLUSTERED 
(
	[maHD] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[InvoiceDetail]    Script Date: 1/29/2023 10:47:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[InvoiceDetail](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[AccountId] [int] NULL,
	[ProductId] [int] NULL,
	[ProductQuantity] [int] NULL,
	[ProductSize] [nvarchar](50) NULL,
	[OrderId] [int] NULL,
 CONSTRAINT [PK_InvoiceDetail] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[InvoiceShop]    Script Date: 1/29/2023 10:47:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[InvoiceShop](
	[maHD] [int] IDENTITY(1,1) NOT NULL,
	[accountID] [int] NULL,
	[sellID] [int] NULL,
	[tongGia] [float] NULL,
	[ngayXuat] [datetime] NULL,
	[status] [int] NULL,
	[email] [nvarchar](500) NULL,
	[name] [nvarchar](50) NULL,
	[phone] [nchar](50) NULL,
	[deliveryAddress] [nvarchar](1000) NULL,
	[OrderID] [int] NULL,
 CONSTRAINT [PK_InvoiceShop] PRIMARY KEY CLUSTERED 
(
	[maHD] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[InvoiceShopDetail]    Script Date: 1/29/2023 10:47:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[InvoiceShopDetail](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[AccountId] [int] NULL,
	[ProductId] [int] NULL,
	[SellID] [int] NULL,
	[ProductQuantity] [int] NULL,
	[ProductSize] [nvarchar](50) NULL,
	[OrderShopId] [int] NULL,
 CONSTRAINT [PK_InvoiceShopDetail] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[InvoiceStatus]    Script Date: 1/29/2023 10:47:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[InvoiceStatus](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[status] [nchar](50) NULL,
 CONSTRAINT [PK_InvoiceStatus] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Product]    Script Date: 1/29/2023 10:47:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Product](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](200) NULL,
	[image] [nvarchar](500) NULL,
	[price] [decimal](18, 0) NULL,
	[title] [nvarchar](500) NULL,
	[description] [nvarchar](max) NULL,
	[cateID] [int] NOT NULL,
	[sell_ID] [int] NOT NULL,
	[model] [nvarchar](50) NULL,
	[color] [nvarchar](50) NULL,
	[delivery] [nvarchar](50) NULL,
	[image2] [nvarchar](500) NULL,
	[image3] [nvarchar](500) NULL,
	[image4] [nvarchar](500) NULL,
 CONSTRAINT [PK_Product] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Request]    Script Date: 1/29/2023 10:47:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Request](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[sell_ID] [int] NULL,
	[productID] [int] NULL,
	[content] [nvarchar](500) NULL,
	[status] [bit] NULL,
 CONSTRAINT [PK_Request] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Review]    Script Date: 1/29/2023 10:47:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Review](
	[accountID] [int] NULL,
	[productID] [int] NULL,
	[contentReview] [nvarchar](500) NULL,
	[dateReview] [date] NULL,
	[maReview] [int] IDENTITY(1,1) NOT NULL,
 CONSTRAINT [PK_Review] PRIMARY KEY CLUSTERED 
(
	[maReview] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Seller]    Script Date: 1/29/2023 10:47:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Seller](
	[sell_ID] [int] IDENTITY(1,1) NOT NULL,
	[name_Shop] [nvarchar](100) NULL,
	[phone_Shop] [nchar](20) NULL,
	[email_Shop] [nvarchar](50) NULL,
	[uID] [int] NOT NULL,
 CONSTRAINT [PK_Seller] PRIMARY KEY CLUSTERED 
(
	[sell_ID] ASC,
	[uID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SoLuongDaBan]    Script Date: 1/29/2023 10:47:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SoLuongDaBan](
	[productID] [int] NULL,
	[soLuongDaBan] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Supplier]    Script Date: 1/29/2023 10:47:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Supplier](
	[idSupplier] [int] IDENTITY(1,1) NOT NULL,
	[nameSupplier] [nvarchar](100) NULL,
	[phoneSupplier] [nvarchar](50) NULL,
	[emailSupplier] [nvarchar](200) NULL,
	[addressSupplier] [nvarchar](200) NULL,
	[cateID] [int] NULL,
 CONSTRAINT [PK_Supplier] PRIMARY KEY CLUSTERED 
(
	[idSupplier] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TongChiTieuBanHang]    Script Date: 1/29/2023 10:47:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TongChiTieuBanHang](
	[userID] [int] NULL,
	[TongChiTieu] [float] NULL,
	[TongBanHang] [float] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TongChiTieuShop]    Script Date: 1/29/2023 10:47:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TongChiTieuShop](
	[sellID] [int] NULL,
	[TongBanHang] [decimal](18, 0) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[WishList]    Script Date: 1/29/2023 10:47:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[WishList](
	[accountID] [int] NULL,
	[productID] [int] NULL,
	[maCart] [int] IDENTITY(1,1) NOT NULL,
 CONSTRAINT [PK_WishList] PRIMARY KEY CLUSTERED 
(
	[maCart] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Account] ON 

INSERT [dbo].[Account] ([uID], [user], [pass], [isSell], [isAdmin], [isShipper], [email], [images], [code]) VALUES (1014, N'admin     ', N'123456    ', 1, 1, 0, N'naruto@gmail.com', N'account/1668068262666.jpg', NULL)
INSERT [dbo].[Account] ([uID], [user], [pass], [isSell], [isAdmin], [isShipper], [email], [images], [code]) VALUES (1037, N'shipper   ', N'123456    ', 0, 0, 1, N'huutrong1101@gmail.com', NULL, NULL)
INSERT [dbo].[Account] ([uID], [user], [pass], [isSell], [isAdmin], [isShipper], [email], [images], [code]) VALUES (1041, N'shop1     ', N'123456    ', 1, 0, 0, N'huutrong1101@gmail.com', NULL, N'993639    ')
INSERT [dbo].[Account] ([uID], [user], [pass], [isSell], [isAdmin], [isShipper], [email], [images], [code]) VALUES (1043, N'shop2     ', N'123456    ', 1, 0, 0, N'huutrong1101@gmail.com', NULL, N'317522    ')
INSERT [dbo].[Account] ([uID], [user], [pass], [isSell], [isAdmin], [isShipper], [email], [images], [code]) VALUES (1045, N'shop3     ', N'123456    ', 1, 0, 0, N'huutrong1101@gmail.com', NULL, N'797810    ')
INSERT [dbo].[Account] ([uID], [user], [pass], [isSell], [isAdmin], [isShipper], [email], [images], [code]) VALUES (1048, N'Trọng     ', N'123456    ', 0, 0, 0, N'huutrong1101@gmail.com', N'https://lh3.googleusercontent.com/a/AEdFTp7xZUaslsVdnfZknnsD-LuWN9OIgco_bzPQWZtdEQ=s96-c', NULL)
INSERT [dbo].[Account] ([uID], [user], [pass], [isSell], [isAdmin], [isShipper], [email], [images], [code]) VALUES (1050, N'user1     ', N'123456    ', 0, 0, 0, N'huutrong1101@gmail.com', NULL, N'508369    ')
INSERT [dbo].[Account] ([uID], [user], [pass], [isSell], [isAdmin], [isShipper], [email], [images], [code]) VALUES (1052, N'user2     ', N'123456    ', 0, 0, 0, N'huutrong1101@gmail.com', NULL, N'703207    ')
INSERT [dbo].[Account] ([uID], [user], [pass], [isSell], [isAdmin], [isShipper], [email], [images], [code]) VALUES (1053, N'user      ', N'123456    ', 0, 0, 0, N'huutrong1101@gmail.com', NULL, N'680765    ')
INSERT [dbo].[Account] ([uID], [user], [pass], [isSell], [isAdmin], [isShipper], [email], [images], [code]) VALUES (1057, N'huutrong5 ', N'123456    ', 0, 0, 0, N'huutrong1101@gmail.com', NULL, N'085808    ')
SET IDENTITY_INSERT [dbo].[Account] OFF
GO
SET IDENTITY_INSERT [dbo].[Blog] ON 

INSERT [dbo].[Blog] ([blog_id], [title], [content1], [content2], [content3], [content4], [image], [date]) VALUES (1, N'Ý TƯỞNG PHỐI ĐỒ VỚI GIÀY THỂ THAO NAM, NỮ CỰC CHẤT', N'Quần jeans có lẽ là một item basic luôn có trong tủ đồ của các nàng. Từ cô nàng an toàn với quần jeans trơn ống ôm đến cô nàng bụi bặm với jeans rách, hoặc retro với jeans ống rộng, jeans dường như sinh ra để tủ đồ của các nàng thêm năng động. Nếu như jeans và những đôi ankle boots là bộ đôi kinh điển trong làng phối đồ thì một đôi sneaker và quần jeans thì sao nhỉ? Cũng năng động không kém đấy.', N'Một phong cách nổi bật nữa mà bạn có thể thử đó là hoodie và sneaker. Bản thân chiếc áo hoodie đã mang lại sự năng động và đáng yêu cho người mặc rồi, vậy tại sao không thử tôn nó lên bằng một đôi sneaker chất lừ. Những đôi giày thể thao thấp cổ, cùng tông với chiếc áo hoodie sẽ là bộ đôi ăn ý khi dạo phố đấy.

', N'Những năm gần đây, quần culottes/ ống rộng lại lên ngôi hot không kém những item khác. Chúng ta thường thấy các cô nàng diện culottes với một đôi gót nhọn yêu kiều nhưng với một đôi sneaker thì sao nhỉ? Set đồ của bạn cũng sẽ hay ho lắm đấy.', N'Sở hữu một chiếc quần Joggers trong tủ đồ của mình, hẳn bạn là một cô gái khá năng động và thể thao đấy. Nào hãy cùng mix chiếc quần này với đôi giày ưa thích nhé.', N'https://saigonsneaker.com/wp-content/uploads/2019/12/cach-phoi-do-voi-giay-the-thao.jpg.webp', CAST(N'2022-11-01' AS Date))
INSERT [dbo].[Blog] ([blog_id], [title], [content1], [content2], [content3], [content4], [image], [date]) VALUES (2, N'CÁCH LÀM SẠCH GIẦY DA LỘN NAM, NỮ HIỆU QUẢ NHẤT', N'Đây được xem là một chất liệu vô cùng quen thuộc của những quý ông lịch lãm từ Pháp. Từ thế kỉ XIX, những sản phẩm được làm từ da lộn dần phổ biến và đỉnh điểm là vào năm 1960, khi da lộn làm mưa làm gió và bao phủ thị trường thời trang. Nếu trước đây da lộn là chất liệu dành cho giới quý tộc, bậc thượng lưu thì ngày nay da lộn được ứng dụng và sử dụng rộng rãi cho nhiều sản phẩm như: giày da lộn, áo khoác da lộn. 

', N'Một trong những cách vệ sinh giày da lộn phổ biến nhất chính là sử dụng bàn chải mềm. Một chiếc bàn chải mềm (bạn có thể sử dụng bàn chải đánh răng) sẽ là một trợ thủ đắc lực cho bạn trong việc làm sạch giày da lộn. Chỉ cần dùng bàn chải mềm chải theo đúng chiều của da giày một cách nhẹ nhàng nhất, bạn đã dễ dàng đánh bay đi những bụi bẩn bám lì trên đôi giày của bạn.

', N'Thế nếu trong trường hợp bạn cần ra ngoài, bạn có những cuộc hẹn quan trọng mà bạn cần chắc chắn đôi giày của mình luôn sạch sẽ thì thế nào? SaigonSneaker.com sẽ bật mí cho bạn, đơn giản là chỉ cần mang theo một chiếc dũa móng tay hay cục tẩy là được nhé. Đối với dũa móng tay, bạn cần hơ nóng chiếc dũa và chà nhẹ nhàng dọc theo chiều dài của giày. Đối với những vết bẩn cứng đầu hơn, bạn có thể sử dụng cục tẩy để chà nhẹ chúng. Tuy nhiên, bạn nên lưu ý không chà quá mạnh tránh làm xước, mất giá trị vốn có của đôi giày.

', N'Tương tự như dấm, cồn có tính tẩy rửa khá cao. Cách đánh giày da lộn bằng cồn như sau: bạn có thể dùng một lớp bông gòn có thấm cồn hoặc giấy ăn thấm cồn lau chùi theo chiều của da giày để giữ cho đôi giày của mình. Tuy nhiên bạn nên lưu ý nồng độ cồn phù hợp để tránh làm hỏng chất liệu, bạc màu đôi giày nhé.', N'https://saigonsneaker.com/wp-content/uploads/2020/01/cach-ve-sinh-giay-da-lon-1.jpg.webp', CAST(N'2022-10-01' AS Date))
INSERT [dbo].[Blog] ([blog_id], [title], [content1], [content2], [content3], [content4], [image], [date]) VALUES (3, N'NHỮNG ĐIỀU CẦN BIẾT KHI MUA NEW BALANCE 2002R', N'NB 2002R với nhiều công nghệ nổi bật như trên có thể giúp bạn mang cả ngày vẫn cảm thấy thoải mái. Có thể dùng để chơi thể thao như: đi bộ, chạy bộ hoặc tập gym. Cũng giống như những dòng khác của NB, 2002R cũng có thể dùng để phối đồ cho những ai yêu thích phong cách vintage, đặc biệt trong những năm gần đây giới trẻ có xu hướng hoài cổ.', N'Quay trở lại vào năm 2020 với một diện mạo mới mang tên New Balance 2002R. Vào năm 2021, cuối cùng đã xâm nhập thị trường và 2022, với xu hướng hoài cổ của giới trẻ,nó tiếp tục chuỗi nóng của mình với nhiều phối màu khác nhau. Cùng với công nghệ nổi tiếng của NB, công nghệ đệm ABZORB được tìm thấy trên đế giữa mang lại cảm giác đàn hồi để tạo sự thoải mái và ổn định tối đa.', N'NB 2002R với nhiều công nghệ nổi bật như trên có thể giúp bạn mang cả ngày vẫn cảm thấy thoải mái. Có thể dùng để chơi thể thao như: đi bộ, chạy bộ hoặc tập gym. Cũng giống như những dòng khác của NB, 2002R cũng có thể dùng để phối đồ cho những ai yêu thích phong cách vintage, đặc biệt trong những năm gần đây giới trẻ có xu hướng hoài cổ.', N'Dòng giày này phụ hợp với tất cả giới tính và độ tuổi. Tuy nhiên có những phối màu sẽ phù hợp với nam hơn và ngược lại. Tùy vào mục đích sử dụng mà chúng ta có thể chọn phối màu phù hợp với bản thân. Với phong cách cổ điển 2002R có thể sẽ phù hợp hơn với các bạn nam thích phong cách retro hay nam giới tuổi tung niên. Các bạn nữ yêu thích phong cách đường phố cũng có thể thử qua.', N'https://saigonsneaker.com/wp-content/uploads/2022/11/New-Balance-2002R-400x281.jpeg.webp', CAST(N'2022-10-10' AS Date))
INSERT [dbo].[Blog] ([blog_id], [title], [content1], [content2], [content3], [content4], [image], [date]) VALUES (4, N'THƯƠNG HIỆU THỜI TRANG FILA CÓ GÌ ĐẶC BIỆT?', N'Với những tính đồ thời trang và đặc biệt là những ai ưa thích street style, chắc hẳn chúng ta không còn lạ lẫm với thương hiệu mang tên Fila. Những đôi giày với logo Fila đã – đang và sẽ còn được diện trên đường phố như một biểu tượng của sự năng động và thời thượng. Vậy hãy cùng tìm hiểu và lý giải sức hút của thương hiệu này đối với giới trẻ nhé.', N'Một thông tin khá thú vị về Fila đó là vào lúc mới thành lập và chưa xây dựng được tiếng tăm trên thị trường thì nhãn hiệu này chủ yếu sản xuất đồ lót.', N'Kể từ giai đoạn năm 2017 đến gần đây, hẳn chúng ta không còn xa lạ với sự hiện diện của các sản phẩm của Fila tại thị trường Việt Nam. Thương hiệu Hàn Quốc này đã cho ra nhiều dòng sản phẩm gây sốt cho giới trẻ yêu thời trang. Hãy cùng điểm qua những cái tên đang “hot” của Fila nhé!', N'Qua bài viết trên bạn đã hiểu rõ thương hiệu Fila là gì. Là một trong những thương hiệu thời trang được giới trẻ yêu thích bởi sự đơn giản, cá tính nhưng cũng rất thời trang, Fila đang từng ngày khẳng định độ “hot” của nó trên thị trường thời trang. Bạn hãy chọn cho mình một sản phẩm ưa thích nhất của thương hiệu này nhé.', N'https://saigonsneaker.com/wp-content/uploads/2018/09/fila-la-gi.jpg.webp', CAST(N'2022-10-09' AS Date))
INSERT [dbo].[Blog] ([blog_id], [title], [content1], [content2], [content3], [content4], [image], [date]) VALUES (5, N'VINTAGE STYLE LÀ GÌ? HƯỚNG DẪN PHỐI ĐỒ THEO PHONG CÁCH THỜI TRANG VINTAGE', N'Vintage là gì? Từ vintage đầu tiên được xuất phát từ quy trình làm rượu nho khi xưa được gọi là vintage wine, ở thời điểm đó từ này như tượng trưng cho những món đồ cao cấp, chất lượng.', N'Những chiếc áo theo phong cách vintage là gì? Là những chiếc áo vintage với với đường may, thiết kế có hơi hướng cổ điển là những sản phẩm dễ tìm cũng như dễ phối nhất trong dòng vintage. Bạn có thể tìm cho mình những chiếc áo sơ mi kẻ ca rô hay chấm bi, hoặc những chiếc áo họa tiết với sự kết hợp của nhiều màu sắc cũng thuộc vintage style. ', N'Vintage là thời trang thuộc thời đại trước, là khi những người phụ nữ mê mệt với các chiếc đầm vintage chiết eo và phần váy phồng tôn lên các đường cong cơ thể của mình. Đây được xem là một chiếc đầm vintage cổ điển thách thức phụ nữ nhất, chỉ những người tự tin mình có vòng eo “con kiến” mới tự tin diện những chiếc đầm có kiểu dáng thế này. ', N'Tương tự như phong cách retro, những mẫu chân váy vintage thông thường dài qua gối, có thể được may theo dạng nhiều tầng, đơn sắc hoặc có các họa tiết bắt mắt. Mẫu chân váy vintage dễ mặc, không quá kén. ', N'https://saigonsneaker.com/wp-content/uploads/2019/12/vintage-style-1-510x510.jpg.webp', CAST(N'2022-10-08' AS Date))
SET IDENTITY_INSERT [dbo].[Blog] OFF
GO
SET IDENTITY_INSERT [dbo].[BlogReview] ON 

INSERT [dbo].[BlogReview] ([accountID], [blogID], [contentReview], [dateReview], [maReview]) VALUES (1014, 1, N'Test comment ', CAST(N'2022-11-13' AS Date), 26)
SET IDENTITY_INSERT [dbo].[BlogReview] OFF
GO
INSERT [dbo].[Category] ([cid], [cname]) VALUES (1, N'GIAY ADIDAS')
INSERT [dbo].[Category] ([cid], [cname]) VALUES (2, N'GIAY NIKE')
INSERT [dbo].[Category] ([cid], [cname]) VALUES (3, N'GIAY BITIS')
INSERT [dbo].[Category] ([cid], [cname]) VALUES (4, N'GIAY CONVERSE')
GO
SET IDENTITY_INSERT [dbo].[Invoice] ON 

INSERT [dbo].[Invoice] ([maHD], [accountID], [tongGia], [ngayXuat], [status], [email], [name], [phone], [deliveryAddress]) VALUES (1284, 1050, 744000, CAST(N'2022-12-16T00:00:00.000' AS DateTime), 1, N'huutrong1101@gmail.com', N'Trọng Nguyễn Hữu', N'0773696410                                        ', N'thôn Quảng Thành II , xã Nghĩa Thành , huyện Châu Đức , tỉnh BRVT')
INSERT [dbo].[Invoice] ([maHD], [accountID], [tongGia], [ngayXuat], [status], [email], [name], [phone], [deliveryAddress]) VALUES (1285, 1052, 846000, CAST(N'2022-12-16T00:00:00.000' AS DateTime), 1, N'huutrong1101@gmail.com', N'Trọng Nguyễn Hữu', N'0773696410                                        ', N'thôn Quảng Thành II , xã Nghĩa Thành , huyện Châu Đức , tỉnh BRVT')
INSERT [dbo].[Invoice] ([maHD], [accountID], [tongGia], [ngayXuat], [status], [email], [name], [phone], [deliveryAddress]) VALUES (1286, 1053, 364000, CAST(N'2022-12-17T00:00:00.000' AS DateTime), 1, N'huutrong1101@gmail.com', N'Trọng Nguyễn Hữu', N'0773696410                                        ', N'thôn Quảng Thành II , xã Nghĩa Thành , huyện Châu Đức , tỉnh BRVT')
INSERT [dbo].[Invoice] ([maHD], [accountID], [tongGia], [ngayXuat], [status], [email], [name], [phone], [deliveryAddress]) VALUES (1287, 1048, 182000, CAST(N'2022-12-22T00:00:00.000' AS DateTime), 1, N'huutrong1101@gmail.com', N'Trọng Nguyễn Hữu', N'0773696410                                        ', N'thôn Quảng Thành II , xã Nghĩa Thành , huyện Châu Đức , tỉnh BRVT')
INSERT [dbo].[Invoice] ([maHD], [accountID], [tongGia], [ngayXuat], [status], [email], [name], [phone], [deliveryAddress]) VALUES (1288, 1053, 182000, CAST(N'2023-01-29T00:00:00.000' AS DateTime), 1, N'huutrong1101@gmail.com', N'Trọng Nguyễn Hữu', N'0773696410                                        ', N'thôn Quảng Thành II , xã Nghĩa Thành , huyện Châu Đức , tỉnh BRVT')
INSERT [dbo].[Invoice] ([maHD], [accountID], [tongGia], [ngayXuat], [status], [email], [name], [phone], [deliveryAddress]) VALUES (1289, 1053, 364000, CAST(N'2023-01-29T00:00:00.000' AS DateTime), 1, N'huutrong1101@gmail.com', N'Trọng Nguyễn Hữu', N'0773696410                                        ', N'thôn Quảng Thành II , xã Nghĩa Thành , huyện Châu Đức , tỉnh BRVT')
INSERT [dbo].[Invoice] ([maHD], [accountID], [tongGia], [ngayXuat], [status], [email], [name], [phone], [deliveryAddress]) VALUES (1290, 1053, 364000, CAST(N'2023-01-29T00:00:00.000' AS DateTime), 1, N'', N'', N'                                                  ', N'')
INSERT [dbo].[Invoice] ([maHD], [accountID], [tongGia], [ngayXuat], [status], [email], [name], [phone], [deliveryAddress]) VALUES (1291, 1053, 364000, CAST(N'2023-01-29T00:00:00.000' AS DateTime), 1, N'', N'', N'                                                  ', N'')
INSERT [dbo].[Invoice] ([maHD], [accountID], [tongGia], [ngayXuat], [status], [email], [name], [phone], [deliveryAddress]) VALUES (1292, 1053, 364000, CAST(N'2023-01-29T00:00:00.000' AS DateTime), 1, N'huutrong1101@gmail.com', N'Trọng Nguyễn Hữu', N'0773696410                                        ', N'thôn Quảng Thành II , xã Nghĩa Thành , huyện Châu Đức , tỉnh BRVT')
SET IDENTITY_INSERT [dbo].[Invoice] OFF
GO
SET IDENTITY_INSERT [dbo].[InvoiceDetail] ON 

INSERT [dbo].[InvoiceDetail] ([id], [AccountId], [ProductId], [ProductQuantity], [ProductSize], [OrderId]) VALUES (1159, 1050, 11, 2, N'small', 1284)
INSERT [dbo].[InvoiceDetail] ([id], [AccountId], [ProductId], [ProductQuantity], [ProductSize], [OrderId]) VALUES (1160, 1050, 19, 2, N'small', 1284)
INSERT [dbo].[InvoiceDetail] ([id], [AccountId], [ProductId], [ProductQuantity], [ProductSize], [OrderId]) VALUES (1161, 1052, 15, 1, N'small', 1285)
INSERT [dbo].[InvoiceDetail] ([id], [AccountId], [ProductId], [ProductQuantity], [ProductSize], [OrderId]) VALUES (1162, 1052, 27, 1, N'small', 1285)
INSERT [dbo].[InvoiceDetail] ([id], [AccountId], [ProductId], [ProductQuantity], [ProductSize], [OrderId]) VALUES (1163, 1053, 11, 2, N'medium', 1286)
INSERT [dbo].[InvoiceDetail] ([id], [AccountId], [ProductId], [ProductQuantity], [ProductSize], [OrderId]) VALUES (1164, 1048, 11, 1, N'medium', 1287)
INSERT [dbo].[InvoiceDetail] ([id], [AccountId], [ProductId], [ProductQuantity], [ProductSize], [OrderId]) VALUES (1165, 1053, 11, 1, N'small', 1288)
INSERT [dbo].[InvoiceDetail] ([id], [AccountId], [ProductId], [ProductQuantity], [ProductSize], [OrderId]) VALUES (1166, 1053, 11, 2, N'small', 1289)
INSERT [dbo].[InvoiceDetail] ([id], [AccountId], [ProductId], [ProductQuantity], [ProductSize], [OrderId]) VALUES (1167, 1053, 11, 2, N'small', 1290)
INSERT [dbo].[InvoiceDetail] ([id], [AccountId], [ProductId], [ProductQuantity], [ProductSize], [OrderId]) VALUES (1168, 1053, 11, 2, N'small', 1291)
INSERT [dbo].[InvoiceDetail] ([id], [AccountId], [ProductId], [ProductQuantity], [ProductSize], [OrderId]) VALUES (1169, 1053, 11, 2, N'small', 1292)
SET IDENTITY_INSERT [dbo].[InvoiceDetail] OFF
GO
SET IDENTITY_INSERT [dbo].[InvoiceShop] ON 

INSERT [dbo].[InvoiceShop] ([maHD], [accountID], [sellID], [tongGia], [ngayXuat], [status], [email], [name], [phone], [deliveryAddress], [OrderID]) VALUES (1121, 1050, 8, 364000, CAST(N'2022-12-16T00:00:00.000' AS DateTime), 4, N'huutrong1101@gmail.com', N'Trọng Nguyễn Hữu', N'0773696410                                        ', N'thôn Quảng Thành II , xã Nghĩa Thành , huyện Châu Đức , tỉnh BRVT', 1284)
INSERT [dbo].[InvoiceShop] ([maHD], [accountID], [sellID], [tongGia], [ngayXuat], [status], [email], [name], [phone], [deliveryAddress], [OrderID]) VALUES (1122, 1050, 8, 380000, CAST(N'2022-12-16T00:00:00.000' AS DateTime), 4, N'huutrong1101@gmail.com', N'Trọng Nguyễn Hữu', N'0773696410                                        ', N'thôn Quảng Thành II , xã Nghĩa Thành , huyện Châu Đức , tỉnh BRVT', 1284)
INSERT [dbo].[InvoiceShop] ([maHD], [accountID], [sellID], [tongGia], [ngayXuat], [status], [email], [name], [phone], [deliveryAddress], [OrderID]) VALUES (1123, 1052, 8, 156000, CAST(N'2022-12-16T00:00:00.000' AS DateTime), 1, N'huutrong1101@gmail.com', N'Trọng Nguyễn Hữu', N'0773696410                                        ', N'thôn Quảng Thành II , xã Nghĩa Thành , huyện Châu Đức , tỉnh BRVT', 1285)
INSERT [dbo].[InvoiceShop] ([maHD], [accountID], [sellID], [tongGia], [ngayXuat], [status], [email], [name], [phone], [deliveryAddress], [OrderID]) VALUES (1124, 1052, 9, 690000, CAST(N'2022-12-16T00:00:00.000' AS DateTime), 4, N'huutrong1101@gmail.com', N'Trọng Nguyễn Hữu', N'0773696410                                        ', N'thôn Quảng Thành II , xã Nghĩa Thành , huyện Châu Đức , tỉnh BRVT', 1285)
INSERT [dbo].[InvoiceShop] ([maHD], [accountID], [sellID], [tongGia], [ngayXuat], [status], [email], [name], [phone], [deliveryAddress], [OrderID]) VALUES (1125, 1053, 8, 364000, CAST(N'2022-12-17T00:00:00.000' AS DateTime), 4, N'huutrong1101@gmail.com', N'Trọng Nguyễn Hữu', N'0773696410                                        ', N'thôn Quảng Thành II , xã Nghĩa Thành , huyện Châu Đức , tỉnh BRVT', 1286)
INSERT [dbo].[InvoiceShop] ([maHD], [accountID], [sellID], [tongGia], [ngayXuat], [status], [email], [name], [phone], [deliveryAddress], [OrderID]) VALUES (1126, 1048, 8, 182000, CAST(N'2022-12-22T00:00:00.000' AS DateTime), 1, N'huutrong1101@gmail.com', N'Trọng Nguyễn Hữu', N'0773696410                                        ', N'thôn Quảng Thành II , xã Nghĩa Thành , huyện Châu Đức , tỉnh BRVT', 1287)
INSERT [dbo].[InvoiceShop] ([maHD], [accountID], [sellID], [tongGia], [ngayXuat], [status], [email], [name], [phone], [deliveryAddress], [OrderID]) VALUES (1127, 1053, 8, 182000, CAST(N'2023-01-29T00:00:00.000' AS DateTime), 1, N'huutrong1101@gmail.com', N'Trọng Nguyễn Hữu', N'0773696410                                        ', N'thôn Quảng Thành II , xã Nghĩa Thành , huyện Châu Đức , tỉnh BRVT', 1288)
INSERT [dbo].[InvoiceShop] ([maHD], [accountID], [sellID], [tongGia], [ngayXuat], [status], [email], [name], [phone], [deliveryAddress], [OrderID]) VALUES (1128, 1053, 8, 364000, CAST(N'2023-01-29T00:00:00.000' AS DateTime), 1, N'huutrong1101@gmail.com', N'Trọng Nguyễn Hữu', N'0773696410                                        ', N'thôn Quảng Thành II , xã Nghĩa Thành , huyện Châu Đức , tỉnh BRVT', 1289)
INSERT [dbo].[InvoiceShop] ([maHD], [accountID], [sellID], [tongGia], [ngayXuat], [status], [email], [name], [phone], [deliveryAddress], [OrderID]) VALUES (1129, 1053, 8, 364000, CAST(N'2023-01-29T00:00:00.000' AS DateTime), 1, N'', N'', N'                                                  ', N'', 1290)
INSERT [dbo].[InvoiceShop] ([maHD], [accountID], [sellID], [tongGia], [ngayXuat], [status], [email], [name], [phone], [deliveryAddress], [OrderID]) VALUES (1130, 1053, 8, 364000, CAST(N'2023-01-29T00:00:00.000' AS DateTime), 1, N'', N'', N'                                                  ', N'', 1291)
INSERT [dbo].[InvoiceShop] ([maHD], [accountID], [sellID], [tongGia], [ngayXuat], [status], [email], [name], [phone], [deliveryAddress], [OrderID]) VALUES (1131, 1053, 8, 364000, CAST(N'2023-01-29T00:00:00.000' AS DateTime), 1, N'huutrong1101@gmail.com', N'Trọng Nguyễn Hữu', N'0773696410                                        ', N'thôn Quảng Thành II , xã Nghĩa Thành , huyện Châu Đức , tỉnh BRVT', 1292)
SET IDENTITY_INSERT [dbo].[InvoiceShop] OFF
GO
SET IDENTITY_INSERT [dbo].[InvoiceShopDetail] ON 

INSERT [dbo].[InvoiceShopDetail] ([id], [AccountId], [ProductId], [SellID], [ProductQuantity], [ProductSize], [OrderShopId]) VALUES (1084, 1050, 11, 8, 2, N'small', 1121)
INSERT [dbo].[InvoiceShopDetail] ([id], [AccountId], [ProductId], [SellID], [ProductQuantity], [ProductSize], [OrderShopId]) VALUES (1085, 1050, 19, 8, 2, N'small', 1122)
INSERT [dbo].[InvoiceShopDetail] ([id], [AccountId], [ProductId], [SellID], [ProductQuantity], [ProductSize], [OrderShopId]) VALUES (1086, 1052, 15, 8, 1, N'small', 1123)
INSERT [dbo].[InvoiceShopDetail] ([id], [AccountId], [ProductId], [SellID], [ProductQuantity], [ProductSize], [OrderShopId]) VALUES (1087, 1052, 27, 9, 1, N'small', 1124)
INSERT [dbo].[InvoiceShopDetail] ([id], [AccountId], [ProductId], [SellID], [ProductQuantity], [ProductSize], [OrderShopId]) VALUES (1088, 1053, 11, 8, 2, N'medium', 1125)
INSERT [dbo].[InvoiceShopDetail] ([id], [AccountId], [ProductId], [SellID], [ProductQuantity], [ProductSize], [OrderShopId]) VALUES (1089, 1048, 11, 8, 1, N'medium', 1126)
INSERT [dbo].[InvoiceShopDetail] ([id], [AccountId], [ProductId], [SellID], [ProductQuantity], [ProductSize], [OrderShopId]) VALUES (1090, 1053, 11, 8, 1, N'small', 1127)
INSERT [dbo].[InvoiceShopDetail] ([id], [AccountId], [ProductId], [SellID], [ProductQuantity], [ProductSize], [OrderShopId]) VALUES (1091, 1053, 11, 8, 2, N'small', 1128)
INSERT [dbo].[InvoiceShopDetail] ([id], [AccountId], [ProductId], [SellID], [ProductQuantity], [ProductSize], [OrderShopId]) VALUES (1092, 1053, 11, 8, 2, N'small', 1129)
INSERT [dbo].[InvoiceShopDetail] ([id], [AccountId], [ProductId], [SellID], [ProductQuantity], [ProductSize], [OrderShopId]) VALUES (1093, 1053, 11, 8, 2, N'small', 1130)
INSERT [dbo].[InvoiceShopDetail] ([id], [AccountId], [ProductId], [SellID], [ProductQuantity], [ProductSize], [OrderShopId]) VALUES (1094, 1053, 11, 8, 2, N'small', 1131)
SET IDENTITY_INSERT [dbo].[InvoiceShopDetail] OFF
GO
SET IDENTITY_INSERT [dbo].[InvoiceStatus] ON 

INSERT [dbo].[InvoiceStatus] ([id], [status]) VALUES (1, N'Chờ xác nhận                                   ')
INSERT [dbo].[InvoiceStatus] ([id], [status]) VALUES (2, N'Đang lấy hàng                                   ')
INSERT [dbo].[InvoiceStatus] ([id], [status]) VALUES (3, N'Đang giao hàng                                   ')
INSERT [dbo].[InvoiceStatus] ([id], [status]) VALUES (4, N'Đã giao                                          ')
INSERT [dbo].[InvoiceStatus] ([id], [status]) VALUES (5, N'Hủy đơn                                          ')
SET IDENTITY_INSERT [dbo].[InvoiceStatus] OFF
GO
SET IDENTITY_INSERT [dbo].[Product] ON 

INSERT [dbo].[Product] ([id], [name], [image], [price], [title], [description], [cateID], [sell_ID], [model], [color], [delivery], [image2], [image3], [image4]) VALUES (11, N'GIÀY NIKE AIR MAX AP NAM - XÁM XANH _ Baocao', N'https://myshoes.vn/image/cache/catalog/nike1/NIKE-CU4826_003_A_PREM-550x550.jpg', CAST(182000 AS Decimal(18, 0)), N'GIÃY NIKE AIR MAX AP NAM - XÃM XANH', N'Chưa có một đôi giày thể thao nào đóng vai trò quan trọng trong thành công của Nike như Air Max 1 . Đối với Nike, Air Max đã đi vào lịch sử như một thiết kế quan trọng và sáng tạo giúp nâng tầm thương hiệu của hãng.', 1, 8, N'G87', N'Gray', N'Hải Phòng', N'https://myshoes.vn/image/cache/catalog/nike1/NIKE-CU4826_003_C_PREM-550x550.jpg', N'https://myshoes.vn/image/cache/catalog/nike1/NIKE-CU4826_003_D_PREM-550x550.jpg', N'https://myshoes.vn/image/cache/catalog/nike1/NIKE-CU4826_003_F_PREM-550x550.jpg')
INSERT [dbo].[Product] ([id], [name], [image], [price], [title], [description], [cateID], [sell_ID], [model], [color], [delivery], [image2], [image3], [image4]) VALUES (15, N'Adidas Ultraboost 4.0 -2', N'https://product.hstatic.net/1000282067/product/giay_ultraboost_mau_xanh_da_troi_g54002_e902370c1de04294ad2602df86bc7c7c_1024x1024.jpg', CAST(156000 AS Decimal(18, 0)), N'Adidas Ultraboost 4.0', N'KIỂM SOÁT LỰC KHI CHẠM ĐẤT, THOẢI MÁI TRONG TỪNG BƯỚC CHẠY.

Giày Sneaker Nam Nữ Adidas Ultraboost 4.0 FU9993 – Hàng Chính Hãng

', 2, 8, N'G87', N'Blue', N'Long An', N'https://images.solecollector.com/complex/images/fl_lossy,q_auto/c_scale,w_690,dpr_2.0/v1/dq2zuhqxoufskbl1ycjd/adidas-ultra-boost-4-navy', N'https://product.hstatic.net/1000282067/product/529360_01.jpg_37102ca9b517400d8159d0dd501ac79e_1024x1024.jpeg', N'https://product.hstatic.net/1000282067/product/ultraboost_shoes_blue_g54002_05_standard_bc063c8c6fa5466f868a6765dd896386_1024x1024.jpg')
INSERT [dbo].[Product] ([id], [name], [image], [price], [title], [description], [cateID], [sell_ID], [model], [color], [delivery], [image2], [image3], [image4]) VALUES (19, N'Giày Nike Air Max SC Nam- Đen Trắng', N'https://myshoes.vn/image/cache/catalog/nike/24.10/giay-nike-air-max-sc-nam-den-trang-01-550x550.jpg', CAST(190000 AS Decimal(18, 0)), N'Giày Nike Air Max SC Nam- Đen Trắng', N'mang nét huyền thoại của Nike, với bộ đệm Air Max trứ danh đây là mẫu giày có thể kết hợp với bất cứ trang phục nào mà bạn vẫn hoàn toàn tự tin trong mọi hoàn cảnh.', 2, 8, N'G68', N'Black', N'Long An', N'https://myshoes.vn/image/cache/catalog/nike/24.10/giay-nike-air-max-sc-nam-den-trang-06-550x550.jpg', N'https://myshoes.vn/image/cache/catalog/nike/24.10/giay-nike-air-max-sc-nam-den-trang-05-550x550.jpg', N'https://myshoes.vn/image/cache/catalog/nike/24.10/giay-nike-air-max-sc-nam-den-trang-04-550x550.jpg')
INSERT [dbo].[Product] ([id], [name], [image], [price], [title], [description], [cateID], [sell_ID], [model], [color], [delivery], [image2], [image3], [image4]) VALUES (20, N'Giày Nike Court Royale 2 Nam - Đen', N'https://myshoes.vn/image/cache/catalog/nike/22.10/Nike-Court-Royale-2-Nam-den-01-550x550.jpg', CAST(490000 AS Decimal(18, 0)), N'Giày Nike Court Royale 2 Nam - Đen', N'', 2, 8, N'G68', N'Black', N'Long An', N'https://myshoes.vn/image/cache/catalog/nike/22.10/Nike-Court-Royale-2-Nam-den-06-550x550.jpg', N'https://myshoes.vn/image/cache/catalog/nike/22.10/Nike-Court-Royale-2-Nam-den-05-550x550.jpg', N'https://myshoes.vn/image/cache/catalog/nike/22.10/Nike-Court-Royale-2-Nam-den-04-550x550.jpg')
INSERT [dbo].[Product] ([id], [name], [image], [price], [title], [description], [cateID], [sell_ID], [model], [color], [delivery], [image2], [image3], [image4]) VALUES (21, N'Giày Nike Air Max AP Nam - Đen', N'https://myshoes.vn/image/cache/catalog/nike/22.10/giay-Nike-Air-Max-AP-nam-den-01-550x550.jpg', CAST(690000 AS Decimal(18, 0)), N'Giày Nike Air Max AP Nam - Đen', N'', 2, 8, N'G68', N'Black', N'Long An', N'https://myshoes.vn/image/cache/catalog/nike/22.10/giay-Nike-Air-Max-AP-nam-den-06-550x550.jpg', N'https://myshoes.vn/image/cache/catalog/nike/22.10/giay-Nike-Air-Max-AP-nam-den-05-550x550.jpg', N'https://myshoes.vn/image/cache/catalog/nike/22.10/giay-Nike-Air-Max-AP-nam-den-04-550x550.jpg')
INSERT [dbo].[Product] ([id], [name], [image], [price], [title], [description], [cateID], [sell_ID], [model], [color], [delivery], [image2], [image3], [image4]) VALUES (22, N'Giày Nike Renew Retaliation TR 3 Nam - Đen Trắng ', N'https://myshoes.vn/image/cache/catalog/nike1/giay-Nike-Renew-Retaliation-TR-3-01-550x550.jpg', CAST(890000 AS Decimal(18, 0)), N'Giày Nike Renew Retaliation TR 3 Nam - Đen Trắng', N'', 2, 8, N'G68', N'Black', N'Long An', N'https://myshoes.vn/image/cache/catalog/nike1/giay-Nike-Renew-Retaliation-TR-3-03-550x550.jpg', N'https://myshoes.vn/image/cache/catalog/nike1/giay-Nike-Renew-Retaliation-TR-3-02-550x550.jpg', N'https://myshoes.vn/image/cache/catalog/nike1/giay-Nike-Renew-Retaliation-TR-3-05-550x550.jpg')
INSERT [dbo].[Product] ([id], [name], [image], [price], [title], [description], [cateID], [sell_ID], [model], [color], [delivery], [image2], [image3], [image4]) VALUES (24, N'Giày Nike Air Zoom Structure 24 Nam - Trắng', N'https://myshoes.vn/image/cache/catalog/nike/10.11/giay-nike-air-zoom-structure-24-nam-trang-01-550x550.jpg', CAST(390000 AS Decimal(18, 0)), N'Giày Nike Air Zoom Structure 24 Nam - Trắng', N'Ở phiên bản này được các chuyên gia đánh giá cao phần bởi sự ổn định nhưng vẫn có cảm giác êm chân trong suốt quá trình sử dụng. Bạn yêu thích thể thao và đang tìm kiếm cho mình một đôi giày để tập luyện thì Nike Air Zoom Structure 24 sẽ là một lựa chọn hoàn toàn chính xác. Bởi một đôi giày tốt sẽ là một người đồng hành quan trọng trong cả 1 quá trình.', 2, 8, N'G68', N'White', N'Long An', N'https://myshoes.vn/image/cache/catalog/nike/10.11/giay-nike-air-zoom-structure-24-nam-trang-02-550x550.jpg', N'https://myshoes.vn/image/cache/catalog/nike/10.11/giay-nike-air-zoom-structure-24-nam-trang-03-550x550.jpg', N'https://myshoes.vn/image/cache/catalog/nike/10.11/giay-nike-air-zoom-structure-24-nam-trang-04-550x550.jpg')
INSERT [dbo].[Product] ([id], [name], [image], [price], [title], [description], [cateID], [sell_ID], [model], [color], [delivery], [image2], [image3], [image4]) VALUES (25, N'Giày Nike Court Royale 2 Nam Nữ - Trắng', N'https://myshoes.vn/image/cache/catalog/nike/22.10/Nike-Court-Royale-2-Nam-trang-01-550x550.jpg', CAST(490000 AS Decimal(18, 0)), N'Giày Nike Court Royale 2 Nam Nữ - Trắng', N'Mua Hàng Ngay', 2, 8, N'G68', N'White', N'Long An', N'https://myshoes.vn/image/cache/catalog/nike/22.10/Nike-Court-Royale-2-Nam-trang-06-550x550.jpg', N'https://myshoes.vn/image/cache/catalog/nike/22.10/Nike-Court-Royale-2-Nam-trang-05-550x550.jpg', N'https://myshoes.vn/image/cache/catalog/nike/22.10/Nike-Court-Royale-2-Nam-trang-02-550x550.jpg')
INSERT [dbo].[Product] ([id], [name], [image], [price], [title], [description], [cateID], [sell_ID], [model], [color], [delivery], [image2], [image3], [image4]) VALUES (26, N'Giày Nike Revolution 5 Nữ - Trắng Full', N'https://myshoes.vn/image/cache/data/nike%202019/nike/nike%202021/giay-nike-revolution-5-nu-trang-full-01-550x550.jpg', CAST(590000 AS Decimal(18, 0)), N'Giày Nike Revolution 5 Nữ - Trắng Full', N'', 2, 8, N'G68', N'White', N'Long An', N'https://myshoes.vn/image/cache/data/nike%202019/nike/nike%202021/giay-nike-revolution-5-nu-trang-full-06-550x550.jpg', N'https://myshoes.vn/image/cache/data/nike%202019/nike/nike%202021/giay-nike-revolution-5-nu-trang-full-02-550x550.jpg', N'https://myshoes.vn/image/cache/data/nike%202019/nike/nike%202021/giay-nike-revolution-5-nu-trang-full-04-550x550.jpg')
INSERT [dbo].[Product] ([id], [name], [image], [price], [title], [description], [cateID], [sell_ID], [model], [color], [delivery], [image2], [image3], [image4]) VALUES (27, N'Giày Nike Air Max Zero Essential Nam Trắng Full', N'https://myshoes.vn/image/cache/data/nike%202019/3.5.19/giay-nike-air-max-zero-essential-nam-trang-full-01-550x550.jpg', CAST(690000 AS Decimal(18, 0)), N'Giày Nike Air Max Zero Essential Nam Trắng Full', N'', 2, 9, N'G68', N'White', N'Long An', N'https://myshoes.vn/image/cache/data/nike%202019/3.5.19/giay-nike-air-max-zero-essential-nam-trang-full-03-550x550.jpg', N'https://myshoes.vn/image/cache/data/nike%202019/3.5.19/giay-nike-air-max-zero-essential-nam-trang-full-05-550x550.jpg', N'https://myshoes.vn/image/cache/data/nike%202019/3.5.19/giay-nike-air-max-zero-essential-nam-trang-full-04-550x550.jpg')
INSERT [dbo].[Product] ([id], [name], [image], [price], [title], [description], [cateID], [sell_ID], [model], [color], [delivery], [image2], [image3], [image4]) VALUES (28, N'Giày Nike Court Majestic Leather Nam Trắng Đen 2', N'https://myshoes.vn/image/cache/data/nike%202019/3.5.19/giay-nike-court-majestic-leather-nam-trang-den-01-550x550.jpg', CAST(890000 AS Decimal(18, 0)), N'Giày Nike Court Majestic Leather Nam Trắng Đen', N'- Giày Nike Court Royale SL chính hãng 100%. Phát hiện hàng Fake đền tiền gấp 2 lần giá sản phẩm.', 1, 9, N'G68', N'White', N'Long An', N'https://myshoes.vn/image/cache/data/nike%202019/3.5.19/giay-nike-court-majestic-leather-nam-trang-den-05-550x550.jpg', N'https://myshoes.vn/image/cache/data/nike%202019/3.5.19/giay-nike-court-majestic-leather-nam-trang-den-06-550x550.jpg', N'https://myshoes.vn/image/cache/data/nike%202019/3.5.19/giay-nike-court-majestic-leather-nam-trang-den-04-550x550.jpg')
INSERT [dbo].[Product] ([id], [name], [image], [price], [title], [description], [cateID], [sell_ID], [model], [color], [delivery], [image2], [image3], [image4]) VALUES (29, N'Giày Puma Smash V2 L Nam Xám', N'https://myshoes.vn/image/cache/data/PUMA%202019/thang7/giay-puma-smash-v2-l-nam-xam-01-550x550.jpg', CAST(590000 AS Decimal(18, 0)), N'Giày Puma Smash V2 L Nam Xám', N'', 2, 9, N'G68', N'Gray', N'Long An', N'https://myshoes.vn/image/cache/data/PUMA%202019/thang7/giay-puma-smash-v2-l-nam-xam-07-550x550.jpg', N'https://myshoes.vn/image/cache/data/PUMA%202019/thang7/giay-puma-smash-v2-l-nam-xam-02-550x550.jpg', N'https://myshoes.vn/image/cache/data/PUMA%202019/thang7/giay-puma-smash-v2-l-nam-xam-01-80x80.jpg')
INSERT [dbo].[Product] ([id], [name], [image], [price], [title], [description], [cateID], [sell_ID], [model], [color], [delivery], [image2], [image3], [image4]) VALUES (30, N'Giày Lacoste Europa 120 Nam - Xám Trắng', N'https://myshoes.vn/image/cache/data/lacoste%202019/thang%206/lc/giay-lacoste-europa-120-nam-xam-trang-01-550x550.jpg', CAST(590000 AS Decimal(18, 0)), N'Giày Lacoste Europa 120 Nam - Xám Trắng', N'', 2, 9, N'G68', N'Gray', N'Long An', N'https://myshoes.vn/image/cache/data/lacoste%202019/thang%206/lc/giay-lacoste-europa-120-nam-xam-trang-05-550x550.jpg', N'https://myshoes.vn/image/cache/data/lacoste%202019/thang%206/lc/giay-lacoste-europa-120-nam-xam-trang-04-550x550.jpg', N'https://myshoes.vn/image/cache/data/lacoste%202019/thang%206/lc/giay-lacoste-europa-120-nam-xam-trang-03-550x550.jpg')
INSERT [dbo].[Product] ([id], [name], [image], [price], [title], [description], [cateID], [sell_ID], [model], [color], [delivery], [image2], [image3], [image4]) VALUES (31, N'Giày Nike Air Zoom Structure 23 Nam - Xám', N'https://myshoes.vn/image/cache/catalog/nike/25.10/giay-nike-structure-23-nam-xam-01-550x550.jpg', CAST(90000 AS Decimal(18, 0)), N'Giày Nike Air Zoom Structure 23 Nam - Xám', N'', 2, 9, N'G68', N'Gray', N'Long An', N'https://myshoes.vn/image/cache/catalog/nike/25.10/giay-nike-structure-23-nam-xam-06-550x550.jpg', N'https://myshoes.vn/image/cache/catalog/nike/25.10/giay-nike-structure-23-nam-xam-05-550x550.jpg', N'https://myshoes.vn/image/cache/catalog/nike/25.10/giay-nike-structure-23-nam-xam-04-550x550.jpg')
INSERT [dbo].[Product] ([id], [name], [image], [price], [title], [description], [cateID], [sell_ID], [model], [color], [delivery], [image2], [image3], [image4]) VALUES (32, N'Giày Nike Air Max AP Nam - Xám Xanh', N'https://myshoes.vn/image/cache/catalog/nike1/NIKE-CU4826_003_A_PREM-550x550.jpg', CAST(690000 AS Decimal(18, 0)), N'Giày Nike Air Max AP Nam - Xám Xanh', N'', 2, 9, N'G68', N'Gray', N'Long An', N'https://myshoes.vn/image/cache/catalog/nike1/NIKE-CU4826_003_C_PREM-550x550.jpg', N'https://myshoes.vn/image/cache/catalog/nike1/NIKE-CU4826_003_D_PREM-550x550.jpg', N'https://myshoes.vn/image/cache/catalog/nike1/NIKE-CU4826_003_E_PREM-550x550.jpg')
INSERT [dbo].[Product] ([id], [name], [image], [price], [title], [description], [cateID], [sell_ID], [model], [color], [delivery], [image2], [image3], [image4]) VALUES (33, N'Giày adidas Edge Lux Nữ - Xám', N'https://myshoes.vn/image/cache/data/adidas%202019/22.3.19/giay-adidas-edge-lux-nu-xam-01-550x550.jpg', CAST(90000 AS Decimal(18, 0)), N'Giày adidas Edge Lux Nữ - Xám', N'* Myshoes.vn cam kết:', 2, 9, N'G68', N'Gray', N'Long An', N'https://myshoes.vn/image/cache/data/adidas%202019/22.3.19/giay-adidas-edge-lux-nu-xam-06-550x550.jpg', N'https://myshoes.vn/image/cache/data/adidas%202019/22.3.19/giay-adidas-edge-lux-nu-xam-05-550x550.jpg', N'https://myshoes.vn/image/cache/data/adidas%202019/22.3.19/giay-adidas-edge-lux-nu-xam-04-550x550.jpg')
INSERT [dbo].[Product] ([id], [name], [image], [price], [title], [description], [cateID], [sell_ID], [model], [color], [delivery], [image2], [image3], [image4]) VALUES (34, N'Giày adidas Super Nova Nữ Xám', N'https://myshoes.vn/image/cache/data/adidas%202019/22.3.19/giay-adidas-super-nova-nu-xam-01-550x550.jpg', CAST(390000 AS Decimal(18, 0)), N'Giày adidas Super Nova Nữ Xám', N'', 2, 9, N'G68', N'Gray', N'Long An', N'https://myshoes.vn/image/cache/data/adidas%202019/22.3.19/giay-adidas-super-nova-nu-xam-02-550x550.jpg', N'https://myshoes.vn/image/cache/data/adidas%202019/22.3.19/giay-adidas-super-nova-nu-xam-03-550x550.jpg', N'https://myshoes.vn/image/cache/data/adidas%202019/22.3.19/giay-adidas-super-nova-nu-xam-04-550x550.jpg')
INSERT [dbo].[Product] ([id], [name], [image], [price], [title], [description], [cateID], [sell_ID], [model], [color], [delivery], [image2], [image3], [image4]) VALUES (35, N'Giày Nike Epic React Flyknit 2 Nam - Xám Xanh', N'https://myshoes.vn/image/cache/data/nike%202019/7.6.19/giay-nike-epic-react-2%20flyknit-nam-xam-xanh-01-550x550.jpg', CAST(790000 AS Decimal(18, 0)), N'Giày Nike Epic React Flyknit 2 Nam - Xám Xanh', N'* Myshoes.vn cam kết:', 2, 9, N'G68', N'Gray', N'Long An', N'https://myshoes.vn/image/cache/data/nike%202019/7.6.19/giay-nike-epic-react-2%20flyknit-nam-xam-xanh-06-550x550.jpg', N'https://myshoes.vn/image/cache/data/nike%202019/7.6.19/giay-nike-epic-react-2%20flyknit-nam-xam-xanh-05-550x550.jpg', N'https://myshoes.vn/image/cache/data/nike%202019/7.6.19/giay-nike-epic-react-2%20flyknit-nam-xam-xanh-04-550x550.jpg')
INSERT [dbo].[Product] ([id], [name], [image], [price], [title], [description], [cateID], [sell_ID], [model], [color], [delivery], [image2], [image3], [image4]) VALUES (36, N'Giày Nike Air Zoom Pegasus 37 Nam - Đen Vàng', N'https://myshoes.vn/image/cache/data/nike%202019/nike/giay-nike-air-zoom-pegasus-37-nam-den-vang-01-550x550.jpg', CAST(790000 AS Decimal(18, 0)), N'Giày Nike Air Zoom Pegasus 37 Nam - Đen Vàng', N'Tiếp theo, phần Upper đã được cải tiến, thay thế bằng một lớp Mesh khác hoàn toàn trước kia. Lớp lưới này nhẹ hơn, dày hơn nhưng tuyệt đối vẫn giữ được sự thông thoáng, thoải mái trong từng mọi hoạt động của bàn chân. Lưỡi gà, cũng được Cut Out tinh tế để fit vừa vặn với các kiểu cổ chân khác nhau đồng thời tăng khả năng điều chỉnh đến một cách linh hoạt nhất.', 2, 11, N'G68', N'Black', N'Long An', N'https://myshoes.vn/image/cache/data/nike%202019/nike/giay-nike-air-zoom-pegasus-37-nam-den-vang-04-550x550.jpg', N'https://myshoes.vn/image/cache/data/nike%202019/nike/giay-nike-air-zoom-pegasus-37-nam-den-vang-06-550x550.jpg', N'https://myshoes.vn/image/cache/data/nike%202019/nike/giay-nike-air-zoom-pegasus-37-nam-den-vang-05-550x550.jpg')
INSERT [dbo].[Product] ([id], [name], [image], [price], [title], [description], [cateID], [sell_ID], [model], [color], [delivery], [image2], [image3], [image4]) VALUES (37, N'Giày Thể Thao Asics GEL-Nimbus® 19 Nam - Xanh vàng', N'https://myshoes.vn/image/cache/data/product10/8.8.17/giay-asics-gel-nimbus-19-nam-xanh-vang-0-550x550.jpg', CAST(490000 AS Decimal(18, 0)), N'Giày Thể Thao Asics GEL-Nimbus® 19 Nam - Xanh vàng', N'Giày Thể Thao Asics GEL-Nimbus® 19 là đôi giày được ứng dụng công nghệ FlyteFoam™ sau khi được thay đổi hoàn toàn, mang lại sự thoải mái tối ưu nhất và một bộ đệm đàn hồi cho bàn chân người sử dụng. Upper lưới dệt 3D độc đáo, không đường may, có thể linh hoạt theo từng chuyển động chân một cách tự nhiên nhất.', 2, 11, N'G68', N'Blue
', N'Long An', N'https://myshoes.vn/image/cache/data/product10/8.8.17/giay-asics-gel-nimbus-19-nam-xanh-vang-04-550x550.jpg', N'https://myshoes.vn/image/cache/data/product10/8.8.17/giay-asics-gel-nimbus-19-nam-xanh-vang-02-550x550.jpg', N'https://myshoes.vn/image/cache/data/product10/8.8.17/giay-asics-gel-nimbus-19-nam-xanh-vang-06-550x550.jpg')
INSERT [dbo].[Product] ([id], [name], [image], [price], [title], [description], [cateID], [sell_ID], [model], [color], [delivery], [image2], [image3], [image4]) VALUES (38, N'Giày Bóng Đá Nam Bitis Hunter Football', N'https://product.hstatic.net/1000230642/product/02400vag__1__5d559f914caf4864ad99a37c18cc1a1b_1024x1024.jpg', CAST(535000 AS Decimal(18, 0)), N'Giày Bóng Đá Nam Biti Hunter Football', N'Với thiết kế năng động, Giày bóng đá Biti’s Hunter được tung ra với 5 màu sắc nổi bật tạo điểm nhấn trên sân đấu.', 3, 11, N'G39', N'Yellow', N'Ho Chi Minh', N'https://product.hstatic.net/1000230642/product/02400vag__3__3a83e45335054285a27fba37cafb23c1_1024x1024.jpg', N'https://product.hstatic.net/1000230642/product/02400vag__4__d3693ef3babe4fc3a2908d8eb2df6e3b_1024x1024.jpg', N'https://product.hstatic.net/1000230642/product/02400vag__4__d3693ef3babe4fc3a2908d8eb2df6e3b_1024x1024.jpg')
INSERT [dbo].[Product] ([id], [name], [image], [price], [title], [description], [cateID], [sell_ID], [model], [color], [delivery], [image2], [image3], [image4]) VALUES (40, N'GIÀY ADIDAS ADVANTAGE BASE NAM - TRẮNG XANH', N'https://myshoes.vn/image/cache/data/adidas/giay-adidas-advantage-base-nam-trang-xanh-01.html-550x550.jpg', CAST(140000 AS Decimal(18, 0)), N'GIÀY ADIDAS ADVANTAGE BASE NAM - TRẮNG XANH', N'Được thừa hưởng lối thiết kế của đàn anh Giày adidas VS Advantage CL song vẫn có thêm nhiều điểm mới cải thiện.Với thiết kế đơn giản nhưng lại vô cùng thanh lịch. Phần Upper của giày được các nhà thiết kế của Adidas sử dụng bằng da bạn tăng thêm độ lịch lãm khi mang. Với các đường kim mũi chỉ hoàn hảo đến từng chi tiết giúp bạn tự tin sải bước. Đây quả thật là một lựa chọn mà các phải mạnh không nên bỏ lỡ. ', 1, 11, N'G76', N'White', N'Nha Trang', N'https://myshoes.vn/image/cache/data/adidas/giay-adidas-advantage-base-nam-trang-xanh-02.html-550x550.jpg', N'https://myshoes.vn/image/cache/data/adidas/giay-adidas-advantage-base-nam-trang-xanh-04.html-550x550.jpg', N'https://myshoes.vn/image/cache/data/adidas/giay-adidas-advantage-base-nam-trang-xanh-03.html-550x550.jpg')
INSERT [dbo].[Product] ([id], [name], [image], [price], [title], [description], [cateID], [sell_ID], [model], [color], [delivery], [image2], [image3], [image4]) VALUES (41, N'GIÀY ADIDAS SUPER COURT NỮ TRẮNG FULL', N'https://myshoes.vn/image/cache/data/adidas%202019/22.3.19/giay-adidas-super-court-nu-trang-full-01-550x550.jpg', CAST(189000 AS Decimal(18, 0)), N'GIÀY ADIDAS SUPER COURT NỮ TRẮNG FULL', N'Bạn đang tìm kiếm cho mình một đôi giày sẽ có thể trường tồn với thời gian, không bị lỗi mốt theo năm tháng. Adidas Super Court là 1 lựa chọn không nên bỏ lỡ . Kiểu dáng thiết kế trẻ trung, màu sắc tươi sắc nên Adidas Super Court sẽ là kiểu giày giúp bạn dễ dàng chuyển từ ''bánh bèo" sang '' cá tính'' trong một nốt nhạc.', 1, 11, N'G89', N'White', N'Nha Trang', N'https://myshoes.vn/image/cache/data/giay-adidas-super-court-nu-trang-full-05-550x550.jpg', N'https://myshoes.vn/image/cache/data/giay-adidas-super-court-nu-trang-full-03-550x550.jpg', N'https://myshoes.vn/image/cache/data/giay-adidas-super-court-nu-trang-full-02-550x550.jpg')
INSERT [dbo].[Product] ([id], [name], [image], [price], [title], [description], [cateID], [sell_ID], [model], [color], [delivery], [image2], [image3], [image4]) VALUES (42, N'GIÀY ADIDAS SUPER COURT NỮ TRẮNG FULL', N'https://myshoes.vn/image/cache/data/adidas%202019/22.3.19/giay-adidas-super-court-nu-trang-full-01-550x550.jpg', CAST(190000 AS Decimal(18, 0)), N'GIÀY ADIDAS SUPER COURT NỮ TRẮNG FULL', N'Bạn đang tìm kiếm cho mình một đôi giày sẽ có thể trường tồn với thời gian, không bị lỗi mốt theo năm tháng. Adidas Super Court là 1 lựa chọn không nên bỏ lỡ . Kiểu dáng thiết kế trẻ trung, màu sắc tươi sắc nên Adidas Super Court sẽ là kiểu giày giúp bạn dễ dàng chuyển từ ''bánh bèo" sang '' cá tính'' trong một nốt nhạc.', 1, 11, N'G76', N'White', N'Nha Trang', N'https://myshoes.vn/image/cache/data/giay-adidas-super-court-nu-trang-full-05-550x550.jpg', N'https://myshoes.vn/image/cache/data/giay-adidas-super-court-nu-trang-full-03-550x550.jpg', N'https://myshoes.vn/image/cache/data/giay-adidas-super-court-nu-trang-full-02-550x550.jpg')
INSERT [dbo].[Product] ([id], [name], [image], [price], [title], [description], [cateID], [sell_ID], [model], [color], [delivery], [image2], [image3], [image4]) VALUES (44, N'Converse Chuck Taylor All Star Renew Sock Knit', N'https://drake.vn/image/cache/catalog/Converse/GIA%CC%80Y%202/170367C/170367C-1-410x574.jpg', CAST(198000 AS Decimal(18, 0)), N'Converse Chuck Taylor All Star Renew Sock Knit', N'Converse Chuck Taylor All Star Crate Knit đã trở lại để mang sự cổ điển đến gần hơn với một tương lai không lãng phí. Kiểu dáng Chuck Taylor với phần đế cao su được làm từ Công nghệ Nike Grind kết hợp với xốp Nike và cao su tái chế. Ngoài ra, upper được làm từ chất vải Polyester với công nghệ dệt kỹ thuật tiên tiến, sợi vải được dệt từ 75% poly tái chế và 25% nilon spandex (loại sợi nhân tạo có khả năng co giãn 4 chiều). ', 4, 11, N'G87', N'Gray', N'Nha Trang', N'https://drake.vn/image/cache/catalog/Converse/GIA%CC%80Y%202/170367C/170367C-8-410x574.jpg', N'https://drake.vn/image/cache/catalog/Converse/GIA%CC%80Y%202/170367C/170367C-3-410x574.jpg', N'https://drake.vn/image/cache/catalog/Converse/GIA%CC%80Y%202/170367C/170367C-2-410x574.jpg')
INSERT [dbo].[Product] ([id], [name], [image], [price], [title], [description], [cateID], [sell_ID], [model], [color], [delivery], [image2], [image3], [image4]) VALUES (45, N'Hunter Layered Upper', N'https://product.hstatic.net/1000230642/product/dsc_0024_a6274cb2948449c785a7269de5fa6349_1024x1024.jpg', CAST(800000 AS Decimal(18, 0)), N'Hunter Layered Upper', N'Sản phẩm rất tốt đi thoải mái', 3, 11, N'G68', N'White', N'Nha Trang', N'https://product.hstatic.net/1000230642/product/dsc_0025_703ee09f5db24cd9a0c8604cdd2592aa_1024x1024.jpg', N'https://product.hstatic.net/1000230642/product/dsc_0026_60087f45b9394f0682f5126309f5d3f6_1024x1024.jpg', N'https://product.hstatic.net/1000230642/product/dsc_0027_647fb72ecf3d455590cddb79c2418458_1024x1024.jpg')
INSERT [dbo].[Product] ([id], [name], [image], [price], [title], [description], [cateID], [sell_ID], [model], [color], [delivery], [image2], [image3], [image4]) VALUES (46, N'Hunter Layered Upper', N'https://product.hstatic.net/1000230642/product/02800den__2__f00d5533d44b47ac84212239f93ebac6_1024x1024.jpg', CAST(767000 AS Decimal(18, 0)), N'Hunter Layered Upper', N'Sản phẩm rất tốt đi rất thoải mái', 3, 11, N'G45', N'Black', N'Nha Trang', N'https://product.hstatic.net/1000230642/product/02800den__3__0f4c2b667bb44347ac302726b71ce9a2_1024x1024.jpg', N'https://product.hstatic.net/1000230642/product/02800den__4__ef90bd83d09942fd87d72165e5ce2fc7_1024x1024.jpg', N'https://product.hstatic.net/1000230642/product/02800den__5__fb6f5367106342348f60cd7b9b70dee6_1024x1024.jpg')
SET IDENTITY_INSERT [dbo].[Product] OFF
GO
SET IDENTITY_INSERT [dbo].[Request] ON 

INSERT [dbo].[Request] ([id], [sell_ID], [productID], [content], [status]) VALUES (18, 8, 11, N'Sản phẩm bị lỗi ', 0)
INSERT [dbo].[Request] ([id], [sell_ID], [productID], [content], [status]) VALUES (19, 8, 15, N'Sản phẩm bị lỗi lần 2 ', 0)
INSERT [dbo].[Request] ([id], [sell_ID], [productID], [content], [status]) VALUES (20, 11, 42, N'yêu cầu xóa sản phẩm do lỗi hình ảnh ', 0)
INSERT [dbo].[Request] ([id], [sell_ID], [productID], [content], [status]) VALUES (21, 9, 29, N'Xóa nhanh', 0)
INSERT [dbo].[Request] ([id], [sell_ID], [productID], [content], [status]) VALUES (22, 11, 36, N'sửa giá ', 0)
INSERT [dbo].[Request] ([id], [sell_ID], [productID], [content], [status]) VALUES (23, 11, 36, N'yêu cầu xóa ', 0)
SET IDENTITY_INSERT [dbo].[Request] OFF
GO
SET IDENTITY_INSERT [dbo].[Review] ON 

INSERT [dbo].[Review] ([accountID], [productID], [contentReview], [dateReview], [maReview]) VALUES (1014, 37, N'alooooo', CAST(N'2022-11-08' AS Date), 33)
SET IDENTITY_INSERT [dbo].[Review] OFF
GO
SET IDENTITY_INSERT [dbo].[Seller] ON 

INSERT [dbo].[Seller] ([sell_ID], [name_Shop], [phone_Shop], [email_Shop], [uID]) VALUES (8, N'Shop 1', N'0773696410          ', N'huutrong1101@gmail.com', 1041)
INSERT [dbo].[Seller] ([sell_ID], [name_Shop], [phone_Shop], [email_Shop], [uID]) VALUES (9, N'Shop 2 ', N'0773696410          ', N'huutrong1101@gmail.com', 1043)
INSERT [dbo].[Seller] ([sell_ID], [name_Shop], [phone_Shop], [email_Shop], [uID]) VALUES (11, N'Shop 3 ', N'0773696410          ', N'huutrong1101@gmail.com', 1045)
SET IDENTITY_INSERT [dbo].[Seller] OFF
GO
INSERT [dbo].[SoLuongDaBan] ([productID], [soLuongDaBan]) VALUES (11, 381)
INSERT [dbo].[SoLuongDaBan] ([productID], [soLuongDaBan]) VALUES (15, 43)
INSERT [dbo].[SoLuongDaBan] ([productID], [soLuongDaBan]) VALUES (19, 53)
INSERT [dbo].[SoLuongDaBan] ([productID], [soLuongDaBan]) VALUES (20, 14)
INSERT [dbo].[SoLuongDaBan] ([productID], [soLuongDaBan]) VALUES (21, 7)
INSERT [dbo].[SoLuongDaBan] ([productID], [soLuongDaBan]) VALUES (24, 10)
INSERT [dbo].[SoLuongDaBan] ([productID], [soLuongDaBan]) VALUES (46, 17)
INSERT [dbo].[SoLuongDaBan] ([productID], [soLuongDaBan]) VALUES (45, 45)
INSERT [dbo].[SoLuongDaBan] ([productID], [soLuongDaBan]) VALUES (41, 2)
INSERT [dbo].[SoLuongDaBan] ([productID], [soLuongDaBan]) VALUES (38, 11)
INSERT [dbo].[SoLuongDaBan] ([productID], [soLuongDaBan]) VALUES (22, 102)
INSERT [dbo].[SoLuongDaBan] ([productID], [soLuongDaBan]) VALUES (27, 1)
GO
SET IDENTITY_INSERT [dbo].[Supplier] ON 

INSERT [dbo].[Supplier] ([idSupplier], [nameSupplier], [phoneSupplier], [emailSupplier], [addressSupplier], [cateID]) VALUES (1, N'Cty TNHH D.ADDIDAS', N'091121786', N'cty@gmail.com', N'so 1 Vo Van Ngan', 1)
INSERT [dbo].[Supplier] ([idSupplier], [nameSupplier], [phoneSupplier], [emailSupplier], [addressSupplier], [cateID]) VALUES (2, N'Cty TNHH D.NIKE', N'091121786', N'cty@gmail.com', N'so 2 Vo Van Ngan', 2)
INSERT [dbo].[Supplier] ([idSupplier], [nameSupplier], [phoneSupplier], [emailSupplier], [addressSupplier], [cateID]) VALUES (3, N'Cty TNHH D.BITIS', N'091121786', N'cty@gmail.com', N'so 3 Vo Van Ngan', 3)
INSERT [dbo].[Supplier] ([idSupplier], [nameSupplier], [phoneSupplier], [emailSupplier], [addressSupplier], [cateID]) VALUES (4, N'Cty TNHH D.CONVERSE', N'091121786', N'cty@gmail.com', N'so 4 Vo Van Ngan', 4)
SET IDENTITY_INSERT [dbo].[Supplier] OFF
GO
INSERT [dbo].[TongChiTieuBanHang] ([userID], [TongChiTieu], [TongBanHang]) VALUES (1041, 959200, 362000)
INSERT [dbo].[TongChiTieuBanHang] ([userID], [TongChiTieu], [TongBanHang]) VALUES (1014, 94801.799999999974, 4000)
INSERT [dbo].[TongChiTieuBanHang] ([userID], [TongChiTieu], [TongBanHang]) VALUES (1052, 846000, 156000)
INSERT [dbo].[TongChiTieuBanHang] ([userID], [TongChiTieu], [TongBanHang]) VALUES (1053, 2002000, 364000)
INSERT [dbo].[TongChiTieuBanHang] ([userID], [TongChiTieu], [TongBanHang]) VALUES (1050, 926000, 182000)
INSERT [dbo].[TongChiTieuBanHang] ([userID], [TongChiTieu], [TongBanHang]) VALUES (1045, 5842000, 181000)
INSERT [dbo].[TongChiTieuBanHang] ([userID], [TongChiTieu], [TongBanHang]) VALUES (1048, 909000, 181000)
GO
INSERT [dbo].[TongChiTieuShop] ([sellID], [TongBanHang]) VALUES (8, CAST(3084000 AS Decimal(18, 0)))
INSERT [dbo].[TongChiTieuShop] ([sellID], [TongBanHang]) VALUES (9, CAST(690000 AS Decimal(18, 0)))
GO
SET IDENTITY_INSERT [dbo].[WishList] ON 

INSERT [dbo].[WishList] ([accountID], [productID], [maCart]) VALUES (1036, 1, 1)
SET IDENTITY_INSERT [dbo].[WishList] OFF
GO
ALTER TABLE [dbo].[BlogReview]  WITH CHECK ADD  CONSTRAINT [FK_BlogReview_Account] FOREIGN KEY([accountID])
REFERENCES [dbo].[Account] ([uID])
GO
ALTER TABLE [dbo].[BlogReview] CHECK CONSTRAINT [FK_BlogReview_Account]
GO
ALTER TABLE [dbo].[BlogReview]  WITH CHECK ADD  CONSTRAINT [FK_BlogReview_Blog] FOREIGN KEY([blogID])
REFERENCES [dbo].[Blog] ([blog_id])
GO
ALTER TABLE [dbo].[BlogReview] CHECK CONSTRAINT [FK_BlogReview_Blog]
GO
ALTER TABLE [dbo].[Cart]  WITH CHECK ADD  CONSTRAINT [FK_Cart_Account] FOREIGN KEY([accountID])
REFERENCES [dbo].[Account] ([uID])
GO
ALTER TABLE [dbo].[Cart] CHECK CONSTRAINT [FK_Cart_Account]
GO
ALTER TABLE [dbo].[Cart]  WITH CHECK ADD  CONSTRAINT [FK_Cart_Product] FOREIGN KEY([productID])
REFERENCES [dbo].[Product] ([id])
GO
ALTER TABLE [dbo].[Cart] CHECK CONSTRAINT [FK_Cart_Product]
GO
ALTER TABLE [dbo].[Invoice]  WITH CHECK ADD  CONSTRAINT [FK_Invoice_Account] FOREIGN KEY([accountID])
REFERENCES [dbo].[Account] ([uID])
GO
ALTER TABLE [dbo].[Invoice] CHECK CONSTRAINT [FK_Invoice_Account]
GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD  CONSTRAINT [FK_Product_Category] FOREIGN KEY([cateID])
REFERENCES [dbo].[Category] ([cid])
GO
ALTER TABLE [dbo].[Product] CHECK CONSTRAINT [FK_Product_Category]
GO
ALTER TABLE [dbo].[Review]  WITH CHECK ADD  CONSTRAINT [FK_Review_Account] FOREIGN KEY([accountID])
REFERENCES [dbo].[Account] ([uID])
GO
ALTER TABLE [dbo].[Review] CHECK CONSTRAINT [FK_Review_Account]
GO
ALTER TABLE [dbo].[Review]  WITH CHECK ADD  CONSTRAINT [FK_Review_Product] FOREIGN KEY([productID])
REFERENCES [dbo].[Product] ([id])
GO
ALTER TABLE [dbo].[Review] CHECK CONSTRAINT [FK_Review_Product]
GO
ALTER TABLE [dbo].[SoLuongDaBan]  WITH CHECK ADD  CONSTRAINT [FK_SoLuongDaBan_Product] FOREIGN KEY([productID])
REFERENCES [dbo].[Product] ([id])
GO
ALTER TABLE [dbo].[SoLuongDaBan] CHECK CONSTRAINT [FK_SoLuongDaBan_Product]
GO
ALTER TABLE [dbo].[Supplier]  WITH CHECK ADD  CONSTRAINT [FK_Supplier_Category] FOREIGN KEY([cateID])
REFERENCES [dbo].[Category] ([cid])
GO
ALTER TABLE [dbo].[Supplier] CHECK CONSTRAINT [FK_Supplier_Category]
GO
ALTER TABLE [dbo].[TongChiTieuBanHang]  WITH CHECK ADD  CONSTRAINT [FK_TongChiTieuBanHang_Account] FOREIGN KEY([userID])
REFERENCES [dbo].[Account] ([uID])
GO
ALTER TABLE [dbo].[TongChiTieuBanHang] CHECK CONSTRAINT [FK_TongChiTieuBanHang_Account]
GO
/****** Object:  StoredProcedure [dbo].[proc_CapNhatSoLuongDaBan]    Script Date: 1/29/2023 10:47:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[proc_CapNhatSoLuongDaBan] @productID int, @soLuongBanThem int
as
begin
	update SoLuongDaBan set [soLuongDaBan]=[soLuongDaBan] + @soLuongBanThem where productID=@productID
end
GO
/****** Object:  StoredProcedure [dbo].[proc_CapNhatTongBanHang]    Script Date: 1/29/2023 10:47:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[proc_CapNhatTongBanHang] @sell_ID int, @banHangThem float
as
begin
	update TongChiTieuBanHang set TongBanHang= TongBanHang + @banHangThem where [userID]=@sell_ID
end
GO
/****** Object:  StoredProcedure [dbo].[proc_CapNhatTongChiTieu]    Script Date: 1/29/2023 10:47:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[proc_CapNhatTongChiTieu] @userID int, @chiTieuThem float
as
begin
	update TongChiTieuBanHang set TongChiTieu= TongChiTieu + @chiTieuThem where [userID]=@userID
end
GO
USE [master]
GO
ALTER DATABASE [QuanLyBanGiay] SET  READ_WRITE 
GO

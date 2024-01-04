
-- Category Data
SET IDENTITY_INSERT [dbo].[Categories] ON
GO
INSERT [dbo].[Categories] ([ID], [ParentCategoryID], [Name], [IsDeleted], [ModifiedOn]) VALUES (2, NULL, N'Headphones', 0, CAST(N'2020-05-16T23:57:01.480' AS DateTime))
GO
INSERT [dbo].[Categories] ([ID], [ParentCategoryID], [Name], [IsDeleted], [ModifiedOn]) VALUES (4, NULL, N'Chargers', 0, CAST(N'2020-08-06T08:08:16.297' AS DateTime))
GO
INSERT [dbo].[Categories] ([ID], [ParentCategoryID], [Name], [IsDeleted], [ModifiedOn]) VALUES (3, 4, N'Stands', 0, CAST(N'2020-08-06T08:07:55.630' AS DateTime))
GO
INSERT [dbo].[Categories] ([ID], [ParentCategoryID], [Name], [IsDeleted], [ModifiedOn]) VALUES (5, NULL, N'Cables', 0, CAST(N'2020-08-06T08:09:10.083' AS DateTime))
GO
INSERT [dbo].[Categories] ([ID], [ParentCategoryID], [Name], [IsDeleted], [ModifiedOn]) VALUES (6, NULL, N'Adapters', 0, CAST(N'2020-08-06T08:09:18.553' AS DateTime))
GO
INSERT [dbo].[Categories] ([ID], [ParentCategoryID], [Name], [IsDeleted], [ModifiedOn]) VALUES (7, 4, N'Car Chargers', 0, CAST(N'2020-08-06T08:08:30.440' AS DateTime))
GO
INSERT [dbo].[Categories] ([ID], [ParentCategoryID], [Name], [IsDeleted], [ModifiedOn]) VALUES (8, NULL, N'Powerbanks', 0, CAST(N'2020-08-06T08:09:26.257' AS DateTime))
GO
INSERT [dbo].[Categories] ([ID], [ParentCategoryID], [Name], [IsDeleted], [ModifiedOn]) VALUES (9, NULL, N'Cases', 0, CAST(N'2020-08-06T08:09:49.383' AS DateTime))
GO
INSERT [dbo].[Categories] ([ID], [ParentCategoryID], [Name], [IsDeleted], [ModifiedOn]) VALUES (10, 9, N'Grips', 0, CAST(N'2020-08-06T08:09:57.630' AS DateTime))
GO
SET IDENTITY_INSERT [dbo].[Categories] OFF
GO

-- Product data
SET IDENTITY_INSERT [dbo].[Products] ON
GO
INSERT [dbo].[Products] ([ID], [Name], [Description], [CategoryID], [Price], [Cost], [StockQuantity], [IsDeleted], [ModifiedOn]) VALUES (1, N'Anker Powerport II PD with 1 PD and 1 PIQ 2.0', N'Forget about taking multiple wall adapters everywhere you go. With one dedicated USB-C Power Delivery port and one port equipped with Anker’s world-famous PowerIQ 2.0 technology, you can charge nearly any device you own—all from a single charger.', 4, CAST(15.00 AS Decimal(18, 2)), CAST(11.00 AS Decimal(18, 2)), 10, 0, CAST(N'2020-05-17T00:00:41.847' AS DateTime))
GO
INSERT [dbo].[Products] ([ID], [Name], [Description], [CategoryID], [Price], [Cost], [StockQuantity], [IsDeleted], [ModifiedOn]) VALUES (2, N'Anker power port 5 black BD', N'60W high power charger with the latest electronic technology. Temperature control technology with high voltage and fast charging technology.', 4, CAST(17.50 AS Decimal(18, 2)), CAST(13.50 AS Decimal(18, 2)), 10, 0, CAST(N'2020-05-17T00:00:41.847' AS DateTime))
GO
INSERT [dbo].[Products] ([ID], [Name], [Description], [CategoryID], [Price], [Cost], [StockQuantity], [IsDeleted], [ModifiedOn]) VALUES (3, N'Anker power port Speed 5 ( QC 3.0) -Black', N'Fast shipping distributor has 5 ports for shipping Qualcomm Fast Shipping 3.0 is compatible with all IQ system devices guarantee a year and a half', 4, CAST(13.50 AS Decimal(18, 2)), CAST(9.50 AS Decimal(18, 2)), 10, 0, CAST(N'2020-05-17T00:00:41.847' AS DateTime))
GO
INSERT [dbo].[Products] ([ID], [Name], [Description], [CategoryID], [Price], [Cost], [StockQuantity], [IsDeleted], [ModifiedOn]) VALUES (4, N'Anker power port travel black 4 USB', N'You can charge your phone while you are traveling to all countries around the world. Contains the latest technology. Smart Security. Security and safety techniques.', 4, CAST(12.50 AS Decimal(18, 2)), CAST(8.50 AS Decimal(18, 2)), 10, 0, CAST(N'2020-05-17T00:00:41.847' AS DateTime))
GO
INSERT [dbo].[Products] ([ID], [Name], [Description], [CategoryID], [Price], [Cost], [StockQuantity], [IsDeleted], [ModifiedOn]) VALUES (5, N'Anker Wall Charger port 4 white', N'Durable, high-quality design with 4-port smart 27-watt express charging features', 4, CAST(8.50 AS Decimal(18, 2)), CAST(5.50 AS Decimal(18, 2)), 10, 0, CAST(N'2020-05-17T00:00:41.847' AS DateTime))
GO
INSERT [dbo].[Products] ([ID], [Name], [Description], [CategoryID], [Price], [Cost], [StockQuantity], [IsDeleted], [ModifiedOn]) VALUES (6, N'Anker Wall Charger 1 with QC3.0 -Black', N'Quick Charger Single Port Qualcomm 3.0 Fast Compatible with all versions of the IQ provider with a one and a half year warranty', 4, CAST(6.50 AS Decimal(18, 2)), CAST(4.00 AS Decimal(18, 2)), 10, 0, CAST(N'2020-05-17T00:00:41.847' AS DateTime))
GO
INSERT [dbo].[Products] ([ID], [Name], [Description], [CategoryID], [Price], [Cost], [StockQuantity], [IsDeleted], [ModifiedOn]) VALUES (7, N'Anker Wall Charger 24W 2-Port USB -white', N'Distinctive design with high quality and excellent with intelligent charging and security ports Charging speed up to 2.4 Amp IQ system a year and a half warranty', 4, CAST(6.50 AS Decimal(18, 2)), CAST(4.00 AS Decimal(18, 2)), 10, 0, CAST(N'2020-05-17T00:00:41.847' AS DateTime))
GO
INSERT [dbo].[Products] ([ID], [Name], [Description], [CategoryID], [Price], [Cost], [StockQuantity], [IsDeleted], [ModifiedOn]) VALUES (8, N'Anker Wall Charger 24W 2-Port USB -Black', N'Distinctive design with high quality and excellent with intelligent charging and security ports Charging speed up to 2.4 Amp IQ system a year and a half warranty', 4, CAST(6.50 AS Decimal(18, 2)), CAST(4.00 AS Decimal(18, 2)), 10, 0, CAST(N'2020-05-17T00:00:41.847' AS DateTime))
GO
INSERT [dbo].[Products] ([ID], [Name], [Description], [CategoryID], [Price], [Cost], [StockQuantity], [IsDeleted], [ModifiedOn]) VALUES (9, N'Apple Adapter', N'Black Apple iPhone home certified by Apple 5W Warranty Year', 4, CAST(6.00 AS Decimal(18, 2)), CAST(4.00 AS Decimal(18, 2)), 10, 0, CAST(N'2020-05-17T00:00:41.847' AS DateTime))
GO
INSERT [dbo].[Products] ([ID], [Name], [Description], [CategoryID], [Price], [Cost], [StockQuantity], [IsDeleted], [ModifiedOn]) VALUES (10, N'Belkin USB surge protector 4 ports +2 USB', N'Powerful 4-socket power connector and 2 2-watt (12-watt) USB port (2.4) Maintaining data integrity with surge protection 2 meter wire length', 4, CAST(9.90 AS Decimal(18, 2)), CAST(7.50 AS Decimal(18, 2)), 10, 0, CAST(N'2020-05-17T00:00:41.847' AS DateTime))
GO
INSERT [dbo].[Products] ([ID], [Name], [Description], [CategoryID], [Price], [Cost], [StockQuantity], [IsDeleted], [ModifiedOn]) VALUES (11, N'Stand Magentic Charger for Apple Watch', N'All-in-one and all-round navigation support Magnets for charging Apple watches All versions Series 1.2.3.4 Fast charging Smart Security', 4, CAST(16.00 AS Decimal(18, 2)), CAST(12.00 AS Decimal(18, 2)), 10, 0, CAST(N'2020-05-17T00:00:41.847' AS DateTime))
GO
INSERT [dbo].[Products] ([ID], [Name], [Description], [CategoryID], [Price], [Cost], [StockQuantity], [IsDeleted], [ModifiedOn]) VALUES (12, N'Magnetic Charging Module', N'Charger charger for the Apple charger is a smart charger that can be connected to the home charger directly or on Power Bank ships all versions Series 1.2.3.4', 4, CAST(13.50 AS Decimal(18, 2)), CAST(9.50 AS Decimal(18, 2)), 10, 0, CAST(N'2020-05-17T00:00:41.847' AS DateTime))
GO
INSERT [dbo].[Products] ([ID], [Name], [Description], [CategoryID], [Price], [Cost], [StockQuantity], [IsDeleted], [ModifiedOn]) VALUES (13, N'Magnetic Charging Cable 1M', N'Magnet charger for charging Apple watch Features a quick charger Smart Security Charges Series 1.2.3 features a 1 meter length', 4, CAST(13.50 AS Decimal(18, 2)), CAST(9.50 AS Decimal(18, 2)), 10, 0, CAST(N'2020-05-17T00:00:41.847' AS DateTime))
GO
INSERT [dbo].[Products] ([ID], [Name], [Description], [CategoryID], [Price], [Cost], [StockQuantity], [IsDeleted], [ModifiedOn]) VALUES (14, N'Magnetic Charging Cable 1.5 M', N'Magnet charger for charging Apple watch features a fast charger Smart Security Charges Series 1.2.3 features a 2 meter long', 4, CAST(14.50 AS Decimal(18, 2)), CAST(10.50 AS Decimal(18, 2)), 10, 0, CAST(N'2020-05-17T00:00:41.847' AS DateTime))
GO
INSERT [dbo].[Products] ([ID], [Name], [Description], [CategoryID], [Price], [Cost], [StockQuantity], [IsDeleted], [ModifiedOn]) VALUES (15, N'Anker Car Charger BD', N'Made of high quality plastic reinforced with the best modern electronic technology for security and safety by the technology of the rack of the power of the Albor rapid delivery and the smart IQ2 port guarantee a year and a half', 7, CAST(11.50 AS Decimal(18, 2)), CAST(7.50 AS Decimal(18, 2)), 10, 0, CAST(N'2020-05-17T00:00:41.847' AS DateTime))
GO
INSERT [dbo].[Products] ([ID], [Name], [Description], [CategoryID], [Price], [Cost], [StockQuantity], [IsDeleted], [ModifiedOn]) VALUES (16, N'Anker car charger Qualcomm 3', N'Fast shipping with great carbon design with modern security and intelligent charging technologies with Qualcomm 3.0 Watt 3.0 W /', 7, CAST(7.50 AS Decimal(18, 2)), CAST(4.00 AS Decimal(18, 2)), 10, 0, CAST(N'2020-05-17T00:00:41.847' AS DateTime))
GO
INSERT [dbo].[Products] ([ID], [Name], [Description], [CategoryID], [Price], [Cost], [StockQuantity], [IsDeleted], [ModifiedOn]) VALUES (17, N'Anker Car Charger IQ', N'Powerful charger Small size Modern design with modern charging technology with full protection Speed ??up to 2.4 mps for each port with two 24-watt ports with IQ system Warranty of one and a half years', 7, CAST(4.00 AS Decimal(18, 2)), CAST(2.00 AS Decimal(18, 2)), 10, 0, CAST(N'2020-05-17T00:00:41.847' AS DateTime))
GO
INSERT [dbo].[Products] ([ID], [Name], [Description], [CategoryID], [Price], [Cost], [StockQuantity], [IsDeleted], [ModifiedOn]) VALUES (18, N'Roav smartcharge car kit', N'SOUND Bluetooth and FM connectionBUILT-IN CAR LOCATOR:2 USB ports equipped with advanced technology deliver high-speed charging. Bluetooth 4.2 enables any car stereo to make and receive phone calls.', 7, CAST(14.00 AS Decimal(18, 2)), CAST(10.00 AS Decimal(18, 2)), 10, 0, CAST(N'2020-05-17T00:00:41.847' AS DateTime))
GO
INSERT [dbo].[Products] ([ID], [Name], [Description], [CategoryID], [Price], [Cost], [StockQuantity], [IsDeleted], [ModifiedOn]) VALUES (19, N'Stand Wizgear Magnetic With Long Arm', N'Wizger car is considered one of the strongest brands of magnets in the world strong bear even the weight of the iPad with a long tractor moving in all directions 360 degrees can be placed on the dashboard or windshield', 3, CAST(7.50 AS Decimal(18, 2)), CAST(4.00 AS Decimal(18, 2)), 10, 0, CAST(N'2020-05-17T00:00:41.847' AS DateTime))
GO
INSERT [dbo].[Products] ([ID], [Name], [Description], [CategoryID], [Price], [Cost], [StockQuantity], [IsDeleted], [ModifiedOn]) VALUES (20, N'Stand Wizgear Magnetic C.D', N'Wizger car is considered one of the strongest brands of magnets in the world strong bear even the weight of the iPad installed with CD open moving in all directions 360 degrees easy to use and installation', 3, CAST(7.00 AS Decimal(18, 2)), CAST(3.50 AS Decimal(18, 2)), 10, 0, CAST(N'2020-05-17T00:00:41.847' AS DateTime))
GO
INSERT [dbo].[Products] ([ID], [Name], [Description], [CategoryID], [Price], [Cost], [StockQuantity], [IsDeleted], [ModifiedOn]) VALUES (21, N'Stand Wizgear big', N'Wizger car is considered one of the strongest brands of magnets in the world strong bear even the weight of the iPad with a short arm moving in all directions 360 degrees can be placed on the dashboard or windshield', 3, CAST(6.00 AS Decimal(18, 2)), CAST(2.50 AS Decimal(18, 2)), 10, 0, CAST(N'2020-05-17T00:00:41.847' AS DateTime))
GO
INSERT [dbo].[Products] ([ID], [Name], [Description], [CategoryID], [Price], [Cost], [StockQuantity], [IsDeleted], [ModifiedOn]) VALUES (22, N'Stand Wizgear Magnetic medium', N'Wizger car is considered one of the strongest brands of magnets in the world strong bear even the weight of the iPad moving in all directions 360 degrees Can be placed on the decor in the car Strong adhesive', 3, CAST(5.00 AS Decimal(18, 2)), CAST(2.50 AS Decimal(18, 2)), 10, 0, CAST(N'2020-05-17T00:00:41.847' AS DateTime))
GO
INSERT [dbo].[Products] ([ID], [Name], [Description], [CategoryID], [Price], [Cost], [StockQuantity], [IsDeleted], [ModifiedOn]) VALUES (23, N'Stand Wizgear Magnetic small', N'Wizger car is considered one of the strongest brands of magnets in the world strong bear even the weight of the iPad fixed can be placed on the decor in the car strong adhesiv', 3, CAST(4.00 AS Decimal(18, 2)), CAST(1.50 AS Decimal(18, 2)), 10, 0, CAST(N'2020-05-17T00:00:41.847' AS DateTime))
GO
INSERT [dbo].[Products] ([ID], [Name], [Description], [CategoryID], [Price], [Cost], [StockQuantity], [IsDeleted], [ModifiedOn]) VALUES (24, N'RAVPOWER Ultra Compact Phone Holder', N'This magnetic two-piece ball mount kit allows you to effortlessly attach your phone to your dashboard so you can keep your hands on the wheel.', 3, CAST(5.75 AS Decimal(18, 2)), CAST(2.70 AS Decimal(18, 2)), 10, 0, CAST(N'2020-05-17T00:00:41.847' AS DateTime))
GO
INSERT [dbo].[Products] ([ID], [Name], [Description], [CategoryID], [Price], [Cost], [StockQuantity], [IsDeleted], [ModifiedOn]) VALUES (25, N'UGREEN MAGNETIC CAR HOLDER', N'Your phone can be firmly installed in the car. Never worry about falling even while driving on a bumpy road. It can hold your mobile phone securely even on rough road, protect your phone while driving.This dashboard phone holder lets you adjust and choo', 3, CAST(5.00 AS Decimal(18, 2)), CAST(1.50 AS Decimal(18, 2)), 10, 0, CAST(N'2020-05-17T00:00:41.847' AS DateTime))
GO
INSERT [dbo].[Products] ([ID], [Name], [Description], [CategoryID], [Price], [Cost], [StockQuantity], [IsDeleted], [ModifiedOn]) VALUES (26, N'Dausen tube 360 Universal Windshield Mount', N'DAUSEN UNIVERSAL WINDSHIELD MOUNT TUBE 360 DEGREESimple interface, heavy duty design. Our sliding lock lever design lets you attach and remove the mount easily on any windshield. Once attached the mount will securely hold your mobile phone in place', 3, CAST(4.50 AS Decimal(18, 2)), CAST(1.50 AS Decimal(18, 2)), 10, 0, CAST(N'2020-05-17T00:00:41.847' AS DateTime))
GO
INSERT [dbo].[Products] ([ID], [Name], [Description], [CategoryID], [Price], [Cost], [StockQuantity], [IsDeleted], [ModifiedOn]) VALUES (27, N'Dausen Magnetic stand', N'360 degree rotary head design Easily stick to the dashboard of the car Strong can be placed on the dashboard or windscreen Magnet strength Not affected by heat or cold', 3, CAST(5.50 AS Decimal(18, 2)), CAST(2.50 AS Decimal(18, 2)), 10, 0, CAST(N'2020-05-17T00:00:41.847' AS DateTime))
GO
INSERT [dbo].[Products] ([ID], [Name], [Description], [CategoryID], [Price], [Cost], [StockQuantity], [IsDeleted], [ModifiedOn]) VALUES (28, N'UGREEN DESKTOP CHARGER STAND', N'This Apple Watch charger holder is made to protect your Apple Watch and prevent it from falling. This stand can support Apples original magnetic charging unit as well as the UGREEN magnetic charging unit.It is suitable for all Apple Watch watches (1, 2,', 3, CAST(3.00 AS Decimal(18, 2)), CAST(1.00 AS Decimal(18, 2)), 10, 0, CAST(N'2020-05-17T00:00:41.847' AS DateTime))
GO
INSERT [dbo].[Products] ([ID], [Name], [Description], [CategoryID], [Price], [Cost], [StockQuantity], [IsDeleted], [ModifiedOn]) VALUES (29, N'ROCK SHOOTING GAME CONTROLLER', N'Enjoy Playing Games Anywhere. The Joystick offers you a real physical object of high precision and sensitive, making you enjoy the game and operating it, helping you win the game easily.', 3, CAST(5.00 AS Decimal(18, 2)), CAST(1.50 AS Decimal(18, 2)), 10, 0, CAST(N'2020-05-17T00:00:41.847' AS DateTime))
GO
INSERT [dbo].[Products] ([ID], [Name], [Description], [CategoryID], [Price], [Cost], [StockQuantity], [IsDeleted], [ModifiedOn]) VALUES (30, N'GameSir-F2- Grip puBG hand Controller', N'Enjoy Playing Games Anywhere. The Joystick offers you a real physical object of high precision and sensitive, making you enjoy the game and operating it, helping you win the game easily.', 3, CAST(7.50 AS Decimal(18, 2)), CAST(3.50 AS Decimal(18, 2)), 10, 0, CAST(N'2020-05-17T00:00:41.863' AS DateTime))
GO
INSERT [dbo].[Products] ([ID], [Name], [Description], [CategoryID], [Price], [Cost], [StockQuantity], [IsDeleted], [ModifiedOn]) VALUES (31, N'Elegant Wood case for Apple Airpods - Nude', N'Apple Airpods case hand made by natural wood and leather for more stronger casing for your airpods. Color available for this item ( Nude / Pink / Blue / Off White / Yellow )', 9, CAST(11.00 AS Decimal(18, 2)), CAST(7.00 AS Decimal(18, 2)), 10, 0, CAST(N'2020-05-17T00:00:41.863' AS DateTime))
GO
INSERT [dbo].[Products] ([ID], [Name], [Description], [CategoryID], [Price], [Cost], [StockQuantity], [IsDeleted], [ModifiedOn]) VALUES (32, N'UGREEN CASE FOR APPLE AIRPODS??', N'Ugreen Cover designed specifically for Apple AirPods.?Protect your AirPods from falling and scratches Available in white, blue and black color', 9, CAST(4.00 AS Decimal(18, 2)), CAST(1.50 AS Decimal(18, 2)), 10, 0, CAST(N'2020-05-17T00:00:41.863' AS DateTime))
GO
INSERT [dbo].[Products] ([ID], [Name], [Description], [CategoryID], [Price], [Cost], [StockQuantity], [IsDeleted], [ModifiedOn]) VALUES (33, N'UGREEN TRAVEL STORAGE CASE', N'Reasonable design and ideal for traveling by maintaining all cables, electronic gadgets and cosmeticsIn the same place making it easier to find. A great way to end the mess in your travel bagAnd keep all the small tools well organized.', 9, CAST(6.00 AS Decimal(18, 2)), CAST(3.50 AS Decimal(18, 2)), 10, 0, CAST(N'2020-05-17T00:00:41.863' AS DateTime))
GO
INSERT [dbo].[Products] ([ID], [Name], [Description], [CategoryID], [Price], [Cost], [StockQuantity], [IsDeleted], [ModifiedOn]) VALUES (34, N'MONET WALLET KICKSTANT', N'MONET has 2 pockets that can securely hold credit cards, IDs, metro cards, business cards, cash and more.', 10, CAST(8.00 AS Decimal(18, 2)), CAST(4.50 AS Decimal(18, 2)), 10, 0, CAST(N'2020-05-17T00:00:41.863' AS DateTime))
GO
INSERT [dbo].[Products] ([ID], [Name], [Description], [CategoryID], [Price], [Cost], [StockQuantity], [IsDeleted], [ModifiedOn]) VALUES (35, N'EGO 10000mAh 4 in 1 Powerbank', N'Exclusive in kuwait Powerbank 4 in 1 Charge your phone your apple watch your airpods at the same time. 10W wireless charging and 18W PD charging is faster than Apple’s charger! 10000 Capacity.4 USB OUTPUT 1 USB input PD5Led Charging Status LightTYPE', 8, CAST(28.00 AS Decimal(18, 2)), CAST(24.00 AS Decimal(18, 2)), 10, 0, CAST(N'2020-05-17T00:00:41.863' AS DateTime))
GO
INSERT [dbo].[Products] ([ID], [Name], [Description], [CategoryID], [Price], [Cost], [StockQuantity], [IsDeleted], [ModifiedOn]) VALUES (36, N'DAUSEN 6000mAh Pavonine Power Bank', N'High capacity of 6000mAh . Built-in LED flashlight . Built-in LCD battery status indicator. Warranty 1 year.', 8, CAST(9.50 AS Decimal(18, 2)), CAST(6.50 AS Decimal(18, 2)), 10, 0, CAST(N'2020-05-17T00:00:41.863' AS DateTime))
GO
INSERT [dbo].[Products] ([ID], [Name], [Description], [CategoryID], [Price], [Cost], [StockQuantity], [IsDeleted], [ModifiedOn]) VALUES (37, N'10000mAh Slim-X Pro Wireless Charge, QC3.0, PD Power Bank', N'Dosen 10,000 mAh Wireless Charger - Black ???Wirelessly charge your devices along with an external capacity battery. Optional 10000 able to charge smartphones at the same time.', 8, CAST(16.00 AS Decimal(18, 2)), CAST(12.00 AS Decimal(18, 2)), 10, 0, CAST(N'2020-05-17T00:00:41.863' AS DateTime))
GO
INSERT [dbo].[Products] ([ID], [Name], [Description], [CategoryID], [Price], [Cost], [StockQuantity], [IsDeleted], [ModifiedOn]) VALUES (38, N'Anker power bank 26800 Pd black', N'PowerCore+ 26800 PD with 30W Power Delivery Charger Designed with high quality aluminum made of the best modern technology for security shipping with two ports of the IQ2 system and the PowerDelivery Express port is recharged during 5.30 hours warranty on', 8, CAST(34.00 AS Decimal(18, 2)), CAST(30.00 AS Decimal(18, 2)), 10, 0, CAST(N'2020-05-17T00:00:41.863' AS DateTime))
GO
INSERT [dbo].[Products] ([ID], [Name], [Description], [CategoryID], [Price], [Cost], [StockQuantity], [IsDeleted], [ModifiedOn]) VALUES (39, N'ANKER POWERCODE 10000 PD+', N'Charge your mobile devices at an optimized speed via the USB-A port. Your USB-C phones, tablets, and more get a full-speed charge from the Power Delivery.', 8, CAST(17.00 AS Decimal(18, 2)), CAST(13.00 AS Decimal(18, 2)), 10, 0, CAST(N'2020-05-17T00:00:41.863' AS DateTime))
GO
INSERT [dbo].[Products] ([ID], [Name], [Description], [CategoryID], [Price], [Cost], [StockQuantity], [IsDeleted], [ModifiedOn]) VALUES (40, N'RAVPower / Car Jump Starter / Element 14000mAh 1000A Peak QC3.0-Black', N'Ravpower Power Bank and Battery Operation 14000 mAh Battery with 3 ports for charging phones and (1 Qualcomm 3.0) with Ismart car operating system up to 12 cylinder. Easy and simple operation mode Warranty one and a half years.', 8, CAST(36.00 AS Decimal(18, 2)), CAST(32.00 AS Decimal(18, 2)), 10, 0, CAST(N'2020-05-17T00:00:41.863' AS DateTime))
GO
INSERT [dbo].[Products] ([ID], [Name], [Description], [CategoryID], [Price], [Cost], [StockQuantity], [IsDeleted], [ModifiedOn]) VALUES (41, N'Anker power bank 20000 core ll black', N'Durable, strong and excellent specifications with modern smart charging and security technologies with two charging ports and a recharging port equipped with a one and a half year IQ warranty system', 8, CAST(20.00 AS Decimal(18, 2)), CAST(16.00 AS Decimal(18, 2)), 10, 0, CAST(N'2020-05-17T00:00:41.863' AS DateTime))
GO
INSERT [dbo].[Products] ([ID], [Name], [Description], [CategoryID], [Price], [Cost], [StockQuantity], [IsDeleted], [ModifiedOn]) VALUES (42, N'Anker power bank 13400 Q 3.0', N'High quality, high quality aluminum specifications Modern intelligent charging technology with IQ and Qualcomm 3 with recharging port Warranty 1 and a half years warranty', 8, CAST(15.75 AS Decimal(18, 2)), CAST(11.75 AS Decimal(18, 2)), 10, 0, CAST(N'2020-05-17T00:00:41.863' AS DateTime))
GO
INSERT [dbo].[Products] ([ID], [Name], [Description], [CategoryID], [Price], [Cost], [StockQuantity], [IsDeleted], [ModifiedOn]) VALUES (43, N'Anker power bank 10000 slim', N'Slim light Small size with modern charging technology with one smart charging port Smart security and recharging port equipped with IQ system a year and a half warranty', 8, CAST(14.00 AS Decimal(18, 2)), CAST(10.00 AS Decimal(18, 2)), 10, 0, CAST(N'2020-05-17T00:00:41.863' AS DateTime))
GO
INSERT [dbo].[Products] ([ID], [Name], [Description], [CategoryID], [Price], [Cost], [StockQuantity], [IsDeleted], [ModifiedOn]) VALUES (44, N'Anker power bank 10000 X 2.5 fast', N'Designed with excellent specifications Small size Attractive design with one smart charging port Smart security with IQ system and a recharging port Warranty 1 year and a half', 8, CAST(14.50 AS Decimal(18, 2)), CAST(10.50 AS Decimal(18, 2)), 10, 0, CAST(N'2020-05-17T00:00:41.863' AS DateTime))
GO
INSERT [dbo].[Products] ([ID], [Name], [Description], [CategoryID], [Price], [Cost], [StockQuantity], [IsDeleted], [ModifiedOn]) VALUES (45, N'Anker power bank 6700', N'Durable with high quality and excellent specifications with modern smart charging and security technology with a security charging port and a recharging port with IQ system Warranty of one and a half years', 8, CAST(9.50 AS Decimal(18, 2)), CAST(6.00 AS Decimal(18, 2)), 10, 0, CAST(N'2020-05-17T00:00:41.863' AS DateTime))
GO
INSERT [dbo].[Products] ([ID], [Name], [Description], [CategoryID], [Price], [Cost], [StockQuantity], [IsDeleted], [ModifiedOn]) VALUES (46, N'Anker power bank 5200', N'Durable with high quality and excellent specifications with modern smart charging and security technology with a security charging port and a recharging port with IQ system Warranty of one and a half years', 8, CAST(7.00 AS Decimal(18, 2)), CAST(4.50 AS Decimal(18, 2)), 10, 0, CAST(N'2020-05-17T00:00:41.863' AS DateTime))
GO
INSERT [dbo].[Products] ([ID], [Name], [Description], [CategoryID], [Price], [Cost], [StockQuantity], [IsDeleted], [ModifiedOn]) VALUES (47, N'UGREEN 10000mAh External Phone Battery with Type USB Lightning Csble', N'Charge Apple and Android devices Simultaneously: With built-in MFi Certified Lightning Cable and external micro USB Port.Warranty: 18 Months', 8, CAST(17.50 AS Decimal(18, 2)), CAST(13.50 AS Decimal(18, 2)), 10, 0, CAST(N'2020-05-17T00:00:41.863' AS DateTime))
GO
INSERT [dbo].[Products] ([ID], [Name], [Description], [CategoryID], [Price], [Cost], [StockQuantity], [IsDeleted], [ModifiedOn]) VALUES (48, N'belkin lightning Audio + charge + Aux', N'Can listen music or connect the device to the car to play music and charging simultaneously The link depends on the fast shipping security supported by Apple', 5, CAST(16.00 AS Decimal(18, 2)), CAST(12.00 AS Decimal(18, 2)), 10, 0, CAST(N'2020-05-17T00:00:41.863' AS DateTime))
GO
INSERT [dbo].[Products] ([ID], [Name], [Description], [CategoryID], [Price], [Cost], [StockQuantity], [IsDeleted], [ModifiedOn]) VALUES (49, N'belkin lightning Audio + charge 2 outlet', N'Music listening and charging can be simultaneously connected based on fast charging security supported by Apple', 5, CAST(16.00 AS Decimal(18, 2)), CAST(12.00 AS Decimal(18, 2)), 10, 0, CAST(N'2020-05-17T00:00:41.863' AS DateTime))
GO
INSERT [dbo].[Products] ([ID], [Name], [Description], [CategoryID], [Price], [Cost], [StockQuantity], [IsDeleted], [ModifiedOn]) VALUES (50, N'Lighting to USB Cable 1.5m Silver', N'Wi-Fi U green is a fast-cut aluminum alloy that features a smart, fast and smart charging with a 1.5-meter color Silver color', 5, CAST(5.00 AS Decimal(18, 2)), CAST(3.50 AS Decimal(18, 2)), 10, 0, CAST(N'2020-05-17T00:00:41.863' AS DateTime))
GO
INSERT [dbo].[Products] ([ID], [Name], [Description], [CategoryID], [Price], [Cost], [StockQuantity], [IsDeleted], [ModifiedOn]) VALUES (51, N'Lighting to USB Cable 1.5m Black', N'Wire iphone is a fast, aluminum-resistant fast-cutting aluminum alloy featuring fast, safe and smart charging', 5, CAST(5.00 AS Decimal(18, 2)), CAST(3.50 AS Decimal(18, 2)), 10, 0, CAST(N'2020-05-17T00:00:41.863' AS DateTime))
GO
INSERT [dbo].[Products] ([ID], [Name], [Description], [CategoryID], [Price], [Cost], [StockQuantity], [IsDeleted], [ModifiedOn]) VALUES (52, N'cable Ugreen 3 in 1 black 1m', N'Wi-Fi U green is a fast, aluminum-resistant, fast-cut aluminum alloy featuring fast and smart charging. You can charge all versions of USB Micro _ Type C _ lightening with 1 meter black', 5, CAST(7.00 AS Decimal(18, 2)), CAST(3.50 AS Decimal(18, 2)), 10, 0, CAST(N'2020-05-17T00:00:41.863' AS DateTime))
GO
INSERT [dbo].[Products] ([ID], [Name], [Description], [CategoryID], [Price], [Cost], [StockQuantity], [IsDeleted], [ModifiedOn]) VALUES (53, N'cable Ugreen 3 in 1 black 1.5 m', N'WIRELESS U Green A fast, aluminum-resistant, fast-cut aluminum alloy featuring fast, secure and smart charging You can charge all versions of USB Micro _ Type C _ lightening with 1.50 m long black', 5, CAST(7.00 AS Decimal(18, 2)), CAST(3.50 AS Decimal(18, 2)), 10, 0, CAST(N'2020-05-17T00:00:41.863' AS DateTime))
GO
INSERT [dbo].[Products] ([ID], [Name], [Description], [CategoryID], [Price], [Cost], [StockQuantity], [IsDeleted], [ModifiedOn]) VALUES (54, N'UGREEN Cable Lightning to USB Red power line 1m', N'Wi-Fi U green is a fast-cutting, aluminum-made, fast-charging, smart-charging, 1-meter-long red color', 5, CAST(7.00 AS Decimal(18, 2)), CAST(3.50 AS Decimal(18, 2)), 10, 0, CAST(N'2020-05-17T00:00:41.863' AS DateTime))
GO
INSERT [dbo].[Products] ([ID], [Name], [Description], [CategoryID], [Price], [Cost], [StockQuantity], [IsDeleted], [ModifiedOn]) VALUES (55, N'Type C Multifultional Converter 8 in 1', N'Perform USB-C Multifunction 8-in-1: Expand your USB-C port to 4KHz HDMI video output, Gigabit Ethernet port, Micro SD (TF) card reader, SD, 3 USB 3.0 ports and port Charging of type C PD (max 20V 5A). Ideal choice for laptops', 5, CAST(26.00 AS Decimal(18, 2)), CAST(22.00 AS Decimal(18, 2)), 10, 0, CAST(N'2020-05-17T00:00:41.863' AS DateTime))
GO
INSERT [dbo].[Products] ([ID], [Name], [Description], [CategoryID], [Price], [Cost], [StockQuantity], [IsDeleted], [ModifiedOn]) VALUES (56, N'UGREEN HDMI 2.0 VERSION CABLE 1 METER', N'HDMI 2.0 CABLE: Enable you to directly connect your laptop to an HDMI-equipped display with maximum 4K at 60Hz. Warranty: 18 Months', 5, CAST(5.00 AS Decimal(18, 2)), CAST(2.50 AS Decimal(18, 2)), 10, 0, CAST(N'2020-05-17T00:00:41.863' AS DateTime))
GO
INSERT [dbo].[Products] ([ID], [Name], [Description], [CategoryID], [Price], [Cost], [StockQuantity], [IsDeleted], [ModifiedOn]) VALUES (57, N'UGREEN HDMI 2.0 VERSION CABLE 5 METER', N'HDMI 2.0 CABLE: Enable you to directly connect your laptop to an HDMI-equipped display with maximum 4K at 60Hz. Warranty: 18 Months', 5, CAST(6.50 AS Decimal(18, 2)), CAST(2.50 AS Decimal(18, 2)), 10, 0, CAST(N'2020-05-17T00:00:41.863' AS DateTime))
GO
INSERT [dbo].[Products] ([ID], [Name], [Description], [CategoryID], [Price], [Cost], [StockQuantity], [IsDeleted], [ModifiedOn]) VALUES (58, N'cable USB - lightning 1 m Apple', N'Apple iPhone Charging Cable USB 2.0 Charging and Synchronization Length 1 m Warranty Year', 5, CAST(7.00 AS Decimal(18, 2)), CAST(2.50 AS Decimal(18, 2)), 10, 0, CAST(N'2020-05-17T00:00:41.863' AS DateTime))
GO
INSERT [dbo].[Products] ([ID], [Name], [Description], [CategoryID], [Price], [Cost], [StockQuantity], [IsDeleted], [ModifiedOn]) VALUES (59, N'cable USB - lightning 2 m Apple', N'Apple iPhone 3G Cable Supported by Apple USB 2.0 Charging and Sync Length 2 m Warranty Year', 5, CAST(8.00 AS Decimal(18, 2)), CAST(4.50 AS Decimal(18, 2)), 10, 0, CAST(N'2020-05-17T00:00:41.863' AS DateTime))
GO
INSERT [dbo].[Products] ([ID], [Name], [Description], [CategoryID], [Price], [Cost], [StockQuantity], [IsDeleted], [ModifiedOn]) VALUES (60, N'cable lightning - type c 1 m Apple', N'Apple iPhone Iphone C-Class Apple Certified You can take advantage of the fast shipping feature and you can also use the BlackBerry 29/30/61 / 87W for synchronization and high-speed shipping Warranty Year', 5, CAST(8.00 AS Decimal(18, 2)), CAST(4.50 AS Decimal(18, 2)), 10, 0, CAST(N'2020-05-17T00:00:41.863' AS DateTime))
GO
INSERT [dbo].[Products] ([ID], [Name], [Description], [CategoryID], [Price], [Cost], [StockQuantity], [IsDeleted], [ModifiedOn]) VALUES (61, N'Iphone 7 connector', N'The iPhone 7 connection is a Lightning to AUX conversion certified by Apple Year Warranty', 5, CAST(5.50 AS Decimal(18, 2)), CAST(2.50 AS Decimal(18, 2)), 10, 0, CAST(N'2020-05-17T00:00:41.863' AS DateTime))
GO
INSERT [dbo].[Products] ([ID], [Name], [Description], [CategoryID], [Price], [Cost], [StockQuantity], [IsDeleted], [ModifiedOn]) VALUES (62, N'lightning Digital apple HDMI', N'Apple TV connection and therefore to pair the phone with the screen and mirroring what is displayed on the screen of your device brings out the content of the video to your large screen up to 1080P certified by Apple year warranty', 5, CAST(19.50 AS Decimal(18, 2)), CAST(15.50 AS Decimal(18, 2)), 10, 0, CAST(N'2020-05-17T00:00:41.863' AS DateTime))
GO
INSERT [dbo].[Products] ([ID], [Name], [Description], [CategoryID], [Price], [Cost], [StockQuantity], [IsDeleted], [ModifiedOn]) VALUES (63, N'Anker cable AUX', N'Strongly designed with a high quality that exceeds all the cables is more durable and works perfectly to connect the audio devices to the speakers to get the sound of the director excellent warranty one and a half years', 5, CAST(3.00 AS Decimal(18, 2)), CAST(2.50 AS Decimal(18, 2)), 10, 0, CAST(N'2020-05-17T00:00:41.863' AS DateTime))
GO
INSERT [dbo].[Products] ([ID], [Name], [Description], [CategoryID], [Price], [Cost], [StockQuantity], [IsDeleted], [ModifiedOn]) VALUES (64, N'Anker cable lightning power line 180 cm black', N'Made with high quality long-lasting Apple devices are safely shipped Designed 1.8m / 6ft length Color Black Warranty One and a half years', 5, CAST(8.50 AS Decimal(18, 2)), CAST(4.50 AS Decimal(18, 2)), 10, 0, CAST(N'2020-05-17T00:00:41.863' AS DateTime))
GO
INSERT [dbo].[Products] ([ID], [Name], [Description], [CategoryID], [Price], [Cost], [StockQuantity], [IsDeleted], [ModifiedOn]) VALUES (65, N'Anker cable lighting power line 90 cm Black', N'Made with high quality long-lasting Apple devices are safely shipped Designed with a length of 0.9m / 3ft Warranty black color a year and a half', 5, CAST(7.50 AS Decimal(18, 2)), CAST(2.50 AS Decimal(18, 2)), 10, 0, CAST(N'2020-05-17T00:00:41.863' AS DateTime))
GO
INSERT [dbo].[Products] ([ID], [Name], [Description], [CategoryID], [Price], [Cost], [StockQuantity], [IsDeleted], [ModifiedOn]) VALUES (66, N'Anker cable lightning power line 180 cm Red', N'Made with high quality long-lasting Apple devices are safely shipped Designed 1.8m / 6ft length Color Black Warranty One and a half years', 5, CAST(8.50 AS Decimal(18, 2)), CAST(4.50 AS Decimal(18, 2)), 10, 0, CAST(N'2020-05-17T00:00:41.863' AS DateTime))
GO
INSERT [dbo].[Products] ([ID], [Name], [Description], [CategoryID], [Price], [Cost], [StockQuantity], [IsDeleted], [ModifiedOn]) VALUES (67, N'Anker cable lightning power line 90 cm Red', N'Made with high quality long-lasting Apple devices are safely shipped Designed with a length of 0.9m / 3ft Warranty black color a year and a half', 5, CAST(7.50 AS Decimal(18, 2)), CAST(3.50 AS Decimal(18, 2)), 10, 0, CAST(N'2020-05-17T00:00:41.863' AS DateTime))
GO
INSERT [dbo].[Products] ([ID], [Name], [Description], [CategoryID], [Price], [Cost], [StockQuantity], [IsDeleted], [ModifiedOn]) VALUES (68, N'Anker cable lightning power line 30 cm Black', N'Made with high quality Long-lasting Apple devices are safely shipped Designed with a length of 0.3m / 1ft Warranty black color a year and a half', 5, CAST(6.50 AS Decimal(18, 2)), CAST(2.50 AS Decimal(18, 2)), 10, 0, CAST(N'2020-05-17T00:00:41.863' AS DateTime))
GO
INSERT [dbo].[Products] ([ID], [Name], [Description], [CategoryID], [Price], [Cost], [StockQuantity], [IsDeleted], [ModifiedOn]) VALUES (69, N'Anker cable lightning 90 c.m black', N'Quick Cable Denied Apple devices are safely shipped in high quality long lasting designed 0.9m / 3ft length black warranty for a year and a half', 5, CAST(5.00 AS Decimal(18, 2)), CAST(2.50 AS Decimal(18, 2)), 10, 0, CAST(N'2020-05-17T00:00:41.863' AS DateTime))
GO
INSERT [dbo].[Products] ([ID], [Name], [Description], [CategoryID], [Price], [Cost], [StockQuantity], [IsDeleted], [ModifiedOn]) VALUES (70, N'Anker cable micro 180 CM Red', N'Fastest and strongest cable made of high quality Kevlar fiber Micro charger for Samsung and Android devices Version Old 1.8m / 6ft Length Red Warranty 1 year and a half', 5, CAST(5.00 AS Decimal(18, 2)), CAST(2.50 AS Decimal(18, 2)), 10, 0, CAST(N'2020-05-17T00:00:41.880' AS DateTime))
GO
INSERT [dbo].[Products] ([ID], [Name], [Description], [CategoryID], [Price], [Cost], [StockQuantity], [IsDeleted], [ModifiedOn]) VALUES (71, N'Anker cable micro 90 CM RED', N'Fastest and strongest cable made of Kevlar fiber Micro quality for charging Samsung and Android devices Version Old 0.9m / 3ft length Red color Warranty one and a half years', 5, CAST(4.00 AS Decimal(18, 2)), CAST(2.50 AS Decimal(18, 2)), 10, 0, CAST(N'2020-05-17T00:00:41.880' AS DateTime))
GO
INSERT [dbo].[Products] ([ID], [Name], [Description], [CategoryID], [Price], [Cost], [StockQuantity], [IsDeleted], [ModifiedOn]) VALUES (72, N'Anker cable USB -Type C 90 cm Red', N'The fastest and strongest cable is made of high quality Kevlar fiber T-C to charge Samsung devices starting from Note8, Note9, S8, S9 and the modern Android 0.9m / 3ft length Red Warranty one and a half years', 5, CAST(5.00 AS Decimal(18, 2)), CAST(2.50 AS Decimal(18, 2)), 10, 0, CAST(N'2020-05-17T00:00:41.880' AS DateTime))
GO
INSERT [dbo].[Products] ([ID], [Name], [Description], [CategoryID], [Price], [Cost], [StockQuantity], [IsDeleted], [ModifiedOn]) VALUES (73, N'Anker PowerLine+ USB-C to USB 3.0 (1.8m/6ft) -Red', N'The fastest and strongest cable is made of high quality Kevlar fiber T-C to charge Samsung devices starting from Note8, Note9, S8, S9 and the modern Android 1.8m/6ft length Red Warranty one and a half years', 5, CAST(7.00 AS Decimal(18, 2)), CAST(2.50 AS Decimal(18, 2)), 10, 0, CAST(N'2020-05-17T00:00:41.880' AS DateTime))
GO
INSERT [dbo].[Products] ([ID], [Name], [Description], [CategoryID], [Price], [Cost], [StockQuantity], [IsDeleted], [ModifiedOn]) VALUES (74, N'Anker PowerLine + II USB-C to Lightning (0.9m/3ft) -Black', N'The fastest and strongest cable is made of high quality Kevlar fiber T-C to Lightning. Support Apple devices with 0.9m/3ft length Red Warranty one and a half years.', 5, CAST(8.50 AS Decimal(18, 2)), CAST(4.50 AS Decimal(18, 2)), 10, 0, CAST(N'2020-05-17T00:00:41.880' AS DateTime))
GO
INSERT [dbo].[Products] ([ID], [Name], [Description], [CategoryID], [Price], [Cost], [StockQuantity], [IsDeleted], [ModifiedOn]) VALUES (75, N'Anker PowerLine + II USB-C to Lightning (1.8m/6ft) -Black', N'The fastest and strongest cable is made of high quality Kevlar fiber T-C to Lightning. Support Apple devices with 1.8m/6ft length Red Warranty one and a half years.', 5, CAST(9.50 AS Decimal(18, 2)), CAST(5.50 AS Decimal(18, 2)), 10, 0, CAST(N'2020-05-17T00:00:41.880' AS DateTime))
GO
INSERT [dbo].[Products] ([ID], [Name], [Description], [CategoryID], [Price], [Cost], [StockQuantity], [IsDeleted], [ModifiedOn]) VALUES (76, N'Dausen lightning Adapter 2 in 1', N'Supports audio playback, simultaneous charging and synchronization Supports fast charging Maintains sound quality Supports IOS10 / 11 operating system on top Supports Iphone 7 / 7plus 8 / 8plus _X / Xs / XsMax _ ipad pro / air Warranty Year', 5, CAST(5.00 AS Decimal(18, 2)), CAST(2.50 AS Decimal(18, 2)), 10, 0, CAST(N'2020-05-17T00:00:41.880' AS DateTime))
GO
INSERT [dbo].[Products] ([ID], [Name], [Description], [CategoryID], [Price], [Cost], [StockQuantity], [IsDeleted], [ModifiedOn]) VALUES (77, N'Cable otter box USB - lightning 1m', N'Cable Iphone Curved design Metallic casing and connectors to ensure durability Durable high-capacity charging and synchronicity Provides flexibility in connection ports Traction strength greater than 100 lbs Dedicated for iPhone 1 meter', 5, CAST(7.50 AS Decimal(18, 2)), CAST(3.50 AS Decimal(18, 2)), 10, 0, CAST(N'2020-05-17T00:00:41.880' AS DateTime))
GO
INSERT [dbo].[Products] ([ID], [Name], [Description], [CategoryID], [Price], [Cost], [StockQuantity], [IsDeleted], [ModifiedOn]) VALUES (78, N'Cable otter box USB - lightning 2m', N'Cable Iphone Curved design Metallic casing and connectors to ensure durability Durable capabilities Supercharging and sync Availability of flexibility in the ports of communication Pull power more than 100 pounds for iPhone 2 meters', 5, CAST(9.00 AS Decimal(18, 2)), CAST(5.50 AS Decimal(18, 2)), 10, 0, CAST(N'2020-05-17T00:00:41.880' AS DateTime))
GO
INSERT [dbo].[Products] ([ID], [Name], [Description], [CategoryID], [Price], [Cost], [StockQuantity], [IsDeleted], [ModifiedOn]) VALUES (79, N'Cable otter box USB - lightning 3m', N'Cable Iphone Braided design Metallic casing and connectors to ensure durability Durable capabilities Supercharging and sync Availability of flexibility in the ports of communication Pull power more than 100 pounds for iPhone 3 meters', 5, CAST(10.50 AS Decimal(18, 2)), CAST(6.50 AS Decimal(18, 2)), 10, 0, CAST(N'2020-05-17T00:00:41.880' AS DateTime))
GO
INSERT [dbo].[Products] ([ID], [Name], [Description], [CategoryID], [Price], [Cost], [StockQuantity], [IsDeleted], [ModifiedOn]) VALUES (80, N'Cable otter box USB - micro 1m', N'Cable Galaxy Braided design Metallic casing and connectors to ensure durability Durability High capacity for charging and synchronization Availability of flexibility in the ports of communication Over 100 lbs.', 5, CAST(7.00 AS Decimal(18, 2)), CAST(3.50 AS Decimal(18, 2)),  10, 0, CAST(N'2020-05-17T00:00:41.880' AS DateTime))
GO
INSERT [dbo].[Products] ([ID], [Name], [Description], [CategoryID], [Price], [Cost], [StockQuantity], [IsDeleted], [ModifiedOn]) VALUES (81, N'Cable otter box USB - micro 2m', N'Cable Galaxy Braided design Metallic casing and connectors to ensure durability Durability High-capacity charging and syncing Availability of flexible connection ports Over 100 lbs.', 5, CAST(8.50 AS Decimal(18, 2)), CAST(4.50 AS Decimal(18, 2)), 10, 0, CAST(N'2020-05-17T00:00:41.880' AS DateTime))
GO
INSERT [dbo].[Products] ([ID], [Name], [Description], [CategoryID], [Price], [Cost], [StockQuantity], [IsDeleted], [ModifiedOn]) VALUES (82, N'Cable otter box USB - micro 3m', N'CableGalaxy Enclosed design Metallic casing and connectors to ensure durability Durability Superior charging and syncing capabilities Provide flexibility in connection ports Traction strength greater than 100 lbs Dedicated to phones Microphone input 3 m', 5, CAST(10.00 AS Decimal(18, 2)), CAST(7.50 AS Decimal(18, 2)), 10, 0, CAST(N'2020-05-17T00:00:41.880' AS DateTime))
GO
INSERT [dbo].[Products] ([ID], [Name], [Description], [CategoryID], [Price], [Cost], [StockQuantity], [IsDeleted], [ModifiedOn]) VALUES (83, N'Cable otter box USB - type c 1m', N'Cable Iphone Braided design Metallic casing and connectors to ensure durability Durable high-capacity charging and synchronicity Availability of flexible connection ports Traction strength greater than 100 lbs Dedicated to phones Tee-c-1 meter', 5, CAST(8.00 AS Decimal(18, 2)), CAST(4.50 AS Decimal(18, 2)), 10, 0, CAST(N'2020-05-17T00:00:41.880' AS DateTime))
GO
INSERT [dbo].[Products] ([ID], [Name], [Description], [CategoryID], [Price], [Cost], [StockQuantity], [IsDeleted], [ModifiedOn]) VALUES (84, N'Cable otter box USB - type c 2m', N'Cable Iphone Curved design Metallic casing and connectors to ensure durability Durable high-capacity charging and sync capabilities Flexible connectivity at up to 100 lb', 5, CAST(9.00 AS Decimal(18, 2)), CAST(6.50 AS Decimal(18, 2)), 10, 0, CAST(N'2020-05-17T00:00:41.880' AS DateTime))
GO
INSERT [dbo].[Products] ([ID], [Name], [Description], [CategoryID], [Price], [Cost], [StockQuantity], [IsDeleted], [ModifiedOn]) VALUES (85, N'Cable otter box USB - type c 3m', N'Cable Iphone Curved design Metallic casing and connectors to ensure durability Durable high-capacity charging and synchronicity Provides flexibility in connection ports Traction strength greater than 100 lbs Dedicated to phones High-speed 3 c', 5, CAST(12.00 AS Decimal(18, 2)), CAST(8.00 AS Decimal(18, 2)), 10, 0, CAST(N'2020-05-17T00:00:41.880' AS DateTime))
GO
INSERT [dbo].[Products] ([ID], [Name], [Description], [CategoryID], [Price], [Cost], [StockQuantity], [IsDeleted], [ModifiedOn]) VALUES (86, N'Cable otter box type c - type c 3m', N'Cable Iphone Braided design Metallic casing and connectors to ensure durability Durability High capacity for charging and synchronization Availability of flexibility in the ports of communication Over 100 lbs.', 5, CAST(10.00 AS Decimal(18, 2)), CAST(7.50 AS Decimal(18, 2)), 10, 0, CAST(N'2020-05-17T00:00:41.880' AS DateTime))
GO
INSERT [dbo].[Products] ([ID], [Name], [Description], [CategoryID], [Price], [Cost], [StockQuantity], [IsDeleted], [ModifiedOn]) VALUES (87, N'BELKIN RockStar Headphones With Lighting Connector White', N'With high quality sound, supreme comfort and fit, and exceptional durability, ROCKSTAR Headphones with Lightning Connector are the headphones you, and your iPhone, have been waiting for.', 2, CAST(15.00 AS Decimal(18, 2)), CAST(11.00 AS Decimal(18, 2)), 10, 0, CAST(N'2020-05-17T00:00:41.880' AS DateTime))
GO
INSERT [dbo].[Products] ([ID], [Name], [Description], [CategoryID], [Price], [Cost], [StockQuantity], [IsDeleted], [ModifiedOn]) VALUES (88, N'BELKIN RockStar Headphones With Lighting Connector BLACK', N'With high quality sound, supreme comfort and fit, and exceptional durability, ROCKSTAR Headphones with Lightning Connector are the headphones you, and your iPhone, have been waiting for.', 2, CAST(15.00 AS Decimal(18, 2)), CAST(11.00 AS Decimal(18, 2)), 10, 0, CAST(N'2020-05-17T00:00:41.880' AS DateTime))
GO
INSERT [dbo].[Products] ([ID], [Name], [Description], [CategoryID], [Price], [Cost], [StockQuantity], [IsDeleted], [ModifiedOn]) VALUES (89, N'Apple Headset AUX', N'Apple iPhone AUX certified AUX wired headset with microphone and noise isolator Supports iPhone 4/5 / 5s / 6s / 6sPlus and all Android devices with AUX', 2, CAST(9.00 AS Decimal(18, 2)), CAST(6.50 AS Decimal(18, 2)), 10, 0, CAST(N'2020-05-17T00:00:41.880' AS DateTime))
GO
INSERT [dbo].[Products] ([ID], [Name], [Description], [CategoryID], [Price], [Cost], [StockQuantity], [IsDeleted], [ModifiedOn]) VALUES (90, N'Apple Headset for 7/8 7/8PLUS _ X/XS XsMax _XR', N'Apple iPhones Lightning Wired certified by Apple Includes microphone and noise isolator Supports iPhone 7 / 7Plus_8 / 8Plus_X / Xs / XsMax / XR_Ipad Pro / Air Warranty Year', 2, CAST(13.00 AS Decimal(18, 2)), CAST(9.00 AS Decimal(18, 2)), 10, 0, CAST(N'2020-05-17T00:00:41.880' AS DateTime))
GO
INSERT [dbo].[Products] ([ID], [Name], [Description], [CategoryID], [Price], [Cost], [StockQuantity], [IsDeleted], [ModifiedOn]) VALUES (91, N'Bluetooth XL Sport Headset anker', N'Powerful sound, pure sand, dust and water resistant. Powerful battery lasts more than 15 hours, can be connected to Bluetooth, including charging port, recharging port and audio cable port Can use 5000mAh battery', 2, CAST(23.00 AS Decimal(18, 2)), CAST(19.00 AS Decimal(18, 2)), 10, 0, CAST(N'2020-05-17T00:00:41.880' AS DateTime))
GO
INSERT [dbo].[Products] ([ID], [Name], [Description], [CategoryID], [Price], [Cost], [StockQuantity], [IsDeleted], [ModifiedOn]) VALUES (92, N'Soundcore Spirit X Wireless Bluetooth Earphone', N'From a single charge, listen to 12 hours of sublime, bass-driven sound. That’s well over a week of workouts from a single charge.', 2, CAST(15.00 AS Decimal(18, 2)), CAST(11.00 AS Decimal(18, 2)), 10, 0, CAST(N'2020-05-17T00:00:41.880' AS DateTime))
GO
INSERT [dbo].[Products] ([ID], [Name], [Description], [CategoryID], [Price], [Cost], [StockQuantity], [IsDeleted], [ModifiedOn]) VALUES (93, N'Anker Spirit Pro Wireless Earphones Black-Gray', N'SweatGuard technology is specially designed to resist the corrosive properties of sweat. Thanks to SweatGuards extreme waterproof protection, Spirit Pro does not require a cover for its charging portAdjust the intensity of your musicA single charge wil', 2, CAST(18.50 AS Decimal(18, 2)), CAST(14.50 AS Decimal(18, 2)), 10, 0, CAST(N'2020-05-17T00:00:41.880' AS DateTime))
GO
INSERT [dbo].[Products] ([ID], [Name], [Description], [CategoryID], [Price], [Cost], [StockQuantity], [IsDeleted], [ModifiedOn]) VALUES (94, N'JBL Tune205 Earphone-aux', N'12.5mm Drivers with JBL Pure Bass Sound3-Button Inline Remote with MicrophoneTangle-Free Flat CableSoft, Comfort-Fit Earbuds', 2, CAST(13.00 AS Decimal(18, 2)), CAST(9.00 AS Decimal(18, 2)), 10, 0, CAST(N'2020-05-17T00:00:41.880' AS DateTime))
GO
INSERT [dbo].[Products] ([ID], [Name], [Description], [CategoryID], [Price], [Cost], [StockQuantity], [IsDeleted], [ModifiedOn]) VALUES (95, N'EGO 10000mAh 4 in 1 Powerbank - White', N'Exclusive in kuwait Powerbank 4 in 1 Charge your phone your apple watch your airpods at the same time. 10W wireless charging and 18W PD charging is faster than Apple’s charger! 10000 Capacity.4 USB OUTPUT 1 USB input PD5Led Charging Status LightTYPE', 8, CAST(28.50 AS Decimal(18, 2)), CAST(24.50 AS Decimal(18, 2)), 10, 0, CAST(N'2020-05-17T00:00:41.880' AS DateTime))
GO
INSERT [dbo].[Products] ([ID], [Name], [Description], [CategoryID], [Price], [Cost], [StockQuantity], [IsDeleted], [ModifiedOn]) VALUES (96, N'EGO TRAVEL SMART CHARGER WITH 4 USB PORTS', N'Fast Charging Support 4 devices at the same time You can also use it for travelWarranty: 1year', 4, CAST(8.00 AS Decimal(18, 2)), CAST(4.50 AS Decimal(18, 2)), 10, 0, CAST(N'2020-05-17T00:00:41.880' AS DateTime))
GO
INSERT [dbo].[Products] ([ID], [Name], [Description], [CategoryID], [Price], [Cost], [StockQuantity], [IsDeleted], [ModifiedOn]) VALUES (97, N'EGO THUNDER CUBE QC3 + PD CHARGER', N'USB USB-C PD + QC Dual Port Travel Charger Supported PD + QC3 fast charging technology Warranty: 1 year', 6, CAST(8.50 AS Decimal(18, 2)), CAST(3.50 AS Decimal(18, 2)), 10, 0, CAST(N'2020-05-17T00:00:41.880' AS DateTime))
GO
INSERT [dbo].[Products] ([ID], [Name], [Description], [CategoryID], [Price], [Cost], [StockQuantity], [IsDeleted], [ModifiedOn]) VALUES (98, N'EGO 3 IN 1 CHANGEABLE CHARGER', N'3-in-1 Powerful Charger - Use one device for all your charging needs .. E-Fusion 3 Charger with 6700 powerbank, E-Fusion can charge up to five devices simultaneouslyWarranty: 1 year', 8, CAST(19.00 AS Decimal(18, 2)), CAST(15.00 AS Decimal(18, 2)), 10, 0, CAST(N'2020-05-17T00:00:41.880' AS DateTime))
GO
INSERT [dbo].[Products] ([ID], [Name], [Description], [CategoryID], [Price], [Cost], [StockQuantity], [IsDeleted], [ModifiedOn]) VALUES (99, N'EGO LIGHTNING CABLE 100CM- BLUE', N'High Tensile Strength and Durable MFI Certified IC3A Fast Charging Super Tough and Durable (Available Colors: Gray, Red, Blue) Warranty: 1 year', 5, CAST(6.00 AS Decimal(18, 2)), CAST(3.50 AS Decimal(18, 2)), 10, 0, CAST(N'2020-05-17T00:00:41.880' AS DateTime))
GO
INSERT [dbo].[Products] ([ID], [Name], [Description], [CategoryID], [Price], [Cost], [StockQuantity], [IsDeleted], [ModifiedOn]) VALUES (100, N'EGO LIGHTNING CABLE 100CM- GREY', N'High Tensile Strength and Durable MFI Certified IC3A Fast Charging Super Tough and Durable (Available Colors: Gray, Red, Blue) Warranty: 1 year', 5, CAST(6.00 AS Decimal(18, 2)), CAST(3.50 AS Decimal(18, 2)), 10, 0, CAST(N'2020-05-17T00:00:41.880' AS DateTime))
GO
INSERT [dbo].[Products] ([ID], [Name], [Description], [CategoryID], [Price], [Cost], [StockQuantity], [IsDeleted], [ModifiedOn]) VALUES (101, N'EGO LIGHTNING CABLE 100CM- RED', N'High Tensile Strength and Durable MFI Certified IC3A Fast Charging Super Tough and Durable (Available Colors: Gray, Red, Blue) Warranty: 1 year', 5, CAST(6.00 AS Decimal(18, 2)), CAST(3.50 AS Decimal(18, 2)), 10, 0, CAST(N'2020-05-17T00:00:41.880' AS DateTime))
GO
INSERT [dbo].[Products] ([ID], [Name], [Description], [CategoryID], [Price], [Cost], [StockQuantity], [IsDeleted], [ModifiedOn]) VALUES (102, N'EGO LIGHTNING CABLE 200CM- BLUE', N'High Tensile Strength and Durable MFI Certified IC3A Fast Charging Super Tough and Durable (Available Colors: Gray, Gold, Blue) Warranty: 1 year', 5, CAST(7.00 AS Decimal(18, 2)), CAST(3.50 AS Decimal(18, 2)), 10, 0, CAST(N'2020-05-17T00:00:41.880' AS DateTime))
GO
INSERT [dbo].[Products] ([ID], [Name], [Description], [CategoryID], [Price], [Cost], [StockQuantity], [IsDeleted], [ModifiedOn]) VALUES (103, N'EGO LIGHTNING CABLE 200CM- GOLD', N'High Tensile Strength and Durable MFI Certified IC3A Fast Charging Super Tough and Durable (Available Colors: Gray, Gold, Blue) Warranty: 1 year', 5, CAST(7.00 AS Decimal(18, 2)), CAST(3.50 AS Decimal(18, 2)), 10, 0, CAST(N'2020-05-17T00:00:41.880' AS DateTime))
GO
INSERT [dbo].[Products] ([ID], [Name], [Description], [CategoryID], [Price], [Cost], [StockQuantity], [IsDeleted], [ModifiedOn]) VALUES (104, N'EGO LIGHTNING CABLE 200CM- GREY', N'High Tensile Strength and Durable MFI Certified IC3A Fast Charging Super Tough and Durable (Available Colors: Gray, Gold, Blue) Warranty: 1 year', 5, CAST(7.00 AS Decimal(18, 2)), CAST(3.50 AS Decimal(18, 2)), 10, 0, CAST(N'2020-05-17T00:00:41.880' AS DateTime))
GO
INSERT [dbo].[Products] ([ID], [Name], [Description], [CategoryID], [Price], [Cost], [StockQuantity], [IsDeleted], [ModifiedOn]) VALUES (105, N'EGO LIGHTNING CABLE 200CM- RED', N'High Tensile Strength and Durable MFI Certified IC3A Fast Charging Super Tough and Durable (Available Colors: Gray, Gold, Blue) Warranty: 1 year', 5, CAST(7.00 AS Decimal(18, 2)), CAST(3.50 AS Decimal(18, 2)), 10, 0, CAST(N'2020-05-17T00:00:41.893' AS DateTime))
GO
INSERT [dbo].[Products] ([ID], [Name], [Description], [CategoryID], [Price], [Cost], [StockQuantity], [IsDeleted], [ModifiedOn]) VALUES (106, N'EGO LIGHTNING CABLE 30CM- BLUE', N'High Tensile Strength and Durable MFI Certified IC3A Fast Charging Super Tough and Durable (Available Colors: Gray, Gold, Blue) Warranty: 1 year', 5, CAST(5.00 AS Decimal(18, 2)), CAST(3.50 AS Decimal(18, 2)), 10, 0, CAST(N'2020-05-17T00:00:41.893' AS DateTime))
GO
INSERT [dbo].[Products] ([ID], [Name], [Description], [CategoryID], [Price], [Cost], [StockQuantity], [IsDeleted], [ModifiedOn]) VALUES (107, N'EGO LIGHTNING CABLE 30CM- GOLD', N'High Tensile Strength and Durable MFI Certified IC3A Fast Charging Super Tough and Durable (Available Colors: Gray, Gold, Blue) Warranty: 1 year', 5, CAST(5.00 AS Decimal(18, 2)), CAST(3.50 AS Decimal(18, 2)), 10, 0, CAST(N'2020-05-17T00:00:41.893' AS DateTime))
GO
INSERT [dbo].[Products] ([ID], [Name], [Description], [CategoryID], [Price], [Cost], [StockQuantity], [IsDeleted], [ModifiedOn]) VALUES (108, N'EGO LIGHTNING CABLE 30CM- GREY', N'High Tensile Strength and Durable MFI Certified IC3A Fast Charging Super Tough and Durable (Available Colors: Gray, Gold, Blue) Warranty: 1 year', 5, CAST(5.00 AS Decimal(18, 2)), CAST(3.50 AS Decimal(18, 2)), 10, 0, CAST(N'2020-05-17T00:00:41.893' AS DateTime))
GO
INSERT [dbo].[Products] ([ID], [Name], [Description], [CategoryID], [Price], [Cost], [StockQuantity], [IsDeleted], [ModifiedOn]) VALUES (109, N'EGO USB TO TYPE-C 200CM - BLUE', N'FAST Charging PD TYPE- C to Lightning. MFI Certified ConnectorDurable Cable - Warranty: 1 year', 5, CAST(5.50 AS Decimal(18, 2)), CAST(3.50 AS Decimal(18, 2)), 10, 0, CAST(N'2020-05-17T00:00:41.893' AS DateTime))
GO
INSERT [dbo].[Products] ([ID], [Name], [Description], [CategoryID], [Price], [Cost], [StockQuantity], [IsDeleted], [ModifiedOn]) VALUES (110, N'EGO USB TO TYPE-C 200CM - GOLD', N'FAST Charging PD TYPE- C to Lightning. MFI Certified ConnectorDurable Cable - Warranty: 1 year', 5, CAST(5.50 AS Decimal(18, 2)), CAST(3.50 AS Decimal(18, 2)), 10, 0, CAST(N'2020-05-17T00:00:41.893' AS DateTime))
GO
INSERT [dbo].[Products] ([ID], [Name], [Description], [CategoryID], [Price], [Cost], [StockQuantity], [IsDeleted], [ModifiedOn]) VALUES (111, N'EGO USB TO TYPE-C 30CM - GOLD', N'FAST Charging PD TYPE- C to Lightning. MFI Certified ConnectorDurable Cable - Warranty: 1 year', 5, CAST(4.00 AS Decimal(18, 2)), CAST(3.50 AS Decimal(18, 2)), 10, 0, CAST(N'2020-05-17T00:00:41.893' AS DateTime))
GO
INSERT [dbo].[Products] ([ID], [Name], [Description], [CategoryID], [Price], [Cost], [StockQuantity], [IsDeleted], [ModifiedOn]) VALUES (112, N'EGO USB TO TYPE-C 200CM - GRAY', N'FAST Charging PD TYPE- C to Lightning. MFI Certified ConnectorDurable Cable - Warranty: 1 year', 5, CAST(5.50 AS Decimal(18, 2)), CAST(3.50 AS Decimal(18, 2)), 10, 0, CAST(N'2020-05-17T00:00:41.893' AS DateTime))
GO
INSERT [dbo].[Products] ([ID], [Name], [Description], [CategoryID], [Price], [Cost], [StockQuantity], [IsDeleted], [ModifiedOn]) VALUES (113, N'EGO USB TO TYPE-C 100CM - GRAY', N'FAST Charging PD TYPE- C to Lightning. MFI Certified ConnectorDurable Cable - Warranty: 1 year', 5, CAST(4.50 AS Decimal(18, 2)), CAST(3.50 AS Decimal(18, 2)), 10, 0, CAST(N'2020-05-17T00:00:41.893' AS DateTime))
GO
INSERT [dbo].[Products] ([ID], [Name], [Description], [CategoryID], [Price], [Cost], [StockQuantity], [IsDeleted], [ModifiedOn]) VALUES (114, N'EGO TYPE-C to LIGNTNING CABLE PD 20CM - BLACK', N'FAST Charging PD TYPE- C to Lightning. MFI Certified ConnectorDurable Cable - Warranty: 1 year', 5, CAST(6.00 AS Decimal(18, 2)), CAST(3.50 AS Decimal(18, 2)), 10, 0, CAST(N'2020-05-17T00:00:41.893' AS DateTime))
GO
INSERT [dbo].[Products] ([ID], [Name], [Description], [CategoryID], [Price], [Cost], [StockQuantity], [IsDeleted], [ModifiedOn]) VALUES (115, N'EGO TYPE-C to LIGNTNING CABLE PD 100CM -BLACK', N'FAST Charging PD TYPE- C to Lightning. MFI Certified ConnectorDurable Cable - Warranty: 1 year', 5, CAST(7.00 AS Decimal(18, 2)), CAST(3.50 AS Decimal(18, 2)), 10, 0, CAST(N'2020-05-17T00:00:41.893' AS DateTime))
GO
INSERT [dbo].[Products] ([ID], [Name], [Description], [CategoryID], [Price], [Cost], [StockQuantity], [IsDeleted], [ModifiedOn]) VALUES (116, N'EGO TYPE-C to LIGNTNING CABLE PD 200CM - BLACK', N'FAST Charging PD TYPE- C to Lightning. MFI Certified ConnectorDurable Cable - Warranty: 1 year', 5, CAST(8.00 AS Decimal(18, 2)), CAST(4.50 AS Decimal(18, 2)), 10, 0, CAST(N'2020-05-17T00:00:41.893' AS DateTime))
GO
INSERT [dbo].[Products] ([ID], [Name], [Description], [CategoryID], [Price], [Cost], [StockQuantity], [IsDeleted], [ModifiedOn]) VALUES (117, N'EGO 120W 5USB Extreme Charger', N'120W Extreme Charger Max Output 24AQC+PD Fast Charge 2 TYPE C FAST CHARGE3 USB QC 3Support All Type C DevicesLed Status light - Warranty: 1 year', 4, CAST(20.00 AS Decimal(18, 2)), CAST(15.70 AS Decimal(18, 2)), 10, 0, CAST(N'2020-05-17T00:00:41.893' AS DateTime))
GO
INSERT [dbo].[Products] ([ID], [Name], [Description], [CategoryID], [Price], [Cost], [StockQuantity], [IsDeleted], [ModifiedOn]) VALUES (118, N'EGO 72W Mighty Charger', N'Support fast charging system1 PORT PD1 PORT QC3 3 PORTS 2.8A Intelligent distribution fast charging module Small and Portable yet powerful adapter - Warranty: 1 year', 4, CAST(12.00 AS Decimal(18, 2)), CAST(10.00 AS Decimal(18, 2)), 10, 0, CAST(N'2020-05-17T00:00:41.893' AS DateTime))
GO
INSERT [dbo].[Products] ([ID], [Name], [Description], [CategoryID], [Price], [Cost], [StockQuantity], [IsDeleted], [ModifiedOn]) VALUES (119, N'EGO AirAlly Stand - Black', N'EGO AirAlly Stand - Black', 3, CAST(1.00 AS Decimal(18, 2)), CAST(0.50 AS Decimal(18, 2)), 10, 0, CAST(N'2020-05-17T00:00:41.893' AS DateTime))
GO
INSERT [dbo].[Products] ([ID], [Name], [Description], [CategoryID], [Price], [Cost], [StockQuantity], [IsDeleted], [ModifiedOn]) VALUES (120, N'EGO AirAlly Stand - White', N'EGO AirAlly Stand - White', 3, CAST(1.00 AS Decimal(18, 2)), CAST(0.50 AS Decimal(18, 2)), 10, 0, CAST(N'2020-05-17T00:00:41.893' AS DateTime))
GO
INSERT [dbo].[Products] ([ID], [Name], [Description], [CategoryID], [Price], [Cost], [StockQuantity], [IsDeleted], [ModifiedOn]) VALUES (121, N'RAVPOWER TYPE-C to TYPE -C Cable 1M', N'Charge and transfer data at high speedCable Type C to Type CBend over 12,000 timesQuick charge 2.4ABraided Nylon, Kevlar fiber core - Warranty 18 Months.', 5, CAST(3.50 AS Decimal(18, 2)), CAST(1.50 AS Decimal(18, 2)), 10, 0, CAST(N'2020-05-17T00:00:41.893' AS DateTime))
GO
INSERT [dbo].[Products] ([ID], [Name], [Description], [CategoryID], [Price], [Cost], [StockQuantity], [IsDeleted], [ModifiedOn]) VALUES (122, N'RAVPOWER USB to TYPE -C Cable 1M', N'Charge and transfer data at high speedCable USB to Type C Bend over 12,000 timesQuick charge 2.4ABraided Nylon, Kevlar fiber core - Warranty 18 Months.', 5, CAST(3.50 AS Decimal(18, 2)), CAST(1.50 AS Decimal(18, 2)), 10, 0, CAST(N'2020-05-17T00:00:41.893' AS DateTime))
GO
INSERT [dbo].[Products] ([ID], [Name], [Description], [CategoryID], [Price], [Cost], [StockQuantity], [IsDeleted], [ModifiedOn]) VALUES (123, N'Anker PowerCore Metro 10000 PD Black', N'Portable power: PowerCore Metro 10000 PD is one of our Slimmest power delivery power banks yet, with enough capacity to provide more than two charges for iPhone XS or Google Pixel, and almost one full charge for an 11" IPad Pro. And the 18W USB-C power de', 8, CAST(14.90 AS Decimal(18, 2)), CAST(10.90 AS Decimal(18, 2)), 10, 0, CAST(N'2020-05-17T00:00:41.893' AS DateTime))
GO
INSERT [dbo].[Products] ([ID], [Name], [Description], [CategoryID], [Price], [Cost], [StockQuantity], [IsDeleted], [ModifiedOn]) VALUES (124, N'Anker PowerCore Metro Essential 20000 PD', N'The Anker Advantage: Join the 50 million+ powered by our leading technology.Ultra-high capacity: The massive 20, 000mAh capacity provides more than 5 and a half charges for iPhone XS, more than 4 full charges for Samsung Galaxy S10, and over 2 and a half', 8, CAST(19.00 AS Decimal(18, 2)), CAST(15.00 AS Decimal(18, 2)), 10, 0, CAST(N'2020-05-17T00:00:41.893' AS DateTime))
GO
INSERT [dbo].[Products] ([ID], [Name], [Description], [CategoryID], [Price], [Cost], [StockQuantity], [IsDeleted], [ModifiedOn]) VALUES (125, N'UGREEN Micro USB 2.0 Data Cable 1M', N'Ugreen Micro USB Cable 3A Nylon Fast Charge USB Data Cable for android phone & tablet, Supports Quick Charge 3, Fast data transmission cable with wide compatibilty and supports most of andriod & windows with micro port.', 5, CAST(3.50 AS Decimal(18, 2)), CAST(1.50 AS Decimal(18, 2)), 10, 0, CAST(N'2020-05-17T00:00:41.893' AS DateTime))
GO
INSERT [dbo].[Products] ([ID], [Name], [Description], [CategoryID], [Price], [Cost], [StockQuantity], [IsDeleted], [ModifiedOn]) VALUES (126, N'UGREEN USB to USB-C Data Cable 1M', N'Ugreen USB Type C Cable for Samsung Galaxy S10 S9 Mobile Phone Cable Fast USB C Charge Data Cable . 3A Nylon Type- C Cable, Reversible Support Fast Charge.', 5, CAST(4.00 AS Decimal(18, 2)), CAST(2.50 AS Decimal(18, 2)), 10, 0, CAST(N'2020-05-17T00:00:41.893' AS DateTime))
GO
INSERT [dbo].[Products] ([ID], [Name], [Description], [CategoryID], [Price], [Cost], [StockQuantity], [IsDeleted], [ModifiedOn]) VALUES (127, N'UGREEN 3M HDMI cable 2.0 Version', N'HDMI 2.0 CABLE: Enable you to directly connect your laptop to an HDMI-equipped display with maximum 4K at 60Hz. Warranty: 18 Months', 5, CAST(5.50 AS Decimal(18, 2)), CAST(2.50 AS Decimal(18, 2)), 10, 0, CAST(N'2020-05-17T00:00:41.893' AS DateTime))
GO
INSERT [dbo].[Products] ([ID], [Name], [Description], [CategoryID], [Price], [Cost], [StockQuantity], [IsDeleted], [ModifiedOn]) VALUES (128, N'UGREEN TYPE-C to TYPE-C', N'Faster and Safer Charging Up to 60W of PowerUGREEN USB C-C cable offers you an output of maximum 20V 3A current, charging your Type C smartphone, tablet or laptop rapidly.', 5, CAST(5.50 AS Decimal(18, 2)), CAST(2.50 AS Decimal(18, 2)), 10, 0, CAST(N'2020-05-17T00:00:41.893' AS DateTime))
GO
INSERT [dbo].[Products] ([ID], [Name], [Description], [CategoryID], [Price], [Cost], [StockQuantity], [IsDeleted], [ModifiedOn]) VALUES (129, N'UGREEN Lightning to TYPE-C', N'Ugreen MFi USB Type C to Lightning Cable for iPhone 11 Pro X XS 8 XR PD18W Fast USB C Charging Data Cable for Macbook PD Cable, MFI CERTIFIED.', 5, CAST(6.00 AS Decimal(18, 2)), CAST(3.50 AS Decimal(18, 2)), 10, 0, CAST(N'2020-05-17T00:00:41.893' AS DateTime))
GO
INSERT [dbo].[Products] ([ID], [Name], [Description], [CategoryID], [Price], [Cost], [StockQuantity], [IsDeleted], [ModifiedOn]) VALUES (130, N'UGREEN 10000mAh mini PD - QC3.0 POWERBANK', N'Ugreen Power Bank 10000mAh Quick Charge 4.0 3.0 QC3.0 External Mobile Battery Fast PD Charger for iPhone 11 8 Xs Mini Powerbank, 18W TYPE- C OUT PUT.', 8, CAST(11.50 AS Decimal(18, 2)), CAST(7.50 AS Decimal(18, 2)), 10, 0, CAST(N'2020-05-17T00:00:41.893' AS DateTime))
GO
INSERT [dbo].[Products] ([ID], [Name], [Description], [CategoryID], [Price], [Cost], [StockQuantity], [IsDeleted], [ModifiedOn]) VALUES (131, N'UGREEN 10000mAh Wireless PD POWERBANK', N'UGREEN 1000mAh Powerbank with 38W. Charge 0% to 50% in 30mins for iPhone 8 / X3Hours full charge power bank. Qi Wireless Charger output: 10W', 8, CAST(14.50 AS Decimal(18, 2)), CAST(10.50 AS Decimal(18, 2)), 10, 0, CAST(N'2020-05-17T00:00:41.893' AS DateTime))
GO
INSERT [dbo].[Products] ([ID], [Name], [Description], [CategoryID], [Price], [Cost], [StockQuantity], [IsDeleted], [ModifiedOn]) VALUES (132, N'UGREEN PD Power Bank 20000mAh', N'?Large Capacity PD Power Bank? The UGREEN PD Power bank packed with 20000mAh high capacity battery inside, offers multiple charges for your devices to save the day, the 20000mah power bank supports 5 recharge for iPhone XR, 4.5 recharge for S10, 8 recharg', 8, CAST(16.50 AS Decimal(18, 2)), CAST(12.50 AS Decimal(18, 2)), 10, 0, CAST(N'2020-05-17T00:00:41.893' AS DateTime))
GO
INSERT [dbo].[Products] ([ID], [Name], [Description], [CategoryID], [Price], [Cost], [StockQuantity], [IsDeleted], [ModifiedOn]) VALUES (133, N'UGREEN Type C to HDMI Cable', N'UGREEN USB type C to HDMI cable can easily connect a USB-C enabled smartphone / Laptop to a HDTV, monitor or projector with HDMI port. It is ideal for conference, presentation, gaming, or expanding workspace by connecting your USB-C devices to a large scr', 5, CAST(11.50 AS Decimal(18, 2)), CAST(7.50 AS Decimal(18, 2)), 10, 0, CAST(N'2020-05-17T00:00:41.893' AS DateTime))
GO
INSERT [dbo].[Products] ([ID], [Name], [Description], [CategoryID], [Price], [Cost], [StockQuantity], [IsDeleted], [ModifiedOn]) VALUES (134, N'UGREEN 5 in 1 Converter', N'UGREEN 5-in-1 USB-C data hub features a 4K HDMI output port, TYPE-C PD, and 3 USB 3.0 ports. And all hub ports can work simultaneously, small yet mighty.', 5, CAST(17.50 AS Decimal(18, 2)), CAST(13.50 AS Decimal(18, 2)), 10, 0, CAST(N'2020-05-17T00:00:41.893' AS DateTime))
GO
INSERT [dbo].[Products] ([ID], [Name], [Description], [CategoryID], [Price], [Cost], [StockQuantity], [IsDeleted], [ModifiedOn]) VALUES (135, N'UGREEN Magnetic Car Phone HolderColor:Black', N'RELIABLE ADHESIVE: With strong adhesive, UGREEN car phone mount can firmly stick to your car dash for a longer lifespan. Never worry about falling off even driving on a bumpy road.', 3, CAST(5.00 AS Decimal(18, 2)), CAST(2.50 AS Decimal(18, 2)), 10, 0, CAST(N'2020-05-17T00:00:41.893' AS DateTime))
GO
INSERT [dbo].[Products] ([ID], [Name], [Description], [CategoryID], [Price], [Cost], [StockQuantity], [IsDeleted], [ModifiedOn]) VALUES (136, N'UGREEN Car Phone Holder', N'The holder locks the phone automatically by gravity linkage. So it only supports vertical mode', 3, CAST(5.00 AS Decimal(18, 2)), CAST(2.50 AS Decimal(18, 2)), 10, 0, CAST(N'2020-05-17T00:00:41.893' AS DateTime))
GO
INSERT [dbo].[Products] ([ID], [Name], [Description], [CategoryID], [Price], [Cost], [StockQuantity], [IsDeleted], [ModifiedOn]) VALUES (137, N'UGREEN Mini Car Charger 5V4.8A', N'Ugreen Mini USB Car Charger For Mobile Phone Tablet GPS 4.8A Fast Charger Car-Charger Dual USB Car Phone Charger Adapter in Car', 7, CAST(4.00 AS Decimal(18, 2)), CAST(2.50 AS Decimal(18, 2)), 10, 0, CAST(N'2020-05-17T00:00:41.893' AS DateTime))
GO
INSERT [dbo].[Products] ([ID], [Name], [Description], [CategoryID], [Price], [Cost], [StockQuantity], [IsDeleted], [ModifiedOn]) VALUES (138, N'UGREEN Quick Charge 3.0 Dual Port USB Car Charger (Black)', N'QUICK CHARGE QC 3.0 4X FASTER: The Quick Charge QC3.0 USB port charges 4X faster than standard chargers with Max 3A current output, compatible with Quick Charge 3.0 / 2.0 devices and non Quick Charge devices such as Samsung Galaxy S10/S9/S8/S8 Plus/S7/S6/', 7, CAST(4.50 AS Decimal(18, 2)), CAST(2.50 AS Decimal(18, 2)), 10, 0, CAST(N'2020-05-17T00:00:41.893' AS DateTime))
GO
INSERT [dbo].[Products] ([ID], [Name], [Description], [CategoryID], [Price], [Cost], [StockQuantity], [IsDeleted], [ModifiedOn]) VALUES (139, N'UGREEN PD+QC 3.0 Fast Car Charger', N'Charging 50% in 30 min (iPhone 11 / 8 / X) - only in PD port: Perfect for charging your iPhone 11 / XS / iPhone XS Max / iPhone XR / iPhone X / iPhone 8 / iPhone 8 Plus at full speed. For example, the iPhone X can be charged from 0% to 50% in just 30 minu', 7, CAST(6.50 AS Decimal(18, 2)), CAST(3.50 AS Decimal(18, 2)), 10, 0, CAST(N'2020-05-17T00:00:41.893' AS DateTime))
GO
INSERT [dbo].[Products] ([ID], [Name], [Description], [CategoryID], [Price], [Cost], [StockQuantity], [IsDeleted], [ModifiedOn]) VALUES (140, N'UGREEN Electronics Gadgets Organizer Bag', N'UGREEN accessory bag case is specially designed for your complete Nintendo Switch devices and other accessories. It is convenient to carry,when you go out for visiting or vocation and well stored when it is not in use. Everything will be well organized an', 9, CAST(7.00 AS Decimal(18, 2)), CAST(3.50 AS Decimal(18, 2)), 10, 0, CAST(N'2020-05-17T00:00:41.893' AS DateTime))
GO
INSERT [dbo].[Products] ([ID], [Name], [Description], [CategoryID], [Price], [Cost], [StockQuantity], [IsDeleted], [ModifiedOn]) VALUES (141, N'UGREEN Nintendo Switch Storage BagEnvironmental protection', N'UGREEN Electronics Travel organizer is designed to keeps your essential gadgets in order and in reach without searching all over the place, which is a must-have for daily life / school.', 9, CAST(7.23 AS Decimal(18, 2)), CAST(4.00 AS Decimal(18, 2)), 10, 0, CAST(N'2020-05-20T11:47:39.037' AS DateTime))
GO
INSERT [dbo].[Products] ([ID], [Name], [Description], [CategoryID], [Price], [Cost], [StockQuantity], [IsDeleted], [ModifiedOn]) VALUES (142, N'UGREEN Nintendo SWITCH Protect Case', N'Easy to Put on and Take off With unique split design for the joy cons, this case protector allows you to take out joy controllers without removing the whole case. Easy to put on and take off whenever you want to dock the switch, especially for playing han', 9, CAST(5.00 AS Decimal(18, 2)), CAST(2.50 AS Decimal(18, 2)), 10, 0, CAST(N'2020-05-17T00:00:41.910' AS DateTime))
GO
INSERT [dbo].[Products] ([ID], [Name], [Description], [CategoryID], [Price], [Cost], [StockQuantity], [IsDeleted], [ModifiedOn]) VALUES (143, N'Anker power port 5 white BD', N'60W high power charger with the latest electronic technology. Temperature control technology with high voltage and fast charging technology.', 4, CAST(17.50 AS Decimal(18, 2)), CAST(13.50 AS Decimal(18, 2)), 10, 0, CAST(N'2020-05-17T00:00:41.910' AS DateTime))
GO
INSERT [dbo].[Products] ([ID], [Name], [Description], [CategoryID], [Price], [Cost], [StockQuantity], [IsDeleted], [ModifiedOn]) VALUES (144, N'Apple HDMI To HDMI Cable', N'Apple HDMI To HDMI CableThe Apple HDMI to HDMI cable lets you connect an Apple TV, Mac mini, or other HDMI device to an HDTV or A/V receiver.', 5, CAST(6.00 AS Decimal(18, 2)), CAST(3.00 AS Decimal(18, 2)), 10, 0, CAST(N'2020-05-20T14:17:23.277' AS DateTime))
GO
INSERT [dbo].[Products] ([ID], [Name], [Description], [CategoryID], [Price], [Cost], [StockQuantity], [IsDeleted], [ModifiedOn]) VALUES (145, N'Apple USB-C to 3.5mm Headphone Jack Adapter', N'Combination Of Great TechnologyThe USB-C to 3.5mm Headphone Jack Adapter lets you connect devices that use a standard 3.5mm audio plug like headphones or speakers to your USB-C devices.', 5, CAST(5.50 AS Decimal(18, 2)), CAST(3.50 AS Decimal(18, 2)), 10, 0, CAST(N'2020-05-17T00:00:41.910' AS DateTime))
GO
INSERT [dbo].[Products] ([ID], [Name], [Description], [CategoryID], [Price], [Cost], [StockQuantity], [IsDeleted], [ModifiedOn]) VALUES (146, N'Apple Type-C to Type-C Charge Cable 1Meter', N'Reversible designUSB-C (1m)Syncing and chargingConnects your latest iPad Pro models with USB-C', 5, CAST(7.50 AS Decimal(18, 2)), CAST(3.50 AS Decimal(18, 2)), 10, 0, CAST(N'2020-05-17T00:00:41.910' AS DateTime))
GO
INSERT [dbo].[Products] ([ID], [Name], [Description], [CategoryID], [Price], [Cost], [StockQuantity], [IsDeleted], [ModifiedOn]) VALUES (147, N'Apple Type-C to Type-C Charge Cable 2Meters', N'Reversible designUSB-C (2m)Syncing and chargingConnects your latest iPad Pro models with USB-C', 5, CAST(8.50 AS Decimal(18, 2)), CAST(4.00 AS Decimal(18, 2)), 10, 0, CAST(N'2020-05-20T14:19:45.513' AS DateTime))
GO
INSERT [dbo].[Products] ([ID], [Name], [Description], [CategoryID], [Price], [Cost], [StockQuantity], [IsDeleted], [ModifiedOn]) VALUES (148, N'Apple 12W Usb Power Adapter - White', N'The Apple Power Adapter is the perfect charger for all your Apple devices whether iPad, iPhone, iPod, MacBook, and the 13-inch MacBook Pro. It offers fast and quick charging for any of your devices.', 6, CAST(9.00 AS Decimal(18, 2)), CAST(5.50 AS Decimal(18, 2)), 10, 0, CAST(N'2020-05-17T00:00:41.910' AS DateTime))
GO
INSERT [dbo].[Products] ([ID], [Name], [Description], [CategoryID], [Price], [Cost], [StockQuantity], [IsDeleted], [ModifiedOn]) VALUES (149, N'Apple 18W USB-C Power Adapter', N'Compact design18W powerApple USB Power AdaptorCompatibility : iPhone/iPad Mini/iPod models', 6, CAST(12.50 AS Decimal(18, 2)), CAST(8.50 AS Decimal(18, 2)), 10, 0, CAST(N'2020-05-27T07:28:39.850' AS DateTime))
GO
INSERT [dbo].[Products] ([ID], [Name], [Description], [CategoryID], [Price], [Cost], [StockQuantity], [IsDeleted], [ModifiedOn]) VALUES (150, N'Anker Ccar Charge PowerDrive PD+ 2', N'Equipped with 1 18W USB-C Power Delivery port, and 1 15W legacy USB port with PowerIQ2.0, to simultaneously charge 2 devices up to 1-and-a-half hours faster than other chargers.', 7, CAST(7.90 AS Decimal(18, 2)), CAST(4.50 AS Decimal(18, 2)), 10, 0, CAST(N'2020-05-17T00:00:41.910' AS DateTime))
GO
INSERT [dbo].[Products] ([ID], [Name], [Description], [CategoryID], [Price], [Cost], [StockQuantity], [IsDeleted], [ModifiedOn]) VALUES (151, N'ANKER POWERBANK POWERCORE SLIM 10000mAH PD', N'Triple Charging Modes: 18W Power Delivery USB-C port, PowerIQ-enabled USB-A port, and trickle-charging mode for low-power devices. Use the dual USB ports to charge two devices simultaneously.', 8, CAST(12.90 AS Decimal(18, 2)), CAST(8.90 AS Decimal(18, 2)), 10, 0, CAST(N'2020-05-17T00:00:41.910' AS DateTime))
GO
INSERT [dbo].[Products] ([ID], [Name], [Description], [CategoryID], [Price], [Cost], [StockQuantity], [IsDeleted], [ModifiedOn]) VALUES (152, N'ELEMENT CASE IPHONE 11 PRO SHADOW - BLACK', N'Sure grip - top, bottom, and sides features ergonomic design for a more comfortable and secure graspFast tap buttons - independent buttons allow the phone controls to work as seamlessly as they would without a casePerforated Back plate - provides a soft', 9, CAST(12.50 AS Decimal(18, 2)), CAST(8.50 AS Decimal(18, 2)), 10, 0, CAST(N'2020-05-17T00:00:41.910' AS DateTime))
GO
INSERT [dbo].[Products] ([ID], [Name], [Description], [CategoryID], [Price], [Cost], [StockQuantity], [IsDeleted], [ModifiedOn]) VALUES (153, N'ELEMENT CASE IPHONE 11 PRO SHADOW - OXBLOOD', N'Sure grip - top, bottom, and sides features ergonomic design for a more comfortable and secure graspFast tap buttons - independent buttons allow the phone controls to work as seamlessly as they would without a casePerforated Back plate - provides a soft', 9, CAST(12.50 AS Decimal(18, 2)), CAST(8.50 AS Decimal(18, 2)), 10, 0, CAST(N'2020-05-17T00:00:41.910' AS DateTime))
GO
INSERT [dbo].[Products] ([ID], [Name], [Description], [CategoryID], [Price], [Cost], [StockQuantity], [IsDeleted], [ModifiedOn]) VALUES (154, N'ELEMENT CASE IPHONE 11 PRO MAX SHADOW - BLACK', N'Sure grip - top, bottom, and sides features ergonomic design for a more comfortable and secure graspFast tap buttons - independent buttons allow the phone controls to work as seamlessly as they would without a casePerforated Back plate - provides a soft', 9, CAST(12.50 AS Decimal(18, 2)), CAST(8.50 AS Decimal(18, 2)), 10, 0, CAST(N'2020-05-17T00:00:41.910' AS DateTime))
GO
INSERT [dbo].[Products] ([ID], [Name], [Description], [CategoryID], [Price], [Cost], [StockQuantity], [IsDeleted], [ModifiedOn]) VALUES (155, N'ELEMENT CASE IPHONE 11 PRO SHADOW MAX - BLACK', N'Sure grip - top, bottom, and sides features ergonomic design for a more comfortable and secure graspFast tap buttons - independent buttons allow the phone controls to work as seamlessly as they would without a casePerforated Back plate - provides a soft', 9, CAST(12.50 AS Decimal(18, 2)), CAST(8.50 AS Decimal(18, 2)), 10, 0, CAST(N'2020-05-17T00:00:41.910' AS DateTime))
GO
INSERT [dbo].[Products] ([ID], [Name], [Description], [CategoryID], [Price], [Cost], [StockQuantity], [IsDeleted], [ModifiedOn]) VALUES (156, N'ELEMENT CASE IPHONE 11 RAIL- CLEAR', N'Sure grip - top, bottom, and sides features ergonomic design for a more comfortable and secure graspFast tap buttons - independent buttons allow the phone controls to work as seamlessly as they would without a casePerforated Back plate - provides a soft', 9, CAST(10.90 AS Decimal(18, 2)), CAST(6.90 AS Decimal(18, 2)), 10, 0, CAST(N'2020-05-17T00:00:41.910' AS DateTime))
GO
INSERT [dbo].[Products] ([ID], [Name], [Description], [CategoryID], [Price], [Cost], [StockQuantity], [IsDeleted], [ModifiedOn]) VALUES (157, N'ELEMENT CASE IPHONE 11 RAIL- CLEAR/ SOLID BLACK', N'Sure grip - top, bottom, and sides features ergonomic design for a more comfortable and secure graspFast tap buttons - independent buttons allow the phone controls to work as seamlessly as they would without a casePerforated Back plate - provides a soft', 9, CAST(10.90 AS Decimal(18, 2)), CAST(6.90 AS Decimal(18, 2)), 10, 0, CAST(N'2020-05-17T00:00:41.910' AS DateTime))
GO
INSERT [dbo].[Products] ([ID], [Name], [Description], [CategoryID], [Price], [Cost], [StockQuantity], [IsDeleted], [ModifiedOn]) VALUES (158, N'ELEMENT CASE IPHONE 11 PRO RAIL- CLEAR', N'Sure grip - top, bottom, and sides features ergonomic design for a more comfortable and secure graspFast tap buttons - independent buttons allow the phone controls to work as seamlessly as they would without a casePerforated Back plate - provides a soft', 9, CAST(10.90 AS Decimal(18, 2)), CAST(6.90 AS Decimal(18, 2)), 10, 0, CAST(N'2020-05-17T00:00:41.910' AS DateTime))
GO
INSERT [dbo].[Products] ([ID], [Name], [Description], [CategoryID], [Price], [Cost], [StockQuantity], [IsDeleted], [ModifiedOn]) VALUES (159, N'ELEMENT CASE IPHONE 11 PRO MAX- CLEAR/SOLID RED', N'Sure grip - top, bottom, and sides features ergonomic design for a more comfortable and secure graspFast tap buttons - independent buttons allow the phone controls to work as seamlessly as they would without a casePerforated Back plate - provides a soft', 9, CAST(10.90 AS Decimal(18, 2)), CAST(6.90 AS Decimal(18, 2)), 10, 0, CAST(N'2020-05-17T00:00:41.910' AS DateTime))
GO
INSERT [dbo].[Products] ([ID], [Name], [Description], [CategoryID], [Price], [Cost], [StockQuantity], [IsDeleted], [ModifiedOn]) VALUES (160, N'ELEMENT CASE IPHONE 11 PRO MAX- CLEAR/SOLID BLACK', N'Sure grip - top, bottom, and sides features ergonomic design for a more comfortable and secure graspFast tap buttons - independent buttons allow the phone controls to work as seamlessly as they would without a casePerforated Back plate - provides a soft', 9, CAST(10.90 AS Decimal(18, 2)), CAST(6.90 AS Decimal(18, 2)), 10, 0, CAST(N'2020-05-17T00:00:41.910' AS DateTime))
GO
INSERT [dbo].[Products] ([ID], [Name], [Description], [CategoryID], [Price], [Cost], [StockQuantity], [IsDeleted], [ModifiedOn]) VALUES (161, N'ELEMENT CASE IPHONE 11 PRO - CLEAR', N'Sure grip - top, bottom, and sides features ergonomic design for a more comfortable and secure graspFast tap buttons - independent buttons allow the phone controls to work as seamlessly as they would without a casePerforated Back plate - provides a soft', 9, CAST(10.90 AS Decimal(18, 2)), CAST(6.90 AS Decimal(18, 2)), 10, 0, CAST(N'2020-05-17T00:00:41.910' AS DateTime))
GO
INSERT [dbo].[Products] ([ID], [Name], [Description], [CategoryID], [Price], [Cost], [StockQuantity], [IsDeleted], [ModifiedOn]) VALUES (162, N'ELEMENT CASE IPHONE 11 PRO - CLEAR/FALAMINGO PINK', N'Sure grip - top, bottom, and sides features ergonomic design for a more comfortable and secure graspFast tap buttons - independent buttons allow the phone controls to work as seamlessly as they would without a casePerforated Back plate - provides a soft', 9, CAST(10.90 AS Decimal(18, 2)), CAST(6.90 AS Decimal(18, 2)), 10, 0, CAST(N'2020-05-17T00:00:41.910' AS DateTime))
GO
INSERT [dbo].[Products] ([ID], [Name], [Description], [CategoryID], [Price], [Cost], [StockQuantity], [IsDeleted], [ModifiedOn]) VALUES (163, N'ELEMENT CASE IPHONE 11 PRO - CLEAR/SOLID RED', N'Sure grip - top, bottom, and sides features ergonomic design for a more comfortable and secure graspFast tap buttons - independent buttons allow the phone controls to work as seamlessly as they would without a casePerforated Back plate - provides a soft', 9, CAST(10.90 AS Decimal(18, 2)), CAST(6.90 AS Decimal(18, 2)), 10, 0, CAST(N'2020-05-17T00:00:41.910' AS DateTime))
GO
INSERT [dbo].[Products] ([ID], [Name], [Description], [CategoryID], [Price], [Cost], [StockQuantity], [IsDeleted], [ModifiedOn]) VALUES (164, N'ELEMENT CASE IPHONE 11 PRO RAIL- CLEAR/SOLID BLACK', N'Sure grip - top, bottom, and sides features ergonomic design for a more comfortable and secure graspFast tap buttons - independent buttons allow the phone controls to work as seamlessly as they would without a casePerforated Back plate - provides a soft', 9, CAST(10.90 AS Decimal(18, 2)), CAST(6.90 AS Decimal(18, 2)), 10, 0, CAST(N'2020-05-17T00:00:41.910' AS DateTime))
GO
INSERT [dbo].[Products] ([ID], [Name], [Description], [CategoryID], [Price], [Cost], [StockQuantity], [IsDeleted], [ModifiedOn]) VALUES (165, N'ELEMENT CASE IPHONE 11 RALLY- CLEAR', N'Sure grip - top, bottom, and sides features ergonomic design for a more comfortable and secure graspFast tap buttons - independent buttons allow the phone controls to work as seamlessly as they would without a casePerforated Back plate - provides a soft', 9, CAST(11.90 AS Decimal(18, 2)), CAST(7.90 AS Decimal(18, 2)), 10, 0, CAST(N'2020-05-17T00:00:41.910' AS DateTime))
GO
INSERT [dbo].[Products] ([ID], [Name], [Description], [CategoryID], [Price], [Cost], [StockQuantity], [IsDeleted], [ModifiedOn]) VALUES (166, N'ELEMENT CASE IPHONE 11 PRO MAX RALLY- CLEAR', N'Sure grip - top, bottom, and sides features ergonomic design for a more comfortable and secure graspFast tap buttons - independent buttons allow the phone controls to work as seamlessly as they would without a casePerforated Back plate - provides a soft', 9, CAST(11.90 AS Decimal(18, 2)), CAST(7.90 AS Decimal(18, 2)), 10, 0, CAST(N'2020-05-17T00:00:41.910' AS DateTime))
GO
INSERT [dbo].[Products] ([ID], [Name], [Description], [CategoryID], [Price], [Cost], [StockQuantity], [IsDeleted], [ModifiedOn]) VALUES (167, N'ELEMENT GLASS IPHONE 11 PRO GLASS SCREEN PROTECTOR', N'Sure grip - top, bottom, and sides features ergonomic design for a more comfortable and secure graspFast tap buttons - independent buttons allow the phone controls to work as seamlessly as they would without a casePerforated Back plate - provides a soft', 9, CAST(9.50 AS Decimal(18, 2)), CAST(7.50 AS Decimal(18, 2)), 10, 0, CAST(N'2020-05-17T00:00:41.910' AS DateTime))
GO
INSERT [dbo].[Products] ([ID], [Name], [Description], [CategoryID], [Price], [Cost], [StockQuantity], [IsDeleted], [ModifiedOn]) VALUES (168, N'ELEMENT GLASS IPHONE 11 GLASS SCREEN PROTECTOR', N'Sure grip - top, bottom, and sides features ergonomic design for a more comfortable and secure graspFast tap buttons - independent buttons allow the phone controls to work as seamlessly as they would without a casePerforated Back plate - provides a soft', 9, CAST(9.50 AS Decimal(18, 2)), CAST(7.50 AS Decimal(18, 2)), 10, 0, CAST(N'2020-05-17T00:00:41.910' AS DateTime))
GO
INSERT [dbo].[Products] ([ID], [Name], [Description], [CategoryID], [Price], [Cost], [StockQuantity], [IsDeleted], [ModifiedOn]) VALUES (169, N'ELEMENT GLASS IPHONE 11 PRO MAX - CLEAR', N'Sure grip - top, bottom, and sides features ergonomic design for a more comfortable and secure graspFast tap buttons - independent buttons allow the phone controls to work as seamlessly as they would without a casePerforated Back plate - provides a soft', 9, CAST(9.50 AS Decimal(18, 2)), CAST(7.50 AS Decimal(18, 2)), 10, 0, CAST(N'2020-05-17T00:00:41.910' AS DateTime))
GO
INSERT [dbo].[Products] ([ID], [Name], [Description], [CategoryID], [Price], [Cost], [StockQuantity], [IsDeleted], [ModifiedOn]) VALUES (170, N'ELEMENT CASE IPHONE 11 PRO MAX RAIL- CLEAR/FLAMINGO', N'Sure grip - top, bottom, and sides features ergonomic design for a more comfortable and secure graspFast tap buttons - independent buttons allow the phone controls to work as seamlessly as they would without a casePerforated Back plate - provides a soft', 9, CAST(10.90 AS Decimal(18, 2)), CAST(6.90 AS Decimal(18, 2)), 10, 0, CAST(N'2020-05-17T00:00:41.910' AS DateTime))
GO
INSERT [dbo].[Products] ([ID], [Name], [Description], [CategoryID], [Price], [Cost], [StockQuantity], [IsDeleted], [ModifiedOn]) VALUES (171, N'ELEMENT CASE IPHONE 11 RALLY- CLEAR', N'Sure grip - top, bottom, and sides features ergonomic design for a more comfortable and secure graspFast tap buttons - independent buttons allow the phone controls to work as seamlessly as they would without a casePerforated Back plate - provides a soft', 9, CAST(11.90 AS Decimal(18, 2)), CAST(7.90 AS Decimal(18, 2)), 10, 0, CAST(N'2020-05-17T00:00:41.910' AS DateTime))
GO
SET IDENTITY_INSERT [dbo].[Products] OFF
GO

-- Picture Data
SET IDENTITY_INSERT [dbo].[Pictures] ON
GO
INSERT [dbo].[Pictures] ([ID], [URL], [IsDeleted], [ModifiedOn]) VALUES (1, N'https://res.cloudinary.com/dalmevetk/image/upload/Products/2.png', 0, CAST(N'2020-05-17T00:01:21.643' AS DateTime))
GO
INSERT [dbo].[Pictures] ([ID], [URL], [IsDeleted], [ModifiedOn]) VALUES (2, N'https://res.cloudinary.com/dalmevetk/image/upload/Products/3.png', 0, CAST(N'2020-05-17T00:01:21.643' AS DateTime))
GO
INSERT [dbo].[Pictures] ([ID], [URL], [IsDeleted], [ModifiedOn]) VALUES (3, N'https://res.cloudinary.com/dalmevetk/image/upload/Products/4.png', 0, CAST(N'2020-05-17T00:01:21.643' AS DateTime))
GO
INSERT [dbo].[Pictures] ([ID], [URL], [IsDeleted], [ModifiedOn]) VALUES (4, N'https://res.cloudinary.com/dalmevetk/image/upload/Products/5.png', 0, CAST(N'2020-05-17T00:01:21.660' AS DateTime))
GO
INSERT [dbo].[Pictures] ([ID], [URL], [IsDeleted], [ModifiedOn]) VALUES (5, N'https://res.cloudinary.com/dalmevetk/image/upload/Products/6.png', 0, CAST(N'2020-05-17T00:01:21.660' AS DateTime))
GO
INSERT [dbo].[Pictures] ([ID], [URL], [IsDeleted], [ModifiedOn]) VALUES (6, N'https://res.cloudinary.com/dalmevetk/image/upload/Products/7.png', 0, CAST(N'2020-05-17T00:01:21.660' AS DateTime))
GO
INSERT [dbo].[Pictures] ([ID], [URL], [IsDeleted], [ModifiedOn]) VALUES (7, N'https://res.cloudinary.com/dalmevetk/image/upload/Products/8.png', 0, CAST(N'2020-05-17T00:01:21.660' AS DateTime))
GO
INSERT [dbo].[Pictures] ([ID], [URL], [IsDeleted], [ModifiedOn]) VALUES (8, N'https://res.cloudinary.com/dalmevetk/image/upload/Products/9.png', 0, CAST(N'2020-05-17T00:01:21.677' AS DateTime))
GO
INSERT [dbo].[Pictures] ([ID], [URL], [IsDeleted], [ModifiedOn]) VALUES (9, N'https://res.cloudinary.com/dalmevetk/image/upload/Products/10.png', 0, CAST(N'2020-05-17T00:01:21.677' AS DateTime))
GO
INSERT [dbo].[Pictures] ([ID], [URL], [IsDeleted], [ModifiedOn]) VALUES (10, N'https://res.cloudinary.com/dalmevetk/image/upload/Products/11.png', 0, CAST(N'2020-05-17T00:01:21.677' AS DateTime))
GO
INSERT [dbo].[Pictures] ([ID], [URL], [IsDeleted], [ModifiedOn]) VALUES (11, N'https://res.cloudinary.com/dalmevetk/image/upload/Products/12.png', 0, CAST(N'2020-05-17T00:01:21.677' AS DateTime))
GO
INSERT [dbo].[Pictures] ([ID], [URL], [IsDeleted], [ModifiedOn]) VALUES (12, N'https://res.cloudinary.com/dalmevetk/image/upload/Products/13.png', 0, CAST(N'2020-05-17T00:01:21.690' AS DateTime))
GO
INSERT [dbo].[Pictures] ([ID], [URL], [IsDeleted], [ModifiedOn]) VALUES (13, N'https://res.cloudinary.com/dalmevetk/image/upload/Products/14.png', 0, CAST(N'2020-05-17T00:01:21.690' AS DateTime))
GO
INSERT [dbo].[Pictures] ([ID], [URL], [IsDeleted], [ModifiedOn]) VALUES (14, N'https://res.cloudinary.com/dalmevetk/image/upload/Products/15.png', 0, CAST(N'2020-05-17T00:01:21.690' AS DateTime))
GO
INSERT [dbo].[Pictures] ([ID], [URL], [IsDeleted], [ModifiedOn]) VALUES (15, N'https://res.cloudinary.com/dalmevetk/image/upload/Products/16.png', 0, CAST(N'2020-05-17T00:01:21.690' AS DateTime))
GO
INSERT [dbo].[Pictures] ([ID], [URL], [IsDeleted], [ModifiedOn]) VALUES (16, N'https://res.cloudinary.com/dalmevetk/image/upload/Products/17.png', 0, CAST(N'2020-05-17T00:01:21.707' AS DateTime))
GO
INSERT [dbo].[Pictures] ([ID], [URL], [IsDeleted], [ModifiedOn]) VALUES (17, N'https://res.cloudinary.com/dalmevetk/image/upload/Products/18.png', 0, CAST(N'2020-05-17T00:01:21.707' AS DateTime))
GO
INSERT [dbo].[Pictures] ([ID], [URL], [IsDeleted], [ModifiedOn]) VALUES (18, N'https://res.cloudinary.com/dalmevetk/image/upload/Products/19.png', 0, CAST(N'2020-05-17T00:01:21.707' AS DateTime))
GO
INSERT [dbo].[Pictures] ([ID], [URL], [IsDeleted], [ModifiedOn]) VALUES (19, N'https://res.cloudinary.com/dalmevetk/image/upload/Products/20.png', 0, CAST(N'2020-05-17T00:01:21.723' AS DateTime))
GO
INSERT [dbo].[Pictures] ([ID], [URL], [IsDeleted], [ModifiedOn]) VALUES (20, N'https://res.cloudinary.com/dalmevetk/image/upload/Products/21.png', 0, CAST(N'2020-05-17T00:01:21.723' AS DateTime))
GO
INSERT [dbo].[Pictures] ([ID], [URL], [IsDeleted], [ModifiedOn]) VALUES (21, N'https://res.cloudinary.com/dalmevetk/image/upload/Products/22.png', 0, CAST(N'2020-05-17T00:01:21.723' AS DateTime))
GO
INSERT [dbo].[Pictures] ([ID], [URL], [IsDeleted], [ModifiedOn]) VALUES (22, N'https://res.cloudinary.com/dalmevetk/image/upload/Products/23.png', 0, CAST(N'2020-05-17T00:01:21.723' AS DateTime))
GO
INSERT [dbo].[Pictures] ([ID], [URL], [IsDeleted], [ModifiedOn]) VALUES (23, N'https://res.cloudinary.com/dalmevetk/image/upload/Products/24.png', 0, CAST(N'2020-05-17T00:01:21.740' AS DateTime))
GO
INSERT [dbo].[Pictures] ([ID], [URL], [IsDeleted], [ModifiedOn]) VALUES (24, N'https://res.cloudinary.com/dalmevetk/image/upload/Products/25.png', 0, CAST(N'2020-05-17T00:01:21.740' AS DateTime))
GO
INSERT [dbo].[Pictures] ([ID], [URL], [IsDeleted], [ModifiedOn]) VALUES (25, N'https://res.cloudinary.com/dalmevetk/image/upload/Products/26.png', 0, CAST(N'2020-05-17T00:01:21.740' AS DateTime))
GO
INSERT [dbo].[Pictures] ([ID], [URL], [IsDeleted], [ModifiedOn]) VALUES (26, N'https://res.cloudinary.com/dalmevetk/image/upload/Products/27.png', 0, CAST(N'2020-05-17T00:01:21.740' AS DateTime))
GO
INSERT [dbo].[Pictures] ([ID], [URL], [IsDeleted], [ModifiedOn]) VALUES (27, N'https://res.cloudinary.com/dalmevetk/image/upload/Products/28.png', 0, CAST(N'2020-05-17T00:01:21.753' AS DateTime))
GO
INSERT [dbo].[Pictures] ([ID], [URL], [IsDeleted], [ModifiedOn]) VALUES (28, N'https://res.cloudinary.com/dalmevetk/image/upload/Products/29.png', 0, CAST(N'2020-05-17T00:01:21.753' AS DateTime))
GO
INSERT [dbo].[Pictures] ([ID], [URL], [IsDeleted], [ModifiedOn]) VALUES (29, N'https://res.cloudinary.com/dalmevetk/image/upload/Products/30.png', 0, CAST(N'2020-05-17T00:01:21.753' AS DateTime))
GO
INSERT [dbo].[Pictures] ([ID], [URL], [IsDeleted], [ModifiedOn]) VALUES (30, N'https://res.cloudinary.com/dalmevetk/image/upload/Products/31.png', 0, CAST(N'2020-05-17T00:01:21.753' AS DateTime))
GO
INSERT [dbo].[Pictures] ([ID], [URL], [IsDeleted], [ModifiedOn]) VALUES (31, N'https://res.cloudinary.com/dalmevetk/image/upload/Products/32.png', 0, CAST(N'2020-05-17T00:01:21.770' AS DateTime))
GO
INSERT [dbo].[Pictures] ([ID], [URL], [IsDeleted], [ModifiedOn]) VALUES (32, N'https://res.cloudinary.com/dalmevetk/image/upload/Products/33.png', 0, CAST(N'2020-05-17T00:01:21.770' AS DateTime))
GO
INSERT [dbo].[Pictures] ([ID], [URL], [IsDeleted], [ModifiedOn]) VALUES (33, N'https://res.cloudinary.com/dalmevetk/image/upload/Products/34.png', 0, CAST(N'2020-05-17T00:01:21.770' AS DateTime))
GO
INSERT [dbo].[Pictures] ([ID], [URL], [IsDeleted], [ModifiedOn]) VALUES (34, N'https://res.cloudinary.com/dalmevetk/image/upload/Products/35.png', 0, CAST(N'2020-05-17T00:01:21.787' AS DateTime))
GO
INSERT [dbo].[Pictures] ([ID], [URL], [IsDeleted], [ModifiedOn]) VALUES (35, N'https://res.cloudinary.com/dalmevetk/image/upload/Products/36.png', 0, CAST(N'2020-05-17T00:01:21.787' AS DateTime))
GO
INSERT [dbo].[Pictures] ([ID], [URL], [IsDeleted], [ModifiedOn]) VALUES (36, N'https://res.cloudinary.com/dalmevetk/image/upload/Products/37.png', 0, CAST(N'2020-05-17T00:01:21.787' AS DateTime))
GO
INSERT [dbo].[Pictures] ([ID], [URL], [IsDeleted], [ModifiedOn]) VALUES (37, N'https://res.cloudinary.com/dalmevetk/image/upload/Products/38.png', 0, CAST(N'2020-05-17T00:01:21.787' AS DateTime))
GO
INSERT [dbo].[Pictures] ([ID], [URL], [IsDeleted], [ModifiedOn]) VALUES (38, N'https://res.cloudinary.com/dalmevetk/image/upload/Products/39.png', 0, CAST(N'2020-05-17T00:01:21.787' AS DateTime))
GO
INSERT [dbo].[Pictures] ([ID], [URL], [IsDeleted], [ModifiedOn]) VALUES (39, N'https://res.cloudinary.com/dalmevetk/image/upload/Products/40.png', 0, CAST(N'2020-05-17T00:01:21.800' AS DateTime))
GO
INSERT [dbo].[Pictures] ([ID], [URL], [IsDeleted], [ModifiedOn]) VALUES (40, N'https://res.cloudinary.com/dalmevetk/image/upload/Products/41.png', 0, CAST(N'2020-05-17T00:01:21.800' AS DateTime))
GO
INSERT [dbo].[Pictures] ([ID], [URL], [IsDeleted], [ModifiedOn]) VALUES (41, N'https://res.cloudinary.com/dalmevetk/image/upload/Products/42.png', 0, CAST(N'2020-05-17T00:01:21.800' AS DateTime))
GO
INSERT [dbo].[Pictures] ([ID], [URL], [IsDeleted], [ModifiedOn]) VALUES (42, N'https://res.cloudinary.com/dalmevetk/image/upload/Products/43.png', 0, CAST(N'2020-05-17T00:01:21.817' AS DateTime))
GO
INSERT [dbo].[Pictures] ([ID], [URL], [IsDeleted], [ModifiedOn]) VALUES (43, N'https://res.cloudinary.com/dalmevetk/image/upload/Products/44.png', 0, CAST(N'2020-05-17T00:01:21.817' AS DateTime))
GO
INSERT [dbo].[Pictures] ([ID], [URL], [IsDeleted], [ModifiedOn]) VALUES (44, N'https://res.cloudinary.com/dalmevetk/image/upload/Products/45.png', 0, CAST(N'2020-05-17T00:01:21.817' AS DateTime))
GO
INSERT [dbo].[Pictures] ([ID], [URL], [IsDeleted], [ModifiedOn]) VALUES (45, N'https://res.cloudinary.com/dalmevetk/image/upload/Products/46.png', 0, CAST(N'2020-05-17T00:01:21.817' AS DateTime))
GO
INSERT [dbo].[Pictures] ([ID], [URL], [IsDeleted], [ModifiedOn]) VALUES (46, N'https://res.cloudinary.com/dalmevetk/image/upload/Products/47.png', 0, CAST(N'2020-05-17T00:01:21.833' AS DateTime))
GO
INSERT [dbo].[Pictures] ([ID], [URL], [IsDeleted], [ModifiedOn]) VALUES (47, N'https://res.cloudinary.com/dalmevetk/image/upload/Products/48.png', 0, CAST(N'2020-05-17T00:01:21.833' AS DateTime))
GO
INSERT [dbo].[Pictures] ([ID], [URL], [IsDeleted], [ModifiedOn]) VALUES (48, N'https://res.cloudinary.com/dalmevetk/image/upload/Products/49.png', 0, CAST(N'2020-05-17T00:01:21.833' AS DateTime))
GO
INSERT [dbo].[Pictures] ([ID], [URL], [IsDeleted], [ModifiedOn]) VALUES (49, N'https://res.cloudinary.com/dalmevetk/image/upload/Products/50.png', 0, CAST(N'2020-05-17T00:01:21.833' AS DateTime))
GO
INSERT [dbo].[Pictures] ([ID], [URL], [IsDeleted], [ModifiedOn]) VALUES (50, N'https://res.cloudinary.com/dalmevetk/image/upload/Products/51.png', 0, CAST(N'2020-05-17T00:01:21.847' AS DateTime))
GO
INSERT [dbo].[Pictures] ([ID], [URL], [IsDeleted], [ModifiedOn]) VALUES (51, N'https://res.cloudinary.com/dalmevetk/image/upload/Products/52.png', 0, CAST(N'2020-05-17T00:01:21.847' AS DateTime))
GO
INSERT [dbo].[Pictures] ([ID], [URL], [IsDeleted], [ModifiedOn]) VALUES (52, N'https://res.cloudinary.com/dalmevetk/image/upload/Products/53.png', 0, CAST(N'2020-05-17T00:01:21.847' AS DateTime))
GO
INSERT [dbo].[Pictures] ([ID], [URL], [IsDeleted], [ModifiedOn]) VALUES (53, N'https://res.cloudinary.com/dalmevetk/image/upload/Products/54.png', 0, CAST(N'2020-05-17T00:01:21.863' AS DateTime))
GO
INSERT [dbo].[Pictures] ([ID], [URL], [IsDeleted], [ModifiedOn]) VALUES (54, N'https://res.cloudinary.com/dalmevetk/image/upload/Products/55.png', 0, CAST(N'2020-05-17T00:01:21.863' AS DateTime))
GO
INSERT [dbo].[Pictures] ([ID], [URL], [IsDeleted], [ModifiedOn]) VALUES (55, N'https://res.cloudinary.com/dalmevetk/image/upload/Products/56.png', 0, CAST(N'2020-05-17T00:01:21.863' AS DateTime))
GO
INSERT [dbo].[Pictures] ([ID], [URL], [IsDeleted], [ModifiedOn]) VALUES (56, N'https://res.cloudinary.com/dalmevetk/image/upload/Products/57.png', 0, CAST(N'2020-05-17T00:01:21.863' AS DateTime))
GO
INSERT [dbo].[Pictures] ([ID], [URL], [IsDeleted], [ModifiedOn]) VALUES (57, N'https://res.cloudinary.com/dalmevetk/image/upload/Products/58.png', 0, CAST(N'2020-05-17T00:01:21.863' AS DateTime))
GO
INSERT [dbo].[Pictures] ([ID], [URL], [IsDeleted], [ModifiedOn]) VALUES (58, N'https://res.cloudinary.com/dalmevetk/image/upload/Products/59.png', 0, CAST(N'2020-05-17T00:01:21.863' AS DateTime))
GO
INSERT [dbo].[Pictures] ([ID], [URL], [IsDeleted], [ModifiedOn]) VALUES (59, N'https://res.cloudinary.com/dalmevetk/image/upload/Products/60.png', 0, CAST(N'2020-05-17T00:01:21.863' AS DateTime))
GO
INSERT [dbo].[Pictures] ([ID], [URL], [IsDeleted], [ModifiedOn]) VALUES (60, N'https://res.cloudinary.com/dalmevetk/image/upload/Products/61.png', 0, CAST(N'2020-05-17T00:01:21.863' AS DateTime))
GO
INSERT [dbo].[Pictures] ([ID], [URL], [IsDeleted], [ModifiedOn]) VALUES (61, N'https://res.cloudinary.com/dalmevetk/image/upload/Products/62.png', 0, CAST(N'2020-05-17T00:01:21.863' AS DateTime))
GO
INSERT [dbo].[Pictures] ([ID], [URL], [IsDeleted], [ModifiedOn]) VALUES (62, N'https://res.cloudinary.com/dalmevetk/image/upload/Products/63.png', 0, CAST(N'2020-05-17T00:01:21.863' AS DateTime))
GO
INSERT [dbo].[Pictures] ([ID], [URL], [IsDeleted], [ModifiedOn]) VALUES (63, N'https://res.cloudinary.com/dalmevetk/image/upload/Products/64.png', 0, CAST(N'2020-05-17T00:01:21.863' AS DateTime))
GO
INSERT [dbo].[Pictures] ([ID], [URL], [IsDeleted], [ModifiedOn]) VALUES (64, N'https://res.cloudinary.com/dalmevetk/image/upload/Products/65.png', 0, CAST(N'2020-05-17T00:01:21.863' AS DateTime))
GO
INSERT [dbo].[Pictures] ([ID], [URL], [IsDeleted], [ModifiedOn]) VALUES (65, N'https://res.cloudinary.com/dalmevetk/image/upload/Products/66.png', 0, CAST(N'2020-05-17T00:01:21.863' AS DateTime))
GO
INSERT [dbo].[Pictures] ([ID], [URL], [IsDeleted], [ModifiedOn]) VALUES (66, N'https://res.cloudinary.com/dalmevetk/image/upload/Products/67.png', 0, CAST(N'2020-05-17T00:01:21.863' AS DateTime))
GO
INSERT [dbo].[Pictures] ([ID], [URL], [IsDeleted], [ModifiedOn]) VALUES (67, N'https://res.cloudinary.com/dalmevetk/image/upload/Products/68.png', 0, CAST(N'2020-05-17T00:01:21.863' AS DateTime))
GO
INSERT [dbo].[Pictures] ([ID], [URL], [IsDeleted], [ModifiedOn]) VALUES (68, N'https://res.cloudinary.com/dalmevetk/image/upload/Products/69.png', 0, CAST(N'2020-05-17T00:01:21.863' AS DateTime))
GO
INSERT [dbo].[Pictures] ([ID], [URL], [IsDeleted], [ModifiedOn]) VALUES (69, N'https://res.cloudinary.com/dalmevetk/image/upload/Products/70.png', 0, CAST(N'2020-05-17T00:01:21.863' AS DateTime))
GO
INSERT [dbo].[Pictures] ([ID], [URL], [IsDeleted], [ModifiedOn]) VALUES (70, N'https://res.cloudinary.com/dalmevetk/image/upload/Products/71.png', 0, CAST(N'2020-05-17T00:01:21.863' AS DateTime))
GO
INSERT [dbo].[Pictures] ([ID], [URL], [IsDeleted], [ModifiedOn]) VALUES (71, N'https://res.cloudinary.com/dalmevetk/image/upload/Products/72.png', 0, CAST(N'2020-05-17T00:01:21.863' AS DateTime))
GO
INSERT [dbo].[Pictures] ([ID], [URL], [IsDeleted], [ModifiedOn]) VALUES (72, N'https://res.cloudinary.com/dalmevetk/image/upload/Products/73.png', 0, CAST(N'2020-05-17T00:01:21.863' AS DateTime))
GO
INSERT [dbo].[Pictures] ([ID], [URL], [IsDeleted], [ModifiedOn]) VALUES (73, N'https://res.cloudinary.com/dalmevetk/image/upload/Products/74.png', 0, CAST(N'2020-05-17T00:01:21.863' AS DateTime))
GO
INSERT [dbo].[Pictures] ([ID], [URL], [IsDeleted], [ModifiedOn]) VALUES (74, N'https://res.cloudinary.com/dalmevetk/image/upload/Products/75.png', 0, CAST(N'2020-05-17T00:01:21.863' AS DateTime))
GO
INSERT [dbo].[Pictures] ([ID], [URL], [IsDeleted], [ModifiedOn]) VALUES (75, N'https://res.cloudinary.com/dalmevetk/image/upload/Products/76.png', 0, CAST(N'2020-05-17T00:01:21.863' AS DateTime))
GO
INSERT [dbo].[Pictures] ([ID], [URL], [IsDeleted], [ModifiedOn]) VALUES (76, N'https://res.cloudinary.com/dalmevetk/image/upload/Products/77.png', 0, CAST(N'2020-05-17T00:01:21.863' AS DateTime))
GO
INSERT [dbo].[Pictures] ([ID], [URL], [IsDeleted], [ModifiedOn]) VALUES (77, N'https://res.cloudinary.com/dalmevetk/image/upload/Products/78.png', 0, CAST(N'2020-05-17T00:01:21.863' AS DateTime))
GO
INSERT [dbo].[Pictures] ([ID], [URL], [IsDeleted], [ModifiedOn]) VALUES (78, N'https://res.cloudinary.com/dalmevetk/image/upload/Products/79.png', 0, CAST(N'2020-05-17T00:01:21.863' AS DateTime))
GO
INSERT [dbo].[Pictures] ([ID], [URL], [IsDeleted], [ModifiedOn]) VALUES (79, N'https://res.cloudinary.com/dalmevetk/image/upload/Products/80.png', 0, CAST(N'2020-05-17T00:01:21.863' AS DateTime))
GO
INSERT [dbo].[Pictures] ([ID], [URL], [IsDeleted], [ModifiedOn]) VALUES (80, N'https://res.cloudinary.com/dalmevetk/image/upload/Products/81.png', 0, CAST(N'2020-05-17T00:01:21.863' AS DateTime))
GO
INSERT [dbo].[Pictures] ([ID], [URL], [IsDeleted], [ModifiedOn]) VALUES (81, N'https://res.cloudinary.com/dalmevetk/image/upload/Products/82.png', 0, CAST(N'2020-05-17T00:01:21.863' AS DateTime))
GO
INSERT [dbo].[Pictures] ([ID], [URL], [IsDeleted], [ModifiedOn]) VALUES (82, N'https://res.cloudinary.com/dalmevetk/image/upload/Products/83.png', 0, CAST(N'2020-05-17T00:01:21.863' AS DateTime))
GO
INSERT [dbo].[Pictures] ([ID], [URL], [IsDeleted], [ModifiedOn]) VALUES (83, N'https://res.cloudinary.com/dalmevetk/image/upload/Products/84.png', 0, CAST(N'2020-05-17T00:01:21.863' AS DateTime))
GO
INSERT [dbo].[Pictures] ([ID], [URL], [IsDeleted], [ModifiedOn]) VALUES (84, N'https://res.cloudinary.com/dalmevetk/image/upload/Products/85.png', 0, CAST(N'2020-05-17T00:01:21.863' AS DateTime))
GO
INSERT [dbo].[Pictures] ([ID], [URL], [IsDeleted], [ModifiedOn]) VALUES (85, N'https://res.cloudinary.com/dalmevetk/image/upload/Products/86.png', 0, CAST(N'2020-05-17T00:01:21.863' AS DateTime))
GO
INSERT [dbo].[Pictures] ([ID], [URL], [IsDeleted], [ModifiedOn]) VALUES (86, N'https://res.cloudinary.com/dalmevetk/image/upload/Products/87.png', 0, CAST(N'2020-05-17T00:01:21.863' AS DateTime))
GO
INSERT [dbo].[Pictures] ([ID], [URL], [IsDeleted], [ModifiedOn]) VALUES (87, N'https://res.cloudinary.com/dalmevetk/image/upload/Products/88.png', 0, CAST(N'2020-05-17T00:01:21.863' AS DateTime))
GO
INSERT [dbo].[Pictures] ([ID], [URL], [IsDeleted], [ModifiedOn]) VALUES (88, N'https://res.cloudinary.com/dalmevetk/image/upload/Products/89.png', 0, CAST(N'2020-05-17T00:01:21.863' AS DateTime))
GO
INSERT [dbo].[Pictures] ([ID], [URL], [IsDeleted], [ModifiedOn]) VALUES (89, N'https://res.cloudinary.com/dalmevetk/image/upload/Products/90.png', 0, CAST(N'2020-05-17T00:01:21.863' AS DateTime))
GO
INSERT [dbo].[Pictures] ([ID], [URL], [IsDeleted], [ModifiedOn]) VALUES (90, N'https://res.cloudinary.com/dalmevetk/image/upload/Products/91.png', 0, CAST(N'2020-05-17T00:01:21.863' AS DateTime))
GO
INSERT [dbo].[Pictures] ([ID], [URL], [IsDeleted], [ModifiedOn]) VALUES (91, N'https://res.cloudinary.com/dalmevetk/image/upload/Products/92.png', 0, CAST(N'2020-05-17T00:01:21.863' AS DateTime))
GO
INSERT [dbo].[Pictures] ([ID], [URL], [IsDeleted], [ModifiedOn]) VALUES (92, N'https://res.cloudinary.com/dalmevetk/image/upload/Products/93.png', 0, CAST(N'2020-05-17T00:01:21.863' AS DateTime))
GO
INSERT [dbo].[Pictures] ([ID], [URL], [IsDeleted], [ModifiedOn]) VALUES (93, N'https://res.cloudinary.com/dalmevetk/image/upload/Products/94.png', 0, CAST(N'2020-05-17T00:01:21.863' AS DateTime))
GO
INSERT [dbo].[Pictures] ([ID], [URL], [IsDeleted], [ModifiedOn]) VALUES (94, N'https://res.cloudinary.com/dalmevetk/image/upload/Products/95.png', 0, CAST(N'2020-05-17T00:01:21.863' AS DateTime))
GO
INSERT [dbo].[Pictures] ([ID], [URL], [IsDeleted], [ModifiedOn]) VALUES (95, N'https://res.cloudinary.com/dalmevetk/image/upload/Products/96.png', 0, CAST(N'2020-05-17T00:01:21.863' AS DateTime))
GO
INSERT [dbo].[Pictures] ([ID], [URL], [IsDeleted], [ModifiedOn]) VALUES (96, N'https://res.cloudinary.com/dalmevetk/image/upload/Products/97.png', 0, CAST(N'2020-05-17T00:01:21.863' AS DateTime))
GO
INSERT [dbo].[Pictures] ([ID], [URL], [IsDeleted], [ModifiedOn]) VALUES (97, N'https://res.cloudinary.com/dalmevetk/image/upload/Products/98.png', 0, CAST(N'2020-05-17T00:01:21.863' AS DateTime))
GO
INSERT [dbo].[Pictures] ([ID], [URL], [IsDeleted], [ModifiedOn]) VALUES (98, N'https://res.cloudinary.com/dalmevetk/image/upload/Products/99.png', 0, CAST(N'2020-05-17T00:01:21.863' AS DateTime))
GO
INSERT [dbo].[Pictures] ([ID], [URL], [IsDeleted], [ModifiedOn]) VALUES (99, N'https://res.cloudinary.com/dalmevetk/image/upload/Products/100.png', 0, CAST(N'2020-05-17T00:01:21.863' AS DateTime))
GO
INSERT [dbo].[Pictures] ([ID], [URL], [IsDeleted], [ModifiedOn]) VALUES (100, N'https://res.cloudinary.com/dalmevetk/image/upload/Products/101.png', 0, CAST(N'2020-05-17T00:01:21.863' AS DateTime))
GO
INSERT [dbo].[Pictures] ([ID], [URL], [IsDeleted], [ModifiedOn]) VALUES (101, N'https://res.cloudinary.com/dalmevetk/image/upload/Products/102.png', 0, CAST(N'2020-05-17T00:01:21.863' AS DateTime))
GO
INSERT [dbo].[Pictures] ([ID], [URL], [IsDeleted], [ModifiedOn]) VALUES (102, N'https://res.cloudinary.com/dalmevetk/image/upload/Products/103.png', 0, CAST(N'2020-05-17T00:01:21.863' AS DateTime))
GO
INSERT [dbo].[Pictures] ([ID], [URL], [IsDeleted], [ModifiedOn]) VALUES (103, N'https://res.cloudinary.com/dalmevetk/image/upload/Products/104.png', 0, CAST(N'2020-05-17T00:01:21.863' AS DateTime))
GO
INSERT [dbo].[Pictures] ([ID], [URL], [IsDeleted], [ModifiedOn]) VALUES (104, N'https://res.cloudinary.com/dalmevetk/image/upload/Products/105.png', 0, CAST(N'2020-05-17T00:01:21.863' AS DateTime))
GO
INSERT [dbo].[Pictures] ([ID], [URL], [IsDeleted], [ModifiedOn]) VALUES (105, N'https://res.cloudinary.com/dalmevetk/image/upload/Products/106.png', 0, CAST(N'2020-05-17T00:01:21.863' AS DateTime))
GO
INSERT [dbo].[Pictures] ([ID], [URL], [IsDeleted], [ModifiedOn]) VALUES (106, N'https://res.cloudinary.com/dalmevetk/image/upload/Products/107.png', 0, CAST(N'2020-05-17T00:01:21.863' AS DateTime))
GO
INSERT [dbo].[Pictures] ([ID], [URL], [IsDeleted], [ModifiedOn]) VALUES (107, N'https://res.cloudinary.com/dalmevetk/image/upload/Products/108.png', 0, CAST(N'2020-05-17T00:01:21.863' AS DateTime))
GO
INSERT [dbo].[Pictures] ([ID], [URL], [IsDeleted], [ModifiedOn]) VALUES (108, N'https://res.cloudinary.com/dalmevetk/image/upload/Products/109.png', 0, CAST(N'2020-05-17T00:01:21.863' AS DateTime))
GO
INSERT [dbo].[Pictures] ([ID], [URL], [IsDeleted], [ModifiedOn]) VALUES (109, N'https://res.cloudinary.com/dalmevetk/image/upload/Products/110.png', 0, CAST(N'2020-05-17T00:01:21.863' AS DateTime))
GO
INSERT [dbo].[Pictures] ([ID], [URL], [IsDeleted], [ModifiedOn]) VALUES (110, N'https://res.cloudinary.com/dalmevetk/image/upload/Products/111.png', 0, CAST(N'2020-05-17T00:01:21.863' AS DateTime))
GO
INSERT [dbo].[Pictures] ([ID], [URL], [IsDeleted], [ModifiedOn]) VALUES (111, N'https://res.cloudinary.com/dalmevetk/image/upload/Products/112.png', 0, CAST(N'2020-05-17T00:01:21.863' AS DateTime))
GO
INSERT [dbo].[Pictures] ([ID], [URL], [IsDeleted], [ModifiedOn]) VALUES (112, N'https://res.cloudinary.com/dalmevetk/image/upload/Products/113.png', 0, CAST(N'2020-05-17T00:01:21.863' AS DateTime))
GO
INSERT [dbo].[Pictures] ([ID], [URL], [IsDeleted], [ModifiedOn]) VALUES (113, N'https://res.cloudinary.com/dalmevetk/image/upload/Products/114.png', 0, CAST(N'2020-05-17T00:01:21.863' AS DateTime))
GO
INSERT [dbo].[Pictures] ([ID], [URL], [IsDeleted], [ModifiedOn]) VALUES (114, N'https://res.cloudinary.com/dalmevetk/image/upload/Products/115.png', 0, CAST(N'2020-05-17T00:01:21.863' AS DateTime))
GO
INSERT [dbo].[Pictures] ([ID], [URL], [IsDeleted], [ModifiedOn]) VALUES (115, N'https://res.cloudinary.com/dalmevetk/image/upload/Products/116.png', 0, CAST(N'2020-05-17T00:01:21.863' AS DateTime))
GO
INSERT [dbo].[Pictures] ([ID], [URL], [IsDeleted], [ModifiedOn]) VALUES (116, N'https://res.cloudinary.com/dalmevetk/image/upload/Products/117.png', 0, CAST(N'2020-05-17T00:01:21.863' AS DateTime))
GO
INSERT [dbo].[Pictures] ([ID], [URL], [IsDeleted], [ModifiedOn]) VALUES (117, N'https://res.cloudinary.com/dalmevetk/image/upload/Products/118.png', 0, CAST(N'2020-05-17T00:01:21.863' AS DateTime))
GO
INSERT [dbo].[Pictures] ([ID], [URL], [IsDeleted], [ModifiedOn]) VALUES (118, N'https://res.cloudinary.com/dalmevetk/image/upload/Products/119.png', 0, CAST(N'2020-05-17T00:01:21.863' AS DateTime))
GO
INSERT [dbo].[Pictures] ([ID], [URL], [IsDeleted], [ModifiedOn]) VALUES (119, N'https://res.cloudinary.com/dalmevetk/image/upload/Products/120.png', 0, CAST(N'2020-05-17T00:01:21.863' AS DateTime))
GO
INSERT [dbo].[Pictures] ([ID], [URL], [IsDeleted], [ModifiedOn]) VALUES (120, N'https://res.cloudinary.com/dalmevetk/image/upload/Products/121.png', 0, CAST(N'2020-05-17T00:01:21.880' AS DateTime))
GO
INSERT [dbo].[Pictures] ([ID], [URL], [IsDeleted], [ModifiedOn]) VALUES (121, N'https://res.cloudinary.com/dalmevetk/image/upload/Products/122.png', 0, CAST(N'2020-05-17T00:01:21.880' AS DateTime))
GO
INSERT [dbo].[Pictures] ([ID], [URL], [IsDeleted], [ModifiedOn]) VALUES (122, N'https://res.cloudinary.com/dalmevetk/image/upload/Products/123.png', 0, CAST(N'2020-05-17T00:01:21.880' AS DateTime))
GO
INSERT [dbo].[Pictures] ([ID], [URL], [IsDeleted], [ModifiedOn]) VALUES (123, N'https://res.cloudinary.com/dalmevetk/image/upload/Products/124.png', 0, CAST(N'2020-05-17T00:01:21.893' AS DateTime))
GO
INSERT [dbo].[Pictures] ([ID], [URL], [IsDeleted], [ModifiedOn]) VALUES (124, N'https://res.cloudinary.com/dalmevetk/image/upload/Products/125.png', 0, CAST(N'2020-05-17T00:01:21.893' AS DateTime))
GO
INSERT [dbo].[Pictures] ([ID], [URL], [IsDeleted], [ModifiedOn]) VALUES (125, N'https://res.cloudinary.com/dalmevetk/image/upload/Products/126.png', 0, CAST(N'2020-05-17T00:01:21.893' AS DateTime))
GO
INSERT [dbo].[Pictures] ([ID], [URL], [IsDeleted], [ModifiedOn]) VALUES (126, N'https://res.cloudinary.com/dalmevetk/image/upload/Products/127.png', 0, CAST(N'2020-05-17T00:01:21.893' AS DateTime))
GO
INSERT [dbo].[Pictures] ([ID], [URL], [IsDeleted], [ModifiedOn]) VALUES (127, N'https://res.cloudinary.com/dalmevetk/image/upload/Products/128.png', 0, CAST(N'2020-05-17T00:01:21.893' AS DateTime))
GO
INSERT [dbo].[Pictures] ([ID], [URL], [IsDeleted], [ModifiedOn]) VALUES (128, N'https://res.cloudinary.com/dalmevetk/image/upload/Products/129.png', 0, CAST(N'2020-05-17T00:01:21.910' AS DateTime))
GO
INSERT [dbo].[Pictures] ([ID], [URL], [IsDeleted], [ModifiedOn]) VALUES (129, N'https://res.cloudinary.com/dalmevetk/image/upload/Products/130.png', 0, CAST(N'2020-05-17T00:01:21.910' AS DateTime))
GO
INSERT [dbo].[Pictures] ([ID], [URL], [IsDeleted], [ModifiedOn]) VALUES (130, N'https://res.cloudinary.com/dalmevetk/image/upload/Products/131.png', 0, CAST(N'2020-05-17T00:01:21.910' AS DateTime))
GO
INSERT [dbo].[Pictures] ([ID], [URL], [IsDeleted], [ModifiedOn]) VALUES (131, N'https://res.cloudinary.com/dalmevetk/image/upload/Products/132.png', 0, CAST(N'2020-05-17T00:01:21.910' AS DateTime))
GO
INSERT [dbo].[Pictures] ([ID], [URL], [IsDeleted], [ModifiedOn]) VALUES (132, N'https://res.cloudinary.com/dalmevetk/image/upload/Products/133.png', 0, CAST(N'2020-05-17T00:01:21.927' AS DateTime))
GO
INSERT [dbo].[Pictures] ([ID], [URL], [IsDeleted], [ModifiedOn]) VALUES (133, N'https://res.cloudinary.com/dalmevetk/image/upload/Products/134.png', 0, CAST(N'2020-05-17T00:01:21.927' AS DateTime))
GO
INSERT [dbo].[Pictures] ([ID], [URL], [IsDeleted], [ModifiedOn]) VALUES (134, N'https://res.cloudinary.com/dalmevetk/image/upload/Products/135.png', 0, CAST(N'2020-05-17T00:01:21.927' AS DateTime))
GO
INSERT [dbo].[Pictures] ([ID], [URL], [IsDeleted], [ModifiedOn]) VALUES (135, N'https://res.cloudinary.com/dalmevetk/image/upload/Products/136.png', 0, CAST(N'2020-05-17T00:01:21.940' AS DateTime))
GO
INSERT [dbo].[Pictures] ([ID], [URL], [IsDeleted], [ModifiedOn]) VALUES (136, N'https://res.cloudinary.com/dalmevetk/image/upload/Products/137.png', 0, CAST(N'2020-05-17T00:01:21.940' AS DateTime))
GO
INSERT [dbo].[Pictures] ([ID], [URL], [IsDeleted], [ModifiedOn]) VALUES (137, N'https://res.cloudinary.com/dalmevetk/image/upload/Products/138.png', 0, CAST(N'2020-05-17T00:01:21.940' AS DateTime))
GO
INSERT [dbo].[Pictures] ([ID], [URL], [IsDeleted], [ModifiedOn]) VALUES (138, N'https://res.cloudinary.com/dalmevetk/image/upload/Products/139.png', 0, CAST(N'2020-05-17T00:01:21.940' AS DateTime))
GO
INSERT [dbo].[Pictures] ([ID], [URL], [IsDeleted], [ModifiedOn]) VALUES (139, N'https://res.cloudinary.com/dalmevetk/image/upload/Products/140.png', 0, CAST(N'2020-05-17T00:01:21.957' AS DateTime))
GO
INSERT [dbo].[Pictures] ([ID], [URL], [IsDeleted], [ModifiedOn]) VALUES (140, N'https://res.cloudinary.com/dalmevetk/image/upload/Products/141.png', 0, CAST(N'2020-05-17T00:01:21.957' AS DateTime))
GO
INSERT [dbo].[Pictures] ([ID], [URL], [IsDeleted], [ModifiedOn]) VALUES (141, N'https://res.cloudinary.com/dalmevetk/image/upload/Products/142.png', 0, CAST(N'2020-05-17T00:01:21.957' AS DateTime))
GO
INSERT [dbo].[Pictures] ([ID], [URL], [IsDeleted], [ModifiedOn]) VALUES (142, N'https://res.cloudinary.com/dalmevetk/image/upload/Products/143.png', 0, CAST(N'2020-05-17T00:01:21.957' AS DateTime))
GO
INSERT [dbo].[Pictures] ([ID], [URL], [IsDeleted], [ModifiedOn]) VALUES (143, N'https://res.cloudinary.com/dalmevetk/image/upload/Products/144.png', 0, CAST(N'2020-05-17T00:01:21.973' AS DateTime))
GO
INSERT [dbo].[Pictures] ([ID], [URL], [IsDeleted], [ModifiedOn]) VALUES (144, N'https://res.cloudinary.com/dalmevetk/image/upload/Products/145.png', 0, CAST(N'2020-05-17T00:01:21.973' AS DateTime))
GO
INSERT [dbo].[Pictures] ([ID], [URL], [IsDeleted], [ModifiedOn]) VALUES (145, N'https://res.cloudinary.com/dalmevetk/image/upload/Products/146.png', 0, CAST(N'2020-05-17T00:01:21.973' AS DateTime))
GO
INSERT [dbo].[Pictures] ([ID], [URL], [IsDeleted], [ModifiedOn]) VALUES (146, N'https://res.cloudinary.com/dalmevetk/image/upload/Products/147.png', 0, CAST(N'2020-05-17T00:01:21.973' AS DateTime))
GO
INSERT [dbo].[Pictures] ([ID], [URL], [IsDeleted], [ModifiedOn]) VALUES (147, N'https://res.cloudinary.com/dalmevetk/image/upload/Products/148.png', 0, CAST(N'2020-05-17T00:01:21.990' AS DateTime))
GO
INSERT [dbo].[Pictures] ([ID], [URL], [IsDeleted], [ModifiedOn]) VALUES (148, N'https://res.cloudinary.com/dalmevetk/image/upload/Products/149.png', 0, CAST(N'2020-05-17T00:01:21.990' AS DateTime))
GO
INSERT [dbo].[Pictures] ([ID], [URL], [IsDeleted], [ModifiedOn]) VALUES (149, N'https://res.cloudinary.com/dalmevetk/image/upload/Products/150.png', 0, CAST(N'2020-05-17T00:01:21.990' AS DateTime))
GO
INSERT [dbo].[Pictures] ([ID], [URL], [IsDeleted], [ModifiedOn]) VALUES (150, N'https://res.cloudinary.com/dalmevetk/image/upload/Products/151.png', 0, CAST(N'2020-05-17T00:01:21.990' AS DateTime))
GO
INSERT [dbo].[Pictures] ([ID], [URL], [IsDeleted], [ModifiedOn]) VALUES (151, N'https://res.cloudinary.com/dalmevetk/image/upload/Products/152.png', 0, CAST(N'2020-05-17T00:01:21.990' AS DateTime))
GO
INSERT [dbo].[Pictures] ([ID], [URL], [IsDeleted], [ModifiedOn]) VALUES (152, N'https://res.cloudinary.com/dalmevetk/image/upload/Products/153.png', 0, CAST(N'2020-05-17T00:01:21.990' AS DateTime))
GO
INSERT [dbo].[Pictures] ([ID], [URL], [IsDeleted], [ModifiedOn]) VALUES (153, N'https://res.cloudinary.com/dalmevetk/image/upload/Products/154.png', 0, CAST(N'2020-05-17T00:01:21.990' AS DateTime))
GO
INSERT [dbo].[Pictures] ([ID], [URL], [IsDeleted], [ModifiedOn]) VALUES (154, N'https://res.cloudinary.com/dalmevetk/image/upload/Products/155.png', 0, CAST(N'2020-05-17T00:01:21.990' AS DateTime))
GO
INSERT [dbo].[Pictures] ([ID], [URL], [IsDeleted], [ModifiedOn]) VALUES (155, N'https://res.cloudinary.com/dalmevetk/image/upload/Products/156.png', 0, CAST(N'2020-05-17T00:01:21.990' AS DateTime))
GO
INSERT [dbo].[Pictures] ([ID], [URL], [IsDeleted], [ModifiedOn]) VALUES (156, N'https://res.cloudinary.com/dalmevetk/image/upload/Products/157.png', 0, CAST(N'2020-05-17T00:01:21.990' AS DateTime))
GO
INSERT [dbo].[Pictures] ([ID], [URL], [IsDeleted], [ModifiedOn]) VALUES (157, N'https://res.cloudinary.com/dalmevetk/image/upload/Products/158.png', 0, CAST(N'2020-05-17T00:01:21.990' AS DateTime))
GO
INSERT [dbo].[Pictures] ([ID], [URL], [IsDeleted], [ModifiedOn]) VALUES (158, N'https://res.cloudinary.com/dalmevetk/image/upload/Products/159.png', 0, CAST(N'2020-05-17T00:01:21.990' AS DateTime))
GO
INSERT [dbo].[Pictures] ([ID], [URL], [IsDeleted], [ModifiedOn]) VALUES (159, N'https://res.cloudinary.com/dalmevetk/image/upload/Products/160.png', 0, CAST(N'2020-05-17T00:01:21.990' AS DateTime))
GO
INSERT [dbo].[Pictures] ([ID], [URL], [IsDeleted], [ModifiedOn]) VALUES (160, N'https://res.cloudinary.com/dalmevetk/image/upload/Products/161.png', 0, CAST(N'2020-05-17T00:01:21.990' AS DateTime))
GO
INSERT [dbo].[Pictures] ([ID], [URL], [IsDeleted], [ModifiedOn]) VALUES (161, N'https://res.cloudinary.com/dalmevetk/image/upload/Products/162.png', 0, CAST(N'2020-05-17T00:01:21.990' AS DateTime))
GO
INSERT [dbo].[Pictures] ([ID], [URL], [IsDeleted], [ModifiedOn]) VALUES (162, N'https://res.cloudinary.com/dalmevetk/image/upload/Products/163.png', 0, CAST(N'2020-05-17T00:01:21.990' AS DateTime))
GO
INSERT [dbo].[Pictures] ([ID], [URL], [IsDeleted], [ModifiedOn]) VALUES (163, N'https://res.cloudinary.com/dalmevetk/image/upload/Products/164.png', 0, CAST(N'2020-05-17T00:01:21.990' AS DateTime))
GO
INSERT [dbo].[Pictures] ([ID], [URL], [IsDeleted], [ModifiedOn]) VALUES (164, N'https://res.cloudinary.com/dalmevetk/image/upload/Products/165.png', 0, CAST(N'2020-05-17T00:01:21.990' AS DateTime))
GO
INSERT [dbo].[Pictures] ([ID], [URL], [IsDeleted], [ModifiedOn]) VALUES (165, N'https://res.cloudinary.com/dalmevetk/image/upload/Products/166.png', 0, CAST(N'2020-05-17T00:01:21.990' AS DateTime))
GO
INSERT [dbo].[Pictures] ([ID], [URL], [IsDeleted], [ModifiedOn]) VALUES (166, N'https://res.cloudinary.com/dalmevetk/image/upload/Products/167.png', 0, CAST(N'2020-05-17T00:01:21.990' AS DateTime))
GO
INSERT [dbo].[Pictures] ([ID], [URL], [IsDeleted], [ModifiedOn]) VALUES (167, N'https://res.cloudinary.com/dalmevetk/image/upload/Products/168.png', 0, CAST(N'2020-05-17T00:01:21.990' AS DateTime))
GO
INSERT [dbo].[Pictures] ([ID], [URL], [IsDeleted], [ModifiedOn]) VALUES (168, N'https://res.cloudinary.com/dalmevetk/image/upload/Products/169.png', 0, CAST(N'2020-05-17T00:01:21.990' AS DateTime))
GO
INSERT [dbo].[Pictures] ([ID], [URL], [IsDeleted], [ModifiedOn]) VALUES (169, N'https://res.cloudinary.com/dalmevetk/image/upload/Products/170.png', 0, CAST(N'2020-05-17T00:01:21.990' AS DateTime))
GO
INSERT [dbo].[Pictures] ([ID], [URL], [IsDeleted], [ModifiedOn]) VALUES (170, N'https://res.cloudinary.com/dalmevetk/image/upload/Products/171.png', 0, CAST(N'2020-05-17T00:01:21.990' AS DateTime))
GO
INSERT [dbo].[Pictures] ([ID], [URL], [IsDeleted], [ModifiedOn]) VALUES (171, N'https://res.cloudinary.com/dalmevetk/image/upload/Products/172.png', 0, CAST(N'2020-05-17T00:01:21.990' AS DateTime))
GO
INSERT [dbo].[Pictures] ([ID], [URL], [IsDeleted], [ModifiedOn]) VALUES (172, N'https://res.cloudinary.com/dalmevetk/image/upload/Products/7ecffd94-2365-452a-95be-cbb69b9c59cc.png', 0, CAST(N'2020-05-17T00:01:21.643' AS DateTime))
GO
INSERT [dbo].[Pictures] ([ID], [URL], [IsDeleted], [ModifiedOn]) VALUES (173, N'https://res.cloudinary.com/dalmevetk/image/upload/Products/c0ed2af7-6eb6-4b8a-bb73-45c4b4d410f1.png', 0, CAST(N'2020-05-17T00:01:21.643' AS DateTime))
GO
INSERT [dbo].[Pictures] ([ID], [URL], [IsDeleted], [ModifiedOn]) VALUES (174, N'https://res.cloudinary.com/dalmevetk/image/upload/Products/76572ecd-2b3c-4dec-b600-e8b3da64160d.png', 0, CAST(N'2020-05-17T00:01:21.643' AS DateTime))
GO
INSERT [dbo].[Pictures] ([ID], [URL], [IsDeleted], [ModifiedOn]) VALUES (175, N'https://res.cloudinary.com/dalmevetk/image/upload/Products/8c273651-6ae0-4cfd-ba5f-9514b78a99e9.png', 0, CAST(N'2020-05-17T00:01:21.643' AS DateTime))
GO
INSERT [dbo].[Pictures] ([ID], [URL], [IsDeleted], [ModifiedOn]) VALUES (176, N'https://res.cloudinary.com/dalmevetk/image/upload/Products/8a90c65c-dd7c-4be9-9efe-9d9ab62481ea.jpg', 0, CAST(N'2020-05-17T00:01:21.643' AS DateTime))
GO
INSERT [dbo].[Pictures] ([ID], [URL], [IsDeleted], [ModifiedOn]) VALUES (177, N'https://res.cloudinary.com/dalmevetk/image/upload/Products/6ba0a398-8285-4f4e-9144-eb3a57098388.jpeg', 0, CAST(N'2020-05-17T00:01:21.643' AS DateTime))
GO
INSERT [dbo].[Pictures] ([ID], [URL], [IsDeleted], [ModifiedOn]) VALUES (178, N'https://res.cloudinary.com/dalmevetk/image/upload/Products/a9b67549-4ef7-409b-92e2-8655aec21f4a.png', 0, CAST(N'2020-05-17T00:01:21.643' AS DateTime))
GO
SET IDENTITY_INSERT [dbo].[Pictures] OFF
GO

-- Product Pictures
SET IDENTITY_INSERT [dbo].[ProductPictures] ON
GO
INSERT [dbo].[ProductPictures] ([ID], [ProductID], [PictureID], [IsDeleted], [ModifiedOn]) VALUES (1, 1, 1, 0, CAST(N'2020-05-17T00:00:41.927' AS DateTime))
GO
INSERT [dbo].[ProductPictures] ([ID], [ProductID], [PictureID], [IsDeleted], [ModifiedOn]) VALUES (2, 2, 2, 0, CAST(N'2020-05-17T00:00:41.927' AS DateTime))
GO
INSERT [dbo].[ProductPictures] ([ID], [ProductID], [PictureID], [IsDeleted], [ModifiedOn]) VALUES (3, 3, 3, 0, CAST(N'2020-05-17T00:00:41.927' AS DateTime))
GO
INSERT [dbo].[ProductPictures] ([ID], [ProductID], [PictureID], [IsDeleted], [ModifiedOn]) VALUES (4, 4, 4, 0, CAST(N'2020-05-17T00:00:41.927' AS DateTime))
GO
INSERT [dbo].[ProductPictures] ([ID], [ProductID], [PictureID], [IsDeleted], [ModifiedOn]) VALUES (5, 5, 5, 0, CAST(N'2020-05-17T00:00:41.927' AS DateTime))
GO
INSERT [dbo].[ProductPictures] ([ID], [ProductID], [PictureID], [IsDeleted], [ModifiedOn]) VALUES (6, 6, 6, 0, CAST(N'2020-05-17T00:00:41.927' AS DateTime))
GO
INSERT [dbo].[ProductPictures] ([ID], [ProductID], [PictureID], [IsDeleted], [ModifiedOn]) VALUES (7, 7, 7, 0, CAST(N'2020-05-17T00:00:41.927' AS DateTime))
GO
INSERT [dbo].[ProductPictures] ([ID], [ProductID], [PictureID], [IsDeleted], [ModifiedOn]) VALUES (8, 8, 8, 0, CAST(N'2020-05-17T00:00:41.927' AS DateTime))
GO
INSERT [dbo].[ProductPictures] ([ID], [ProductID], [PictureID], [IsDeleted], [ModifiedOn]) VALUES (9, 9, 9, 0, CAST(N'2020-05-17T00:00:41.927' AS DateTime))
GO
INSERT [dbo].[ProductPictures] ([ID], [ProductID], [PictureID], [IsDeleted], [ModifiedOn]) VALUES (10, 10, 10, 0, CAST(N'2020-05-17T00:00:41.927' AS DateTime))
GO
INSERT [dbo].[ProductPictures] ([ID], [ProductID], [PictureID], [IsDeleted], [ModifiedOn]) VALUES (11, 11, 11, 0, CAST(N'2020-05-17T00:00:41.927' AS DateTime))
GO
INSERT [dbo].[ProductPictures] ([ID], [ProductID], [PictureID], [IsDeleted], [ModifiedOn]) VALUES (12, 12, 12, 0, CAST(N'2020-05-17T00:00:41.927' AS DateTime))
GO
INSERT [dbo].[ProductPictures] ([ID], [ProductID], [PictureID], [IsDeleted], [ModifiedOn]) VALUES (13, 13, 13, 0, CAST(N'2020-05-17T00:00:41.927' AS DateTime))
GO
INSERT [dbo].[ProductPictures] ([ID], [ProductID], [PictureID], [IsDeleted], [ModifiedOn]) VALUES (14, 14, 14, 0, CAST(N'2020-05-17T00:00:41.927' AS DateTime))
GO
INSERT [dbo].[ProductPictures] ([ID], [ProductID], [PictureID], [IsDeleted], [ModifiedOn]) VALUES (15, 15, 15, 0, CAST(N'2020-05-17T00:00:41.927' AS DateTime))
GO
INSERT [dbo].[ProductPictures] ([ID], [ProductID], [PictureID], [IsDeleted], [ModifiedOn]) VALUES (16, 16, 16, 0, CAST(N'2020-05-17T00:00:41.927' AS DateTime))
GO
INSERT [dbo].[ProductPictures] ([ID], [ProductID], [PictureID], [IsDeleted], [ModifiedOn]) VALUES (17, 17, 17, 0, CAST(N'2020-05-17T00:00:41.927' AS DateTime))
GO
INSERT [dbo].[ProductPictures] ([ID], [ProductID], [PictureID], [IsDeleted], [ModifiedOn]) VALUES (18, 18, 18, 0, CAST(N'2020-05-17T00:00:41.927' AS DateTime))
GO
INSERT [dbo].[ProductPictures] ([ID], [ProductID], [PictureID], [IsDeleted], [ModifiedOn]) VALUES (19, 19, 19, 0, CAST(N'2020-05-17T00:00:41.927' AS DateTime))
GO
INSERT [dbo].[ProductPictures] ([ID], [ProductID], [PictureID], [IsDeleted], [ModifiedOn]) VALUES (20, 20, 20, 0, CAST(N'2020-05-17T00:00:41.927' AS DateTime))
GO
INSERT [dbo].[ProductPictures] ([ID], [ProductID], [PictureID], [IsDeleted], [ModifiedOn]) VALUES (21, 21, 21, 0, CAST(N'2020-05-17T00:00:41.927' AS DateTime))
GO
INSERT [dbo].[ProductPictures] ([ID], [ProductID], [PictureID], [IsDeleted], [ModifiedOn]) VALUES (22, 22, 22, 0, CAST(N'2020-05-17T00:00:41.927' AS DateTime))
GO
INSERT [dbo].[ProductPictures] ([ID], [ProductID], [PictureID], [IsDeleted], [ModifiedOn]) VALUES (23, 23, 23, 0, CAST(N'2020-05-17T00:00:41.927' AS DateTime))
GO
INSERT [dbo].[ProductPictures] ([ID], [ProductID], [PictureID], [IsDeleted], [ModifiedOn]) VALUES (24, 24, 24, 0, CAST(N'2020-05-17T00:00:41.927' AS DateTime))
GO
INSERT [dbo].[ProductPictures] ([ID], [ProductID], [PictureID], [IsDeleted], [ModifiedOn]) VALUES (25, 25, 25, 0, CAST(N'2020-05-17T00:00:41.927' AS DateTime))
GO
INSERT [dbo].[ProductPictures] ([ID], [ProductID], [PictureID], [IsDeleted], [ModifiedOn]) VALUES (26, 26, 26, 0, CAST(N'2020-05-17T00:00:41.927' AS DateTime))
GO
INSERT [dbo].[ProductPictures] ([ID], [ProductID], [PictureID], [IsDeleted], [ModifiedOn]) VALUES (27, 27, 27, 0, CAST(N'2020-05-17T00:00:41.927' AS DateTime))
GO
INSERT [dbo].[ProductPictures] ([ID], [ProductID], [PictureID], [IsDeleted], [ModifiedOn]) VALUES (28, 28, 28, 0, CAST(N'2020-05-17T00:00:41.927' AS DateTime))
GO
INSERT [dbo].[ProductPictures] ([ID], [ProductID], [PictureID], [IsDeleted], [ModifiedOn]) VALUES (29, 29, 29, 0, CAST(N'2020-05-17T00:00:41.927' AS DateTime))
GO
INSERT [dbo].[ProductPictures] ([ID], [ProductID], [PictureID], [IsDeleted], [ModifiedOn]) VALUES (30, 30, 30, 0, CAST(N'2020-05-17T00:00:41.927' AS DateTime))
GO
INSERT [dbo].[ProductPictures] ([ID], [ProductID], [PictureID], [IsDeleted], [ModifiedOn]) VALUES (31, 31, 31, 0, CAST(N'2020-05-17T00:00:41.927' AS DateTime))
GO
INSERT [dbo].[ProductPictures] ([ID], [ProductID], [PictureID], [IsDeleted], [ModifiedOn]) VALUES (32, 32, 32, 0, CAST(N'2020-05-17T00:00:41.927' AS DateTime))
GO
INSERT [dbo].[ProductPictures] ([ID], [ProductID], [PictureID], [IsDeleted], [ModifiedOn]) VALUES (33, 33, 33, 0, CAST(N'2020-05-17T00:00:41.927' AS DateTime))
GO
INSERT [dbo].[ProductPictures] ([ID], [ProductID], [PictureID], [IsDeleted], [ModifiedOn]) VALUES (34, 34, 34, 0, CAST(N'2020-05-17T00:00:41.927' AS DateTime))
GO
INSERT [dbo].[ProductPictures] ([ID], [ProductID], [PictureID], [IsDeleted], [ModifiedOn]) VALUES (35, 35, 35, 0, CAST(N'2020-05-17T00:00:41.927' AS DateTime))
GO
INSERT [dbo].[ProductPictures] ([ID], [ProductID], [PictureID], [IsDeleted], [ModifiedOn]) VALUES (36, 36, 36, 0, CAST(N'2020-05-17T00:00:41.927' AS DateTime))
GO
INSERT [dbo].[ProductPictures] ([ID], [ProductID], [PictureID], [IsDeleted], [ModifiedOn]) VALUES (37, 37, 37, 0, CAST(N'2020-05-17T00:00:41.927' AS DateTime))
GO
INSERT [dbo].[ProductPictures] ([ID], [ProductID], [PictureID], [IsDeleted], [ModifiedOn]) VALUES (38, 38, 38, 0, CAST(N'2020-05-17T00:00:41.927' AS DateTime))
GO
INSERT [dbo].[ProductPictures] ([ID], [ProductID], [PictureID], [IsDeleted], [ModifiedOn]) VALUES (39, 39, 39, 0, CAST(N'2020-05-17T00:00:41.927' AS DateTime))
GO
INSERT [dbo].[ProductPictures] ([ID], [ProductID], [PictureID], [IsDeleted], [ModifiedOn]) VALUES (40, 40, 40, 0, CAST(N'2020-05-17T00:00:41.927' AS DateTime))
GO
INSERT [dbo].[ProductPictures] ([ID], [ProductID], [PictureID], [IsDeleted], [ModifiedOn]) VALUES (41, 41, 41, 0, CAST(N'2020-05-17T00:00:41.927' AS DateTime))
GO
INSERT [dbo].[ProductPictures] ([ID], [ProductID], [PictureID], [IsDeleted], [ModifiedOn]) VALUES (42, 42, 42, 0, CAST(N'2020-05-17T00:00:41.927' AS DateTime))
GO
INSERT [dbo].[ProductPictures] ([ID], [ProductID], [PictureID], [IsDeleted], [ModifiedOn]) VALUES (43, 43, 43, 0, CAST(N'2020-05-17T00:00:41.927' AS DateTime))
GO
INSERT [dbo].[ProductPictures] ([ID], [ProductID], [PictureID], [IsDeleted], [ModifiedOn]) VALUES (44, 44, 44, 0, CAST(N'2020-05-17T00:00:41.927' AS DateTime))
GO
INSERT [dbo].[ProductPictures] ([ID], [ProductID], [PictureID], [IsDeleted], [ModifiedOn]) VALUES (45, 45, 45, 0, CAST(N'2020-05-17T00:00:41.927' AS DateTime))
GO
INSERT [dbo].[ProductPictures] ([ID], [ProductID], [PictureID], [IsDeleted], [ModifiedOn]) VALUES (46, 46, 46, 0, CAST(N'2020-05-17T00:00:41.927' AS DateTime))
GO
INSERT [dbo].[ProductPictures] ([ID], [ProductID], [PictureID], [IsDeleted], [ModifiedOn]) VALUES (47, 47, 47, 0, CAST(N'2020-05-17T00:00:41.927' AS DateTime))
GO
INSERT [dbo].[ProductPictures] ([ID], [ProductID], [PictureID], [IsDeleted], [ModifiedOn]) VALUES (48, 48, 48, 0, CAST(N'2020-05-17T00:00:41.927' AS DateTime))
GO
INSERT [dbo].[ProductPictures] ([ID], [ProductID], [PictureID], [IsDeleted], [ModifiedOn]) VALUES (49, 49, 49, 0, CAST(N'2020-05-17T00:00:41.927' AS DateTime))
GO
INSERT [dbo].[ProductPictures] ([ID], [ProductID], [PictureID], [IsDeleted], [ModifiedOn]) VALUES (50, 50, 50, 0, CAST(N'2020-05-17T00:00:41.927' AS DateTime))
GO
INSERT [dbo].[ProductPictures] ([ID], [ProductID], [PictureID], [IsDeleted], [ModifiedOn]) VALUES (51, 51, 51, 0, CAST(N'2020-05-17T00:00:41.927' AS DateTime))
GO
INSERT [dbo].[ProductPictures] ([ID], [ProductID], [PictureID], [IsDeleted], [ModifiedOn]) VALUES (52, 52, 52, 0, CAST(N'2020-05-17T00:00:41.927' AS DateTime))
GO
INSERT [dbo].[ProductPictures] ([ID], [ProductID], [PictureID], [IsDeleted], [ModifiedOn]) VALUES (53, 53, 53, 0, CAST(N'2020-05-17T00:00:41.927' AS DateTime))
GO
INSERT [dbo].[ProductPictures] ([ID], [ProductID], [PictureID], [IsDeleted], [ModifiedOn]) VALUES (54, 54, 54, 0, CAST(N'2020-05-17T00:00:41.927' AS DateTime))
GO
INSERT [dbo].[ProductPictures] ([ID], [ProductID], [PictureID], [IsDeleted], [ModifiedOn]) VALUES (55, 55, 55, 0, CAST(N'2020-05-17T00:00:41.927' AS DateTime))
GO
INSERT [dbo].[ProductPictures] ([ID], [ProductID], [PictureID], [IsDeleted], [ModifiedOn]) VALUES (56, 56, 56, 0, CAST(N'2020-05-17T00:00:41.927' AS DateTime))
GO
INSERT [dbo].[ProductPictures] ([ID], [ProductID], [PictureID], [IsDeleted], [ModifiedOn]) VALUES (57, 57, 57, 0, CAST(N'2020-05-17T00:00:41.927' AS DateTime))
GO
INSERT [dbo].[ProductPictures] ([ID], [ProductID], [PictureID], [IsDeleted], [ModifiedOn]) VALUES (58, 58, 58, 0, CAST(N'2020-05-17T00:00:41.927' AS DateTime))
GO
INSERT [dbo].[ProductPictures] ([ID], [ProductID], [PictureID], [IsDeleted], [ModifiedOn]) VALUES (59, 59, 59, 0, CAST(N'2020-05-17T00:00:41.927' AS DateTime))
GO
INSERT [dbo].[ProductPictures] ([ID], [ProductID], [PictureID], [IsDeleted], [ModifiedOn]) VALUES (60, 60, 60, 0, CAST(N'2020-05-17T00:00:41.927' AS DateTime))
GO
INSERT [dbo].[ProductPictures] ([ID], [ProductID], [PictureID], [IsDeleted], [ModifiedOn]) VALUES (61, 61, 61, 0, CAST(N'2020-05-17T00:00:41.927' AS DateTime))
GO
INSERT [dbo].[ProductPictures] ([ID], [ProductID], [PictureID], [IsDeleted], [ModifiedOn]) VALUES (62, 62, 62, 0, CAST(N'2020-05-17T00:00:41.927' AS DateTime))
GO
INSERT [dbo].[ProductPictures] ([ID], [ProductID], [PictureID], [IsDeleted], [ModifiedOn]) VALUES (63, 63, 63, 0, CAST(N'2020-05-17T00:00:41.927' AS DateTime))
GO
INSERT [dbo].[ProductPictures] ([ID], [ProductID], [PictureID], [IsDeleted], [ModifiedOn]) VALUES (64, 64, 64, 0, CAST(N'2020-05-17T00:00:41.927' AS DateTime))
GO
INSERT [dbo].[ProductPictures] ([ID], [ProductID], [PictureID], [IsDeleted], [ModifiedOn]) VALUES (65, 65, 65, 0, CAST(N'2020-05-17T00:00:41.927' AS DateTime))
GO
INSERT [dbo].[ProductPictures] ([ID], [ProductID], [PictureID], [IsDeleted], [ModifiedOn]) VALUES (66, 66, 66, 0, CAST(N'2020-05-17T00:00:41.927' AS DateTime))
GO
INSERT [dbo].[ProductPictures] ([ID], [ProductID], [PictureID], [IsDeleted], [ModifiedOn]) VALUES (67, 67, 67, 0, CAST(N'2020-05-17T00:00:41.927' AS DateTime))
GO
INSERT [dbo].[ProductPictures] ([ID], [ProductID], [PictureID], [IsDeleted], [ModifiedOn]) VALUES (68, 68, 68, 0, CAST(N'2020-05-17T00:00:41.927' AS DateTime))
GO
INSERT [dbo].[ProductPictures] ([ID], [ProductID], [PictureID], [IsDeleted], [ModifiedOn]) VALUES (69, 69, 69, 0, CAST(N'2020-05-17T00:00:41.927' AS DateTime))
GO
INSERT [dbo].[ProductPictures] ([ID], [ProductID], [PictureID], [IsDeleted], [ModifiedOn]) VALUES (70, 70, 70, 0, CAST(N'2020-05-17T00:00:41.927' AS DateTime))
GO
INSERT [dbo].[ProductPictures] ([ID], [ProductID], [PictureID], [IsDeleted], [ModifiedOn]) VALUES (71, 71, 71, 0, CAST(N'2020-05-17T00:00:41.927' AS DateTime))
GO
INSERT [dbo].[ProductPictures] ([ID], [ProductID], [PictureID], [IsDeleted], [ModifiedOn]) VALUES (72, 72, 72, 0, CAST(N'2020-05-17T00:00:41.927' AS DateTime))
GO
INSERT [dbo].[ProductPictures] ([ID], [ProductID], [PictureID], [IsDeleted], [ModifiedOn]) VALUES (73, 73, 73, 0, CAST(N'2020-05-17T00:00:41.927' AS DateTime))
GO
INSERT [dbo].[ProductPictures] ([ID], [ProductID], [PictureID], [IsDeleted], [ModifiedOn]) VALUES (74, 74, 74, 0, CAST(N'2020-05-17T00:00:41.927' AS DateTime))
GO
INSERT [dbo].[ProductPictures] ([ID], [ProductID], [PictureID], [IsDeleted], [ModifiedOn]) VALUES (75, 75, 75, 0, CAST(N'2020-05-17T00:00:41.927' AS DateTime))
GO
INSERT [dbo].[ProductPictures] ([ID], [ProductID], [PictureID], [IsDeleted], [ModifiedOn]) VALUES (76, 76, 76, 0, CAST(N'2020-05-17T00:00:41.927' AS DateTime))
GO
INSERT [dbo].[ProductPictures] ([ID], [ProductID], [PictureID], [IsDeleted], [ModifiedOn]) VALUES (77, 77, 77, 0, CAST(N'2020-05-17T00:00:41.927' AS DateTime))
GO
INSERT [dbo].[ProductPictures] ([ID], [ProductID], [PictureID], [IsDeleted], [ModifiedOn]) VALUES (78, 78, 78, 0, CAST(N'2020-05-17T00:00:41.927' AS DateTime))
GO
INSERT [dbo].[ProductPictures] ([ID], [ProductID], [PictureID], [IsDeleted], [ModifiedOn]) VALUES (79, 79, 79, 0, CAST(N'2020-05-17T00:00:41.927' AS DateTime))
GO
INSERT [dbo].[ProductPictures] ([ID], [ProductID], [PictureID], [IsDeleted], [ModifiedOn]) VALUES (80, 80, 80, 0, CAST(N'2020-05-17T00:00:41.927' AS DateTime))
GO
INSERT [dbo].[ProductPictures] ([ID], [ProductID], [PictureID], [IsDeleted], [ModifiedOn]) VALUES (81, 81, 81, 0, CAST(N'2020-05-17T00:00:41.927' AS DateTime))
GO
INSERT [dbo].[ProductPictures] ([ID], [ProductID], [PictureID], [IsDeleted], [ModifiedOn]) VALUES (82, 82, 82, 0, CAST(N'2020-05-17T00:00:41.927' AS DateTime))
GO
INSERT [dbo].[ProductPictures] ([ID], [ProductID], [PictureID], [IsDeleted], [ModifiedOn]) VALUES (83, 83, 83, 0, CAST(N'2020-05-17T00:00:41.927' AS DateTime))
GO
INSERT [dbo].[ProductPictures] ([ID], [ProductID], [PictureID], [IsDeleted], [ModifiedOn]) VALUES (84, 84, 84, 0, CAST(N'2020-05-17T00:00:41.927' AS DateTime))
GO
INSERT [dbo].[ProductPictures] ([ID], [ProductID], [PictureID], [IsDeleted], [ModifiedOn]) VALUES (85, 85, 85, 0, CAST(N'2020-05-17T00:00:41.927' AS DateTime))
GO
INSERT [dbo].[ProductPictures] ([ID], [ProductID], [PictureID], [IsDeleted], [ModifiedOn]) VALUES (86, 86, 86, 0, CAST(N'2020-05-17T00:00:41.927' AS DateTime))
GO
INSERT [dbo].[ProductPictures] ([ID], [ProductID], [PictureID], [IsDeleted], [ModifiedOn]) VALUES (87, 87, 87, 0, CAST(N'2020-05-17T00:00:41.927' AS DateTime))
GO
INSERT [dbo].[ProductPictures] ([ID], [ProductID], [PictureID], [IsDeleted], [ModifiedOn]) VALUES (88, 88, 88, 0, CAST(N'2020-05-17T00:00:41.927' AS DateTime))
GO
INSERT [dbo].[ProductPictures] ([ID], [ProductID], [PictureID], [IsDeleted], [ModifiedOn]) VALUES (89, 89, 89, 0, CAST(N'2020-05-17T00:00:41.927' AS DateTime))
GO
INSERT [dbo].[ProductPictures] ([ID], [ProductID], [PictureID], [IsDeleted], [ModifiedOn]) VALUES (90, 90, 90, 0, CAST(N'2020-05-17T00:00:41.927' AS DateTime))
GO
INSERT [dbo].[ProductPictures] ([ID], [ProductID], [PictureID], [IsDeleted], [ModifiedOn]) VALUES (91, 91, 91, 0, CAST(N'2020-05-17T00:00:41.927' AS DateTime))
GO
INSERT [dbo].[ProductPictures] ([ID], [ProductID], [PictureID], [IsDeleted], [ModifiedOn]) VALUES (92, 92, 92, 0, CAST(N'2020-05-17T00:00:41.927' AS DateTime))
GO
INSERT [dbo].[ProductPictures] ([ID], [ProductID], [PictureID], [IsDeleted], [ModifiedOn]) VALUES (93, 93, 93, 0, CAST(N'2020-05-17T00:00:41.927' AS DateTime))
GO
INSERT [dbo].[ProductPictures] ([ID], [ProductID], [PictureID], [IsDeleted], [ModifiedOn]) VALUES (94, 94, 94, 0, CAST(N'2020-05-17T00:00:41.927' AS DateTime))
GO
INSERT [dbo].[ProductPictures] ([ID], [ProductID], [PictureID], [IsDeleted], [ModifiedOn]) VALUES (95, 95, 95, 0, CAST(N'2020-05-17T00:00:41.927' AS DateTime))
GO
INSERT [dbo].[ProductPictures] ([ID], [ProductID], [PictureID], [IsDeleted], [ModifiedOn]) VALUES (96, 96, 96, 0, CAST(N'2020-05-17T00:00:41.927' AS DateTime))
GO
INSERT [dbo].[ProductPictures] ([ID], [ProductID], [PictureID], [IsDeleted], [ModifiedOn]) VALUES (97, 97, 97, 0, CAST(N'2020-05-17T00:00:41.927' AS DateTime))
GO
INSERT [dbo].[ProductPictures] ([ID], [ProductID], [PictureID], [IsDeleted], [ModifiedOn]) VALUES (98, 98, 98, 0, CAST(N'2020-05-17T00:00:41.927' AS DateTime))
GO
INSERT [dbo].[ProductPictures] ([ID], [ProductID], [PictureID], [IsDeleted], [ModifiedOn]) VALUES (99, 99, 99, 0, CAST(N'2020-05-17T00:00:41.927' AS DateTime))
GO
INSERT [dbo].[ProductPictures] ([ID], [ProductID], [PictureID], [IsDeleted], [ModifiedOn]) VALUES (100, 100, 100, 0, CAST(N'2020-05-17T00:00:41.927' AS DateTime))
GO
INSERT [dbo].[ProductPictures] ([ID], [ProductID], [PictureID], [IsDeleted], [ModifiedOn]) VALUES (101, 101, 101, 0, CAST(N'2020-05-17T00:00:41.927' AS DateTime))
GO
INSERT [dbo].[ProductPictures] ([ID], [ProductID], [PictureID], [IsDeleted], [ModifiedOn]) VALUES (102, 102, 102, 0, CAST(N'2020-05-17T00:00:41.927' AS DateTime))
GO
INSERT [dbo].[ProductPictures] ([ID], [ProductID], [PictureID], [IsDeleted], [ModifiedOn]) VALUES (103, 103, 103, 0, CAST(N'2020-05-17T00:00:41.927' AS DateTime))
GO
INSERT [dbo].[ProductPictures] ([ID], [ProductID], [PictureID], [IsDeleted], [ModifiedOn]) VALUES (104, 104, 104, 0, CAST(N'2020-05-17T00:00:41.927' AS DateTime))
GO
INSERT [dbo].[ProductPictures] ([ID], [ProductID], [PictureID], [IsDeleted], [ModifiedOn]) VALUES (105, 105, 105, 0, CAST(N'2020-05-17T00:00:41.927' AS DateTime))
GO
INSERT [dbo].[ProductPictures] ([ID], [ProductID], [PictureID], [IsDeleted], [ModifiedOn]) VALUES (106, 106, 106, 0, CAST(N'2020-05-17T00:00:41.927' AS DateTime))
GO
INSERT [dbo].[ProductPictures] ([ID], [ProductID], [PictureID], [IsDeleted], [ModifiedOn]) VALUES (107, 107, 107, 0, CAST(N'2020-05-17T00:00:41.927' AS DateTime))
GO
INSERT [dbo].[ProductPictures] ([ID], [ProductID], [PictureID], [IsDeleted], [ModifiedOn]) VALUES (108, 108, 108, 0, CAST(N'2020-05-17T00:00:41.927' AS DateTime))
GO
INSERT [dbo].[ProductPictures] ([ID], [ProductID], [PictureID], [IsDeleted], [ModifiedOn]) VALUES (109, 109, 109, 0, CAST(N'2020-05-17T00:00:41.927' AS DateTime))
GO
INSERT [dbo].[ProductPictures] ([ID], [ProductID], [PictureID], [IsDeleted], [ModifiedOn]) VALUES (110, 110, 110, 0, CAST(N'2020-05-17T00:00:41.927' AS DateTime))
GO
INSERT [dbo].[ProductPictures] ([ID], [ProductID], [PictureID], [IsDeleted], [ModifiedOn]) VALUES (111, 111, 111, 0, CAST(N'2020-05-17T00:00:41.927' AS DateTime))
GO
INSERT [dbo].[ProductPictures] ([ID], [ProductID], [PictureID], [IsDeleted], [ModifiedOn]) VALUES (112, 112, 112, 0, CAST(N'2020-05-17T00:00:41.927' AS DateTime))
GO
INSERT [dbo].[ProductPictures] ([ID], [ProductID], [PictureID], [IsDeleted], [ModifiedOn]) VALUES (113, 113, 113, 0, CAST(N'2020-05-17T00:00:41.927' AS DateTime))
GO
INSERT [dbo].[ProductPictures] ([ID], [ProductID], [PictureID], [IsDeleted], [ModifiedOn]) VALUES (114, 114, 114, 0, CAST(N'2020-05-17T00:00:41.927' AS DateTime))
GO
INSERT [dbo].[ProductPictures] ([ID], [ProductID], [PictureID], [IsDeleted], [ModifiedOn]) VALUES (115, 115, 115, 0, CAST(N'2020-05-17T00:00:41.927' AS DateTime))
GO
INSERT [dbo].[ProductPictures] ([ID], [ProductID], [PictureID], [IsDeleted], [ModifiedOn]) VALUES (116, 116, 116, 0, CAST(N'2020-05-17T00:00:41.927' AS DateTime))
GO
INSERT [dbo].[ProductPictures] ([ID], [ProductID], [PictureID], [IsDeleted], [ModifiedOn]) VALUES (117, 117, 117, 0, CAST(N'2020-05-17T00:00:41.927' AS DateTime))
GO
INSERT [dbo].[ProductPictures] ([ID], [ProductID], [PictureID], [IsDeleted], [ModifiedOn]) VALUES (118, 118, 118, 0, CAST(N'2020-05-17T00:00:41.927' AS DateTime))
GO
INSERT [dbo].[ProductPictures] ([ID], [ProductID], [PictureID], [IsDeleted], [ModifiedOn]) VALUES (119, 119, 119, 0, CAST(N'2020-05-17T00:00:41.927' AS DateTime))
GO
INSERT [dbo].[ProductPictures] ([ID], [ProductID], [PictureID], [IsDeleted], [ModifiedOn]) VALUES (120, 120, 120, 0, CAST(N'2020-05-17T00:00:41.927' AS DateTime))
GO
INSERT [dbo].[ProductPictures] ([ID], [ProductID], [PictureID], [IsDeleted], [ModifiedOn]) VALUES (121, 121, 121, 0, CAST(N'2020-05-17T00:00:41.927' AS DateTime))
GO
INSERT [dbo].[ProductPictures] ([ID], [ProductID], [PictureID], [IsDeleted], [ModifiedOn]) VALUES (122, 122, 122, 0, CAST(N'2020-05-17T00:00:41.927' AS DateTime))
GO
INSERT [dbo].[ProductPictures] ([ID], [ProductID], [PictureID], [IsDeleted], [ModifiedOn]) VALUES (123, 123, 123, 0, CAST(N'2020-05-17T00:00:41.927' AS DateTime))
GO
INSERT [dbo].[ProductPictures] ([ID], [ProductID], [PictureID], [IsDeleted], [ModifiedOn]) VALUES (124, 124, 124, 0, CAST(N'2020-05-17T00:00:41.927' AS DateTime))
GO
INSERT [dbo].[ProductPictures] ([ID], [ProductID], [PictureID], [IsDeleted], [ModifiedOn]) VALUES (125, 125, 125, 0, CAST(N'2020-05-17T00:00:41.927' AS DateTime))
GO
INSERT [dbo].[ProductPictures] ([ID], [ProductID], [PictureID], [IsDeleted], [ModifiedOn]) VALUES (126, 126, 126, 0, CAST(N'2020-05-17T00:00:41.927' AS DateTime))
GO
INSERT [dbo].[ProductPictures] ([ID], [ProductID], [PictureID], [IsDeleted], [ModifiedOn]) VALUES (127, 127, 127, 0, CAST(N'2020-05-17T00:00:41.927' AS DateTime))
GO
INSERT [dbo].[ProductPictures] ([ID], [ProductID], [PictureID], [IsDeleted], [ModifiedOn]) VALUES (128, 128, 128, 0, CAST(N'2020-05-17T00:00:41.927' AS DateTime))
GO
INSERT [dbo].[ProductPictures] ([ID], [ProductID], [PictureID], [IsDeleted], [ModifiedOn]) VALUES (129, 129, 129, 0, CAST(N'2020-05-17T00:00:41.927' AS DateTime))
GO
INSERT [dbo].[ProductPictures] ([ID], [ProductID], [PictureID], [IsDeleted], [ModifiedOn]) VALUES (130, 130, 130, 0, CAST(N'2020-05-17T00:00:41.927' AS DateTime))
GO
INSERT [dbo].[ProductPictures] ([ID], [ProductID], [PictureID], [IsDeleted], [ModifiedOn]) VALUES (131, 131, 131, 0, CAST(N'2020-05-17T00:00:41.927' AS DateTime))
GO
INSERT [dbo].[ProductPictures] ([ID], [ProductID], [PictureID], [IsDeleted], [ModifiedOn]) VALUES (132, 132, 132, 0, CAST(N'2020-05-17T00:00:41.927' AS DateTime))
GO
INSERT [dbo].[ProductPictures] ([ID], [ProductID], [PictureID], [IsDeleted], [ModifiedOn]) VALUES (133, 133, 133, 0, CAST(N'2020-05-17T00:00:41.927' AS DateTime))
GO
INSERT [dbo].[ProductPictures] ([ID], [ProductID], [PictureID], [IsDeleted], [ModifiedOn]) VALUES (134, 134, 134, 0, CAST(N'2020-05-17T00:00:41.927' AS DateTime))
GO
INSERT [dbo].[ProductPictures] ([ID], [ProductID], [PictureID], [IsDeleted], [ModifiedOn]) VALUES (135, 135, 135, 0, CAST(N'2020-05-17T00:00:41.927' AS DateTime))
GO
INSERT [dbo].[ProductPictures] ([ID], [ProductID], [PictureID], [IsDeleted], [ModifiedOn]) VALUES (136, 136, 136, 0, CAST(N'2020-05-17T00:00:41.927' AS DateTime))
GO
INSERT [dbo].[ProductPictures] ([ID], [ProductID], [PictureID], [IsDeleted], [ModifiedOn]) VALUES (137, 137, 137, 0, CAST(N'2020-05-17T00:00:41.927' AS DateTime))
GO
INSERT [dbo].[ProductPictures] ([ID], [ProductID], [PictureID], [IsDeleted], [ModifiedOn]) VALUES (138, 138, 138, 0, CAST(N'2020-05-17T00:00:41.927' AS DateTime))
GO
INSERT [dbo].[ProductPictures] ([ID], [ProductID], [PictureID], [IsDeleted], [ModifiedOn]) VALUES (139, 139, 139, 0, CAST(N'2020-05-17T00:00:41.927' AS DateTime))
GO
INSERT [dbo].[ProductPictures] ([ID], [ProductID], [PictureID], [IsDeleted], [ModifiedOn]) VALUES (140, 140, 140, 0, CAST(N'2020-05-17T00:00:41.927' AS DateTime))
GO
INSERT [dbo].[ProductPictures] ([ID], [ProductID], [PictureID], [IsDeleted], [ModifiedOn]) VALUES (142, 142, 142, 0, CAST(N'2020-05-17T00:00:41.927' AS DateTime))
GO
INSERT [dbo].[ProductPictures] ([ID], [ProductID], [PictureID], [IsDeleted], [ModifiedOn]) VALUES (143, 143, 143, 0, CAST(N'2020-05-17T00:00:41.927' AS DateTime))
GO
INSERT [dbo].[ProductPictures] ([ID], [ProductID], [PictureID], [IsDeleted], [ModifiedOn]) VALUES (145, 145, 145, 0, CAST(N'2020-05-17T00:00:41.927' AS DateTime))
GO
INSERT [dbo].[ProductPictures] ([ID], [ProductID], [PictureID], [IsDeleted], [ModifiedOn]) VALUES (146, 146, 146, 0, CAST(N'2020-05-17T00:00:41.927' AS DateTime))
GO
INSERT [dbo].[ProductPictures] ([ID], [ProductID], [PictureID], [IsDeleted], [ModifiedOn]) VALUES (148, 148, 148, 0, CAST(N'2020-05-17T00:00:41.927' AS DateTime))
GO
INSERT [dbo].[ProductPictures] ([ID], [ProductID], [PictureID], [IsDeleted], [ModifiedOn]) VALUES (150, 150, 150, 0, CAST(N'2020-05-17T00:00:41.927' AS DateTime))
GO
INSERT [dbo].[ProductPictures] ([ID], [ProductID], [PictureID], [IsDeleted], [ModifiedOn]) VALUES (151, 151, 151, 0, CAST(N'2020-05-17T00:00:41.927' AS DateTime))
GO
INSERT [dbo].[ProductPictures] ([ID], [ProductID], [PictureID], [IsDeleted], [ModifiedOn]) VALUES (152, 152, 152, 0, CAST(N'2020-05-17T00:00:41.927' AS DateTime))
GO
INSERT [dbo].[ProductPictures] ([ID], [ProductID], [PictureID], [IsDeleted], [ModifiedOn]) VALUES (153, 153, 153, 0, CAST(N'2020-05-17T00:00:41.927' AS DateTime))
GO
INSERT [dbo].[ProductPictures] ([ID], [ProductID], [PictureID], [IsDeleted], [ModifiedOn]) VALUES (154, 154, 154, 0, CAST(N'2020-05-17T00:00:41.927' AS DateTime))
GO
INSERT [dbo].[ProductPictures] ([ID], [ProductID], [PictureID], [IsDeleted], [ModifiedOn]) VALUES (155, 155, 155, 0, CAST(N'2020-05-17T00:00:41.927' AS DateTime))
GO
INSERT [dbo].[ProductPictures] ([ID], [ProductID], [PictureID], [IsDeleted], [ModifiedOn]) VALUES (156, 156, 156, 0, CAST(N'2020-05-17T00:00:41.927' AS DateTime))
GO
INSERT [dbo].[ProductPictures] ([ID], [ProductID], [PictureID], [IsDeleted], [ModifiedOn]) VALUES (157, 157, 157, 0, CAST(N'2020-05-17T00:00:41.927' AS DateTime))
GO
INSERT [dbo].[ProductPictures] ([ID], [ProductID], [PictureID], [IsDeleted], [ModifiedOn]) VALUES (158, 158, 158, 0, CAST(N'2020-05-17T00:00:41.927' AS DateTime))
GO
INSERT [dbo].[ProductPictures] ([ID], [ProductID], [PictureID], [IsDeleted], [ModifiedOn]) VALUES (159, 159, 159, 0, CAST(N'2020-05-17T00:00:41.927' AS DateTime))
GO
INSERT [dbo].[ProductPictures] ([ID], [ProductID], [PictureID], [IsDeleted], [ModifiedOn]) VALUES (160, 160, 160, 0, CAST(N'2020-05-17T00:00:41.927' AS DateTime))
GO
INSERT [dbo].[ProductPictures] ([ID], [ProductID], [PictureID], [IsDeleted], [ModifiedOn]) VALUES (161, 161, 161, 0, CAST(N'2020-05-17T00:00:41.927' AS DateTime))
GO
INSERT [dbo].[ProductPictures] ([ID], [ProductID], [PictureID], [IsDeleted], [ModifiedOn]) VALUES (162, 162, 162, 0, CAST(N'2020-05-17T00:00:41.927' AS DateTime))
GO
INSERT [dbo].[ProductPictures] ([ID], [ProductID], [PictureID], [IsDeleted], [ModifiedOn]) VALUES (163, 163, 163, 0, CAST(N'2020-05-17T00:00:41.927' AS DateTime))
GO
INSERT [dbo].[ProductPictures] ([ID], [ProductID], [PictureID], [IsDeleted], [ModifiedOn]) VALUES (164, 164, 164, 0, CAST(N'2020-05-17T00:00:41.927' AS DateTime))
GO
INSERT [dbo].[ProductPictures] ([ID], [ProductID], [PictureID], [IsDeleted], [ModifiedOn]) VALUES (165, 165, 165, 0, CAST(N'2020-05-17T00:00:41.927' AS DateTime))
GO
INSERT [dbo].[ProductPictures] ([ID], [ProductID], [PictureID], [IsDeleted], [ModifiedOn]) VALUES (166, 166, 166, 0, CAST(N'2020-05-17T00:00:41.927' AS DateTime))
GO
INSERT [dbo].[ProductPictures] ([ID], [ProductID], [PictureID], [IsDeleted], [ModifiedOn]) VALUES (167, 167, 167, 0, CAST(N'2020-05-17T00:00:41.927' AS DateTime))
GO
INSERT [dbo].[ProductPictures] ([ID], [ProductID], [PictureID], [IsDeleted], [ModifiedOn]) VALUES (168, 168, 168, 0, CAST(N'2020-05-17T00:00:41.927' AS DateTime))
GO
INSERT [dbo].[ProductPictures] ([ID], [ProductID], [PictureID], [IsDeleted], [ModifiedOn]) VALUES (169, 169, 169, 0, CAST(N'2020-05-17T00:00:41.927' AS DateTime))
GO
INSERT [dbo].[ProductPictures] ([ID], [ProductID], [PictureID], [IsDeleted], [ModifiedOn]) VALUES (170, 170, 170, 0, CAST(N'2020-05-17T00:00:41.927' AS DateTime))
GO
INSERT [dbo].[ProductPictures] ([ID], [ProductID], [PictureID], [IsDeleted], [ModifiedOn]) VALUES (171, 171, 171, 0, CAST(N'2020-05-17T00:00:41.927' AS DateTime))
GO
INSERT [dbo].[ProductPictures] ([ID], [ProductID], [PictureID], [IsDeleted], [ModifiedOn]) VALUES (174, 141, 141, 0, CAST(N'2020-05-17T00:00:41.927' AS DateTime))
GO
INSERT [dbo].[ProductPictures] ([ID], [ProductID], [PictureID], [IsDeleted], [ModifiedOn]) VALUES (175, 144, 144, 0, CAST(N'2020-05-17T00:00:41.927' AS DateTime))
GO
INSERT [dbo].[ProductPictures] ([ID], [ProductID], [PictureID], [IsDeleted], [ModifiedOn]) VALUES (176, 147, 147, 0, CAST(N'2020-05-17T00:00:41.927' AS DateTime))
GO
INSERT [dbo].[ProductPictures] ([ID], [ProductID], [PictureID], [IsDeleted], [ModifiedOn]) VALUES (178, 149, 149, 0, CAST(N'2020-05-17T00:00:41.927' AS DateTime))
GO
INSERT [dbo].[ProductPictures] ([ID], [ProductID], [PictureID], [IsDeleted], [ModifiedOn]) VALUES (180, 149, 149, 0, CAST(N'2020-05-17T00:00:41.927' AS DateTime))
GO
SET IDENTITY_INSERT [dbo].[ProductPictures] OFF
GO

-- Yearly Profit Data
SET IDENTITY_INSERT [dbo].[YearlyProfitRecords] ON 
GO

INSERT [dbo].[YearlyProfitRecords] ([ID], [Year], [TotalProfit], [IsDeleted], [ModifiedOn]) VALUES(2, 2021, 4796, 0, CAST(N'2021-12-31T22:39:00' AS DATETIME))
GO

SET IDENTITY_INSERT [dbo].[YearlyProfitRecords] OFF


-- Monthly Profit Data
SET IDENTITY_INSERT [dbo].[MonthlyProfitRecords] ON
GO

INSERT [dbo].[MonthlyProfitRecords] ([ID], [Month], [Profit], [IsDeleted], [ModifiedOn], [YearlyProfitRecordID]) VALUES(13, 1, 234, 0, CAST(N'2021-01-28T22:39:00' AS DATETIME), 2)
GO

INSERT [dbo].[MonthlyProfitRecords] ([ID], [Month], [Profit], [IsDeleted], [ModifiedOn], [YearlyProfitRecordID]) VALUES(14, 2, 432, 0, CAST(N'2021-02-28T22:39:00' AS DATETIME), 2)
GO

INSERT [dbo].[MonthlyProfitRecords] ([ID], [Month], [Profit], [IsDeleted], [ModifiedOn], [YearlyProfitRecordID]) VALUES(15, 3, 216, 0, CAST(N'2021-03-31T22:39:00' AS DATETIME), 2)
GO

INSERT [dbo].[MonthlyProfitRecords] ([ID], [Month], [Profit], [IsDeleted], [ModifiedOn], [YearlyProfitRecordID]) VALUES(16, 4, 548, 0, CAST(N'2021-04-30T22:39:00' AS DATETIME), 2)
GO

INSERT [dbo].[MonthlyProfitRecords] ([ID], [Month], [Profit], [IsDeleted], [ModifiedOn], [YearlyProfitRecordID]) VALUES(17, 5, 190, 0, CAST(N'2021-05-31T22:39:00' AS DATETIME), 2)
GO

INSERT [dbo].[MonthlyProfitRecords] ([ID], [Month], [Profit], [IsDeleted], [ModifiedOn], [YearlyProfitRecordID]) VALUES(18, 6, 862, 0, CAST(N'2021-06-30T22:39:00' AS DATETIME), 2)
GO

INSERT [dbo].[MonthlyProfitRecords] ([ID], [Month], [Profit], [IsDeleted], [ModifiedOn], [YearlyProfitRecordID]) VALUES(19, 7, 310, 0, CAST(N'2021-07-31T22:39:00' AS DATETIME), 2)
GO

INSERT [dbo].[MonthlyProfitRecords] ([ID], [Month], [Profit], [IsDeleted], [ModifiedOn], [YearlyProfitRecordID]) VALUES(20, 8, 527, 0, CAST(N'2021-08-31T22:39:00' AS DATETIME), 2)
GO

INSERT [dbo].[MonthlyProfitRecords] ([ID], [Month], [Profit], [IsDeleted], [ModifiedOn], [YearlyProfitRecordID]) VALUES(21, 9, 319, 0, CAST(N'2021-09-30T22:39:00' AS DATETIME), 2)
GO

INSERT [dbo].[MonthlyProfitRecords] ([ID], [Month], [Profit], [IsDeleted], [ModifiedOn], [YearlyProfitRecordID]) VALUES(22, 10, 248, 0, CAST(N'2021-10-31T22:39:00' AS DATETIME), 2)
GO

INSERT [dbo].[MonthlyProfitRecords] ([ID], [Month], [Profit], [IsDeleted], [ModifiedOn], [YearlyProfitRecordID]) VALUES(23, 11, 350, 0, CAST(N'2021-11-30T22:39:00' AS DATETIME), 2)
GO

INSERT [dbo].[MonthlyProfitRecords] ([ID], [Month], [Profit], [IsDeleted], [ModifiedOn], [YearlyProfitRecordID]) VALUES(24, 12, 560, 0, CAST(N'2021-12-31T22:39:00' AS DATETIME), 2)
GO

INSERT [dbo].[MonthlyProfitRecords] ([ID], [Month], [Profit], [IsDeleted], [ModifiedOn], [YearlyProfitRecordID]) VALUES(25, 1, 643, 0, CAST(N'2022-01-28T22:39:00' AS DATETIME), 3)
GO

INSERT [dbo].[MonthlyProfitRecords] ([ID], [Month], [Profit], [IsDeleted], [ModifiedOn], [YearlyProfitRecordID]) VALUES(26, 2, 892, 0, CAST(N'2022-02-28T22:39:00' AS DATETIME), 3)
GO

INSERT [dbo].[MonthlyProfitRecords] ([ID], [Month], [Profit], [IsDeleted], [ModifiedOn], [YearlyProfitRecordID]) VALUES(27, 3, 971, 0, CAST(N'2022-03-31T22:39:00' AS DATETIME), 3)
GO

INSERT [dbo].[MonthlyProfitRecords] ([ID], [Month], [Profit], [IsDeleted], [ModifiedOn], [YearlyProfitRecordID]) VALUES(28, 4, 657, 0, CAST(N'2022-04-30T22:39:00' AS DATETIME), 3)
GO

INSERT [dbo].[MonthlyProfitRecords] ([ID], [Month], [Profit], [IsDeleted], [ModifiedOn], [YearlyProfitRecordID]) VALUES(29, 5, 605, 0, CAST(N'2022-05-31T22:39:00' AS DATETIME), 3)
GO

INSERT [dbo].[MonthlyProfitRecords] ([ID], [Month], [Profit], [IsDeleted], [ModifiedOn], [YearlyProfitRecordID]) VALUES(30, 6, 550, 0, CAST(N'2022-06-30T22:39:00' AS DATETIME), 3)
GO

INSERT [dbo].[MonthlyProfitRecords] ([ID], [Month], [Profit], [IsDeleted], [ModifiedOn], [YearlyProfitRecordID]) VALUES(31, 7, 450, 0, CAST(N'2022-07-31T22:39:00' AS DATETIME), 3)
GO

INSERT [dbo].[MonthlyProfitRecords] ([ID], [Month], [Profit], [IsDeleted], [ModifiedOn], [YearlyProfitRecordID]) VALUES(32, 8, 658, 0, CAST(N'2022-08-31T22:39:00' AS DATETIME), 3)
GO

INSERT [dbo].[MonthlyProfitRecords] ([ID], [Month], [Profit], [IsDeleted], [ModifiedOn], [YearlyProfitRecordID]) VALUES(33, 9, 687, 0, CAST(N'2022-09-30T22:39:00' AS DATETIME), 3)
GO

INSERT [dbo].[MonthlyProfitRecords] ([ID], [Month], [Profit], [IsDeleted], [ModifiedOn], [YearlyProfitRecordID]) VALUES(34, 10, 234, 0, CAST(N'2022-10-31T22:39:00' AS DATETIME), 3)
GO

INSERT [dbo].[MonthlyProfitRecords] ([ID], [Month], [Profit], [IsDeleted], [ModifiedOn], [YearlyProfitRecordID]) VALUES(35, 11, 285, 0, CAST(N'2022-11-30T22:39:00' AS DATETIME), 3)
GO

INSERT [dbo].[MonthlyProfitRecords] ([ID], [Month], [Profit], [IsDeleted], [ModifiedOn], [YearlyProfitRecordID]) VALUES(36, 12, 760, 0, CAST(N'2022-12-31T22:39:00' AS DATETIME), 3)
GO

SET IDENTITY_INSERT [dbo].[MonthlyProfitRecords] OFF
GO


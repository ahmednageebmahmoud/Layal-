USE [Layal]
GO
/****** Object:  StoredProcedure [dbo].[Words_Update]    Script Date: 1/30/2020 7:50:35 PM ******/
DROP PROCEDURE [dbo].[Words_Update]
GO
/****** Object:  StoredProcedure [dbo].[Words_Insert]    Script Date: 1/30/2020 7:50:35 PM ******/
DROP PROCEDURE [dbo].[Words_Insert]
GO
/****** Object:  StoredProcedure [dbo].[Words_DeleteList]    Script Date: 1/30/2020 7:50:35 PM ******/
DROP PROCEDURE [dbo].[Words_DeleteList]
GO
/****** Object:  StoredProcedure [dbo].[Words_Delete]    Script Date: 1/30/2020 7:50:35 PM ******/
DROP PROCEDURE [dbo].[Words_Delete]
GO
/****** Object:  StoredProcedure [dbo].[UsersPrivileges_SelectByMenuId]    Script Date: 1/30/2020 7:50:35 PM ******/
DROP PROCEDURE [dbo].[UsersPrivileges_SelectByMenuId]
GO
/****** Object:  StoredProcedure [dbo].[UsersPrivileges_ChekcIfIsClosed]    Script Date: 1/30/2020 7:50:35 PM ******/
DROP PROCEDURE [dbo].[UsersPrivileges_ChekcIfIsClosed]
GO
/****** Object:  StoredProcedure [dbo].[UserSocialAccounts_SelectAllByUserId]    Script Date: 1/30/2020 7:50:35 PM ******/
DROP PROCEDURE [dbo].[UserSocialAccounts_SelectAllByUserId]
GO
/****** Object:  StoredProcedure [dbo].[UserSocialAccounts_Insert]    Script Date: 1/30/2020 7:50:35 PM ******/
DROP PROCEDURE [dbo].[UserSocialAccounts_Insert]
GO
/****** Object:  StoredProcedure [dbo].[UserSocialAccounts_Delete]    Script Date: 1/30/2020 7:50:35 PM ******/
DROP PROCEDURE [dbo].[UserSocialAccounts_Delete]
GO
/****** Object:  StoredProcedure [dbo].[Users_UserNameBeforUsed]    Script Date: 1/30/2020 7:50:35 PM ******/
DROP PROCEDURE [dbo].[Users_UserNameBeforUsed]
GO
/****** Object:  StoredProcedure [dbo].[Users_UpdateLangage]    Script Date: 1/30/2020 7:50:35 PM ******/
DROP PROCEDURE [dbo].[Users_UpdateLangage]
GO
/****** Object:  StoredProcedure [dbo].[Users_Update]    Script Date: 1/30/2020 7:50:35 PM ******/
DROP PROCEDURE [dbo].[Users_Update]
GO
/****** Object:  StoredProcedure [dbo].[Users_UpateActiveCodeAndEmail]    Script Date: 1/30/2020 7:50:35 PM ******/
DROP PROCEDURE [dbo].[Users_UpateActiveCodeAndEmail]
GO
/****** Object:  StoredProcedure [dbo].[Users_SelectByUserNameAndPassword]    Script Date: 1/30/2020 7:50:35 PM ******/
DROP PROCEDURE [dbo].[Users_SelectByUserNameAndPassword]
GO
/****** Object:  StoredProcedure [dbo].[Users_SelectByPk]    Script Date: 1/30/2020 7:50:35 PM ******/
DROP PROCEDURE [dbo].[Users_SelectByPk]
GO
/****** Object:  StoredProcedure [dbo].[Users_SelectByFilter]    Script Date: 1/30/2020 7:50:35 PM ******/
DROP PROCEDURE [dbo].[Users_SelectByFilter]
GO
/****** Object:  StoredProcedure [dbo].[Users_SelectByBranchIdWithWorkTypes]    Script Date: 1/30/2020 7:50:35 PM ******/
DROP PROCEDURE [dbo].[Users_SelectByBranchIdWithWorkTypes]
GO
/****** Object:  StoredProcedure [dbo].[Users_SelectByBranchId]    Script Date: 1/30/2020 7:50:35 PM ******/
DROP PROCEDURE [dbo].[Users_SelectByBranchId]
GO
/****** Object:  StoredProcedure [dbo].[Users_SelectByBaicBranchWithWorkTypes]    Script Date: 1/30/2020 7:50:35 PM ******/
DROP PROCEDURE [dbo].[Users_SelectByBaicBranchWithWorkTypes]
GO
/****** Object:  StoredProcedure [dbo].[Users_SelectByAccountType]    Script Date: 1/30/2020 7:50:35 PM ******/
DROP PROCEDURE [dbo].[Users_SelectByAccountType]
GO
/****** Object:  StoredProcedure [dbo].[Users_SelectAllForUsersPrivileges]    Script Date: 1/30/2020 7:50:35 PM ******/
DROP PROCEDURE [dbo].[Users_SelectAllForUsersPrivileges]
GO
/****** Object:  StoredProcedure [dbo].[Users_SelectAllEmployees]    Script Date: 1/30/2020 7:50:35 PM ******/
DROP PROCEDURE [dbo].[Users_SelectAllEmployees]
GO
/****** Object:  StoredProcedure [dbo].[Users_PhoneNumberBeforUsed]    Script Date: 1/30/2020 7:50:35 PM ******/
DROP PROCEDURE [dbo].[Users_PhoneNumberBeforUsed]
GO
/****** Object:  StoredProcedure [dbo].[Users_NationalityNumberBeforUsed]    Script Date: 1/30/2020 7:50:35 PM ******/
DROP PROCEDURE [dbo].[Users_NationalityNumberBeforUsed]
GO
/****** Object:  StoredProcedure [dbo].[Users_Insert]    Script Date: 1/30/2020 7:50:35 PM ******/
DROP PROCEDURE [dbo].[Users_Insert]
GO
/****** Object:  StoredProcedure [dbo].[Users_EmailBeforUsed]    Script Date: 1/30/2020 7:50:35 PM ******/
DROP PROCEDURE [dbo].[Users_EmailBeforUsed]
GO
/****** Object:  StoredProcedure [dbo].[Users_CheckIfEmailActivated]    Script Date: 1/30/2020 7:50:35 PM ******/
DROP PROCEDURE [dbo].[Users_CheckIfEmailActivated]
GO
/****** Object:  StoredProcedure [dbo].[Users_CheckIfActive]    Script Date: 1/30/2020 7:50:35 PM ******/
DROP PROCEDURE [dbo].[Users_CheckIfActive]
GO
/****** Object:  StoredProcedure [dbo].[Users_CheckFromActiveCode]    Script Date: 1/30/2020 7:50:35 PM ******/
DROP PROCEDURE [dbo].[Users_CheckFromActiveCode]
GO
/****** Object:  StoredProcedure [dbo].[Users_CheckCompeleteAccountInformation]    Script Date: 1/30/2020 7:50:35 PM ******/
DROP PROCEDURE [dbo].[Users_CheckCompeleteAccountInformation]
GO
/****** Object:  StoredProcedure [dbo].[Users_ActiveEmail]    Script Date: 1/30/2020 7:50:35 PM ******/
DROP PROCEDURE [dbo].[Users_ActiveEmail]
GO
/****** Object:  StoredProcedure [dbo].[UserPrivileges_SelectByUserId]    Script Date: 1/30/2020 7:50:35 PM ******/
DROP PROCEDURE [dbo].[UserPrivileges_SelectByUserId]
GO
/****** Object:  StoredProcedure [dbo].[UserPrivileges_RemoveByMenuIdAndUserId]    Script Date: 1/30/2020 7:50:35 PM ******/
DROP PROCEDURE [dbo].[UserPrivileges_RemoveByMenuIdAndUserId]
GO
/****** Object:  StoredProcedure [dbo].[UserPrivileges_Insert]    Script Date: 1/30/2020 7:50:35 PM ******/
DROP PROCEDURE [dbo].[UserPrivileges_Insert]
GO
/****** Object:  StoredProcedure [dbo].[UserPayments_Update]    Script Date: 1/30/2020 7:50:35 PM ******/
DROP PROCEDURE [dbo].[UserPayments_Update]
GO
/****** Object:  StoredProcedure [dbo].[UserPayments_SelectByUserToId]    Script Date: 1/30/2020 7:50:35 PM ******/
DROP PROCEDURE [dbo].[UserPayments_SelectByUserToId]
GO
/****** Object:  StoredProcedure [dbo].[UserPayments_SelectByPK]    Script Date: 1/30/2020 7:50:35 PM ******/
DROP PROCEDURE [dbo].[UserPayments_SelectByPK]
GO
/****** Object:  StoredProcedure [dbo].[UserPayments_Insert]    Script Date: 1/30/2020 7:50:35 PM ******/
DROP PROCEDURE [dbo].[UserPayments_Insert]
GO
/****** Object:  StoredProcedure [dbo].[StaticFields_Update]    Script Date: 1/30/2020 7:50:35 PM ******/
DROP PROCEDURE [dbo].[StaticFields_Update]
GO
/****** Object:  StoredProcedure [dbo].[StaticFields_SelectByFilter]    Script Date: 1/30/2020 7:50:35 PM ******/
DROP PROCEDURE [dbo].[StaticFields_SelectByFilter]
GO
/****** Object:  StoredProcedure [dbo].[StaticFields_SelectAll]    Script Date: 1/30/2020 7:50:35 PM ******/
DROP PROCEDURE [dbo].[StaticFields_SelectAll]
GO
/****** Object:  StoredProcedure [dbo].[StaticFields_Insert]    Script Date: 1/30/2020 7:50:35 PM ******/
DROP PROCEDURE [dbo].[StaticFields_Insert]
GO
/****** Object:  StoredProcedure [dbo].[StaticFields_Delete]    Script Date: 1/30/2020 7:50:35 PM ******/
DROP PROCEDURE [dbo].[StaticFields_Delete]
GO
/****** Object:  StoredProcedure [dbo].[StaticFields_CheckIfUsed]    Script Date: 1/30/2020 7:50:35 PM ******/
DROP PROCEDURE [dbo].[StaticFields_CheckIfUsed]
GO
/****** Object:  StoredProcedure [dbo].[SocialAccountTypes_Update]    Script Date: 1/30/2020 7:50:35 PM ******/
DROP PROCEDURE [dbo].[SocialAccountTypes_Update]
GO
/****** Object:  StoredProcedure [dbo].[SocialAccountTypes_SelectByFilter]    Script Date: 1/30/2020 7:50:35 PM ******/
DROP PROCEDURE [dbo].[SocialAccountTypes_SelectByFilter]
GO
/****** Object:  StoredProcedure [dbo].[SocialAccountTypes_SelectAll]    Script Date: 1/30/2020 7:50:35 PM ******/
DROP PROCEDURE [dbo].[SocialAccountTypes_SelectAll]
GO
/****** Object:  StoredProcedure [dbo].[SocialAccountTypes_Insert]    Script Date: 1/30/2020 7:50:35 PM ******/
DROP PROCEDURE [dbo].[SocialAccountTypes_Insert]
GO
/****** Object:  StoredProcedure [dbo].[SocialAccountTypes_Delete]    Script Date: 1/30/2020 7:50:35 PM ******/
DROP PROCEDURE [dbo].[SocialAccountTypes_Delete]
GO
/****** Object:  StoredProcedure [dbo].[SocialAccountTypes_CheckIfUsed]    Script Date: 1/30/2020 7:50:35 PM ******/
DROP PROCEDURE [dbo].[SocialAccountTypes_CheckIfUsed]
GO
/****** Object:  StoredProcedure [dbo].[Products_DisActiveParentAndChildren]    Script Date: 1/30/2020 7:50:35 PM ******/
DROP PROCEDURE [dbo].[Products_DisActiveParentAndChildren]
GO
/****** Object:  StoredProcedure [dbo].[Products_Disactive]    Script Date: 1/30/2020 7:50:35 PM ******/
DROP PROCEDURE [dbo].[Products_Disactive]
GO
/****** Object:  StoredProcedure [dbo].[PrintNameTypes_SelectByPK]    Script Date: 1/30/2020 7:50:35 PM ******/
DROP PROCEDURE [dbo].[PrintNameTypes_SelectByPK]
GO
/****** Object:  StoredProcedure [dbo].[PrintNameTypes_SelectAll]    Script Date: 1/30/2020 7:50:35 PM ******/
DROP PROCEDURE [dbo].[PrintNameTypes_SelectAll]
GO
/****** Object:  StoredProcedure [dbo].[PrintNamesTypes_Update]    Script Date: 1/30/2020 7:50:35 PM ******/
DROP PROCEDURE [dbo].[PrintNamesTypes_Update]
GO
/****** Object:  StoredProcedure [dbo].[PrintNamesTypes_SelectByFilter]    Script Date: 1/30/2020 7:50:35 PM ******/
DROP PROCEDURE [dbo].[PrintNamesTypes_SelectByFilter]
GO
/****** Object:  StoredProcedure [dbo].[PrintNamesTypes_Insert]    Script Date: 1/30/2020 7:50:35 PM ******/
DROP PROCEDURE [dbo].[PrintNamesTypes_Insert]
GO
/****** Object:  StoredProcedure [dbo].[PrintNamesTypes_Delete]    Script Date: 1/30/2020 7:50:35 PM ******/
DROP PROCEDURE [dbo].[PrintNamesTypes_Delete]
GO
/****** Object:  StoredProcedure [dbo].[PrintNamesTypes_CheckIfUsed]    Script Date: 1/30/2020 7:50:35 PM ******/
DROP PROCEDURE [dbo].[PrintNamesTypes_CheckIfUsed]
GO
/****** Object:  StoredProcedure [dbo].[Phot_ProductTypes_Update]    Script Date: 1/30/2020 7:50:35 PM ******/
DROP PROCEDURE [dbo].[Phot_ProductTypes_Update]
GO
/****** Object:  StoredProcedure [dbo].[Phot_ProductTypes_SelectByPK]    Script Date: 1/30/2020 7:50:35 PM ******/
DROP PROCEDURE [dbo].[Phot_ProductTypes_SelectByPK]
GO
/****** Object:  StoredProcedure [dbo].[Phot_ProductTypes_SelectByFilter]    Script Date: 1/30/2020 7:50:35 PM ******/
DROP PROCEDURE [dbo].[Phot_ProductTypes_SelectByFilter]
GO
/****** Object:  StoredProcedure [dbo].[Phot_ProductTypes_SelectByAll]    Script Date: 1/30/2020 7:50:35 PM ******/
DROP PROCEDURE [dbo].[Phot_ProductTypes_SelectByAll]
GO
/****** Object:  StoredProcedure [dbo].[Phot_ProductTypes_Insert]    Script Date: 1/30/2020 7:50:35 PM ******/
DROP PROCEDURE [dbo].[Phot_ProductTypes_Insert]
GO
/****** Object:  StoredProcedure [dbo].[Phot_ProductTypes_Delete]    Script Date: 1/30/2020 7:50:35 PM ******/
DROP PROCEDURE [dbo].[Phot_ProductTypes_Delete]
GO
/****** Object:  StoredProcedure [dbo].[Phot_ProductTypes_CheckIfUed]    Script Date: 1/30/2020 7:50:35 PM ******/
DROP PROCEDURE [dbo].[Phot_ProductTypes_CheckIfUed]
GO
/****** Object:  StoredProcedure [dbo].[Phot_ProductsOptionsItems_SelectByIds]    Script Date: 1/30/2020 7:50:35 PM ******/
DROP PROCEDURE [dbo].[Phot_ProductsOptionsItems_SelectByIds]
GO
/****** Object:  StoredProcedure [dbo].[Phot_ProductsOptions_Update]    Script Date: 1/30/2020 7:50:35 PM ******/
DROP PROCEDURE [dbo].[Phot_ProductsOptions_Update]
GO
/****** Object:  StoredProcedure [dbo].[Phot_ProductsOptions_SelectByProductId]    Script Date: 1/30/2020 7:50:35 PM ******/
DROP PROCEDURE [dbo].[Phot_ProductsOptions_SelectByProductId]
GO
/****** Object:  StoredProcedure [dbo].[Phot_ProductsOptions_Insert]    Script Date: 1/30/2020 7:50:35 PM ******/
DROP PROCEDURE [dbo].[Phot_ProductsOptions_Insert]
GO
/****** Object:  StoredProcedure [dbo].[Phot_ProductsOptions_Delete]    Script Date: 1/30/2020 7:50:35 PM ******/
DROP PROCEDURE [dbo].[Phot_ProductsOptions_Delete]
GO
/****** Object:  StoredProcedure [dbo].[Phot_ProductsOptionItems_Update]    Script Date: 1/30/2020 7:50:35 PM ******/
DROP PROCEDURE [dbo].[Phot_ProductsOptionItems_Update]
GO
/****** Object:  StoredProcedure [dbo].[Phot_ProductsOptionItems_Insert]    Script Date: 1/30/2020 7:50:35 PM ******/
DROP PROCEDURE [dbo].[Phot_ProductsOptionItems_Insert]
GO
/****** Object:  StoredProcedure [dbo].[Phot_ProductsOptionItems_CheckIfUsed]    Script Date: 1/30/2020 7:50:35 PM ******/
DROP PROCEDURE [dbo].[Phot_ProductsOptionItems_CheckIfUsed]
GO
/****** Object:  StoredProcedure [dbo].[Phot_Products_Update]    Script Date: 1/30/2020 7:50:35 PM ******/
DROP PROCEDURE [dbo].[Phot_Products_Update]
GO
/****** Object:  StoredProcedure [dbo].[Phot_Products_SelectByProductId]    Script Date: 1/30/2020 7:50:35 PM ******/
DROP PROCEDURE [dbo].[Phot_Products_SelectByProductId]
GO
/****** Object:  StoredProcedure [dbo].[Phot_Products_SelectByPK]    Script Date: 1/30/2020 7:50:35 PM ******/
DROP PROCEDURE [dbo].[Phot_Products_SelectByPK]
GO
/****** Object:  StoredProcedure [dbo].[Phot_Products_SelectByFilter]    Script Date: 1/30/2020 7:50:35 PM ******/
DROP PROCEDURE [dbo].[Phot_Products_SelectByFilter]
GO
/****** Object:  StoredProcedure [dbo].[Phot_Products_Insert]    Script Date: 1/30/2020 7:50:35 PM ******/
DROP PROCEDURE [dbo].[Phot_Products_Insert]
GO
/****** Object:  StoredProcedure [dbo].[Phot_Products_Images_Insert]    Script Date: 1/30/2020 7:50:35 PM ******/
DROP PROCEDURE [dbo].[Phot_Products_Images_Insert]
GO
/****** Object:  StoredProcedure [dbo].[Phot_Products_Delete]    Script Date: 1/30/2020 7:50:35 PM ******/
DROP PROCEDURE [dbo].[Phot_Products_Delete]
GO
/****** Object:  StoredProcedure [dbo].[Phot_Products_CheckIfUsed]    Script Date: 1/30/2020 7:50:35 PM ******/
DROP PROCEDURE [dbo].[Phot_Products_CheckIfUsed]
GO
/****** Object:  StoredProcedure [dbo].[Phot_Products_CheckIfActive]    Script Date: 1/30/2020 7:50:35 PM ******/
DROP PROCEDURE [dbo].[Phot_Products_CheckIfActive]
GO
/****** Object:  StoredProcedure [dbo].[Phot_OrdersOptions_Insert]    Script Date: 1/30/2020 7:50:35 PM ******/
DROP PROCEDURE [dbo].[Phot_OrdersOptions_Insert]
GO
/****** Object:  StoredProcedure [dbo].[Phot_OrderServicePrices_SelectByOrderId]    Script Date: 1/30/2020 7:50:35 PM ******/
DROP PROCEDURE [dbo].[Phot_OrderServicePrices_SelectByOrderId]
GO
/****** Object:  StoredProcedure [dbo].[Phot_OrderServicePrices_InsertCustom]    Script Date: 1/30/2020 7:50:35 PM ******/
DROP PROCEDURE [dbo].[Phot_OrderServicePrices_InsertCustom]
GO
/****** Object:  StoredProcedure [dbo].[Phot_OrderServicePrices_Insert]    Script Date: 1/30/2020 7:50:35 PM ******/
DROP PROCEDURE [dbo].[Phot_OrderServicePrices_Insert]
GO
/****** Object:  StoredProcedure [dbo].[Phot_Orders_UpdateDropboxFolderPath]    Script Date: 1/30/2020 7:50:35 PM ******/
DROP PROCEDURE [dbo].[Phot_Orders_UpdateDropboxFolderPath]
GO
/****** Object:  StoredProcedure [dbo].[Phot_Orders_SelectFullDetailsById]    Script Date: 1/30/2020 7:50:35 PM ******/
DROP PROCEDURE [dbo].[Phot_Orders_SelectFullDetailsById]
GO
/****** Object:  StoredProcedure [dbo].[Phot_Orders_SelectById]    Script Date: 1/30/2020 7:50:35 PM ******/
DROP PROCEDURE [dbo].[Phot_Orders_SelectById]
GO
/****** Object:  StoredProcedure [dbo].[Phot_Orders_SelectByFilterV2]    Script Date: 1/30/2020 7:50:35 PM ******/
DROP PROCEDURE [dbo].[Phot_Orders_SelectByFilterV2]
GO
/****** Object:  StoredProcedure [dbo].[Phot_Orders_SelectByFilter]    Script Date: 1/30/2020 7:50:35 PM ******/
DROP PROCEDURE [dbo].[Phot_Orders_SelectByFilter]
GO
/****** Object:  StoredProcedure [dbo].[Phot_Orders_Insert]    Script Date: 1/30/2020 7:50:35 PM ******/
DROP PROCEDURE [dbo].[Phot_Orders_Insert]
GO
/****** Object:  StoredProcedure [dbo].[Phot_Orders_CheckIfCancled]    Script Date: 1/30/2020 7:50:35 PM ******/
DROP PROCEDURE [dbo].[Phot_Orders_CheckIfCancled]
GO
/****** Object:  StoredProcedure [dbo].[Phot_Orders_Cancel]    Script Date: 1/30/2020 7:50:35 PM ******/
DROP PROCEDURE [dbo].[Phot_Orders_Cancel]
GO
/****** Object:  StoredProcedure [dbo].[Phot_OrderPayments_SelectByOrderId]    Script Date: 1/30/2020 7:50:35 PM ******/
DROP PROCEDURE [dbo].[Phot_OrderPayments_SelectByOrderId]
GO
/****** Object:  StoredProcedure [dbo].[Phot_OrderPayments_Insert]    Script Date: 1/30/2020 7:50:35 PM ******/
DROP PROCEDURE [dbo].[Phot_OrderPayments_Insert]
GO
/****** Object:  StoredProcedure [dbo].[Phot_OrderPayments_Accept]    Script Date: 1/30/2020 7:50:35 PM ******/
DROP PROCEDURE [dbo].[Phot_OrderPayments_Accept]
GO
/****** Object:  StoredProcedure [dbo].[Pages_SelectAllForUserCanBeAccess]    Script Date: 1/30/2020 7:50:35 PM ******/
DROP PROCEDURE [dbo].[Pages_SelectAllForUserCanBeAccess]
GO
/****** Object:  StoredProcedure [dbo].[Pages_SelectAllByUser_Id]    Script Date: 1/30/2020 7:50:35 PM ******/
DROP PROCEDURE [dbo].[Pages_SelectAllByUser_Id]
GO
/****** Object:  StoredProcedure [dbo].[Packages_Update]    Script Date: 1/30/2020 7:50:35 PM ******/
DROP PROCEDURE [dbo].[Packages_Update]
GO
/****** Object:  StoredProcedure [dbo].[Packages_SelectByPK]    Script Date: 1/30/2020 7:50:35 PM ******/
DROP PROCEDURE [dbo].[Packages_SelectByPK]
GO
/****** Object:  StoredProcedure [dbo].[Packages_SelectByPaging]    Script Date: 1/30/2020 7:50:35 PM ******/
DROP PROCEDURE [dbo].[Packages_SelectByPaging]
GO
/****** Object:  StoredProcedure [dbo].[Packages_SelectAll]    Script Date: 1/30/2020 7:50:35 PM ******/
DROP PROCEDURE [dbo].[Packages_SelectAll]
GO
/****** Object:  StoredProcedure [dbo].[Packages_Insert]    Script Date: 1/30/2020 7:50:35 PM ******/
DROP PROCEDURE [dbo].[Packages_Insert]
GO
/****** Object:  StoredProcedure [dbo].[Packages_Delete]    Script Date: 1/30/2020 7:50:35 PM ******/
DROP PROCEDURE [dbo].[Packages_Delete]
GO
/****** Object:  StoredProcedure [dbo].[PackageDetails_Insert]    Script Date: 1/30/2020 7:50:35 PM ******/
DROP PROCEDURE [dbo].[PackageDetails_Insert]
GO
/****** Object:  StoredProcedure [dbo].[PackageDetails_DeleteAllByPackageId]    Script Date: 1/30/2020 7:50:35 PM ******/
DROP PROCEDURE [dbo].[PackageDetails_DeleteAllByPackageId]
GO
/****** Object:  StoredProcedure [dbo].[PackageDetails_Delete]    Script Date: 1/30/2020 7:50:35 PM ******/
DROP PROCEDURE [dbo].[PackageDetails_Delete]
GO
/****** Object:  StoredProcedure [dbo].[Package_CheckIfUsed]    Script Date: 1/30/2020 7:50:35 PM ******/
DROP PROCEDURE [dbo].[Package_CheckIfUsed]
GO
/****** Object:  StoredProcedure [dbo].[NotificationsUser_Read]    Script Date: 1/30/2020 7:50:35 PM ******/
DROP PROCEDURE [dbo].[NotificationsUser_Read]
GO
/****** Object:  StoredProcedure [dbo].[NotificationsUser_Insert]    Script Date: 1/30/2020 7:50:35 PM ******/
DROP PROCEDURE [dbo].[NotificationsUser_Insert]
GO
/****** Object:  StoredProcedure [dbo].[Notifications_SelectByFilter]    Script Date: 1/30/2020 7:50:35 PM ******/
DROP PROCEDURE [dbo].[Notifications_SelectByFilter]
GO
/****** Object:  StoredProcedure [dbo].[Notifications_Insert]    Script Date: 1/30/2020 7:50:35 PM ******/
DROP PROCEDURE [dbo].[Notifications_Insert]
GO
/****** Object:  StoredProcedure [dbo].[Menus_SelectAllForUserCanBeAccess]    Script Date: 1/30/2020 7:50:35 PM ******/
DROP PROCEDURE [dbo].[Menus_SelectAllForUserCanBeAccess]
GO
/****** Object:  StoredProcedure [dbo].[Menus_SelectAllByUser_Id]    Script Date: 1/30/2020 7:50:35 PM ******/
DROP PROCEDURE [dbo].[Menus_SelectAllByUser_Id]
GO
/****** Object:  StoredProcedure [dbo].[Menus_SelectAll]    Script Date: 1/30/2020 7:50:35 PM ******/
DROP PROCEDURE [dbo].[Menus_SelectAll]
GO
/****** Object:  StoredProcedure [dbo].[FilesReceivedTypes_Update]    Script Date: 1/30/2020 7:50:35 PM ******/
DROP PROCEDURE [dbo].[FilesReceivedTypes_Update]
GO
/****** Object:  StoredProcedure [dbo].[FilesReceivedTypes_SelectByFilter]    Script Date: 1/30/2020 7:50:35 PM ******/
DROP PROCEDURE [dbo].[FilesReceivedTypes_SelectByFilter]
GO
/****** Object:  StoredProcedure [dbo].[FilesReceivedTypes_SelectAll]    Script Date: 1/30/2020 7:50:35 PM ******/
DROP PROCEDURE [dbo].[FilesReceivedTypes_SelectAll]
GO
/****** Object:  StoredProcedure [dbo].[FilesReceivedTypes_Insert]    Script Date: 1/30/2020 7:50:35 PM ******/
DROP PROCEDURE [dbo].[FilesReceivedTypes_Insert]
GO
/****** Object:  StoredProcedure [dbo].[FilesReceivedTypes_Delete]    Script Date: 1/30/2020 7:50:35 PM ******/
DROP PROCEDURE [dbo].[FilesReceivedTypes_Delete]
GO
/****** Object:  StoredProcedure [dbo].[FilesReceivedTypes_CheckIfUsed]    Script Date: 1/30/2020 7:50:35 PM ******/
DROP PROCEDURE [dbo].[FilesReceivedTypes_CheckIfUsed]
GO
/****** Object:  StoredProcedure [dbo].[EventTaskStatusIsFinshed_Update]    Script Date: 1/30/2020 7:50:35 PM ******/
DROP PROCEDURE [dbo].[EventTaskStatusIsFinshed_Update]
GO
/****** Object:  StoredProcedure [dbo].[EventTaskStatusIsFinsed_CheckIfFinshed]    Script Date: 1/30/2020 7:50:35 PM ******/
DROP PROCEDURE [dbo].[EventTaskStatusIsFinsed_CheckIfFinshed]
GO
/****** Object:  StoredProcedure [dbo].[EventTaskStatusHistories_SelectLast]    Script Date: 1/30/2020 7:50:35 PM ******/
DROP PROCEDURE [dbo].[EventTaskStatusHistories_SelectLast]
GO
/****** Object:  StoredProcedure [dbo].[EventTaskStatusHistories_SelectByEventId]    Script Date: 1/30/2020 7:50:35 PM ******/
DROP PROCEDURE [dbo].[EventTaskStatusHistories_SelectByEventId]
GO
/****** Object:  StoredProcedure [dbo].[EventTaskStatusHistories_Insert]    Script Date: 1/30/2020 7:50:35 PM ******/
DROP PROCEDURE [dbo].[EventTaskStatusHistories_Insert]
GO
/****** Object:  StoredProcedure [dbo].[EventTaskStatusHistories_CheckIfTaskFinshedWithBranch]    Script Date: 1/30/2020 7:50:35 PM ******/
DROP PROCEDURE [dbo].[EventTaskStatusHistories_CheckIfTaskFinshedWithBranch]
GO
/****** Object:  StoredProcedure [dbo].[EventSurveyQuestionTypes_Update]    Script Date: 1/30/2020 7:50:35 PM ******/
DROP PROCEDURE [dbo].[EventSurveyQuestionTypes_Update]
GO
/****** Object:  StoredProcedure [dbo].[EventSurveyQuestionTypes_SelectByFilter]    Script Date: 1/30/2020 7:50:35 PM ******/
DROP PROCEDURE [dbo].[EventSurveyQuestionTypes_SelectByFilter]
GO
/****** Object:  StoredProcedure [dbo].[EventSurveyQuestionTypes_SelectAll]    Script Date: 1/30/2020 7:50:35 PM ******/
DROP PROCEDURE [dbo].[EventSurveyQuestionTypes_SelectAll]
GO
/****** Object:  StoredProcedure [dbo].[EventSurveyQuestionTypes_Insert]    Script Date: 1/30/2020 7:50:35 PM ******/
DROP PROCEDURE [dbo].[EventSurveyQuestionTypes_Insert]
GO
/****** Object:  StoredProcedure [dbo].[EventSurveyQuestionTypes_Delete]    Script Date: 1/30/2020 7:50:35 PM ******/
DROP PROCEDURE [dbo].[EventSurveyQuestionTypes_Delete]
GO
/****** Object:  StoredProcedure [dbo].[EventSurveyQuestionTypes_CheckIfUsed]    Script Date: 1/30/2020 7:50:35 PM ******/
DROP PROCEDURE [dbo].[EventSurveyQuestionTypes_CheckIfUsed]
GO
/****** Object:  StoredProcedure [dbo].[EventSurveyQuestions_WithEvent]    Script Date: 1/30/2020 7:50:35 PM ******/
DROP PROCEDURE [dbo].[EventSurveyQuestions_WithEvent]
GO
/****** Object:  StoredProcedure [dbo].[EventSurveyQuestions_Update]    Script Date: 1/30/2020 7:50:35 PM ******/
DROP PROCEDURE [dbo].[EventSurveyQuestions_Update]
GO
/****** Object:  StoredProcedure [dbo].[EventSurveyQuestions_SelectDefault]    Script Date: 1/30/2020 7:50:35 PM ******/
DROP PROCEDURE [dbo].[EventSurveyQuestions_SelectDefault]
GO
/****** Object:  StoredProcedure [dbo].[EventSurveyQuestions_SelectByEventId]    Script Date: 1/30/2020 7:50:35 PM ******/
DROP PROCEDURE [dbo].[EventSurveyQuestions_SelectByEventId]
GO
/****** Object:  StoredProcedure [dbo].[EventSurveyQuestions_SelectAll]    Script Date: 1/30/2020 7:50:35 PM ******/
DROP PROCEDURE [dbo].[EventSurveyQuestions_SelectAll]
GO
/****** Object:  StoredProcedure [dbo].[EventSurveyQuestions_RemoveByEventId]    Script Date: 1/30/2020 7:50:35 PM ******/
DROP PROCEDURE [dbo].[EventSurveyQuestions_RemoveByEventId]
GO
/****** Object:  StoredProcedure [dbo].[EventSurveyQuestions_Insert]    Script Date: 1/30/2020 7:50:35 PM ******/
DROP PROCEDURE [dbo].[EventSurveyQuestions_Insert]
GO
/****** Object:  StoredProcedure [dbo].[EventSurveyQuestions_Delete]    Script Date: 1/30/2020 7:50:35 PM ******/
DROP PROCEDURE [dbo].[EventSurveyQuestions_Delete]
GO
/****** Object:  StoredProcedure [dbo].[EventSurveyQuestions_CheckIfUsed]    Script Date: 1/30/2020 7:50:35 PM ******/
DROP PROCEDURE [dbo].[EventSurveyQuestions_CheckIfUsed]
GO
/****** Object:  StoredProcedure [dbo].[EventSurveyQuestions_CheckIfInserted]    Script Date: 1/30/2020 7:50:35 PM ******/
DROP PROCEDURE [dbo].[EventSurveyQuestions_CheckIfInserted]
GO
/****** Object:  StoredProcedure [dbo].[EventSurveyQuestionAnswerer_Insert]    Script Date: 1/30/2020 7:50:35 PM ******/
DROP PROCEDURE [dbo].[EventSurveyQuestionAnswerer_Insert]
GO
/****** Object:  StoredProcedure [dbo].[EventSurveyQuestionAnswerer_DeleteByEventSurveyId]    Script Date: 1/30/2020 7:50:35 PM ******/
DROP PROCEDURE [dbo].[EventSurveyQuestionAnswerer_DeleteByEventSurveyId]
GO
/****** Object:  StoredProcedure [dbo].[EventSurvey_CheckIfIsInserted]    Script Date: 1/30/2020 7:50:35 PM ******/
DROP PROCEDURE [dbo].[EventSurvey_CheckIfIsInserted]
GO
/****** Object:  StoredProcedure [dbo].[EventSurveies_SelectByPK]    Script Date: 1/30/2020 7:50:35 PM ******/
DROP PROCEDURE [dbo].[EventSurveies_SelectByPK]
GO
/****** Object:  StoredProcedure [dbo].[EventSurveies_Insert_DeleteByEventId]    Script Date: 1/30/2020 7:50:35 PM ******/
DROP PROCEDURE [dbo].[EventSurveies_Insert_DeleteByEventId]
GO
/****** Object:  StoredProcedure [dbo].[EventSurveies_Insert]    Script Date: 1/30/2020 7:50:35 PM ******/
DROP PROCEDURE [dbo].[EventSurveies_Insert]
GO
/****** Object:  StoredProcedure [dbo].[EventSurveies_DeleteByEventId]    Script Date: 1/30/2020 7:50:35 PM ******/
DROP PROCEDURE [dbo].[EventSurveies_DeleteByEventId]
GO
/****** Object:  StoredProcedure [dbo].[EventSurveies_ChartByYear]    Script Date: 1/30/2020 7:50:35 PM ******/
DROP PROCEDURE [dbo].[EventSurveies_ChartByYear]
GO
/****** Object:  StoredProcedure [dbo].[Events_UpdateCalendarEventId]    Script Date: 1/30/2020 7:50:35 PM ******/
DROP PROCEDURE [dbo].[Events_UpdateCalendarEventId]
GO
/****** Object:  StoredProcedure [dbo].[Events_Update2]    Script Date: 1/30/2020 7:50:35 PM ******/
DROP PROCEDURE [dbo].[Events_Update2]
GO
/****** Object:  StoredProcedure [dbo].[Events_Update]    Script Date: 1/30/2020 7:50:35 PM ******/
DROP PROCEDURE [dbo].[Events_Update]
GO
/****** Object:  StoredProcedure [dbo].[Events_SelectInformation]    Script Date: 1/30/2020 7:50:35 PM ******/
DROP PROCEDURE [dbo].[Events_SelectInformation]
GO
/****** Object:  StoredProcedure [dbo].[Events_SelectByPK]    Script Date: 1/30/2020 7:50:35 PM ******/
DROP PROCEDURE [dbo].[Events_SelectByPK]
GO
/****** Object:  StoredProcedure [dbo].[Events_SelectByFilterForEmployee]    Script Date: 1/30/2020 7:50:35 PM ******/
DROP PROCEDURE [dbo].[Events_SelectByFilterForEmployee]
GO
/****** Object:  StoredProcedure [dbo].[Events_SelectByFilter]    Script Date: 1/30/2020 7:50:35 PM ******/
DROP PROCEDURE [dbo].[Events_SelectByFilter]
GO
/****** Object:  StoredProcedure [dbo].[Events_Insert]    Script Date: 1/30/2020 7:50:35 PM ******/
DROP PROCEDURE [dbo].[Events_Insert]
GO
/****** Object:  StoredProcedure [dbo].[Events_CountsByYear]    Script Date: 1/30/2020 7:50:35 PM ******/
DROP PROCEDURE [dbo].[Events_CountsByYear]
GO
/****** Object:  StoredProcedure [dbo].[Events_CheckFromDateEventIsFinshedBranchId]    Script Date: 1/30/2020 7:50:35 PM ******/
DROP PROCEDURE [dbo].[Events_CheckFromDateEventIsFinshedBranchId]
GO
/****** Object:  StoredProcedure [dbo].[Events_CheckFromDateEventIsFinshed]    Script Date: 1/30/2020 7:50:35 PM ******/
DROP PROCEDURE [dbo].[Events_CheckFromDateEventIsFinshed]
GO
/****** Object:  StoredProcedure [dbo].[EventPhotographers_SelectEventsByFilter]    Script Date: 1/30/2020 7:50:35 PM ******/
DROP PROCEDURE [dbo].[EventPhotographers_SelectEventsByFilter]
GO
/****** Object:  StoredProcedure [dbo].[EventPhotographers_SelectAllUsers]    Script Date: 1/30/2020 7:50:35 PM ******/
DROP PROCEDURE [dbo].[EventPhotographers_SelectAllUsers]
GO
/****** Object:  StoredProcedure [dbo].[EventPhotographers_SelectAllByEventId]    Script Date: 1/30/2020 7:50:35 PM ******/
DROP PROCEDURE [dbo].[EventPhotographers_SelectAllByEventId]
GO
/****** Object:  StoredProcedure [dbo].[EventPhotographers_SelectAll]    Script Date: 1/30/2020 7:50:35 PM ******/
DROP PROCEDURE [dbo].[EventPhotographers_SelectAll]
GO
/****** Object:  StoredProcedure [dbo].[EventPhotographers_Insert]    Script Date: 1/30/2020 7:50:35 PM ******/
DROP PROCEDURE [dbo].[EventPhotographers_Insert]
GO
/****** Object:  StoredProcedure [dbo].[EventPhotographers_Delete]    Script Date: 1/30/2020 7:50:35 PM ******/
DROP PROCEDURE [dbo].[EventPhotographers_Delete]
GO
/****** Object:  StoredProcedure [dbo].[EventPhotographers_CheckCanBeAccess]    Script Date: 1/30/2020 7:50:35 PM ******/
DROP PROCEDURE [dbo].[EventPhotographers_CheckCanBeAccess]
GO
/****** Object:  StoredProcedure [dbo].[EventCoordinations_SelectTasksNumber]    Script Date: 1/30/2020 7:50:35 PM ******/
DROP PROCEDURE [dbo].[EventCoordinations_SelectTasksNumber]
GO
/****** Object:  StoredProcedure [dbo].[EventCoordinations_SelectByEventId]    Script Date: 1/30/2020 7:50:35 PM ******/
DROP PROCEDURE [dbo].[EventCoordinations_SelectByEventId]
GO
/****** Object:  StoredProcedure [dbo].[EventCoordinations_Insert]    Script Date: 1/30/2020 7:50:35 PM ******/
DROP PROCEDURE [dbo].[EventCoordinations_Insert]
GO
/****** Object:  StoredProcedure [dbo].[EventCoordinations_Delete]    Script Date: 1/30/2020 7:50:35 PM ******/
DROP PROCEDURE [dbo].[EventCoordinations_Delete]
GO
/****** Object:  StoredProcedure [dbo].[EventArchivesDetails_Inserrt]    Script Date: 1/30/2020 7:50:35 PM ******/
DROP PROCEDURE [dbo].[EventArchivesDetails_Inserrt]
GO
/****** Object:  StoredProcedure [dbo].[EventArchivesDetails_Delete]    Script Date: 1/30/2020 7:50:35 PM ******/
DROP PROCEDURE [dbo].[EventArchivesDetails_Delete]
GO
/****** Object:  StoredProcedure [dbo].[EventArchives_Update]    Script Date: 1/30/2020 7:50:35 PM ******/
DROP PROCEDURE [dbo].[EventArchives_Update]
GO
/****** Object:  StoredProcedure [dbo].[EventArchives_SelectAll]    Script Date: 1/30/2020 7:50:35 PM ******/
DROP PROCEDURE [dbo].[EventArchives_SelectAll]
GO
/****** Object:  StoredProcedure [dbo].[EventArchives_Insert]    Script Date: 1/30/2020 7:50:35 PM ******/
DROP PROCEDURE [dbo].[EventArchives_Insert]
GO
/****** Object:  StoredProcedure [dbo].[EnquiryTypes_Update]    Script Date: 1/30/2020 7:50:35 PM ******/
DROP PROCEDURE [dbo].[EnquiryTypes_Update]
GO
/****** Object:  StoredProcedure [dbo].[EnquiryTypes_SelectByFilter]    Script Date: 1/30/2020 7:50:35 PM ******/
DROP PROCEDURE [dbo].[EnquiryTypes_SelectByFilter]
GO
/****** Object:  StoredProcedure [dbo].[EnquiryTypes_SelectAll]    Script Date: 1/30/2020 7:50:35 PM ******/
DROP PROCEDURE [dbo].[EnquiryTypes_SelectAll]
GO
/****** Object:  StoredProcedure [dbo].[EnquiryTypes_Insert]    Script Date: 1/30/2020 7:50:35 PM ******/
DROP PROCEDURE [dbo].[EnquiryTypes_Insert]
GO
/****** Object:  StoredProcedure [dbo].[EnquiryTypes_Delete]    Script Date: 1/30/2020 7:50:35 PM ******/
DROP PROCEDURE [dbo].[EnquiryTypes_Delete]
GO
/****** Object:  StoredProcedure [dbo].[EnquiryTypes_CheckIfUsed]    Script Date: 1/30/2020 7:50:35 PM ******/
DROP PROCEDURE [dbo].[EnquiryTypes_CheckIfUsed]
GO
/****** Object:  StoredProcedure [dbo].[EnquiryStatusTypes_SelectByPK]    Script Date: 1/30/2020 7:50:35 PM ******/
DROP PROCEDURE [dbo].[EnquiryStatusTypes_SelectByPK]
GO
/****** Object:  StoredProcedure [dbo].[EnquiryStatus_Update]    Script Date: 1/30/2020 7:50:35 PM ******/
DROP PROCEDURE [dbo].[EnquiryStatus_Update]
GO
/****** Object:  StoredProcedure [dbo].[EnquiryStatus_SelectByFilter]    Script Date: 1/30/2020 7:50:35 PM ******/
DROP PROCEDURE [dbo].[EnquiryStatus_SelectByFilter]
GO
/****** Object:  StoredProcedure [dbo].[EnquiryStatus_SelectByEnquiryId]    Script Date: 1/30/2020 7:50:35 PM ******/
DROP PROCEDURE [dbo].[EnquiryStatus_SelectByEnquiryId]
GO
/****** Object:  StoredProcedure [dbo].[EnquiryStatus_ResetClendersIdsToNull]    Script Date: 1/30/2020 7:50:35 PM ******/
DROP PROCEDURE [dbo].[EnquiryStatus_ResetClendersIdsToNull]
GO
/****** Object:  StoredProcedure [dbo].[EnquiryStatus_Insert]    Script Date: 1/30/2020 7:50:35 PM ******/
DROP PROCEDURE [dbo].[EnquiryStatus_Insert]
GO
/****** Object:  StoredProcedure [dbo].[EnquiryPayments_SelectByEnquiryId]    Script Date: 1/30/2020 7:50:35 PM ******/
DROP PROCEDURE [dbo].[EnquiryPayments_SelectByEnquiryId]
GO
/****** Object:  StoredProcedure [dbo].[EnquiryPayments_Insert]    Script Date: 1/30/2020 7:50:35 PM ******/
DROP PROCEDURE [dbo].[EnquiryPayments_Insert]
GO
/****** Object:  StoredProcedure [dbo].[EnquiryPayments_CheckIfPaymentedDeposit]    Script Date: 1/30/2020 7:50:35 PM ******/
DROP PROCEDURE [dbo].[EnquiryPayments_CheckIfPaymentedDeposit]
GO
/****** Object:  StoredProcedure [dbo].[EnquiryPayments_AcceptFromManger]    Script Date: 1/30/2020 7:50:35 PM ******/
DROP PROCEDURE [dbo].[EnquiryPayments_AcceptFromManger]
GO
/****** Object:  StoredProcedure [dbo].[Enquiries_ChangeCreateEventState]    Script Date: 1/30/2020 7:50:35 PM ******/
DROP PROCEDURE [dbo].[Enquiries_ChangeCreateEventState]
GO
/****** Object:  StoredProcedure [dbo].[Enquires_Update]    Script Date: 1/30/2020 7:50:35 PM ******/
DROP PROCEDURE [dbo].[Enquires_Update]
GO
/****** Object:  StoredProcedure [dbo].[Enquires_SelectByPk_SimpleData]    Script Date: 1/30/2020 7:50:35 PM ******/
DROP PROCEDURE [dbo].[Enquires_SelectByPk_SimpleData]
GO
/****** Object:  StoredProcedure [dbo].[Enquires_SelectByPk]    Script Date: 1/30/2020 7:50:35 PM ******/
DROP PROCEDURE [dbo].[Enquires_SelectByPk]
GO
/****** Object:  StoredProcedure [dbo].[Enquires_SelectByFilter]    Script Date: 1/30/2020 7:50:35 PM ******/
DROP PROCEDURE [dbo].[Enquires_SelectByFilter]
GO
/****** Object:  StoredProcedure [dbo].[Enquires_IsClosed]    Script Date: 1/30/2020 7:50:35 PM ******/
DROP PROCEDURE [dbo].[Enquires_IsClosed]
GO
/****** Object:  StoredProcedure [dbo].[Enquires_Insert]    Script Date: 1/30/2020 7:50:35 PM ******/
DROP PROCEDURE [dbo].[Enquires_Insert]
GO
/****** Object:  StoredProcedure [dbo].[Enquires_Delete]    Script Date: 1/30/2020 7:50:35 PM ******/
DROP PROCEDURE [dbo].[Enquires_Delete]
GO
/****** Object:  StoredProcedure [dbo].[Enquires_Closed]    Script Date: 1/30/2020 7:50:35 PM ******/
DROP PROCEDURE [dbo].[Enquires_Closed]
GO
/****** Object:  StoredProcedure [dbo].[Enquires_CheckIfWithBranch]    Script Date: 1/30/2020 7:50:35 PM ******/
DROP PROCEDURE [dbo].[Enquires_CheckIfWithBranch]
GO
/****** Object:  StoredProcedure [dbo].[Enquires_CheckIfCreatedEvent]    Script Date: 1/30/2020 7:50:35 PM ******/
DROP PROCEDURE [dbo].[Enquires_CheckIfCreatedEvent]
GO
/****** Object:  StoredProcedure [dbo].[Enquires_CheckFromOwner]    Script Date: 1/30/2020 7:50:35 PM ******/
DROP PROCEDURE [dbo].[Enquires_CheckFromOwner]
GO
/****** Object:  StoredProcedure [dbo].[EmployeesWorks_SelectByUserId]    Script Date: 1/30/2020 7:50:35 PM ******/
DROP PROCEDURE [dbo].[EmployeesWorks_SelectByUserId]
GO
/****** Object:  StoredProcedure [dbo].[EmployeesWorks_Insert]    Script Date: 1/30/2020 7:50:35 PM ******/
DROP PROCEDURE [dbo].[EmployeesWorks_Insert]
GO
/****** Object:  StoredProcedure [dbo].[EmployeesWorks_Delete]    Script Date: 1/30/2020 7:50:35 PM ******/
DROP PROCEDURE [dbo].[EmployeesWorks_Delete]
GO
/****** Object:  StoredProcedure [dbo].[EmployeesWorks_CheckIfInserted]    Script Date: 1/30/2020 7:50:35 PM ******/
DROP PROCEDURE [dbo].[EmployeesWorks_CheckIfInserted]
GO
/****** Object:  StoredProcedure [dbo].[Employees_SelectWorks]    Script Date: 1/30/2020 7:50:35 PM ******/
DROP PROCEDURE [dbo].[Employees_SelectWorks]
GO
/****** Object:  StoredProcedure [dbo].[Employees_CheckAllowAccessToEventForUpdateWorks]    Script Date: 1/30/2020 7:50:35 PM ******/
DROP PROCEDURE [dbo].[Employees_CheckAllowAccessToEventForUpdateWorks]
GO
/****** Object:  StoredProcedure [dbo].[EmployeeDistributionTasks_SelectByEventId]    Script Date: 1/30/2020 7:50:35 PM ******/
DROP PROCEDURE [dbo].[EmployeeDistributionTasks_SelectByEventId]
GO
/****** Object:  StoredProcedure [dbo].[EmployeeDistributionTasks_Insert]    Script Date: 1/30/2020 7:50:35 PM ******/
DROP PROCEDURE [dbo].[EmployeeDistributionTasks_Insert]
GO
/****** Object:  StoredProcedure [dbo].[EmployeeDistributionTasks_Delete]    Script Date: 1/30/2020 7:50:35 PM ******/
DROP PROCEDURE [dbo].[EmployeeDistributionTasks_Delete]
GO
/****** Object:  StoredProcedure [dbo].[EmployeeDistributionTasks_CheckIfInserted]    Script Date: 1/30/2020 7:50:35 PM ******/
DROP PROCEDURE [dbo].[EmployeeDistributionTasks_CheckIfInserted]
GO
/****** Object:  StoredProcedure [dbo].[CRM_EventTaskStatusHistories]    Script Date: 1/30/2020 7:50:35 PM ******/
DROP PROCEDURE [dbo].[CRM_EventTaskStatusHistories]
GO
/****** Object:  StoredProcedure [dbo].[CRM_EnquiryStatus]    Script Date: 1/30/2020 7:50:35 PM ******/
DROP PROCEDURE [dbo].[CRM_EnquiryStatus]
GO
/****** Object:  StoredProcedure [dbo].[CRM_EnquiryPayments]    Script Date: 1/30/2020 7:50:35 PM ******/
DROP PROCEDURE [dbo].[CRM_EnquiryPayments]
GO
/****** Object:  StoredProcedure [dbo].[Countries_Update]    Script Date: 1/30/2020 7:50:35 PM ******/
DROP PROCEDURE [dbo].[Countries_Update]
GO
/****** Object:  StoredProcedure [dbo].[Countries_SelectWithCitiesByPk]    Script Date: 1/30/2020 7:50:35 PM ******/
DROP PROCEDURE [dbo].[Countries_SelectWithCitiesByPk]
GO
/****** Object:  StoredProcedure [dbo].[Countries_SelectByFilter]    Script Date: 1/30/2020 7:50:35 PM ******/
DROP PROCEDURE [dbo].[Countries_SelectByFilter]
GO
/****** Object:  StoredProcedure [dbo].[Countries_SelectAll]    Script Date: 1/30/2020 7:50:35 PM ******/
DROP PROCEDURE [dbo].[Countries_SelectAll]
GO
/****** Object:  StoredProcedure [dbo].[Countries_IsoCodeBeforUsed]    Script Date: 1/30/2020 7:50:35 PM ******/
DROP PROCEDURE [dbo].[Countries_IsoCodeBeforUsed]
GO
/****** Object:  StoredProcedure [dbo].[Countries_Insert]    Script Date: 1/30/2020 7:50:35 PM ******/
DROP PROCEDURE [dbo].[Countries_Insert]
GO
/****** Object:  StoredProcedure [dbo].[Countries_Delete]    Script Date: 1/30/2020 7:50:35 PM ******/
DROP PROCEDURE [dbo].[Countries_Delete]
GO
/****** Object:  StoredProcedure [dbo].[Countries_CheckIfUsed]    Script Date: 1/30/2020 7:50:35 PM ******/
DROP PROCEDURE [dbo].[Countries_CheckIfUsed]
GO
/****** Object:  StoredProcedure [dbo].[Cities_UpdatePrices]    Script Date: 1/30/2020 7:50:35 PM ******/
DROP PROCEDURE [dbo].[Cities_UpdatePrices]
GO
/****** Object:  StoredProcedure [dbo].[Cities_Update]    Script Date: 1/30/2020 7:50:35 PM ******/
DROP PROCEDURE [dbo].[Cities_Update]
GO
/****** Object:  StoredProcedure [dbo].[Cities_SelectById]    Script Date: 1/30/2020 7:50:35 PM ******/
DROP PROCEDURE [dbo].[Cities_SelectById]
GO
/****** Object:  StoredProcedure [dbo].[Cities_SelectByFilter]    Script Date: 1/30/2020 7:50:35 PM ******/
DROP PROCEDURE [dbo].[Cities_SelectByFilter]
GO
/****** Object:  StoredProcedure [dbo].[Cities_SelectAll]    Script Date: 1/30/2020 7:50:35 PM ******/
DROP PROCEDURE [dbo].[Cities_SelectAll]
GO
/****** Object:  StoredProcedure [dbo].[Cities_Insert]    Script Date: 1/30/2020 7:50:35 PM ******/
DROP PROCEDURE [dbo].[Cities_Insert]
GO
/****** Object:  StoredProcedure [dbo].[Cities_Delete]    Script Date: 1/30/2020 7:50:35 PM ******/
DROP PROCEDURE [dbo].[Cities_Delete]
GO
/****** Object:  StoredProcedure [dbo].[Cities_CheckIfUsed]    Script Date: 1/30/2020 7:50:35 PM ******/
DROP PROCEDURE [dbo].[Cities_CheckIfUsed]
GO
/****** Object:  StoredProcedure [dbo].[Branches_Update]    Script Date: 1/30/2020 7:50:35 PM ******/
DROP PROCEDURE [dbo].[Branches_Update]
GO
/****** Object:  StoredProcedure [dbo].[Branches_SelectByPk]    Script Date: 1/30/2020 7:50:35 PM ******/
DROP PROCEDURE [dbo].[Branches_SelectByPk]
GO
/****** Object:  StoredProcedure [dbo].[Branches_SelectByFilter]    Script Date: 1/30/2020 7:50:35 PM ******/
DROP PROCEDURE [dbo].[Branches_SelectByFilter]
GO
/****** Object:  StoredProcedure [dbo].[Branches_SelectByAll]    Script Date: 1/30/2020 7:50:35 PM ******/
DROP PROCEDURE [dbo].[Branches_SelectByAll]
GO
/****** Object:  StoredProcedure [dbo].[Branches_Insert]    Script Date: 1/30/2020 7:50:35 PM ******/
DROP PROCEDURE [dbo].[Branches_Insert]
GO
/****** Object:  StoredProcedure [dbo].[Branches_Delete]    Script Date: 1/30/2020 7:50:35 PM ******/
DROP PROCEDURE [dbo].[Branches_Delete]
GO
/****** Object:  StoredProcedure [dbo].[Branches_CheckIsBasicBranch]    Script Date: 1/30/2020 7:50:35 PM ******/
DROP PROCEDURE [dbo].[Branches_CheckIsBasicBranch]
GO
/****** Object:  StoredProcedure [dbo].[Branches_CheckIfUsed]    Script Date: 1/30/2020 7:50:35 PM ******/
DROP PROCEDURE [dbo].[Branches_CheckIfUsed]
GO
/****** Object:  StoredProcedure [dbo].[Albums_Update]    Script Date: 1/30/2020 7:50:35 PM ******/
DROP PROCEDURE [dbo].[Albums_Update]
GO
/****** Object:  StoredProcedure [dbo].[Albums_SelectByPk]    Script Date: 1/30/2020 7:50:35 PM ******/
DROP PROCEDURE [dbo].[Albums_SelectByPk]
GO
/****** Object:  StoredProcedure [dbo].[Albums_SelectByFilter]    Script Date: 1/30/2020 7:50:35 PM ******/
DROP PROCEDURE [dbo].[Albums_SelectByFilter]
GO
/****** Object:  StoredProcedure [dbo].[Albums_SelectAll]    Script Date: 1/30/2020 7:50:35 PM ******/
DROP PROCEDURE [dbo].[Albums_SelectAll]
GO
/****** Object:  StoredProcedure [dbo].[Albums_Insert]    Script Date: 1/30/2020 7:50:35 PM ******/
DROP PROCEDURE [dbo].[Albums_Insert]
GO
/****** Object:  StoredProcedure [dbo].[Albums_Delete]    Script Date: 1/30/2020 7:50:35 PM ******/
DROP PROCEDURE [dbo].[Albums_Delete]
GO
/****** Object:  StoredProcedure [dbo].[Albums_CheckIfUsed]    Script Date: 1/30/2020 7:50:35 PM ******/
DROP PROCEDURE [dbo].[Albums_CheckIfUsed]
GO
/****** Object:  StoredProcedure [dbo].[.Phot_ProductsOptions_CheckIfUsed]    Script Date: 1/30/2020 7:50:35 PM ******/
DROP PROCEDURE [dbo].[.Phot_ProductsOptions_CheckIfUsed]
GO
ALTER TABLE [dbo].[WorkTypes] DROP CONSTRAINT [FK_WorkTypes_Words]
GO
ALTER TABLE [dbo].[UserSocialAccounts] DROP CONSTRAINT [FK_UserSocialAccounts_Users]
GO
ALTER TABLE [dbo].[Users] DROP CONSTRAINT [FK_Users_Languages]
GO
ALTER TABLE [dbo].[Users] DROP CONSTRAINT [FK_Users_Countries]
GO
ALTER TABLE [dbo].[Users] DROP CONSTRAINT [FK_Users_Cities]
GO
ALTER TABLE [dbo].[Users] DROP CONSTRAINT [FK_Users_Branches]
GO
ALTER TABLE [dbo].[Users] DROP CONSTRAINT [FK_Users_AccountTypes]
GO
ALTER TABLE [dbo].[UserPrivileges] DROP CONSTRAINT [FK_UserPrivileges_Users]
GO
ALTER TABLE [dbo].[UserPrivileges] DROP CONSTRAINT [FK_UserPrivileges_Pages]
GO
ALTER TABLE [dbo].[StaticFields] DROP CONSTRAINT [FK_PackageInputTypes_Words]
GO
ALTER TABLE [dbo].[SocialAccountTypes] DROP CONSTRAINT [FK_SocialAccounts_Words]
GO
ALTER TABLE [dbo].[PrintNamesTypes] DROP CONSTRAINT [FK_PrintNamesTypes_Words]
GO
ALTER TABLE [dbo].[Phot_ProductTypes] DROP CONSTRAINT [FK_Phot_ProductTypes_Words]
GO
ALTER TABLE [dbo].[Phot_ProductsOptionsItems] DROP CONSTRAINT [FK_Phot_ProductsOptionsItems_Words]
GO
ALTER TABLE [dbo].[Phot_ProductsOptionsItems] DROP CONSTRAINT [FK_Phot_ProductsOptionsItems_Phot_ProductsOptions]
GO
ALTER TABLE [dbo].[Phot_ProductsOptions] DROP CONSTRAINT [FK_Phot_ProductsOptions_StaticFields]
GO
ALTER TABLE [dbo].[Phot_ProductsOptions] DROP CONSTRAINT [FK_Phot_ProductsOptions_Phot_Products]
GO
ALTER TABLE [dbo].[Phot_Products_Images] DROP CONSTRAINT [FK_Phot_Products_Images_Phot_Products]
GO
ALTER TABLE [dbo].[Phot_Products] DROP CONSTRAINT [FK_Phot_Products_Phot_ProductTypes]
GO
ALTER TABLE [dbo].[Phot_OrdersOptions] DROP CONSTRAINT [FK_OrdersphotographerOptions_Phot_ProductsOptionsItems]
GO
ALTER TABLE [dbo].[Phot_OrdersOptions] DROP CONSTRAINT [FK_OrdersphotographerOptions_Phot_ProductsOptions]
GO
ALTER TABLE [dbo].[Phot_OrdersOptions] DROP CONSTRAINT [FK_OrdersphotographerOptions_Ordersphotographer]
GO
ALTER TABLE [dbo].[Phot_Orders] DROP CONSTRAINT [FK_Phot_Orders_Countries]
GO
ALTER TABLE [dbo].[Phot_Orders] DROP CONSTRAINT [FK_Phot_Orders_Cities]
GO
ALTER TABLE [dbo].[Phot_Orders] DROP CONSTRAINT [FK_Ordersphotographer_Users]
GO
ALTER TABLE [dbo].[Phot_Orders] DROP CONSTRAINT [FK_Ordersphotographer_Phot_ProductTypes]
GO
ALTER TABLE [dbo].[Phot_Orders] DROP CONSTRAINT [FK_Ordersphotographer_Phot_Products]
GO
ALTER TABLE [dbo].[Pages] DROP CONSTRAINT [FK_Pages_Words]
GO
ALTER TABLE [dbo].[Pages] DROP CONSTRAINT [FK_Pages_Menus]
GO
ALTER TABLE [dbo].[Packages] DROP CONSTRAINT [FK_Packages_AlbumTypes]
GO
ALTER TABLE [dbo].[PackageDetails] DROP CONSTRAINT [FK_PackageDetails_Words]
GO
ALTER TABLE [dbo].[PackageDetails] DROP CONSTRAINT [FK_PackageDetails_Packages]
GO
ALTER TABLE [dbo].[PackageDetails] DROP CONSTRAINT [FK_PackageDetails_PackageInputTypes]
GO
ALTER TABLE [dbo].[NotificationsUser] DROP CONSTRAINT [FK_NotificationsUser_Users]
GO
ALTER TABLE [dbo].[NotificationsUser] DROP CONSTRAINT [FK_NotificationsUser_Notifications]
GO
ALTER TABLE [dbo].[Notifications] DROP CONSTRAINT [FK_Notifications_Words1]
GO
ALTER TABLE [dbo].[Notifications] DROP CONSTRAINT [FK_Notifications_Words]
GO
ALTER TABLE [dbo].[Notifications] DROP CONSTRAINT [FK_Notifications_Pages]
GO
ALTER TABLE [dbo].[Notifications] DROP CONSTRAINT [FK_Notifications_Notifications]
GO
ALTER TABLE [dbo].[Menus] DROP CONSTRAINT [FK_Menus_Words]
GO
ALTER TABLE [dbo].[FilesReceivedTypes] DROP CONSTRAINT [FK_FilesReceivedTypes_Words]
GO
ALTER TABLE [dbo].[EventTaskStatusIsFinshed] DROP CONSTRAINT [FK_EventWorksStatusIsFinshed_Events]
GO
ALTER TABLE [dbo].[EventTaskStatusHistories] DROP CONSTRAINT [FK_EventWorksStatusHistory_Branches]
GO
ALTER TABLE [dbo].[EventTaskStatusHistories] DROP CONSTRAINT [FK_EventWorksStatus_WorkTypes]
GO
ALTER TABLE [dbo].[EventTaskStatusHistories] DROP CONSTRAINT [FK_EventWorksStatus_Users]
GO
ALTER TABLE [dbo].[EventTaskStatusHistories] DROP CONSTRAINT [FK_EventWorksStatus_Events]
GO
ALTER TABLE [dbo].[EventTaskStatusHistories] DROP CONSTRAINT [FK_EventWorksStatus_AccountTypes]
GO
ALTER TABLE [dbo].[EventSurveyQuestionTypes] DROP CONSTRAINT [FK_PoolQuestionTypes_Words]
GO
ALTER TABLE [dbo].[EventSurveyQuestions] DROP CONSTRAINT [FK_EventPoolQuestions_PoolQuestionTypes]
GO
ALTER TABLE [dbo].[EventSurveyQuestions] DROP CONSTRAINT [FK_EventPoolQuestions_EventPools]
GO
ALTER TABLE [dbo].[EventSurveyQuestionAnswerer] DROP CONSTRAINT [FK_EventSurveyQuestionAnswers_EventSurveyQuestionTypes]
GO
ALTER TABLE [dbo].[EventSurveyQuestionAnswerer] DROP CONSTRAINT [FK_EventSurveyQuestionAnswers_EventSurveies]
GO
ALTER TABLE [dbo].[EventSurveyQuestionAnswerer] DROP CONSTRAINT [FK_EventPoolQuestionAnswers_EventPoolQuestionAnswers]
GO
ALTER TABLE [dbo].[EventSurveies] DROP CONSTRAINT [FK_EventSurveies_Events]
GO
ALTER TABLE [dbo].[Events] DROP CONSTRAINT [FK_Events_Users]
GO
ALTER TABLE [dbo].[Events] DROP CONSTRAINT [FK_Events_PrintNamesTypes]
GO
ALTER TABLE [dbo].[Events] DROP CONSTRAINT [FK_Events_Packages]
GO
ALTER TABLE [dbo].[Events] DROP CONSTRAINT [FK_Events_Enquires]
GO
ALTER TABLE [dbo].[Events] DROP CONSTRAINT [FK_Events_Branches]
GO
ALTER TABLE [dbo].[EventPhotographers] DROP CONSTRAINT [FK_EventPhotographers_Users]
GO
ALTER TABLE [dbo].[EventPhotographers] DROP CONSTRAINT [FK_EventPhotographers_Events]
GO
ALTER TABLE [dbo].[EventCoordinations] DROP CONSTRAINT [FK_EventCoordination_Users]
GO
ALTER TABLE [dbo].[EventCoordinations] DROP CONSTRAINT [FK_EventCoordination_Events]
GO
ALTER TABLE [dbo].[EventArchives] DROP CONSTRAINT [FK_EventArchives_Users]
GO
ALTER TABLE [dbo].[EnquiryTypes] DROP CONSTRAINT [FK_EnquiryTypes_Words]
GO
ALTER TABLE [dbo].[EnquiryStatusTypes] DROP CONSTRAINT [FK_EnquiryStatusTypes_Words]
GO
ALTER TABLE [dbo].[EnquiryStatus] DROP CONSTRAINT [FK_EnquiryStatus_Users]
GO
ALTER TABLE [dbo].[EnquiryStatus] DROP CONSTRAINT [FK_EnquiryStatus_EnquiryStatusTypes]
GO
ALTER TABLE [dbo].[EnquiryStatus] DROP CONSTRAINT [FK_EnquiryStatus_EnquiryPayments]
GO
ALTER TABLE [dbo].[EnquiryStatus] DROP CONSTRAINT [FK_EnquiryStatus_Enquires]
GO
ALTER TABLE [dbo].[EnquiryPayments] DROP CONSTRAINT [FK_EnquiryPayments_Users]
GO
ALTER TABLE [dbo].[EnquiryPayments] DROP CONSTRAINT [FK_EnquiryPayments_Enquires]
GO
ALTER TABLE [dbo].[Enquires] DROP CONSTRAINT [FK_EnquiryForms_Users]
GO
ALTER TABLE [dbo].[Enquires] DROP CONSTRAINT [FK_EnquiryForms_EnquiryTypes]
GO
ALTER TABLE [dbo].[Enquires] DROP CONSTRAINT [FK_EnquiryForms_Countries]
GO
ALTER TABLE [dbo].[Enquires] DROP CONSTRAINT [FK_EnquiryForms_Cities]
GO
ALTER TABLE [dbo].[Enquires] DROP CONSTRAINT [FK_Enquires_Countries]
GO
ALTER TABLE [dbo].[Enquires] DROP CONSTRAINT [FK_Enquires_Branches]
GO
ALTER TABLE [dbo].[EmployeesWorks] DROP CONSTRAINT [FK_EmployeesWorks_WorkTypes]
GO
ALTER TABLE [dbo].[EmployeesWorks] DROP CONSTRAINT [FK_EmployeesWorks_Users]
GO
ALTER TABLE [dbo].[EmployeeDistributionTasks] DROP CONSTRAINT [FK_EmployeeDistributionWorks_WorkTypes]
GO
ALTER TABLE [dbo].[EmployeeDistributionTasks] DROP CONSTRAINT [FK_EmployeeDistributionWorks_Users]
GO
ALTER TABLE [dbo].[EmployeeDistributionTasks] DROP CONSTRAINT [FK_EmployeeDistributionWorks_Events]
GO
ALTER TABLE [dbo].[EmployeeDistributionTasks] DROP CONSTRAINT [FK_EmployeeDistributionWorks_Branches]
GO
ALTER TABLE [dbo].[Countries] DROP CONSTRAINT [FK_Countries_Words]
GO
ALTER TABLE [dbo].[Cities] DROP CONSTRAINT [FK_Cities_Words]
GO
ALTER TABLE [dbo].[Cities] DROP CONSTRAINT [FK_Cities_Countries]
GO
ALTER TABLE [dbo].[Branches] DROP CONSTRAINT [FK_Branches_Words]
GO
ALTER TABLE [dbo].[Branches] DROP CONSTRAINT [FK_Branches_Countries]
GO
ALTER TABLE [dbo].[Branches] DROP CONSTRAINT [FK_Branches_Cities]
GO
ALTER TABLE [dbo].[AlbumsFiles] DROP CONSTRAINT [FK_AlbumsFiles_Albums]
GO
ALTER TABLE [dbo].[Albums] DROP CONSTRAINT [FK_AlbumTypes_Words]
GO
ALTER TABLE [dbo].[AccountTypes] DROP CONSTRAINT [FK_AccountTypes_Words]
GO
ALTER TABLE [dbo].[Users] DROP CONSTRAINT [DF_Users_IsActiveEmail]
GO
ALTER TABLE [dbo].[Phot_Products] DROP CONSTRAINT [DF_Phot_Products_Version]
GO
ALTER TABLE [dbo].[Phot_Orders] DROP CONSTRAINT [DF_Phot_Orders_IsActive]
GO
ALTER TABLE [dbo].[Enquires] DROP CONSTRAINT [DF_Enquires_IsCreatedEvent]
GO
ALTER TABLE [dbo].[Cities] DROP CONSTRAINT [DF_Cities_ShippingPrice]
GO
/****** Object:  Index [IX_PoolQuestionTypes]    Script Date: 1/30/2020 7:50:35 PM ******/
DROP INDEX [IX_PoolQuestionTypes] ON [dbo].[EventSurveyQuestionTypes]
GO
/****** Object:  Table [dbo].[WorkTypes]    Script Date: 1/30/2020 7:50:35 PM ******/
DROP TABLE [dbo].[WorkTypes]
GO
/****** Object:  Table [dbo].[UserSocialAccounts]    Script Date: 1/30/2020 7:50:35 PM ******/
DROP TABLE [dbo].[UserSocialAccounts]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 1/30/2020 7:50:35 PM ******/
DROP TABLE [dbo].[Users]
GO
/****** Object:  Table [dbo].[UserPrivileges]    Script Date: 1/30/2020 7:50:35 PM ******/
DROP TABLE [dbo].[UserPrivileges]
GO
/****** Object:  Table [dbo].[UserPayments]    Script Date: 1/30/2020 7:50:35 PM ******/
DROP TABLE [dbo].[UserPayments]
GO
/****** Object:  Table [dbo].[StaticFields]    Script Date: 1/30/2020 7:50:35 PM ******/
DROP TABLE [dbo].[StaticFields]
GO
/****** Object:  Table [dbo].[SocialAccountTypes]    Script Date: 1/30/2020 7:50:35 PM ******/
DROP TABLE [dbo].[SocialAccountTypes]
GO
/****** Object:  Table [dbo].[PrintNamesTypes]    Script Date: 1/30/2020 7:50:35 PM ******/
DROP TABLE [dbo].[PrintNamesTypes]
GO
/****** Object:  Table [dbo].[Phot_ProductTypes]    Script Date: 1/30/2020 7:50:35 PM ******/
DROP TABLE [dbo].[Phot_ProductTypes]
GO
/****** Object:  Table [dbo].[Phot_ProductsOptionsItems]    Script Date: 1/30/2020 7:50:35 PM ******/
DROP TABLE [dbo].[Phot_ProductsOptionsItems]
GO
/****** Object:  Table [dbo].[Phot_ProductsOptions]    Script Date: 1/30/2020 7:50:35 PM ******/
DROP TABLE [dbo].[Phot_ProductsOptions]
GO
/****** Object:  Table [dbo].[Phot_Products_Images]    Script Date: 1/30/2020 7:50:35 PM ******/
DROP TABLE [dbo].[Phot_Products_Images]
GO
/****** Object:  Table [dbo].[Phot_Products]    Script Date: 1/30/2020 7:50:35 PM ******/
DROP TABLE [dbo].[Phot_Products]
GO
/****** Object:  Table [dbo].[Phot_OrdersOptions]    Script Date: 1/30/2020 7:50:35 PM ******/
DROP TABLE [dbo].[Phot_OrdersOptions]
GO
/****** Object:  Table [dbo].[Phot_OrderServicePrices]    Script Date: 1/30/2020 7:50:35 PM ******/
DROP TABLE [dbo].[Phot_OrderServicePrices]
GO
/****** Object:  Table [dbo].[Phot_Orders]    Script Date: 1/30/2020 7:50:35 PM ******/
DROP TABLE [dbo].[Phot_Orders]
GO
/****** Object:  Table [dbo].[Phot_OrderPayments]    Script Date: 1/30/2020 7:50:35 PM ******/
DROP TABLE [dbo].[Phot_OrderPayments]
GO
/****** Object:  Table [dbo].[Pages]    Script Date: 1/30/2020 7:50:35 PM ******/
DROP TABLE [dbo].[Pages]
GO
/****** Object:  Table [dbo].[Packages]    Script Date: 1/30/2020 7:50:35 PM ******/
DROP TABLE [dbo].[Packages]
GO
/****** Object:  Table [dbo].[PackageDetails]    Script Date: 1/30/2020 7:50:35 PM ******/
DROP TABLE [dbo].[PackageDetails]
GO
/****** Object:  Table [dbo].[NotificationsUser]    Script Date: 1/30/2020 7:50:35 PM ******/
DROP TABLE [dbo].[NotificationsUser]
GO
/****** Object:  Table [dbo].[Notifications]    Script Date: 1/30/2020 7:50:35 PM ******/
DROP TABLE [dbo].[Notifications]
GO
/****** Object:  Table [dbo].[Menus]    Script Date: 1/30/2020 7:50:35 PM ******/
DROP TABLE [dbo].[Menus]
GO
/****** Object:  Table [dbo].[Languages]    Script Date: 1/30/2020 7:50:35 PM ******/
DROP TABLE [dbo].[Languages]
GO
/****** Object:  Table [dbo].[FilesReceivedTypes]    Script Date: 1/30/2020 7:50:35 PM ******/
DROP TABLE [dbo].[FilesReceivedTypes]
GO
/****** Object:  Table [dbo].[EventTaskStatusIsFinshed]    Script Date: 1/30/2020 7:50:35 PM ******/
DROP TABLE [dbo].[EventTaskStatusIsFinshed]
GO
/****** Object:  Table [dbo].[EventTaskStatusHistories]    Script Date: 1/30/2020 7:50:35 PM ******/
DROP TABLE [dbo].[EventTaskStatusHistories]
GO
/****** Object:  Table [dbo].[EventSurveyQuestionTypes]    Script Date: 1/30/2020 7:50:35 PM ******/
DROP TABLE [dbo].[EventSurveyQuestionTypes]
GO
/****** Object:  Table [dbo].[EventSurveyQuestions]    Script Date: 1/30/2020 7:50:35 PM ******/
DROP TABLE [dbo].[EventSurveyQuestions]
GO
/****** Object:  Table [dbo].[EventSurveyQuestionAnswerer]    Script Date: 1/30/2020 7:50:35 PM ******/
DROP TABLE [dbo].[EventSurveyQuestionAnswerer]
GO
/****** Object:  Table [dbo].[EventSurveies]    Script Date: 1/30/2020 7:50:35 PM ******/
DROP TABLE [dbo].[EventSurveies]
GO
/****** Object:  Table [dbo].[Events]    Script Date: 1/30/2020 7:50:35 PM ******/
DROP TABLE [dbo].[Events]
GO
/****** Object:  Table [dbo].[EventPhotographers]    Script Date: 1/30/2020 7:50:35 PM ******/
DROP TABLE [dbo].[EventPhotographers]
GO
/****** Object:  Table [dbo].[EventCoordinations]    Script Date: 1/30/2020 7:50:35 PM ******/
DROP TABLE [dbo].[EventCoordinations]
GO
/****** Object:  Table [dbo].[EventArchives]    Script Date: 1/30/2020 7:50:35 PM ******/
DROP TABLE [dbo].[EventArchives]
GO
/****** Object:  Table [dbo].[EventArchiveDetails]    Script Date: 1/30/2020 7:50:35 PM ******/
DROP TABLE [dbo].[EventArchiveDetails]
GO
/****** Object:  Table [dbo].[EnquiryTypes]    Script Date: 1/30/2020 7:50:35 PM ******/
DROP TABLE [dbo].[EnquiryTypes]
GO
/****** Object:  Table [dbo].[EnquiryStatusTypes]    Script Date: 1/30/2020 7:50:35 PM ******/
DROP TABLE [dbo].[EnquiryStatusTypes]
GO
/****** Object:  Table [dbo].[EnquiryStatus]    Script Date: 1/30/2020 7:50:35 PM ******/
DROP TABLE [dbo].[EnquiryStatus]
GO
/****** Object:  Table [dbo].[EnquiryPayments]    Script Date: 1/30/2020 7:50:35 PM ******/
DROP TABLE [dbo].[EnquiryPayments]
GO
/****** Object:  Table [dbo].[Enquires]    Script Date: 1/30/2020 7:50:35 PM ******/
DROP TABLE [dbo].[Enquires]
GO
/****** Object:  Table [dbo].[EmployeesWorks]    Script Date: 1/30/2020 7:50:35 PM ******/
DROP TABLE [dbo].[EmployeesWorks]
GO
/****** Object:  Table [dbo].[EmployeeDistributionTasks]    Script Date: 1/30/2020 7:50:35 PM ******/
DROP TABLE [dbo].[EmployeeDistributionTasks]
GO
/****** Object:  Table [dbo].[Branches]    Script Date: 1/30/2020 7:50:35 PM ******/
DROP TABLE [dbo].[Branches]
GO
/****** Object:  Table [dbo].[AlbumsFiles]    Script Date: 1/30/2020 7:50:35 PM ******/
DROP TABLE [dbo].[AlbumsFiles]
GO
/****** Object:  Table [dbo].[Albums]    Script Date: 1/30/2020 7:50:35 PM ******/
DROP TABLE [dbo].[Albums]
GO
/****** Object:  View [dbo].[CitiesView]    Script Date: 1/30/2020 7:50:35 PM ******/
DROP VIEW [dbo].[CitiesView]
GO
/****** Object:  Table [dbo].[Cities]    Script Date: 1/30/2020 7:50:35 PM ******/
DROP TABLE [dbo].[Cities]
GO
/****** Object:  View [dbo].[CountriesView]    Script Date: 1/30/2020 7:50:35 PM ******/
DROP VIEW [dbo].[CountriesView]
GO
/****** Object:  Table [dbo].[Countries]    Script Date: 1/30/2020 7:50:35 PM ******/
DROP TABLE [dbo].[Countries]
GO
/****** Object:  View [dbo].[AccountTypes_Select]    Script Date: 1/30/2020 7:50:35 PM ******/
DROP VIEW [dbo].[AccountTypes_Select]
GO
/****** Object:  Table [dbo].[Words]    Script Date: 1/30/2020 7:50:35 PM ******/
DROP TABLE [dbo].[Words]
GO
/****** Object:  Table [dbo].[AccountTypes]    Script Date: 1/30/2020 7:50:35 PM ******/
DROP TABLE [dbo].[AccountTypes]
GO
/****** Object:  UserDefinedFunction [dbo].[UserPayments_CheckIsClosed]    Script Date: 1/30/2020 7:50:35 PM ******/
DROP FUNCTION [dbo].[UserPayments_CheckIsClosed]
GO
/****** Object:  UserDefinedFunction [dbo].[GetNotificationsCountIsNotRead]    Script Date: 1/30/2020 7:50:35 PM ******/
DROP FUNCTION [dbo].[GetNotificationsCountIsNotRead]
GO
/****** Object:  UserDefinedFunction [dbo].[EventTaskStatusIsFinsed_CheckIfFinshedFun]    Script Date: 1/30/2020 7:50:35 PM ******/
DROP FUNCTION [dbo].[EventTaskStatusIsFinsed_CheckIfFinshedFun]
GO
/****** Object:  UserDefinedFunction [dbo].[Events_CheckIfTaskFinshed]    Script Date: 1/30/2020 7:50:35 PM ******/
DROP FUNCTION [dbo].[Events_CheckIfTaskFinshed]
GO
/****** Object:  UserDefinedFunction [dbo].[EnquiryPayments_TotalPaymentsActive]    Script Date: 1/30/2020 7:50:35 PM ******/
DROP FUNCTION [dbo].[EnquiryPayments_TotalPaymentsActive]
GO
/****** Object:  UserDefinedFunction [dbo].[EnquiryPayments_TotalPayments]    Script Date: 1/30/2020 7:50:35 PM ******/
DROP FUNCTION [dbo].[EnquiryPayments_TotalPayments]
GO
/****** Object:  UserDefinedFunction [dbo].[EnquiryPayments_CheckIfPaymentDeposit]    Script Date: 1/30/2020 7:50:35 PM ******/
DROP FUNCTION [dbo].[EnquiryPayments_CheckIfPaymentDeposit]
GO
USE [master]
GO
/****** Object:  Database [Layal]    Script Date: 1/30/2020 7:50:35 PM ******/
DROP DATABASE [Layal]
GO
/****** Object:  Database [Layal]    Script Date: 1/30/2020 7:50:35 PM ******/
CREATE DATABASE [Layal]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Layal', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.AHMEDNAGEEB\MSSQL\DATA\Layal.mdf' , SIZE = 73728KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Layal_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.AHMEDNAGEEB\MSSQL\DATA\Layal_log.ldf' , SIZE = 139264KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [Layal] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Layal].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Layal] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Layal] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Layal] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Layal] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Layal] SET ARITHABORT OFF 
GO
ALTER DATABASE [Layal] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Layal] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Layal] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Layal] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Layal] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Layal] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Layal] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Layal] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Layal] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Layal] SET  ENABLE_BROKER 
GO
ALTER DATABASE [Layal] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Layal] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Layal] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Layal] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Layal] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Layal] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Layal] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Layal] SET RECOVERY FULL 
GO
ALTER DATABASE [Layal] SET  MULTI_USER 
GO
ALTER DATABASE [Layal] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Layal] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Layal] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Layal] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Layal] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'Layal', N'ON'
GO
ALTER DATABASE [Layal] SET QUERY_STORE = OFF
GO
USE [Layal]
GO
/****** Object:  UserDefinedFunction [dbo].[EnquiryPayments_CheckIfPaymentDeposit]    Script Date: 1/30/2020 7:50:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE function [dbo].[EnquiryPayments_CheckIfPaymentDeposit](@EnquiryId bigint) returns bit

as begin
if (select sum(Amount) from EnquiryPayments 
where IsDeposit=1 and  FKEnquiry_Id=@EnquiryId and IsAcceptFromManger=1) > 0
return 1;
return 0
end 
GO
/****** Object:  UserDefinedFunction [dbo].[EnquiryPayments_TotalPayments]    Script Date: 1/30/2020 7:50:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create function [dbo].[EnquiryPayments_TotalPayments](@EnquiryId bigint) returns decimal(18,2)

as begin
return (select sum(Amount) from EnquiryPayments where FKEnquiry_Id=@EnquiryId)
end 
GO
/****** Object:  UserDefinedFunction [dbo].[EnquiryPayments_TotalPaymentsActive]    Script Date: 1/30/2020 7:50:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create function [dbo].[EnquiryPayments_TotalPaymentsActive](@EnquiryId bigint) returns decimal(18,2)

as begin
return (select sum(Amount) from EnquiryPayments where FKEnquiry_Id=@EnquiryId and IsAcceptFromManger=1)
end 
GO
/****** Object:  UserDefinedFunction [dbo].[Events_CheckIfTaskFinshed]    Script Date: 1/30/2020 7:50:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE function [dbo].[Events_CheckIfTaskFinshed](@eventId bigint, @workTypeId int,@UserId bigint)returns bit
as begin

if((select top 1 count(*) from EventTaskStatusHistories 
where FKEvent_Id=@eventId and FKWorkType_Id=@workTypeId and IsFinshed=1 and FKUsre_Id=@UserId )>0)
return 1;

return 0

end 
GO
/****** Object:  UserDefinedFunction [dbo].[EventTaskStatusIsFinsed_CheckIfFinshedFun]    Script Date: 1/30/2020 7:50:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE function [dbo].[EventTaskStatusIsFinsed_CheckIfFinshedFun](@eventId bigint,@workTypeId int) returns bit
as begin
/* Works Types
	Booking                =1  , DataPerfection         =2  ,
	Coordination           =3  , Implementation         =4  ,
	ArchivingAndSaveing    =5  , ProcessingProducts      =6  ,
	Choosing              =7  , DigitalProcessing      =8  ,
	PreparingForPrinting   =9  , Manufacturing          =10 ,
	QualityAndReview       =11 , Packaging              =12 ,
	TransmissionAndDelivery=13 , Archiving              =14 ,*/

	 
if(@WorkTypeId = 1)		  return (select top 1 Booking					from EventTaskStatusIsFinshed 	 where EventId=@EventId	)
else if(@WorkTypeId = 2)  return (select top 1 DataPerfection			from EventTaskStatusIsFinshed  where EventId=@EventId	)
else if(@WorkTypeId = 3)  return (select top 1 Coordination				from EventTaskStatusIsFinshed where EventId=@EventId	)
else if(@WorkTypeId = 4)  return (select top 1 Implementation			from EventTaskStatusIsFinshed  where EventId=@EventId	)
else if(@WorkTypeId = 5)  return (select top 1 ArchivingAndSaveing		from EventTaskStatusIsFinshed where EventId=@EventId	)
else if(@WorkTypeId = 6)  return (select top 1 ProcessingProducts		from EventTaskStatusIsFinshed where EventId=@EventId	)
else if(@WorkTypeId = 7)  return (select top 1 Choosing				from EventTaskStatusIsFinshed where EventId=@EventId	)
else if(@WorkTypeId = 8)  return (select top 1 DigitalProcessing		from EventTaskStatusIsFinshed where EventId=@EventId	)
else if(@WorkTypeId = 9)  return (select top 1 PreparingForPrinting		from EventTaskStatusIsFinshed where EventId=@EventId	)
else if(@WorkTypeId = 10) return (select top 1 Manufacturing			from EventTaskStatusIsFinshed where EventId=@EventId	)
else if(@WorkTypeId = 11) return (select top 1 QualityAndReview			from EventTaskStatusIsFinshed where EventId=@EventId	)
else if(@WorkTypeId = 12) return (select top 1 Packaging				from EventTaskStatusIsFinshed where EventId=@EventId	)
else if(@WorkTypeId = 13) return (select top 1 TransmissionAndDelivery	from EventTaskStatusIsFinshed where EventId=@EventId	)
else if(@WorkTypeId = 14) return (select top 1 Archiving				from EventTaskStatusIsFinshed where EventId=@EventId	)
return 0;
end
GO
/****** Object:  UserDefinedFunction [dbo].[GetNotificationsCountIsNotRead]    Script Date: 1/30/2020 7:50:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE function [dbo].[GetNotificationsCountIsNotRead](@CuurentUserLoggadId bigint
) returns int
as begin
return (Select ISNULL(Count(Id),0) from NotificationsUser where FKUser_Id=@CuurentUserLoggadId and IsRead=0)
end
GO
/****** Object:  UserDefinedFunction [dbo].[UserPayments_CheckIsClosed]    Script Date: 1/30/2020 7:50:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE function [dbo].[UserPayments_CheckIsClosed](@isAcceptFromManger bit , @paymentImage nvarchar(max))returns bit
as begin 
if(
 (@isAcceptFromManger =1 and  @paymentImage is not null) or (@isAcceptFromManger =0))
 return 1; --Return As Closed

 return 0;
end
GO
/****** Object:  Table [dbo].[AccountTypes]    Script Date: 1/30/2020 7:50:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AccountTypes](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[FkWord_Id] [bigint] NULL,
 CONSTRAINT [PK_AccountTypes] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Words]    Script Date: 1/30/2020 7:50:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Words](
	[Id] [bigint] NOT NULL,
	[Ar] [nvarchar](max) NULL,
	[En] [nvarchar](max) NULL,
 CONSTRAINT [PK_Words] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  View [dbo].[AccountTypes_Select]    Script Date: 1/30/2020 7:50:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create view [dbo].[AccountTypes_Select]
as     
select AccountTypes.*,
Words.Ar,
Words.En 
from AccountTypes
join Words on Words.Id=AccountTypes.FkWord_Id 
  

GO
/****** Object:  Table [dbo].[Countries]    Script Date: 1/30/2020 7:50:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Countries](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[FKWord_Id] [bigint] NOT NULL,
	[IsoCode] [nvarchar](50) NULL,
 CONSTRAINT [PK_Countries] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[CountriesView]    Script Date: 1/30/2020 7:50:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create view [dbo].[CountriesView]
as 
select Countries.*,Words.Ar,
Words.En from  Countries join Words on Words.Id=Countries.Id
GO
/****** Object:  Table [dbo].[Cities]    Script Date: 1/30/2020 7:50:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Cities](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[FKWord_Id] [bigint] NOT NULL,
	[FKCountry_Id] [int] NOT NULL,
	[ShippingPrice] [decimal](18, 12) NOT NULL,
 CONSTRAINT [PK_Cities] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[CitiesView]    Script Date: 1/30/2020 7:50:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create view [dbo].[CitiesView]
as 
select Cities.*,Words.Ar,
Words.En from  Cities join Words on Words.Id=Cities.Id
GO
/****** Object:  Table [dbo].[Albums]    Script Date: 1/30/2020 7:50:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Albums](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[FKWord_Id] [bigint] NOT NULL,
	[FKWord_Description_Id] [bigint] NOT NULL,
 CONSTRAINT [PK_AlbumTypes] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AlbumsFiles]    Script Date: 1/30/2020 7:50:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AlbumsFiles](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[FileUrl] [ntext] NOT NULL,
	[FKAlbum_Id] [int] NOT NULL,
 CONSTRAINT [PK_AlbumsFiles] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Branches]    Script Date: 1/30/2020 7:50:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Branches](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Address] [nvarchar](max) NULL,
	[PhoneNo] [nvarchar](50) NOT NULL,
	[FkCountry_Id] [int] NOT NULL,
	[FKCity_Id] [int] NOT NULL,
	[FKWord_Id] [bigint] NOT NULL,
	[IsBasic] [bit] NOT NULL,
	[FKArchivingAndSaveingEmployee_Id] [bigint] NULL,
	[FKImplementationEmployeeId_Id] [bigint] NULL,
	[FKCoordinationEmployee_Id] [bigint] NULL,
	[FKArchivingAndSaveingAnotherBranch_Id] [int] NULL,
 CONSTRAINT [PK_Branches] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[EmployeeDistributionTasks]    Script Date: 1/30/2020 7:50:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EmployeeDistributionTasks](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[FKWorkType_Id] [int] NOT NULL,
	[FKEmployee_Id] [bigint] NOT NULL,
	[FKEvent_Id] [bigint] NOT NULL,
	[IsAnotherBranch] [bit] NOT NULL,
	[FKBranch_Id] [int] NOT NULL,
 CONSTRAINT [PK_EmployeeDistributionWorks] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[EmployeesWorks]    Script Date: 1/30/2020 7:50:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EmployeesWorks](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[FkWorkType_Id] [int] NOT NULL,
	[FKUser_Id] [bigint] NOT NULL,
 CONSTRAINT [PK_EmpoyeesWorks] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Enquires]    Script Date: 1/30/2020 7:50:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Enquires](
	[Id] [bigint] NOT NULL,
	[FirstName] [nvarchar](50) NOT NULL,
	[LastName] [nvarchar](50) NOT NULL,
	[PhoneNo] [nvarchar](50) NOT NULL,
	[FkCountry_Id] [int] NOT NULL,
	[FkCity_Id] [int] NOT NULL,
	[FKEnquiryType_Id] [int] NULL,
	[FKUserCreated_Id] [bigint] NULL,
	[CreateDateTime] [datetime] NOT NULL,
	[Day] [int] NOT NULL,
	[Month] [int] NOT NULL,
	[Year] [int] NOT NULL,
	[FKBranch_Id] [int] NOT NULL,
	[IsLinkedClinet] [bit] NULL,
	[IsClosed] [bit] NULL,
	[ClosedDateTime] [datetime] NULL,
	[IsWithBranch] [bit] NOT NULL,
	[FkClinet_Id] [bigint] NULL,
	[IsCreatedEvent] [bit] NOT NULL,
	[FKPhoneCountry_Id] [int] NOT NULL,
 CONSTRAINT [PK_EnquiryForms] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[EnquiryPayments]    Script Date: 1/30/2020 7:50:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EnquiryPayments](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[Amount] [decimal](18, 2) NOT NULL,
	[IsDeposit] [bit] NOT NULL,
	[IsBankTransfer] [bit] NOT NULL,
	[TransferImage] [nvarchar](max) NULL,
	[IsAcceptFromManger] [bit] NULL,
	[DateTime] [datetime] NOT NULL,
	[FKEnquiry_Id] [bigint] NOT NULL,
	[FKUserCreated_Id] [bigint] NOT NULL,
 CONSTRAINT [PK_EnquiryPayments] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[EnquiryStatus]    Script Date: 1/30/2020 7:50:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EnquiryStatus](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[Notes] [nvarchar](max) NULL,
	[DateTime] [datetime] NOT NULL,
	[ScheduleVisitDateTime] [datetime] NULL,
	[FKEnquiry_Id] [bigint] NOT NULL,
	[FKEnquiryStatus_Id] [int] NOT NULL,
	[FKUserCreated_Id] [bigint] NULL,
	[FKEnquiryPayment_Id] [bigint] NULL,
	[ScheduleVisitDateClendarEventId] [nvarchar](max) NULL,
 CONSTRAINT [PK_EnquiryStatus] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[EnquiryStatusTypes]    Script Date: 1/30/2020 7:50:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EnquiryStatusTypes](
	[Id] [int] NOT NULL,
	[FKWord_Id] [bigint] NOT NULL,
 CONSTRAINT [PK_EnquiryStatusTypes] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[EnquiryTypes]    Script Date: 1/30/2020 7:50:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EnquiryTypes](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[FKWord_Id] [bigint] NOT NULL,
 CONSTRAINT [PK_EnquiryTypes] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[EventArchiveDetails]    Script Date: 1/30/2020 7:50:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EventArchiveDetails](
	[Id] [bigint] NOT NULL,
	[FKEvent_Id] [bigint] NOT NULL,
	[FKEventArchive_Id] [int] NOT NULL,
	[MemoryId] [nvarchar](50) NOT NULL,
	[MemoryType] [nvarchar](50) NOT NULL,
	[PhotoStartName] [nvarchar](50) NOT NULL,
	[PhotoNumberFrom] [int] NOT NULL,
	[PhotoNumberTo] [int] NOT NULL,
	[Notes] [nvarchar](max) NULL,
	[DateTime] [datetime] NOT NULL,
 CONSTRAINT [PK_EventArchivesDetails] PRIMARY KEY CLUSTERED 
(
	[Id] ASC,
	[FKEvent_Id] ASC,
	[FKEventArchive_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[EventArchives]    Script Date: 1/30/2020 7:50:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EventArchives](
	[Id] [int] NOT NULL,
	[FKEvent_Id] [bigint] NOT NULL,
	[HardDiskNumber] [nvarchar](50) NOT NULL,
	[FolderName] [nvarchar](50) NOT NULL,
	[DateTime] [datetime] NOT NULL,
	[FKUser_Id] [bigint] NOT NULL,
 CONSTRAINT [PK_EventArchives] PRIMARY KEY CLUSTERED 
(
	[Id] ASC,
	[FKEvent_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[EventCoordinations]    Script Date: 1/30/2020 7:50:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EventCoordinations](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[TaskNumber] [int] NOT NULL,
	[Task] [nvarchar](50) NOT NULL,
	[StartTime] [time](7) NOT NULL,
	[EndTime] [time](7) NOT NULL,
	[Notes] [nvarchar](max) NULL,
	[FKEvent_Id] [bigint] NOT NULL,
	[FKUserCreated_Id] [bigint] NOT NULL,
 CONSTRAINT [PK_EventCoordination] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[EventPhotographers]    Script Date: 1/30/2020 7:50:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EventPhotographers](
	[Id] [bigint] NOT NULL,
	[FKEvent_Id] [bigint] NOT NULL,
	[FKUser_Id] [bigint] NOT NULL,
	[CreateDateTime] [datetime] NOT NULL,
 CONSTRAINT [PK] PRIMARY KEY CLUSTERED 
(
	[Id] ASC,
	[FKEvent_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Events]    Script Date: 1/30/2020 7:50:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Events](
	[Id] [bigint] NOT NULL,
	[IsClinetCustomLogo] [bit] NULL,
	[LogoFilePath] [nvarchar](max) NULL,
	[IsNamesAr] [bit] NULL,
	[NameGroom] [nvarchar](50) NULL,
	[NameBride] [nvarchar](50) NULL,
	[FKPrintNameType_Id] [int] NULL,
	[EventDateTime] [datetime] NOT NULL,
	[CreateDateTime] [datetime] NOT NULL,
	[FKPackage_Id] [int] NOT NULL,
	[FKClinet_Id] [bigint] NOT NULL,
	[Notes] [nvarchar](max) NULL,
	[FKUserCreaed_Id] [bigint] NOT NULL,
	[FKBranch_Id] [int] NOT NULL,
	[ClendarEventId] [nvarchar](max) NULL,
	[PackagePrice] [decimal](18, 2) NOT NULL,
	[PackageNamsArExtraPrice] [decimal](18, 2) NOT NULL,
	[VistToCoordinationDateTime] [datetime] NULL,
	[VistToCoordinationClendarEventId] [nvarchar](max) NULL,
	[NamesPrintingPrice] [decimal](18, 2) NULL,
 CONSTRAINT [PK_Events] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[EventSurveies]    Script Date: 1/30/2020 7:50:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EventSurveies](
	[Id] [bigint] NOT NULL,
	[FKClinet_Id] [bigint] NOT NULL,
	[IsSatisfied] [bit] NOT NULL,
 CONSTRAINT [PK_EventSurveies] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[EventSurveyQuestionAnswerer]    Script Date: 1/30/2020 7:50:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EventSurveyQuestionAnswerer](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[FKEventSurveyQuestion_Id] [bigint] NOT NULL,
	[Answerer] [nvarchar](max) NOT NULL,
	[DateTime] [datetime] NOT NULL,
	[FKSurveyQuestionType_Id] [int] NOT NULL,
	[FKEventSurvey_Id] [bigint] NOT NULL,
 CONSTRAINT [PK_EventPoolQuestionAnswers] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[EventSurveyQuestions]    Script Date: 1/30/2020 7:50:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EventSurveyQuestions](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[IsDefault] [bit] NULL,
	[FKSurveyQuestionType_Id] [int] NOT NULL,
	[FKEvent_Id] [bigint] NULL,
	[IsActive] [bit] NULL,
 CONSTRAINT [PK_EventPoolQuestions] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[EventSurveyQuestionTypes]    Script Date: 1/30/2020 7:50:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EventSurveyQuestionTypes](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[FKWord_Id] [bigint] NOT NULL,
	[InputType] [int] NULL,
 CONSTRAINT [PK_PoolQuestionTypes] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[EventTaskStatusHistories]    Script Date: 1/30/2020 7:50:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EventTaskStatusHistories](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[IsFinshed] [bit] NOT NULL,
	[DateTime] [datetime] NOT NULL,
	[FKEvent_Id] [bigint] NOT NULL,
	[FKWorkType_Id] [int] NOT NULL,
	[FKUsre_Id] [bigint] NOT NULL,
	[FKAccountType_Id] [int] NOT NULL,
	[FKBranch_Id] [int] NOT NULL,
 CONSTRAINT [PK_EventWorksStatus] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[EventTaskStatusIsFinshed]    Script Date: 1/30/2020 7:50:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EventTaskStatusIsFinshed](
	[EventId] [bigint] NOT NULL,
	[Booking] [bit] NULL,
	[DataPerfection] [bit] NULL,
	[Coordination] [bit] NULL,
	[Implementation] [bit] NULL,
	[ArchivingAndSaveing] [bit] NULL,
	[ProcessingProducts] [bit] NULL,
	[Choosing] [bit] NULL,
	[DigitalProcessing] [bit] NULL,
	[PreparingForPrinting] [bit] NULL,
	[Manufacturing] [bit] NULL,
	[QualityAndReview] [bit] NULL,
	[Packaging] [bit] NULL,
	[TransmissionAndDelivery] [bit] NULL,
	[Archiving] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[EventId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[FilesReceivedTypes]    Script Date: 1/30/2020 7:50:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FilesReceivedTypes](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[FKWord_Id] [bigint] NOT NULL,
 CONSTRAINT [PK_FilesReceivedTypes] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Languages]    Script Date: 1/30/2020 7:50:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Languages](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Code] [nvarchar](50) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Languages] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Menus]    Script Date: 1/30/2020 7:50:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Menus](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CssClass] [nvarchar](50) NOT NULL,
	[OrderByNumber] [int] NOT NULL,
	[Parent_Id] [int] NULL,
	[FKWord_Id] [bigint] NOT NULL,
 CONSTRAINT [PK_Menu] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Notifications]    Script Date: 1/30/2020 7:50:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Notifications](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[DateTime] [datetime] NOT NULL,
	[Target_Id] [bigint] NULL,
	[FKPage_Id] [int] NOT NULL,
	[FKUser_Id] [bigint] NULL,
	[FkWord_Id] [bigint] NOT NULL,
	[FKDescriptionWord_Id] [bigint] NOT NULL,
	[RedirectUrl] [nvarchar](max) NULL,
 CONSTRAINT [PK_Notifications] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[NotificationsUser]    Script Date: 1/30/2020 7:50:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NotificationsUser](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[FKNotify_Id] [bigint] NOT NULL,
	[FKUser_Id] [bigint] NOT NULL,
	[IsRead] [bit] NOT NULL,
 CONSTRAINT [PK_NotificationsUser] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PackageDetails]    Script Date: 1/30/2020 7:50:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PackageDetails](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[FKWord_Id] [bigint] NOT NULL,
	[FKStaticField_Id] [int] NOT NULL,
	[FKPackage_Id] [int] NOT NULL,
 CONSTRAINT [PK_PackageDetails] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Packages]    Script Date: 1/30/2020 7:50:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Packages](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[FkWordName_Id] [bigint] NOT NULL,
	[IsPrintNamesFree] [bit] NOT NULL,
	[FkWordDescription_Id] [bigint] NOT NULL,
	[FKAlbumType_Id] [int] NOT NULL,
	[Price] [decimal](18, 2) NOT NULL,
	[NamsArExtraPrice] [decimal](18, 2) NOT NULL,
 CONSTRAINT [PK_Packages] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Pages]    Script Date: 1/30/2020 7:50:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Pages](
	[Id] [int] NOT NULL,
	[FKWord_Id] [bigint] NOT NULL,
	[Url] [nvarchar](50) NOT NULL,
	[FkMenu_Id] [int] NOT NULL,
	[OrderByNumber] [int] NOT NULL,
	[IsForClient] [bit] NULL,
	[IsForAdmin] [bit] NULL,
	[IsHide] [bit] NOT NULL,
 CONSTRAINT [PK_Pages] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Phot_OrderPayments]    Script Date: 1/30/2020 7:50:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Phot_OrderPayments](
	[Id] [bigint] NOT NULL,
	[FkOrder_Id] [bigint] NOT NULL,
	[PaymentDateTime] [datetime] NOT NULL,
	[IsBankTransfer] [bit] NOT NULL,
	[IsAcceptFromManger] [bit] NULL,
	[FKUserCreated_Id] [bigint] NOT NULL,
	[Amount] [decimal](18, 2) NOT NULL,
	[TransferImage] [nvarchar](max) NOT NULL,
	[AcceptNotes] [nvarchar](max) NULL,
	[AcceptDateTime] [datetime] NULL,
 CONSTRAINT [PK_OrderPayments] PRIMARY KEY CLUSTERED 
(
	[Id] ASC,
	[FkOrder_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Phot_Orders]    Script Date: 1/30/2020 7:50:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Phot_Orders](
	[Id] [bigint] NOT NULL,
	[FKProductType_Id] [bigint] NOT NULL,
	[FKProduct_Id] [bigint] NOT NULL,
	[CreateDateTime] [datetime] NOT NULL,
	[FKUserCreated] [bigint] NOT NULL,
	[IsActive] [bit] NOT NULL,
	[DropboxFolderPath] [nvarchar](max) NULL,
	[Delivery_IsReceiptFromTheBranch] [bit] NOT NULL,
	[Delivery_Address] [nvarchar](max) NULL,
	[Delivery_FkCountry_Id] [int] NULL,
	[Delivery_FKCity_Id] [int] NULL,
	[DateTimeCancel] [datetime] NULL,
	[FkUserCancel_Id] [bigint] NULL,
 CONSTRAINT [PK__Ordersph__3214EC071A9B6428] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Phot_OrderServicePrices]    Script Date: 1/30/2020 7:50:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Phot_OrderServicePrices](
	[Id] [bigint] NOT NULL,
	[FkOrder_Id] [bigint] NOT NULL,
	[FkUser_Id] [bigint] NOT NULL,
	[FKWord_Id] [bigint] NOT NULL,
	[Price] [decimal](18, 2) NOT NULL,
	[CreateDateTime] [datetime] NOT NULL,
 CONSTRAINT [PK_Phot_OrderPrices] PRIMARY KEY CLUSTERED 
(
	[Id] ASC,
	[FkOrder_Id] ASC,
	[FkUser_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Phot_OrdersOptions]    Script Date: 1/30/2020 7:50:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Phot_OrdersOptions](
	[Id] [bigint] NOT NULL,
	[FKOrder_Id] [bigint] NOT NULL,
	[FKProdutOption_Id] [bigint] NOT NULL,
	[FKProductOptionItem_Id] [bigint] NOT NULL,
 CONSTRAINT [PK__Ordersph__3214EC0706CC3BAE] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Phot_Products]    Script Date: 1/30/2020 7:50:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Phot_Products](
	[Id] [bigint] NOT NULL,
	[FKWord_Name_Id] [bigint] NOT NULL,
	[FKWord_Description_Id] [bigint] NOT NULL,
	[FKProductType_Id] [bigint] NOT NULL,
	[FKWord_UplaodFilesNotes_Id] [bigint] NOT NULL,
	[FKUser_Id] [bigint] NOT NULL,
	[IsActive] [bit] NOT NULL,
	[CreateDateTime] [datetime] NOT NULL,
	[Version] [int] NOT NULL,
	[FkProductParent_Id] [bigint] NULL,
 CONSTRAINT [PK_Phot_Products] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Phot_Products_Images]    Script Date: 1/30/2020 7:50:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Phot_Products_Images](
	[Id] [bigint] NOT NULL,
	[ImageUrl] [nvarchar](max) NOT NULL,
	[FkProduct_Id] [bigint] NOT NULL,
 CONSTRAINT [PK_Phot_Products_Images] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Phot_ProductsOptions]    Script Date: 1/30/2020 7:50:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Phot_ProductsOptions](
	[Id] [bigint] NOT NULL,
	[FKStaticField_Id] [int] NOT NULL,
	[FKProduct_Id] [bigint] NOT NULL,
 CONSTRAINT [PK_Phot_ProductsOptions] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Phot_ProductsOptionsItems]    Script Date: 1/30/2020 7:50:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Phot_ProductsOptionsItems](
	[Id] [bigint] NOT NULL,
	[FKWord_Value_Id] [bigint] NOT NULL,
	[Price] [decimal](18, 2) NOT NULL,
	[FKProductOption_Id] [bigint] NOT NULL,
 CONSTRAINT [PK_Phot_ProductsOptionsItems] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Phot_ProductTypes]    Script Date: 1/30/2020 7:50:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Phot_ProductTypes](
	[Id] [bigint] NOT NULL,
	[FKWord_Name_Id] [bigint] NOT NULL,
	[ImageUrl] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_Phot_ProductTypes] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PrintNamesTypes]    Script Date: 1/30/2020 7:50:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PrintNamesTypes](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[FKWord_Id] [bigint] NOT NULL,
	[Price] [decimal](18, 2) NOT NULL,
 CONSTRAINT [PK_PrintNamesTypes] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SocialAccountTypes]    Script Date: 1/30/2020 7:50:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SocialAccountTypes](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[FKWord_Id] [bigint] NOT NULL,
 CONSTRAINT [PK_SocialAccountTypes] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[StaticFields]    Script Date: 1/30/2020 7:50:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[StaticFields](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[FKWord_Id] [bigint] NOT NULL,
 CONSTRAINT [PK_PackageInputTypes] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UserPayments]    Script Date: 1/30/2020 7:50:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserPayments](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[Amount] [decimal](18, 2) NOT NULL,
	[DateTime] [datetime] NOT NULL,
	[IsAcceptFromManger] [bit] NULL,
	[FKUserTo_Id] [bigint] NOT NULL,
	[FKUserFrom_Id] [bigint] NOT NULL,
	[Notes] [nvarchar](max) NULL,
	[PaymentImage] [nvarchar](max) NULL,
	[IsBankTransfer] [bit] NULL,
 CONSTRAINT [PK_UserPayments] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UserPrivileges]    Script Date: 1/30/2020 7:50:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserPrivileges](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[FKPage_Id] [int] NOT NULL,
	[FkUser_Id] [bigint] NOT NULL,
	[CanAdd] [bit] NOT NULL,
	[CanEdit] [bit] NOT NULL,
	[CanDelete] [bit] NOT NULL,
	[CanDisplay] [bit] NOT NULL,
 CONSTRAINT [PK_UserPrivileges] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 1/30/2020 7:50:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[Id] [bigint] NOT NULL,
	[UserName] [nvarchar](50) NOT NULL,
	[Email] [nvarchar](50) NULL,
	[PhoneNo] [nvarchar](50) NULL,
	[Address] [nvarchar](250) NULL,
	[Password] [nvarchar](50) NOT NULL,
	[ActiveCode] [nvarchar](50) NULL,
	[FKAccountType_Id] [int] NOT NULL,
	[FkCountry_Id] [int] NULL,
	[FkCity_Id] [int] NULL,
	[FKLanguage_Id] [int] NOT NULL,
	[CreateDateTime] [datetime] NOT NULL,
	[FKPranch_Id] [int] NULL,
	[IsActiveEmail] [bit] NOT NULL,
	[DateOfBirth] [date] NULL,
	[IsActive] [bit] NOT NULL,
	[FullName] [nvarchar](150) NULL,
	[NationalityNumber] [nvarchar](20) NULL,
	[WebSite] [nvarchar](500) NULL,
 CONSTRAINT [PK_Users] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UserSocialAccounts]    Script Date: 1/30/2020 7:50:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserSocialAccounts](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[FKSocialAccountType_Id] [int] NOT NULL,
	[Link] [nvarchar](max) NOT NULL,
	[FKUser_Id] [bigint] NOT NULL,
 CONSTRAINT [PK_UserSocialAccounts] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[WorkTypes]    Script Date: 1/30/2020 7:50:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[WorkTypes](
	[Id] [int] NOT NULL,
	[FKWord_Id] [bigint] NOT NULL,
	[PageUrl] [nvarchar](50) NULL,
 CONSTRAINT [PK_WorkTypes] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[AccountTypes] ON 
GO
INSERT [dbo].[AccountTypes] ([Id], [FkWord_Id]) VALUES (1, 1)
GO
INSERT [dbo].[AccountTypes] ([Id], [FkWord_Id]) VALUES (2, 4)
GO
INSERT [dbo].[AccountTypes] ([Id], [FkWord_Id]) VALUES (3, 5)
GO
INSERT [dbo].[AccountTypes] ([Id], [FkWord_Id]) VALUES (4, 6)
GO
INSERT [dbo].[AccountTypes] ([Id], [FkWord_Id]) VALUES (5, 20180)
GO
INSERT [dbo].[AccountTypes] ([Id], [FkWord_Id]) VALUES (6, 30258)
GO
INSERT [dbo].[AccountTypes] ([Id], [FkWord_Id]) VALUES (7, 30266)
GO
SET IDENTITY_INSERT [dbo].[AccountTypes] OFF
GO
SET IDENTITY_INSERT [dbo].[Albums] ON 
GO
INSERT [dbo].[Albums] ([Id], [FKWord_Id], [FKWord_Description_Id]) VALUES (17, 40609, 40610)
GO
SET IDENTITY_INSERT [dbo].[Albums] OFF
GO
SET IDENTITY_INSERT [dbo].[AlbumsFiles] ON 
GO
INSERT [dbo].[AlbumsFiles] ([Id], [FileUrl], [FKAlbum_Id]) VALUES (36, N'/Files/Albums/Image372c98a2-a9a2-48f4-9c06-098321e823e5.jpg', 17)
GO
INSERT [dbo].[AlbumsFiles] ([Id], [FileUrl], [FKAlbum_Id]) VALUES (37, N'/Files/Albums/Imagef9e5ceab-14f5-40e1-af44-e57295522236.jpg', 17)
GO
INSERT [dbo].[AlbumsFiles] ([Id], [FileUrl], [FKAlbum_Id]) VALUES (38, N'/Files/Albums/Imagec56fab93-deeb-41ef-a133-77294dedb33e.jpg', 17)
GO
INSERT [dbo].[AlbumsFiles] ([Id], [FileUrl], [FKAlbum_Id]) VALUES (39, N'/Files/Albums/Image4888f6c5-5ea1-4df9-b4a6-a8a4986addc3.jpg', 17)
GO
SET IDENTITY_INSERT [dbo].[AlbumsFiles] OFF
GO
SET IDENTITY_INSERT [dbo].[Branches] ON 
GO
INSERT [dbo].[Branches] ([Id], [Address], [PhoneNo], [FkCountry_Id], [FKCity_Id], [FKWord_Id], [IsBasic], [FKArchivingAndSaveingEmployee_Id], [FKImplementationEmployeeId_Id], [FKCoordinationEmployee_Id], [FKArchivingAndSaveingAnotherBranch_Id]) VALUES (7, N'سي', N'01025249400', 15, 10, 40455, 0, 20057, 20056, 20055, 8)
GO
INSERT [dbo].[Branches] ([Id], [Address], [PhoneNo], [FkCountry_Id], [FKCity_Id], [FKWord_Id], [IsBasic], [FKArchivingAndSaveingEmployee_Id], [FKImplementationEmployeeId_Id], [FKCoordinationEmployee_Id], [FKArchivingAndSaveingAnotherBranch_Id]) VALUES (8, N'سيسي', N'01025249400', 15, 11, 40506, 1, 30063, 30063, 30063, 7)
GO
SET IDENTITY_INSERT [dbo].[Branches] OFF
GO
SET IDENTITY_INSERT [dbo].[Cities] ON 
GO
INSERT [dbo].[Cities] ([Id], [FKWord_Id], [FKCountry_Id], [ShippingPrice]) VALUES (10, 30222, 15, CAST(50.000000000000 AS Decimal(18, 12)))
GO
INSERT [dbo].[Cities] ([Id], [FKWord_Id], [FKCountry_Id], [ShippingPrice]) VALUES (11, 30223, 15, CAST(120.000000000000 AS Decimal(18, 12)))
GO
INSERT [dbo].[Cities] ([Id], [FKWord_Id], [FKCountry_Id], [ShippingPrice]) VALUES (12, 40525, 15, CAST(15.000000000000 AS Decimal(18, 12)))
GO
SET IDENTITY_INSERT [dbo].[Cities] OFF
GO
SET IDENTITY_INSERT [dbo].[Countries] ON 
GO
INSERT [dbo].[Countries] ([Id], [FKWord_Id], [IsoCode]) VALUES (15, 30221, N'02')
GO
INSERT [dbo].[Countries] ([Id], [FKWord_Id], [IsoCode]) VALUES (16, 40353, N'563')
GO
SET IDENTITY_INSERT [dbo].[Countries] OFF
GO
INSERT [dbo].[Enquires] ([Id], [FirstName], [LastName], [PhoneNo], [FkCountry_Id], [FkCity_Id], [FKEnquiryType_Id], [FKUserCreated_Id], [CreateDateTime], [Day], [Month], [Year], [FKBranch_Id], [IsLinkedClinet], [IsClosed], [ClosedDateTime], [IsWithBranch], [FkClinet_Id], [IsCreatedEvent], [FKPhoneCountry_Id]) VALUES (1, N'sd', N'sd', N'01025249400', 15, 10, 16, 5, CAST(N'2019-11-07T23:52:37.503' AS DateTime), 7, 11, 2019, 7, 1, NULL, NULL, 1, NULL, 0, 16)
GO
SET IDENTITY_INSERT [dbo].[EnquiryPayments] ON 
GO
INSERT [dbo].[EnquiryPayments] ([Id], [Amount], [IsDeposit], [IsBankTransfer], [TransferImage], [IsAcceptFromManger], [DateTime], [FKEnquiry_Id], [FKUserCreated_Id]) VALUES (20032, CAST(300.00 AS Decimal(18, 2)), 1, 0, NULL, 1, CAST(N'2019-11-07T23:52:58.260' AS DateTime), 1, 5)
GO
SET IDENTITY_INSERT [dbo].[EnquiryPayments] OFF
GO
SET IDENTITY_INSERT [dbo].[EnquiryStatus] ON 
GO
INSERT [dbo].[EnquiryStatus] ([Id], [Notes], [DateTime], [ScheduleVisitDateTime], [FKEnquiry_Id], [FKEnquiryStatus_Id], [FKUserCreated_Id], [FKEnquiryPayment_Id], [ScheduleVisitDateClendarEventId]) VALUES (20073, NULL, CAST(N'2019-11-07T23:52:37.937' AS DateTime), NULL, 1, 9, 5, NULL, NULL)
GO
INSERT [dbo].[EnquiryStatus] ([Id], [Notes], [DateTime], [ScheduleVisitDateTime], [FKEnquiry_Id], [FKEnquiryStatus_Id], [FKUserCreated_Id], [FKEnquiryPayment_Id], [ScheduleVisitDateClendarEventId]) VALUES (20074, NULL, CAST(N'2019-11-07T23:52:58.253' AS DateTime), NULL, 1, 7, 5, 20032, NULL)
GO
INSERT [dbo].[EnquiryStatus] ([Id], [Notes], [DateTime], [ScheduleVisitDateTime], [FKEnquiry_Id], [FKEnquiryStatus_Id], [FKUserCreated_Id], [FKEnquiryPayment_Id], [ScheduleVisitDateClendarEventId]) VALUES (20075, NULL, CAST(N'2019-11-07T23:53:27.490' AS DateTime), NULL, 1, 10, 5, NULL, NULL)
GO
INSERT [dbo].[EnquiryStatus] ([Id], [Notes], [DateTime], [ScheduleVisitDateTime], [FKEnquiry_Id], [FKEnquiryStatus_Id], [FKUserCreated_Id], [FKEnquiryPayment_Id], [ScheduleVisitDateClendarEventId]) VALUES (20076, NULL, CAST(N'2019-11-07T23:53:31.977' AS DateTime), NULL, 1, 10, 5, NULL, NULL)
GO
INSERT [dbo].[EnquiryStatus] ([Id], [Notes], [DateTime], [ScheduleVisitDateTime], [FKEnquiry_Id], [FKEnquiryStatus_Id], [FKUserCreated_Id], [FKEnquiryPayment_Id], [ScheduleVisitDateClendarEventId]) VALUES (20077, NULL, CAST(N'2019-11-07T23:53:34.430' AS DateTime), NULL, 1, 10, 5, NULL, NULL)
GO
SET IDENTITY_INSERT [dbo].[EnquiryStatus] OFF
GO
INSERT [dbo].[EnquiryStatusTypes] ([Id], [FKWord_Id]) VALUES (1, 78)
GO
INSERT [dbo].[EnquiryStatusTypes] ([Id], [FKWord_Id]) VALUES (2, 79)
GO
INSERT [dbo].[EnquiryStatusTypes] ([Id], [FKWord_Id]) VALUES (3, 80)
GO
INSERT [dbo].[EnquiryStatusTypes] ([Id], [FKWord_Id]) VALUES (4, 81)
GO
INSERT [dbo].[EnquiryStatusTypes] ([Id], [FKWord_Id]) VALUES (5, 82)
GO
INSERT [dbo].[EnquiryStatusTypes] ([Id], [FKWord_Id]) VALUES (6, 92)
GO
INSERT [dbo].[EnquiryStatusTypes] ([Id], [FKWord_Id]) VALUES (7, 93)
GO
INSERT [dbo].[EnquiryStatusTypes] ([Id], [FKWord_Id]) VALUES (8, 94)
GO
INSERT [dbo].[EnquiryStatusTypes] ([Id], [FKWord_Id]) VALUES (9, 40507)
GO
INSERT [dbo].[EnquiryStatusTypes] ([Id], [FKWord_Id]) VALUES (10, 40508)
GO
INSERT [dbo].[EnquiryStatusTypes] ([Id], [FKWord_Id]) VALUES (11, 40509)
GO
INSERT [dbo].[EnquiryStatusTypes] ([Id], [FKWord_Id]) VALUES (12, 40510)
GO
SET IDENTITY_INSERT [dbo].[EnquiryTypes] ON 
GO
INSERT [dbo].[EnquiryTypes] ([Id], [FKWord_Id]) VALUES (7, 42)
GO
INSERT [dbo].[EnquiryTypes] ([Id], [FKWord_Id]) VALUES (8, 43)
GO
INSERT [dbo].[EnquiryTypes] ([Id], [FKWord_Id]) VALUES (9, 44)
GO
INSERT [dbo].[EnquiryTypes] ([Id], [FKWord_Id]) VALUES (15, 30226)
GO
INSERT [dbo].[EnquiryTypes] ([Id], [FKWord_Id]) VALUES (16, 40456)
GO
SET IDENTITY_INSERT [dbo].[EnquiryTypes] OFF
GO
INSERT [dbo].[EventArchiveDetails] ([Id], [FKEvent_Id], [FKEventArchive_Id], [MemoryId], [MemoryType], [PhotoStartName], [PhotoNumberFrom], [PhotoNumberTo], [Notes], [DateTime]) VALUES (1, 24, 1, N'2454', N'54', N'sd', 5, 2, NULL, CAST(N'2019-08-23T23:30:19.390' AS DateTime))
GO
INSERT [dbo].[EventArchiveDetails] ([Id], [FKEvent_Id], [FKEventArchive_Id], [MemoryId], [MemoryType], [PhotoStartName], [PhotoNumberFrom], [PhotoNumberTo], [Notes], [DateTime]) VALUES (2, 1, 1, N'001', N'sam', N'axz', 51, 100, NULL, CAST(N'2019-10-19T23:14:47.407' AS DateTime))
GO
INSERT [dbo].[EventArchiveDetails] ([Id], [FKEvent_Id], [FKEventArchive_Id], [MemoryId], [MemoryType], [PhotoStartName], [PhotoNumberFrom], [PhotoNumberTo], [Notes], [DateTime]) VALUES (3, 1, 1, N'002', N'sam', N'axz', 51, 100, NULL, CAST(N'2019-10-19T23:15:13.443' AS DateTime))
GO
SET IDENTITY_INSERT [dbo].[EventSurveyQuestions] ON 
GO
INSERT [dbo].[EventSurveyQuestions] ([Id], [IsDefault], [FKSurveyQuestionType_Id], [FKEvent_Id], [IsActive]) VALUES (7, 1, 4, NULL, 1)
GO
INSERT [dbo].[EventSurveyQuestions] ([Id], [IsDefault], [FKSurveyQuestionType_Id], [FKEvent_Id], [IsActive]) VALUES (8, 1, 3, NULL, 1)
GO
INSERT [dbo].[EventSurveyQuestions] ([Id], [IsDefault], [FKSurveyQuestionType_Id], [FKEvent_Id], [IsActive]) VALUES (9, 1, 5, NULL, 1)
GO
SET IDENTITY_INSERT [dbo].[EventSurveyQuestions] OFF
GO
SET IDENTITY_INSERT [dbo].[EventSurveyQuestionTypes] ON 
GO
INSERT [dbo].[EventSurveyQuestionTypes] ([Id], [FKWord_Id], [InputType]) VALUES (3, 30307, 0)
GO
INSERT [dbo].[EventSurveyQuestionTypes] ([Id], [FKWord_Id], [InputType]) VALUES (4, 30308, 0)
GO
INSERT [dbo].[EventSurveyQuestionTypes] ([Id], [FKWord_Id], [InputType]) VALUES (5, 30310, 0)
GO
SET IDENTITY_INSERT [dbo].[EventSurveyQuestionTypes] OFF
GO
SET IDENTITY_INSERT [dbo].[FilesReceivedTypes] ON 
GO
INSERT [dbo].[FilesReceivedTypes] ([Id], [FKWord_Id]) VALUES (2, 30317)
GO
INSERT [dbo].[FilesReceivedTypes] ([Id], [FKWord_Id]) VALUES (3, 30318)
GO
SET IDENTITY_INSERT [dbo].[FilesReceivedTypes] OFF
GO
SET IDENTITY_INSERT [dbo].[Languages] ON 
GO
INSERT [dbo].[Languages] ([Id], [Code], [Name]) VALUES (1, N'en', N'English')
GO
INSERT [dbo].[Languages] ([Id], [Code], [Name]) VALUES (2, N'ar', N'Arabic')
GO
SET IDENTITY_INSERT [dbo].[Languages] OFF
GO
SET IDENTITY_INSERT [dbo].[Menus] ON 
GO
INSERT [dbo].[Menus] ([Id], [CssClass], [OrderByNumber], [Parent_Id], [FKWord_Id]) VALUES (1, N'fas fa-cogs', 1, NULL, 2)
GO
INSERT [dbo].[Menus] ([Id], [CssClass], [OrderByNumber], [Parent_Id], [FKWord_Id]) VALUES (2, N'fas fa-users-cog', 2, NULL, 7)
GO
INSERT [dbo].[Menus] ([Id], [CssClass], [OrderByNumber], [Parent_Id], [FKWord_Id]) VALUES (3, N'fab fa-wpforms', 3, NULL, 33)
GO
INSERT [dbo].[Menus] ([Id], [CssClass], [OrderByNumber], [Parent_Id], [FKWord_Id]) VALUES (4, N'flaticon2-photo-camera
', 5, NULL, 10142)
GO
INSERT [dbo].[Menus] ([Id], [CssClass], [OrderByNumber], [Parent_Id], [FKWord_Id]) VALUES (5, N'fas fa-hand-holding-heart', 4, NULL, 20149)
GO
INSERT [dbo].[Menus] ([Id], [CssClass], [OrderByNumber], [Parent_Id], [FKWord_Id]) VALUES (6, N'fa fa-chart-line', 1, 4, 30304)
GO
INSERT [dbo].[Menus] ([Id], [CssClass], [OrderByNumber], [Parent_Id], [FKWord_Id]) VALUES (7, N'fab fa-product-hunt', 6, NULL, 40619)
GO
INSERT [dbo].[Menus] ([Id], [CssClass], [OrderByNumber], [Parent_Id], [FKWord_Id]) VALUES (8, N'fas fa-cart-arrow-down', 7, NULL, 40667)
GO
SET IDENTITY_INSERT [dbo].[Menus] OFF
GO
SET IDENTITY_INSERT [dbo].[Packages] ON 
GO
INSERT [dbo].[Packages] ([Id], [FkWordName_Id], [IsPrintNamesFree], [FkWordDescription_Id], [FKAlbumType_Id], [Price], [NamsArExtraPrice]) VALUES (1007, 40611, 0, 40612, 17, CAST(20.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)))
GO
SET IDENTITY_INSERT [dbo].[Packages] OFF
GO
INSERT [dbo].[Pages] ([Id], [FKWord_Id], [Url], [FkMenu_Id], [OrderByNumber], [IsForClient], [IsForAdmin], [IsHide]) VALUES (1, 3, N'/UsersPrivileges', 2, 1, 0, 1, 0)
GO
INSERT [dbo].[Pages] ([Id], [FKWord_Id], [Url], [FkMenu_Id], [OrderByNumber], [IsForClient], [IsForAdmin], [IsHide]) VALUES (2, 12, N'/Users', 2, 1, 0, 1, 0)
GO
INSERT [dbo].[Pages] ([Id], [FKWord_Id], [Url], [FkMenu_Id], [OrderByNumber], [IsForClient], [IsForAdmin], [IsHide]) VALUES (3, 13, N'/Countries', 1, 1, 0, 1, 0)
GO
INSERT [dbo].[Pages] ([Id], [FKWord_Id], [Url], [FkMenu_Id], [OrderByNumber], [IsForClient], [IsForAdmin], [IsHide]) VALUES (4, 34, N'/EnquiryTypes', 3, 1, 0, 1, 0)
GO
INSERT [dbo].[Pages] ([Id], [FKWord_Id], [Url], [FkMenu_Id], [OrderByNumber], [IsForClient], [IsForAdmin], [IsHide]) VALUES (5, 41, N'/Enquires', 3, 2, 0, 1, 0)
GO
INSERT [dbo].[Pages] ([Id], [FKWord_Id], [Url], [FkMenu_Id], [OrderByNumber], [IsForClient], [IsForAdmin], [IsHide]) VALUES (6, 45, N'/Branches', 1, 2, 0, 1, 0)
GO
INSERT [dbo].[Pages] ([Id], [FKWord_Id], [Url], [FkMenu_Id], [OrderByNumber], [IsForClient], [IsForAdmin], [IsHide]) VALUES (7, 50, N'/MyEnquires', 3, 1, 1, 0, 0)
GO
INSERT [dbo].[Pages] ([Id], [FKWord_Id], [Url], [FkMenu_Id], [OrderByNumber], [IsForClient], [IsForAdmin], [IsHide]) VALUES (8, 51, N'/MyEnquires/AddAndUpdate', 3, 2, 1, 0, 0)
GO
INSERT [dbo].[Pages] ([Id], [FKWord_Id], [Url], [FkMenu_Id], [OrderByNumber], [IsForClient], [IsForAdmin], [IsHide]) VALUES (9, 51, N'/Enquires/AddAndUpdate', 3, 2, 0, 1, 0)
GO
INSERT [dbo].[Pages] ([Id], [FKWord_Id], [Url], [FkMenu_Id], [OrderByNumber], [IsForClient], [IsForAdmin], [IsHide]) VALUES (10, 85, N'/', 2, 3, 0, 1, 1)
GO
INSERT [dbo].[Pages] ([Id], [FKWord_Id], [Url], [FkMenu_Id], [OrderByNumber], [IsForClient], [IsForAdmin], [IsHide]) VALUES (11, 10088, N'/PrintNamesTypes', 5, 3, 0, 1, 0)
GO
INSERT [dbo].[Pages] ([Id], [FKWord_Id], [Url], [FkMenu_Id], [OrderByNumber], [IsForClient], [IsForAdmin], [IsHide]) VALUES (12, 10141, N'/Events', 4, 1, 0, 1, 0)
GO
INSERT [dbo].[Pages] ([Id], [FKWord_Id], [Url], [FkMenu_Id], [OrderByNumber], [IsForClient], [IsForAdmin], [IsHide]) VALUES (13, 10141, N'/MyEvents', 4, 1, 1, 0, 0)
GO
INSERT [dbo].[Pages] ([Id], [FKWord_Id], [Url], [FkMenu_Id], [OrderByNumber], [IsForClient], [IsForAdmin], [IsHide]) VALUES (14, 20147, N'/Packages', 5, 4, 0, 1, 0)
GO
INSERT [dbo].[Pages] ([Id], [FKWord_Id], [Url], [FkMenu_Id], [OrderByNumber], [IsForClient], [IsForAdmin], [IsHide]) VALUES (15, 20148, N'/Albums', 5, 2, 0, 1, 0)
GO
INSERT [dbo].[Pages] ([Id], [FKWord_Id], [Url], [FkMenu_Id], [OrderByNumber], [IsForClient], [IsForAdmin], [IsHide]) VALUES (16, 20150, N'/StaticFields', 1, 3, 0, 1, 0)
GO
INSERT [dbo].[Pages] ([Id], [FKWord_Id], [Url], [FkMenu_Id], [OrderByNumber], [IsForClient], [IsForAdmin], [IsHide]) VALUES (17, 30260, N'/SocialAccountTypes', 1, 1, 0, 1, 0)
GO
INSERT [dbo].[Pages] ([Id], [FKWord_Id], [Url], [FkMenu_Id], [OrderByNumber], [IsForClient], [IsForAdmin], [IsHide]) VALUES (18, 30269, N'/UserPayments/Payments', 2, 4, 0, 1, 1)
GO
INSERT [dbo].[Pages] ([Id], [FKWord_Id], [Url], [FkMenu_Id], [OrderByNumber], [IsForClient], [IsForAdmin], [IsHide]) VALUES (19, 30270, N'/EnquiryPayments/Payments', 3, 4, 0, 1, 1)
GO
INSERT [dbo].[Pages] ([Id], [FKWord_Id], [Url], [FkMenu_Id], [OrderByNumber], [IsForClient], [IsForAdmin], [IsHide]) VALUES (20, 30303, N'/EventSurveyQuestionTypes', 6, 1, 0, 1, 0)
GO
INSERT [dbo].[Pages] ([Id], [FKWord_Id], [Url], [FkMenu_Id], [OrderByNumber], [IsForClient], [IsForAdmin], [IsHide]) VALUES (21, 30309, N'/EventSurveyQuestions', 6, 2, 0, 1, 0)
GO
INSERT [dbo].[Pages] ([Id], [FKWord_Id], [Url], [FkMenu_Id], [OrderByNumber], [IsForClient], [IsForAdmin], [IsHide]) VALUES (22, 30315, N'/FilesReceivedTypes', 1, 5, 0, 1, 0)
GO
INSERT [dbo].[Pages] ([Id], [FKWord_Id], [Url], [FkMenu_Id], [OrderByNumber], [IsForClient], [IsForAdmin], [IsHide]) VALUES (23, 40620, N'/ProductTypes', 7, 2, 0, 1, 0)
GO
INSERT [dbo].[Pages] ([Id], [FKWord_Id], [Url], [FkMenu_Id], [OrderByNumber], [IsForClient], [IsForAdmin], [IsHide]) VALUES (24, 40631, N'/Products', 7, 3, 0, 1, 0)
GO
INSERT [dbo].[Pages] ([Id], [FKWord_Id], [Url], [FkMenu_Id], [OrderByNumber], [IsForClient], [IsForAdmin], [IsHide]) VALUES (25, 40649, N'/ShippingCategories', 7, 1, 0, 1, 0)
GO
INSERT [dbo].[Pages] ([Id], [FKWord_Id], [Url], [FkMenu_Id], [OrderByNumber], [IsForClient], [IsForAdmin], [IsHide]) VALUES (26, 40667, N'/PhotoOrdersMangment', 8, 1, 0, 1, 0)
GO
INSERT [dbo].[Phot_OrderPayments] ([Id], [FkOrder_Id], [PaymentDateTime], [IsBankTransfer], [IsAcceptFromManger], [FKUserCreated_Id], [Amount], [TransferImage], [AcceptNotes], [AcceptDateTime]) VALUES (1, 1, CAST(N'2019-12-11T21:55:21.523' AS DateTime), 1, 1, 30061, CAST(500.00 AS Decimal(18, 2)), N'/Files/Orders/Payments/Imageb7c543bf-960a-4fcf-9aef-2e684479f7a3.jpg', N'الملغ لم يحو ل', CAST(N'2019-12-11T22:37:51.923' AS DateTime))
GO
INSERT [dbo].[Phot_OrderServicePrices] ([Id], [FkOrder_Id], [FkUser_Id], [FKWord_Id], [Price], [CreateDateTime]) VALUES (1, 1, 30061, 40540, CAST(587.00 AS Decimal(18, 2)), CAST(N'2019-12-11T21:42:37.840' AS DateTime))
GO
INSERT [dbo].[Phot_OrderServicePrices] ([Id], [FkOrder_Id], [FkUser_Id], [FKWord_Id], [Price], [CreateDateTime]) VALUES (2, 1, 30061, 30244, CAST(60.00 AS Decimal(18, 2)), CAST(N'2019-12-11T21:42:37.857' AS DateTime))
GO
INSERT [dbo].[Phot_OrderServicePrices] ([Id], [FkOrder_Id], [FkUser_Id], [FKWord_Id], [Price], [CreateDateTime]) VALUES (3, 1, 30061, 40814, CAST(50.00 AS Decimal(18, 2)), CAST(N'2019-12-11T21:42:37.900' AS DateTime))
GO
INSERT [dbo].[Phot_Products] ([Id], [FKWord_Name_Id], [FKWord_Description_Id], [FKProductType_Id], [FKWord_UplaodFilesNotes_Id], [FKUser_Id], [IsActive], [CreateDateTime], [Version], [FkProductParent_Id]) VALUES (1, 40792, 40793, 3, 40794, 5, 1, CAST(N'2019-12-11T21:11:20.233' AS DateTime), 1, NULL)
GO
INSERT [dbo].[Phot_Products] ([Id], [FKWord_Name_Id], [FKWord_Description_Id], [FKProductType_Id], [FKWord_UplaodFilesNotes_Id], [FKUser_Id], [IsActive], [CreateDateTime], [Version], [FkProductParent_Id]) VALUES (2, 40803, 40804, 3, 40805, 5, 1, CAST(N'2019-12-11T21:11:46.360' AS DateTime), 2, 1)
GO
INSERT [dbo].[Phot_Products_Images] ([Id], [ImageUrl], [FkProduct_Id]) VALUES (1, N'/Files/Products/Imagedaa91f22-9851-4d06-ad7f-63ea94eb5ad0.jpeg', 1)
GO
INSERT [dbo].[Phot_Products_Images] ([Id], [ImageUrl], [FkProduct_Id]) VALUES (2, N'/Files/Products/Imagedeae8c9c-ba05-45e5-8a42-068135d1f776.jpg', 2)
GO
INSERT [dbo].[Phot_Products_Images] ([Id], [ImageUrl], [FkProduct_Id]) VALUES (3, N'/Files/Products/Imaged8c2dde9-e81c-4753-accd-ba295f3f7051.jpg', 2)
GO
INSERT [dbo].[Phot_ProductsOptions] ([Id], [FKStaticField_Id], [FKProduct_Id]) VALUES (1, 11, 1)
GO
INSERT [dbo].[Phot_ProductsOptions] ([Id], [FKStaticField_Id], [FKProduct_Id]) VALUES (2, 9, 1)
GO
INSERT [dbo].[Phot_ProductsOptions] ([Id], [FKStaticField_Id], [FKProduct_Id]) VALUES (3, 11, 2)
GO
INSERT [dbo].[Phot_ProductsOptions] ([Id], [FKStaticField_Id], [FKProduct_Id]) VALUES (4, 9, 2)
GO
INSERT [dbo].[Phot_ProductsOptionsItems] ([Id], [FKWord_Value_Id], [Price], [FKProductOption_Id]) VALUES (1, 40795, CAST(600.00 AS Decimal(18, 2)), 1)
GO
INSERT [dbo].[Phot_ProductsOptionsItems] ([Id], [FKWord_Value_Id], [Price], [FKProductOption_Id]) VALUES (2, 40796, CAST(587.00 AS Decimal(18, 2)), 1)
GO
INSERT [dbo].[Phot_ProductsOptionsItems] ([Id], [FKWord_Value_Id], [Price], [FKProductOption_Id]) VALUES (3, 40797, CAST(500.00 AS Decimal(18, 2)), 1)
GO
INSERT [dbo].[Phot_ProductsOptionsItems] ([Id], [FKWord_Value_Id], [Price], [FKProductOption_Id]) VALUES (4, 40798, CAST(90.00 AS Decimal(18, 2)), 2)
GO
INSERT [dbo].[Phot_ProductsOptionsItems] ([Id], [FKWord_Value_Id], [Price], [FKProductOption_Id]) VALUES (5, 40799, CAST(80.00 AS Decimal(18, 2)), 2)
GO
INSERT [dbo].[Phot_ProductsOptionsItems] ([Id], [FKWord_Value_Id], [Price], [FKProductOption_Id]) VALUES (6, 40800, CAST(70.00 AS Decimal(18, 2)), 2)
GO
INSERT [dbo].[Phot_ProductsOptionsItems] ([Id], [FKWord_Value_Id], [Price], [FKProductOption_Id]) VALUES (7, 40801, CAST(60.00 AS Decimal(18, 2)), 2)
GO
INSERT [dbo].[Phot_ProductsOptionsItems] ([Id], [FKWord_Value_Id], [Price], [FKProductOption_Id]) VALUES (8, 40802, CAST(50.00 AS Decimal(18, 2)), 2)
GO
INSERT [dbo].[Phot_ProductsOptionsItems] ([Id], [FKWord_Value_Id], [Price], [FKProductOption_Id]) VALUES (9, 40806, CAST(600.00 AS Decimal(18, 2)), 3)
GO
INSERT [dbo].[Phot_ProductsOptionsItems] ([Id], [FKWord_Value_Id], [Price], [FKProductOption_Id]) VALUES (10, 40807, CAST(587.00 AS Decimal(18, 2)), 3)
GO
INSERT [dbo].[Phot_ProductsOptionsItems] ([Id], [FKWord_Value_Id], [Price], [FKProductOption_Id]) VALUES (11, 40808, CAST(500.00 AS Decimal(18, 2)), 3)
GO
INSERT [dbo].[Phot_ProductsOptionsItems] ([Id], [FKWord_Value_Id], [Price], [FKProductOption_Id]) VALUES (12, 40809, CAST(90.00 AS Decimal(18, 2)), 4)
GO
INSERT [dbo].[Phot_ProductsOptionsItems] ([Id], [FKWord_Value_Id], [Price], [FKProductOption_Id]) VALUES (13, 40810, CAST(80.00 AS Decimal(18, 2)), 4)
GO
INSERT [dbo].[Phot_ProductsOptionsItems] ([Id], [FKWord_Value_Id], [Price], [FKProductOption_Id]) VALUES (14, 40811, CAST(70.00 AS Decimal(18, 2)), 4)
GO
INSERT [dbo].[Phot_ProductsOptionsItems] ([Id], [FKWord_Value_Id], [Price], [FKProductOption_Id]) VALUES (15, 40812, CAST(60.00 AS Decimal(18, 2)), 4)
GO
INSERT [dbo].[Phot_ProductsOptionsItems] ([Id], [FKWord_Value_Id], [Price], [FKProductOption_Id]) VALUES (16, 40813, CAST(50.00 AS Decimal(18, 2)), 4)
GO
INSERT [dbo].[Phot_ProductTypes] ([Id], [FKWord_Name_Id], [ImageUrl]) VALUES (1, 40777, N'/Files/Products/Types/Imaged45a582e-3369-46fb-a543-e238d3665264.jpg')
GO
INSERT [dbo].[Phot_ProductTypes] ([Id], [FKWord_Name_Id], [ImageUrl]) VALUES (2, 40778, N'/Files/Products/Types/Imagec6753002-c50b-44ad-9ea9-150403c2b56d.jpg')
GO
INSERT [dbo].[Phot_ProductTypes] ([Id], [FKWord_Name_Id], [ImageUrl]) VALUES (3, 40779, N'/Files/Products/Types/Image46b03ae4-dce6-4a06-a679-9b00fb130b86.jpg')
GO
INSERT [dbo].[Phot_ProductTypes] ([Id], [FKWord_Name_Id], [ImageUrl]) VALUES (4, 40780, N'/Files/Products/Types/Image930cb401-5c8b-43a3-91ab-36dc3cc9586a.jpg')
GO
INSERT [dbo].[Phot_ProductTypes] ([Id], [FKWord_Name_Id], [ImageUrl]) VALUES (5, 40781, N'/Files/Products/Types/Image6962455f-330d-41fb-a708-aef287dfb534.jpg')
GO
INSERT [dbo].[Phot_ProductTypes] ([Id], [FKWord_Name_Id], [ImageUrl]) VALUES (6, 40782, N'/Files/Products/Types/Imageef9c5ff8-f534-4105-9992-ee3defd3696f.jpg')
GO
INSERT [dbo].[Phot_ProductTypes] ([Id], [FKWord_Name_Id], [ImageUrl]) VALUES (7, 40783, N'/Files/Products/Types/Image9adddd21-a805-4a92-b00b-15eb279494d8.jpg')
GO
INSERT [dbo].[Phot_ProductTypes] ([Id], [FKWord_Name_Id], [ImageUrl]) VALUES (8, 40784, N'/Files/Products/Types/Image0e58ea41-dde3-4a47-9dbb-6365fec98b97.jpg')
GO
INSERT [dbo].[Phot_ProductTypes] ([Id], [FKWord_Name_Id], [ImageUrl]) VALUES (9, 40785, N'/Files/Products/Types/Image2a5ceffb-eb1f-41b7-aff3-c67231727010.jpg')
GO
INSERT [dbo].[Phot_ProductTypes] ([Id], [FKWord_Name_Id], [ImageUrl]) VALUES (10, 40786, N'/Files/Products/Types/Image8572c8ab-a94e-442d-83cd-c46048e31085.jpg')
GO
INSERT [dbo].[Phot_ProductTypes] ([Id], [FKWord_Name_Id], [ImageUrl]) VALUES (11, 40787, N'/Files/Products/Types/Image576e53f0-362a-43c1-abad-e4dd2a2517bc.jpg')
GO
INSERT [dbo].[Phot_ProductTypes] ([Id], [FKWord_Name_Id], [ImageUrl]) VALUES (12, 40788, N'/Files/Products/Types/Image4fc92719-a887-4f53-ad9c-2dfce762dbcf.jpg')
GO
INSERT [dbo].[Phot_ProductTypes] ([Id], [FKWord_Name_Id], [ImageUrl]) VALUES (13, 40789, N'/Files/Products/Types/Image9a5a5b37-6fb5-4185-a911-60174bfe74e7.jpeg')
GO
INSERT [dbo].[Phot_ProductTypes] ([Id], [FKWord_Name_Id], [ImageUrl]) VALUES (14, 40790, N'/Files/Products/Types/Image26f15e14-ef14-4821-974c-e93ed249f752.jpg')
GO
INSERT [dbo].[Phot_ProductTypes] ([Id], [FKWord_Name_Id], [ImageUrl]) VALUES (15, 40791, N'/Files/Products/Types/Image8453444d-9c7c-43e6-beb0-bf7e94bd88f0.jpeg')
GO
SET IDENTITY_INSERT [dbo].[PrintNamesTypes] ON 
GO
INSERT [dbo].[PrintNamesTypes] ([Id], [FKWord_Id], [Price]) VALUES (9, 40384, CAST(500.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[PrintNamesTypes] ([Id], [FKWord_Id], [Price]) VALUES (10, 40475, CAST(55.00 AS Decimal(18, 2)))
GO
SET IDENTITY_INSERT [dbo].[PrintNamesTypes] OFF
GO
SET IDENTITY_INSERT [dbo].[SocialAccountTypes] ON 
GO
INSERT [dbo].[SocialAccountTypes] ([Id], [FKWord_Id]) VALUES (1, 30259)
GO
SET IDENTITY_INSERT [dbo].[SocialAccountTypes] OFF
GO
SET IDENTITY_INSERT [dbo].[StaticFields] ON 
GO
INSERT [dbo].[StaticFields] ([Id], [FKWord_Id]) VALUES (9, 30244)
GO
INSERT [dbo].[StaticFields] ([Id], [FKWord_Id]) VALUES (10, 40473)
GO
INSERT [dbo].[StaticFields] ([Id], [FKWord_Id]) VALUES (11, 40540)
GO
INSERT [dbo].[StaticFields] ([Id], [FKWord_Id]) VALUES (1012, 40614)
GO
INSERT [dbo].[StaticFields] ([Id], [FKWord_Id]) VALUES (1016, 40618)
GO
SET IDENTITY_INSERT [dbo].[StaticFields] OFF
GO
SET IDENTITY_INSERT [dbo].[UserPayments] ON 
GO
INSERT [dbo].[UserPayments] ([Id], [Amount], [DateTime], [IsAcceptFromManger], [FKUserTo_Id], [FKUserFrom_Id], [Notes], [PaymentImage], [IsBankTransfer]) VALUES (20, CAST(50.00 AS Decimal(18, 2)), CAST(N'2019-07-31T23:59:38.367' AS DateTime), 1, 10028, 10020, NULL, N'/Files/Users/Payments/Image1a1ca705-e368-4ce6-821b-ba56072b2f17.JPG', NULL)
GO
INSERT [dbo].[UserPayments] ([Id], [Amount], [DateTime], [IsAcceptFromManger], [FKUserTo_Id], [FKUserFrom_Id], [Notes], [PaymentImage], [IsBankTransfer]) VALUES (21, CAST(22.00 AS Decimal(18, 2)), CAST(N'2019-08-01T00:02:40.277' AS DateTime), 0, 10028, 10020, N'yyyy', NULL, NULL)
GO
INSERT [dbo].[UserPayments] ([Id], [Amount], [DateTime], [IsAcceptFromManger], [FKUserTo_Id], [FKUserFrom_Id], [Notes], [PaymentImage], [IsBankTransfer]) VALUES (22, CAST(50.00 AS Decimal(18, 2)), CAST(N'2019-08-01T00:16:24.327' AS DateTime), 1, 10028, 10020, NULL, NULL, 1)
GO
INSERT [dbo].[UserPayments] ([Id], [Amount], [DateTime], [IsAcceptFromManger], [FKUserTo_Id], [FKUserFrom_Id], [Notes], [PaymentImage], [IsBankTransfer]) VALUES (23, CAST(50.00 AS Decimal(18, 2)), CAST(N'2019-08-01T00:30:34.047' AS DateTime), 1, 10028, 5, NULL, N'/Files/Users/Payments/Image091ed1bc-15b9-4378-99d0-b72d9b6f5445.jpg', 1)
GO
INSERT [dbo].[UserPayments] ([Id], [Amount], [DateTime], [IsAcceptFromManger], [FKUserTo_Id], [FKUserFrom_Id], [Notes], [PaymentImage], [IsBankTransfer]) VALUES (24, CAST(50.00 AS Decimal(18, 2)), CAST(N'2019-08-01T00:30:42.780' AS DateTime), 1, 10028, 5, NULL, NULL, NULL)
GO
INSERT [dbo].[UserPayments] ([Id], [Amount], [DateTime], [IsAcceptFromManger], [FKUserTo_Id], [FKUserFrom_Id], [Notes], [PaymentImage], [IsBankTransfer]) VALUES (10017, CAST(50.00 AS Decimal(18, 2)), CAST(N'2019-08-03T14:30:06.423' AS DateTime), 1, 20025, 10020, NULL, N'/Files/Users/Payments/Image02c0c190-9483-4125-9981-04a85a610bbe.jpg', NULL)
GO
INSERT [dbo].[UserPayments] ([Id], [Amount], [DateTime], [IsAcceptFromManger], [FKUserTo_Id], [FKUserFrom_Id], [Notes], [PaymentImage], [IsBankTransfer]) VALUES (10018, CAST(100.00 AS Decimal(18, 2)), CAST(N'2019-08-03T14:45:15.727' AS DateTime), 1, 20025, 10020, NULL, N'/Files/Users/Payments/Imageefee2a83-68cb-4c4d-8c77-24497ae676cb.jpg', 1)
GO
INSERT [dbo].[UserPayments] ([Id], [Amount], [DateTime], [IsAcceptFromManger], [FKUserTo_Id], [FKUserFrom_Id], [Notes], [PaymentImage], [IsBankTransfer]) VALUES (10019, CAST(80.00 AS Decimal(18, 2)), CAST(N'2019-08-03T15:10:34.530' AS DateTime), 1, 20025, 5, NULL, N'/Files/Users/Payments/Image5c582081-e0b0-42fa-8eba-ec97f22fb9a6.jpg', NULL)
GO
INSERT [dbo].[UserPayments] ([Id], [Amount], [DateTime], [IsAcceptFromManger], [FKUserTo_Id], [FKUserFrom_Id], [Notes], [PaymentImage], [IsBankTransfer]) VALUES (10020, CAST(90.00 AS Decimal(18, 2)), CAST(N'2019-08-03T15:18:28.203' AS DateTime), 1, 20025, 5, NULL, N'/Files/Users/Payments/Imagefa9d1a10-476e-4544-80a8-56b20acedb8a.jpg', 1)
GO
INSERT [dbo].[UserPayments] ([Id], [Amount], [DateTime], [IsAcceptFromManger], [FKUserTo_Id], [FKUserFrom_Id], [Notes], [PaymentImage], [IsBankTransfer]) VALUES (10021, CAST(55.00 AS Decimal(18, 2)), CAST(N'2019-08-03T18:43:38.443' AS DateTime), 1, 10024, 5, NULL, NULL, NULL)
GO
INSERT [dbo].[UserPayments] ([Id], [Amount], [DateTime], [IsAcceptFromManger], [FKUserTo_Id], [FKUserFrom_Id], [Notes], [PaymentImage], [IsBankTransfer]) VALUES (10022, CAST(55.00 AS Decimal(18, 2)), CAST(N'2019-08-03T18:43:44.273' AS DateTime), 1, 10024, 5, NULL, NULL, NULL)
GO
INSERT [dbo].[UserPayments] ([Id], [Amount], [DateTime], [IsAcceptFromManger], [FKUserTo_Id], [FKUserFrom_Id], [Notes], [PaymentImage], [IsBankTransfer]) VALUES (10023, CAST(56666.00 AS Decimal(18, 2)), CAST(N'2019-08-03T18:43:53.120' AS DateTime), 1, 10024, 5, NULL, NULL, NULL)
GO
INSERT [dbo].[UserPayments] ([Id], [Amount], [DateTime], [IsAcceptFromManger], [FKUserTo_Id], [FKUserFrom_Id], [Notes], [PaymentImage], [IsBankTransfer]) VALUES (10024, CAST(50.00 AS Decimal(18, 2)), CAST(N'2019-10-22T22:42:14.347' AS DateTime), 1, 20062, 5, NULL, N'/Files/Users/Payments/Image1ab76765-38c2-4c85-a15d-425d3f8700e0.jpg', 1)
GO
INSERT [dbo].[UserPayments] ([Id], [Amount], [DateTime], [IsAcceptFromManger], [FKUserTo_Id], [FKUserFrom_Id], [Notes], [PaymentImage], [IsBankTransfer]) VALUES (10025, CAST(500.00 AS Decimal(18, 2)), CAST(N'2019-10-22T22:48:21.277' AS DateTime), 0, 20062, 20058, N'sd', NULL, NULL)
GO
INSERT [dbo].[UserPayments] ([Id], [Amount], [DateTime], [IsAcceptFromManger], [FKUserTo_Id], [FKUserFrom_Id], [Notes], [PaymentImage], [IsBankTransfer]) VALUES (10026, CAST(5050.00 AS Decimal(18, 2)), CAST(N'2019-10-22T23:06:03.153' AS DateTime), NULL, 20062, 20058, NULL, NULL, NULL)
GO
INSERT [dbo].[UserPayments] ([Id], [Amount], [DateTime], [IsAcceptFromManger], [FKUserTo_Id], [FKUserFrom_Id], [Notes], [PaymentImage], [IsBankTransfer]) VALUES (10027, CAST(50.00 AS Decimal(18, 2)), CAST(N'2019-10-22T23:06:38.727' AS DateTime), 1, 20062, 5, NULL, NULL, NULL)
GO
INSERT [dbo].[UserPayments] ([Id], [Amount], [DateTime], [IsAcceptFromManger], [FKUserTo_Id], [FKUserFrom_Id], [Notes], [PaymentImage], [IsBankTransfer]) VALUES (20024, CAST(200.00 AS Decimal(18, 2)), CAST(N'2019-10-23T20:06:40.277' AS DateTime), 1, 20062, 20058, NULL, NULL, 0)
GO
INSERT [dbo].[UserPayments] ([Id], [Amount], [DateTime], [IsAcceptFromManger], [FKUserTo_Id], [FKUserFrom_Id], [Notes], [PaymentImage], [IsBankTransfer]) VALUES (20025, CAST(1000.00 AS Decimal(18, 2)), CAST(N'2019-10-23T20:09:14.637' AS DateTime), 1, 20062, 5, NULL, N'/Files/Users/Payments/Image248b47ab-57f8-4791-972c-e0edda719bb5.jpg', 1)
GO
SET IDENTITY_INSERT [dbo].[UserPayments] OFF
GO
INSERT [dbo].[Users] ([Id], [UserName], [Email], [PhoneNo], [Address], [Password], [ActiveCode], [FKAccountType_Id], [FkCountry_Id], [FkCity_Id], [FKLanguage_Id], [CreateDateTime], [FKPranch_Id], [IsActiveEmail], [DateOfBirth], [IsActive], [FullName], [NationalityNumber], [WebSite]) VALUES (5, N'ahmed', N'a0hed@gmail.com', N'01025249400', N'dfdfdfdfdffdfdfdfssssd', N'123456', NULL, 1, NULL, NULL, 2, CAST(N'2020-01-01T00:00:00.000' AS DateTime), NULL, 0, NULL, 1, N'lmmmmmmmmmmmm', N'11111111111112', N'http://localhost:33752/Users/ProfileUpdate')
GO
INSERT [dbo].[Words] ([Id], [Ar], [En]) VALUES (1, N'مدير المشروع', N'Project Manager ')
GO
INSERT [dbo].[Words] ([Id], [Ar], [En]) VALUES (2, N'الاعدادت', N'Setting')
GO
INSERT [dbo].[Words] ([Id], [Ar], [En]) VALUES (3, N'صلاحيات الستخدم', N'Users Privileges')
GO
INSERT [dbo].[Words] ([Id], [Ar], [En]) VALUES (4, N'مشرف', N'Supervisor')
GO
INSERT [dbo].[Words] ([Id], [Ar], [En]) VALUES (5, N'مدير فرع', N'Branch Manager')
GO
INSERT [dbo].[Words] ([Id], [Ar], [En]) VALUES (6, N'عميل', N'Clinet')
GO
INSERT [dbo].[Words] ([Id], [Ar], [En]) VALUES (7, N'المستخدمين', N'Users')
GO
INSERT [dbo].[Words] ([Id], [Ar], [En]) VALUES (8, N'مصر', N'Egypt')
GO
INSERT [dbo].[Words] ([Id], [Ar], [En]) VALUES (9, N'الكويت', N'kuwait')
GO
INSERT [dbo].[Words] ([Id], [Ar], [En]) VALUES (10, N'القاهرة', N'cairo')
GO
INSERT [dbo].[Words] ([Id], [Ar], [En]) VALUES (12, N'المستخدمين', N'Users')
GO
INSERT [dbo].[Words] ([Id], [Ar], [En]) VALUES (13, N'الدول', N'Countries')
GO
INSERT [dbo].[Words] ([Id], [Ar], [En]) VALUES (33, N'الاستفسارات', N'Enquires')
GO
INSERT [dbo].[Words] ([Id], [Ar], [En]) VALUES (34, N'انواع الاستفسارات', N'Enquiry Types')
GO
INSERT [dbo].[Words] ([Id], [Ar], [En]) VALUES (41, N'الاستفسارات', N'Enquires')
GO
INSERT [dbo].[Words] ([Id], [Ar], [En]) VALUES (42, N'عبر الواتساب', N'By Whatssp')
GO
INSERT [dbo].[Words] ([Id], [Ar], [En]) VALUES (43, N'عبر الفيس بوك', N'By FaceBook')
GO
INSERT [dbo].[Words] ([Id], [Ar], [En]) VALUES (44, N'عبر الهاتف', N'By Phone')
GO
INSERT [dbo].[Words] ([Id], [Ar], [En]) VALUES (45, N'فروع الشركة', N'Branches')
GO
INSERT [dbo].[Words] ([Id], [Ar], [En]) VALUES (47, N'جدة', N'Gada')
GO
INSERT [dbo].[Words] ([Id], [Ar], [En]) VALUES (48, N'المدينة المنورة', N'Medina')
GO
INSERT [dbo].[Words] ([Id], [Ar], [En]) VALUES (50, N'استفسارتى', N'My Enquires')
GO
INSERT [dbo].[Words] ([Id], [Ar], [En]) VALUES (51, N'اضافة استفسار جديد', N'Add New Enquiry')
GO
INSERT [dbo].[Words] ([Id], [Ar], [En]) VALUES (52, N' استفسار جدبد', N'New Enquiry')
GO
INSERT [dbo].[Words] ([Id], [Ar], [En]) VALUES (53, N'لقد قام العميل ahmed10  بنشاء استفسار جديد', N'ahmed10 Has been created new enqiry')
GO
INSERT [dbo].[Words] ([Id], [Ar], [En]) VALUES (54, N' استفسار جدبد', N'New Enquiry')
GO
INSERT [dbo].[Words] ([Id], [Ar], [En]) VALUES (55, N'لقد قام العميل ahmed10  بنشاء استفسار جديد', N'ahmed10 Has been created new enqiry')
GO
INSERT [dbo].[Words] ([Id], [Ar], [En]) VALUES (56, N' استفسار جدبد', N'New Enquiry')
GO
INSERT [dbo].[Words] ([Id], [Ar], [En]) VALUES (57, N'لقد قام العميل ahmed10  بنشاء استفسار جديد', N'ahmed10 Has been created new enqiry')
GO
INSERT [dbo].[Words] ([Id], [Ar], [En]) VALUES (58, N' استفسار جدبد', N'New Enquiry')
GO
INSERT [dbo].[Words] ([Id], [Ar], [En]) VALUES (59, N'لقد قام العميل ahmed10  بنشاء استفسار جديد', N'ahmed10 Has been created new enqiry')
GO
INSERT [dbo].[Words] ([Id], [Ar], [En]) VALUES (60, N' استفسار جدبد', N'New Enquiry')
GO
INSERT [dbo].[Words] ([Id], [Ar], [En]) VALUES (61, N'لقد قام العميل ahmed10  بنشاء استفسار جديد', N'ahmed10 Has been created new enqiry')
GO
INSERT [dbo].[Words] ([Id], [Ar], [En]) VALUES (62, N' استفسار جدبد', N'New Enquiry')
GO
INSERT [dbo].[Words] ([Id], [Ar], [En]) VALUES (63, N'لقد قام العميل ahmed10  بنشاء استفسار جديد', N'ahmed10 Has been created new enqiry')
GO
INSERT [dbo].[Words] ([Id], [Ar], [En]) VALUES (64, N' استفسار جدبد', N'New Enquiry')
GO
INSERT [dbo].[Words] ([Id], [Ar], [En]) VALUES (65, N'لقد قام العميل ahmed10  بنشاء استفسار جديد', N'ahmed10 Has been created new enqiry')
GO
INSERT [dbo].[Words] ([Id], [Ar], [En]) VALUES (66, N' استفسار جدبد', N'New Enquiry')
GO
INSERT [dbo].[Words] ([Id], [Ar], [En]) VALUES (67, N'لقد قام العميل ahmed10  بنشاء استفسار جديد', N'ahmed10 Has been created new enqiry')
GO
INSERT [dbo].[Words] ([Id], [Ar], [En]) VALUES (68, N' استفسار جدبد', N'New Enquiry')
GO
INSERT [dbo].[Words] ([Id], [Ar], [En]) VALUES (69, N'لقد قام العميل ahmed10  بنشاء استفسار جديد', N'ahmed10 Has been created new enqiry')
GO
INSERT [dbo].[Words] ([Id], [Ar], [En]) VALUES (70, N' استفسار جدبد', N'New Enquiry')
GO
INSERT [dbo].[Words] ([Id], [Ar], [En]) VALUES (71, N'لقد قام العميل ahmed10  بنشاء استفسار جديد', N'ahmed10 Has been created new enqiry')
GO
INSERT [dbo].[Words] ([Id], [Ar], [En]) VALUES (72, N' استفسار جدبد', N'New Enquiry')
GO
INSERT [dbo].[Words] ([Id], [Ar], [En]) VALUES (73, N'لقد قام العميل ahmed10  بنشاء استفسار جديد', N'ahmed10 Has been created new enqiry')
GO
INSERT [dbo].[Words] ([Id], [Ar], [En]) VALUES (74, N' استفسار جدبد', N'New Enquiry')
GO
INSERT [dbo].[Words] ([Id], [Ar], [En]) VALUES (75, N'لقد قام العميل ahmed10  بنشاء استفسار جديد', N'ahmed10 Has been created new enqiry')
GO
INSERT [dbo].[Words] ([Id], [Ar], [En]) VALUES (76, N' استفسار جدبد', N'New Enquiry')
GO
INSERT [dbo].[Words] ([Id], [Ar], [En]) VALUES (77, N'لقد قام العميل ahmed10  بنشاء استفسار جديد', N'ahmed10 Has been created new enqiry')
GO
INSERT [dbo].[Words] ([Id], [Ar], [En]) VALUES (78, N'العميل لم يرد', N'Not Answer ')
GO
INSERT [dbo].[Words] ([Id], [Ar], [En]) VALUES (79, N'تم التواصل مع العميل ', N'Customer Contacted')
GO
INSERT [dbo].[Words] ([Id], [Ar], [En]) VALUES (80, N'رفض الخدمة ', N'Reject Service')
GO
INSERT [dbo].[Words] ([Id], [Ar], [En]) VALUES (81, N'الموافقة التامة', N'Full Approval')
GO
INSERT [dbo].[Words] ([Id], [Ar], [En]) VALUES (82, N'تحديد موعد للزيارة ', N' Schedule a Visit')
GO
INSERT [dbo].[Words] ([Id], [Ar], [En]) VALUES (83, N' استفسار جدبد', N'New Enquiry')
GO
INSERT [dbo].[Words] ([Id], [Ar], [En]) VALUES (84, N'لقد قام العميل ahmed10  بنشاء استفسار جديد', N'ahmed10 Has been created new enqiry')
GO
INSERT [dbo].[Words] ([Id], [Ar], [En]) VALUES (85, N'معلومات المستخدم', N'User Information')
GO
INSERT [dbo].[Words] ([Id], [Ar], [En]) VALUES (86, N' استفسار جدبد', N'New Enquiry')
GO
INSERT [dbo].[Words] ([Id], [Ar], [En]) VALUES (87, N'لقد قامت الآدارة بنشاء استفسار جديد', N'Manger Has been created new enqiry')
GO
INSERT [dbo].[Words] ([Id], [Ar], [En]) VALUES (88, N' استفسار جدبد', N'New Enquiry')
GO
INSERT [dbo].[Words] ([Id], [Ar], [En]) VALUES (89, N'لقد قامت الآدارة تحويل استفسار جديد لك', N'Manger Has been Convert New Enqiry For You')
GO
INSERT [dbo].[Words] ([Id], [Ar], [En]) VALUES (90, N'اضافة حالة جديدة على استفسار ما', N'Add New Status On Some Enquiry')
GO
INSERT [dbo].[Words] ([Id], [Ar], [En]) VALUES (91, N'لقد قام branch بـ وضع حالة جديد   ', N'branch Has Been Add New Status')
GO
INSERT [dbo].[Words] ([Id], [Ar], [En]) VALUES (92, N'يحتاج للتفكير ', N'Needs To Think')
GO
INSERT [dbo].[Words] ([Id], [Ar], [En]) VALUES (93, N'الحجز بواسطة الدفع الكاش', N'Book By Cash')
GO
INSERT [dbo].[Words] ([Id], [Ar], [En]) VALUES (94, N'الحجز بواسطة الحوالة البنكية', N'Book By Bank Transfer')
GO
INSERT [dbo].[Words] ([Id], [Ar], [En]) VALUES (10088, N'انواع حفر الاسماء', N'Print Names Types')
GO
INSERT [dbo].[Words] ([Id], [Ar], [En]) VALUES (10089, N'dfdf', N'dfdf')
GO
INSERT [dbo].[Words] ([Id], [Ar], [En]) VALUES (10090, N'dssd', N'sdsd`')
GO
INSERT [dbo].[Words] ([Id], [Ar], [En]) VALUES (10091, N'sd', N'dsdضضضض')
GO
INSERT [dbo].[Words] ([Id], [Ar], [En]) VALUES (10092, N'سي', N'سيسي')
GO
INSERT [dbo].[Words] ([Id], [Ar], [En]) VALUES (10096, N'sdsd', N'dfdf')
GO
INSERT [dbo].[Words] ([Id], [Ar], [En]) VALUES (10099, N'حفر 1', N'p1')
GO
INSERT [dbo].[Words] ([Id], [Ar], [En]) VALUES (10100, N'حفر 2', N'p2sddddddddd')
GO
INSERT [dbo].[Words] ([Id], [Ar], [En]) VALUES (10101, N' استفسار جدبد', N'New Enquiry')
GO
INSERT [dbo].[Words] ([Id], [Ar], [En]) VALUES (10102, N'لقد قام المدير بنشاء استفسار جديد', N'Manger Has been created new enqiry')
GO
INSERT [dbo].[Words] ([Id], [Ar], [En]) VALUES (10103, N'اضافة حالة جديدة على استفسار ما', N'Add New Status On Some Enquiry')
GO
INSERT [dbo].[Words] ([Id], [Ar], [En]) VALUES (10104, N'لقد قام branch بـ وضع حالة جديد   ', N'branch Has Been Add New Status')
GO
INSERT [dbo].[Words] ([Id], [Ar], [En]) VALUES (10105, N'اضافة حالة جديدة على استفسار ما', N'Add New Status On Some Enquiry')
GO
INSERT [dbo].[Words] ([Id], [Ar], [En]) VALUES (10106, N'لقد قام branch بـ وضع حالة جديد   ', N'branch Has Been Add New Status')
GO
INSERT [dbo].[Words] ([Id], [Ar], [En]) VALUES (10107, N'اضافة حالة جديدة على استفسار ما', N'Add New Status On Some Enquiry')
GO
INSERT [dbo].[Words] ([Id], [Ar], [En]) VALUES (10108, N'لقد قام branch بـ وضع حالة جديد   ', N'branch Has Been Add New Status')
GO
INSERT [dbo].[Words] ([Id], [Ar], [En]) VALUES (10109, N'اضافة حالة جديدة على استفسار ما', N'Add New Status On Some Enquiry')
GO
INSERT [dbo].[Words] ([Id], [Ar], [En]) VALUES (10110, N'لقد قام branch بـ وضع حالة جديد   ', N'branch Has Been Add New Status')
GO
INSERT [dbo].[Words] ([Id], [Ar], [En]) VALUES (10111, N'اضافة حالة جديدة على استفسار ما', N'Add New Status On Some Enquiry')
GO
INSERT [dbo].[Words] ([Id], [Ar], [En]) VALUES (10112, N'لقد قام branch بـ وضع حالة جديد   ', N'branch Has Been Add New Status')
GO
INSERT [dbo].[Words] ([Id], [Ar], [En]) VALUES (10113, N'اضافة حالة جديدة على استفسار ما', N'Add New Status On Some Enquiry')
GO
INSERT [dbo].[Words] ([Id], [Ar], [En]) VALUES (10114, N'لقد قام branch بـ وضع حالة جديد   ', N'branch Has Been Add New Status')
GO
INSERT [dbo].[Words] ([Id], [Ar], [En]) VALUES (10115, N'اضافة حالة جديدة على استفسار ما', N'Add New Status On Some Enquiry')
GO
INSERT [dbo].[Words] ([Id], [Ar], [En]) VALUES (10116, N'لقد قام branch بـ وضع حالة جديد   ', N'branch Has Been Add New Status')
GO
INSERT [dbo].[Words] ([Id], [Ar], [En]) VALUES (10117, N'اضافة حالة جديدة على استفسار ما', N'Add New Status On Some Enquiry')
GO
INSERT [dbo].[Words] ([Id], [Ar], [En]) VALUES (10118, N'لقد قام branch بـ وضع حالة جديد   ', N'branch Has Been Add New Status')
GO
INSERT [dbo].[Words] ([Id], [Ar], [En]) VALUES (10119, N' استفسار جدبد', N'New Enquiry')
GO
INSERT [dbo].[Words] ([Id], [Ar], [En]) VALUES (10120, N'لقد قام المدير بنشاء استفسار جديد', N'Manger Has been created new enqiry')
GO
INSERT [dbo].[Words] ([Id], [Ar], [En]) VALUES (10121, N'اضافة حالة جديدة على استفسار ما', N'Add New Status On Some Enquiry')
GO
INSERT [dbo].[Words] ([Id], [Ar], [En]) VALUES (10122, N'لقد قام branch بـ وضع حالة جديد   ', N'branch Has Been Add New Status')
GO
INSERT [dbo].[Words] ([Id], [Ar], [En]) VALUES (10123, N'اضافة حالة جديدة على استفسار ما', N'Add New Status On Some Enquiry')
GO
INSERT [dbo].[Words] ([Id], [Ar], [En]) VALUES (10124, N'لقد قام branch بـ وضع حالة جديد   ', N'branch Has Been Add New Status')
GO
INSERT [dbo].[Words] ([Id], [Ar], [En]) VALUES (10125, N'اضافة حالة جديدة على استفسار ما', N'Add New Status On Some Enquiry')
GO
INSERT [dbo].[Words] ([Id], [Ar], [En]) VALUES (10126, N'لقد قام branch بـ وضع حالة جديد   ', N'branch Has Been Add New Status')
GO
INSERT [dbo].[Words] ([Id], [Ar], [En]) VALUES (10127, N'اضافة حالة جديدة على استفسار ما', N'Add New Status On Some Enquiry')
GO
INSERT [dbo].[Words] ([Id], [Ar], [En]) VALUES (10128, N'لقد قام branch بـ وضع حالة جديد   ', N'branch Has Been Add New Status')
GO
INSERT [dbo].[Words] ([Id], [Ar], [En]) VALUES (10129, N'اضافة حالة جديدة على استفسار ما', N'Add New Status On Some Enquiry')
GO
INSERT [dbo].[Words] ([Id], [Ar], [En]) VALUES (10130, N'لقد قام branch بـ وضع حالة جديد   ', N'branch Has Been Add New Status')
GO
INSERT [dbo].[Words] ([Id], [Ar], [En]) VALUES (10131, N'اضافة حالة جديدة على استفسار ما', N'Add New Status On Some Enquiry')
GO
INSERT [dbo].[Words] ([Id], [Ar], [En]) VALUES (10132, N'لقد قام branch بـ وضع حالة جديد   ', N'branch Has Been Add New Status')
GO
INSERT [dbo].[Words] ([Id], [Ar], [En]) VALUES (10133, N'اضافة حالة جديدة على استفسار ما', N'Add New Status On Some Enquiry')
GO
INSERT [dbo].[Words] ([Id], [Ar], [En]) VALUES (10134, N'لقد قام branch بـ وضع حالة جديد   ', N'branch Has Been Add New Status')
GO
INSERT [dbo].[Words] ([Id], [Ar], [En]) VALUES (10135, N'اضافة حالة جديدة على استفسار ما', N'Add New Status On Some Enquiry')
GO
INSERT [dbo].[Words] ([Id], [Ar], [En]) VALUES (10136, N'لقد قام branch بـ وضع حالة جديد   ', N'branch Has Been Add New Status')
GO
INSERT [dbo].[Words] ([Id], [Ar], [En]) VALUES (10137, N'اضافة حالة جديدة على استفسار ما', N'Add New Status On Some Enquiry')
GO
INSERT [dbo].[Words] ([Id], [Ar], [En]) VALUES (10138, N'لقد قام branch بـ وضع حالة جديد   ', N'branch Has Been Add New Status')
GO
INSERT [dbo].[Words] ([Id], [Ar], [En]) VALUES (10139, N'اضافة حالة جديدة على استفسار ما', N'Add New Status On Some Enquiry')
GO
INSERT [dbo].[Words] ([Id], [Ar], [En]) VALUES (10140, N'لقد قام branch بـ وضع حالة جديد   ', N'branch Has Been Add New Status')
GO
INSERT [dbo].[Words] ([Id], [Ar], [En]) VALUES (10141, N'المناسبات', N'Events')
GO
INSERT [dbo].[Words] ([Id], [Ar], [En]) VALUES (10142, N'المناسبات', N'Events')
GO
INSERT [dbo].[Words] ([Id], [Ar], [En]) VALUES (10143, N'تجربة', N'tese')
GO
INSERT [dbo].[Words] ([Id], [Ar], [En]) VALUES (10144, N'لقج تم انشاء حدث جديد', N'Created New Event')
GO
INSERT [dbo].[Words] ([Id], [Ar], [En]) VALUES (10145, N'لقد قام مدير فرع جدة بـ انشاء حدث جديد ', N'Gada Branch Manger Has Been Created New Event')
GO
INSERT [dbo].[Words] ([Id], [Ar], [En]) VALUES (10146, N'لقج تم انشاء حدث جديد', N'Created New Event')
GO
INSERT [dbo].[Words] ([Id], [Ar], [En]) VALUES (10147, N'لقد قام مدير فرع جدة بـ انشاء حدث جديد ', N'Gada Branch Manger Has Been Created New Event')
GO
INSERT [dbo].[Words] ([Id], [Ar], [En]) VALUES (20146, N'مناسباتى', N'MyEvents')
GO
INSERT [dbo].[Words] ([Id], [Ar], [En]) VALUES (20147, N'الباكيجات', N'Packages')
GO
INSERT [dbo].[Words] ([Id], [Ar], [En]) VALUES (20148, N'انواع الالبومات', N'Album Types')
GO
INSERT [dbo].[Words] ([Id], [Ar], [En]) VALUES (20149, N'الباكيجات', N'Packages')
GO
INSERT [dbo].[Words] ([Id], [Ar], [En]) VALUES (20150, N'الحثقول الثابتة', N'Static Fields')
GO
INSERT [dbo].[Words] ([Id], [Ar], [En]) VALUES (20151, N'سيسي', N'سيسي')
GO
INSERT [dbo].[Words] ([Id], [Ar], [En]) VALUES (20152, N'سيسي', N'يسيسي\')
GO
INSERT [dbo].[Words] ([Id], [Ar], [En]) VALUES (20153, N'البوم 1', N'album 1')
GO
INSERT [dbo].[Words] ([Id], [Ar], [En]) VALUES (20154, N'asas', N'sdsdsdsdsd55522')
GO
INSERT [dbo].[Words] ([Id], [Ar], [En]) VALUES (20155, N'fdf', N'dfdf')
GO
INSERT [dbo].[Words] ([Id], [Ar], [En]) VALUES (20156, N'cvcv000000', N'fdf')
GO
INSERT [dbo].[Words] ([Id], [Ar], [En]) VALUES (20157, N'dfdfq', N',fdklfj')
GO
INSERT [dbo].[Words] ([Id], [Ar], [En]) VALUES (20158, N'idojfdlfnl', N'dsdfkjsf')
GO
INSERT [dbo].[Words] ([Id], [Ar], [En]) VALUES (20159, N'dsdsd', N'vv')
GO
INSERT [dbo].[Words] ([Id], [Ar], [En]) VALUES (20161, N'صث', N'صث')
GO
INSERT [dbo].[Words] ([Id], [Ar], [En]) VALUES (20162, N'صث', N'صث')
GO
INSERT [dbo].[Words] ([Id], [Ar], [En]) VALUES (20163, N'صث', N'صث')
GO
INSERT [dbo].[Words] ([Id], [Ar], [En]) VALUES (20164, N'd', N'ds')
GO
INSERT [dbo].[Words] ([Id], [Ar], [En]) VALUES (20165, N'd', N'ds')
GO
INSERT [dbo].[Words] ([Id], [Ar], [En]) VALUES (20166, N'd', N'ds')
GO
INSERT [dbo].[Words] ([Id], [Ar], [En]) VALUES (20167, N'يسسي', N'sasas')
GO
INSERT [dbo].[Words] ([Id], [Ar], [En]) VALUES (20168, N'dsd', N'sdsd')
GO
INSERT [dbo].[Words] ([Id], [Ar], [En]) VALUES (20169, N'sdsd', N'sdsd')
GO
INSERT [dbo].[Words] ([Id], [Ar], [En]) VALUES (20170, N'sd', N'sd')
GO
INSERT [dbo].[Words] ([Id], [Ar], [En]) VALUES (20179, N'sdsd', N'ssdsd')
GO
INSERT [dbo].[Words] ([Id], [Ar], [En]) VALUES (20180, N'موظف', N'Employee')
GO
INSERT [dbo].[Words] ([Id], [Ar], [En]) VALUES (20181, N'الحجز', N'Booking')
GO
INSERT [dbo].[Words] ([Id], [Ar], [En]) VALUES (20182, N'اكمال البيانات', N'Data Perfection')
GO
INSERT [dbo].[Words] ([Id], [Ar], [En]) VALUES (20183, N'الاعداد والتنسيق', N'Coordination')
GO
INSERT [dbo].[Words] ([Id], [Ar], [En]) VALUES (20184, N'التنفيذ', N'Implementation')
GO
INSERT [dbo].[Words] ([Id], [Ar], [En]) VALUES (20185, N'الأرشفة و الحفظ', N'Archiving and Saveing')
GO
INSERT [dbo].[Words] ([Id], [Ar], [En]) VALUES (20186, N'تجهيز المنتاجات', N'Product processing')
GO
INSERT [dbo].[Words] ([Id], [Ar], [En]) VALUES (20187, N'الاختيار', N'Chooseing')
GO
INSERT [dbo].[Words] ([Id], [Ar], [En]) VALUES (20188, N'المعالجة الرقمية', N'Digital processing')
GO
INSERT [dbo].[Words] ([Id], [Ar], [En]) VALUES (20189, N'الاعداد للطباعة', N'Preparing for printing')
GO
INSERT [dbo].[Words] ([Id], [Ar], [En]) VALUES (20190, N'التصنيع', N'Manufacturing')
GO
INSERT [dbo].[Words] ([Id], [Ar], [En]) VALUES (20191, N'الجودة و المراجعة', N'Quality and review')
GO
INSERT [dbo].[Words] ([Id], [Ar], [En]) VALUES (20192, N'التغليف', N'Packaging')
GO
INSERT [dbo].[Words] ([Id], [Ar], [En]) VALUES (20193, N'الارسال و التسليم', N'Transmission and delivery
')
GO
INSERT [dbo].[Words] ([Id], [Ar], [En]) VALUES (20194, N'الأرشفة', N'Archiving')
GO
INSERT [dbo].[Words] ([Id], [Ar], [En]) VALUES (20195, N'عملية دفع جديدة', N'New Payment Process')
GO
INSERT [dbo].[Words] ([Id], [Ar], [En]) VALUES (20196, N'لقد قام الموظف   branch باضافة عملية دفع عن طريق حولة بنكية وقيمتها 20', N'branch Has been Add Payment Process By Bank Transfer And It Is Valaue 20')
GO
INSERT [dbo].[Words] ([Id], [Ar], [En]) VALUES (20197, N'عملية دفع جديدة', N'New Payment Process')
GO
INSERT [dbo].[Words] ([Id], [Ar], [En]) VALUES (20198, N'لقد قام الموظف   branch باضافة عملية دفع عن طريق حولة بنكية وقيمتها 20', N'branch Has been Add Payment Process By Bank Transfer And It Is Valaue 20')
GO
INSERT [dbo].[Words] ([Id], [Ar], [En]) VALUES (20199, N'اضافة حالة جديدة على استفسار ما', N'Add New Status On Some Enquiry')
GO
INSERT [dbo].[Words] ([Id], [Ar], [En]) VALUES (20200, N'لقد قام branch بـ وضع حالة جديد   ', N'branch Has Been Add New Status')
GO
INSERT [dbo].[Words] ([Id], [Ar], [En]) VALUES (20201, N'اضافة حالة جديدة على استفسار ما', N'Add New Status On Some Enquiry')
GO
INSERT [dbo].[Words] ([Id], [Ar], [En]) VALUES (20202, N'لقد قام branch بـ وضع حالة جديد   ', N'branch Has Been Add New Status')
GO
INSERT [dbo].[Words] ([Id], [Ar], [En]) VALUES (20203, N'بيانات المدفوعات', N'Payments Informations')
GO
INSERT [dbo].[Words] ([Id], [Ar], [En]) VALUES (20204, N'عملية دفع جديدة', N'New Payment Process')
GO
INSERT [dbo].[Words] ([Id], [Ar], [En]) VALUES (20205, N'لقد قام الموظف   branch باضافة عملية دفع عن طريق حولة بنكية وقيمتها 2000', N'branch Has been Add Payment Process By Bank Transfer And It Is Valaue 2000')
GO
INSERT [dbo].[Words] ([Id], [Ar], [En]) VALUES (20206, N'اضافة حالة جديدة على استفسار ما', N'Add New Status On Some Enquiry')
GO
INSERT [dbo].[Words] ([Id], [Ar], [En]) VALUES (20207, N'لقد قام branch بـ وضع حالة جديد   ', N'branch Has Been Add New Status')
GO
INSERT [dbo].[Words] ([Id], [Ar], [En]) VALUES (20208, N'عملية دفع جديدة', N'New Payment Process')
GO
INSERT [dbo].[Words] ([Id], [Ar], [En]) VALUES (20209, N'لقد قام الموظف   branch باضافة عملية دفع عن طريق حولة بنكية وقيمتها 50', N'branch Has been Add Payment Process By Bank Transfer And It Is Valaue 50')
GO
INSERT [dbo].[Words] ([Id], [Ar], [En]) VALUES (20210, N'عملية دفع جديدة', N'New Payment Process')
GO
INSERT [dbo].[Words] ([Id], [Ar], [En]) VALUES (20211, N'لقد قام الموظف   branch باضافة عملية دفع عن طريق دفع نقدا وقيمتها 51', N'branch Has been Add Payment Process By Cash Payment And It Is Valaue 51')
GO
INSERT [dbo].[Words] ([Id], [Ar], [En]) VALUES (20212, N'عملية دفع جديدة', N'New Payment Process')
GO
INSERT [dbo].[Words] ([Id], [Ar], [En]) VALUES (20213, N'لقد قام الموظف   ahmed باضافة عملية دفع عن طريق دفع نقدا وقيمتها 55', N'ahmed Has been Add Payment Process By Cash Payment And It Is Valaue 55')
GO
INSERT [dbo].[Words] ([Id], [Ar], [En]) VALUES (20214, N'عملية دفع جديدة', N'New Payment Process')
GO
INSERT [dbo].[Words] ([Id], [Ar], [En]) VALUES (20215, N'لقد قام المدير  باضافة عملية دفع عن طريق دفع نقدا وقيمتها 54', N'Manger Has been Add Payment Process By Cash Payment And It Is Valaue 54')
GO
INSERT [dbo].[Words] ([Id], [Ar], [En]) VALUES (20216, N'لقج تم انشاء حدث جديد', N'Created New Event')
GO
INSERT [dbo].[Words] ([Id], [Ar], [En]) VALUES (20217, N'لقد قام مدير فرع جدة بـ انشاء حدث جديد ', N'Gada Branch Manger Has Been Created New Event')
GO
INSERT [dbo].[Words] ([Id], [Ar], [En]) VALUES (20218, N'لقج تم انشاء حدث جديد', N'Created New Event')
GO
INSERT [dbo].[Words] ([Id], [Ar], [En]) VALUES (20219, N'لقد قام مدير فرع جدة بـ انشاء حدث جديد ', N'Gada Branch Manger Has Been Created New Event')
GO
INSERT [dbo].[Words] ([Id], [Ar], [En]) VALUES (20220, N' استفسار جدبد', N'New Enquiry')
GO
INSERT [dbo].[Words] ([Id], [Ar], [En]) VALUES (20221, N'لقد قام المدير بنشاء استفسار جديد', N'Manger Has been created new enqiry')
GO
INSERT [dbo].[Words] ([Id], [Ar], [En]) VALUES (20222, N'عملية دفع جديدة', N'New Payment Process')
GO
INSERT [dbo].[Words] ([Id], [Ar], [En]) VALUES (20223, N'لقد قام الموظف   branch باضافة عملية دفع عن طريق دفع نقدا وقيمتها 10', N'branch Has been Add Payment Process By Cash Payment And It Is Valaue 10')
GO
INSERT [dbo].[Words] ([Id], [Ar], [En]) VALUES (20224, N'اضافة حالة جديدة على استفسار ما', N'Add New Status On Some Enquiry')
GO
INSERT [dbo].[Words] ([Id], [Ar], [En]) VALUES (20225, N'لقد قام branch بـ وضع حالة جديد   ', N'branch Has Been Add New Status')
GO
INSERT [dbo].[Words] ([Id], [Ar], [En]) VALUES (20226, N'عملية دفع جديدة', N'New Payment Process')
GO
INSERT [dbo].[Words] ([Id], [Ar], [En]) VALUES (20227, N'لقد قام الموظف   branch باضافة عملية دفع عن طريق دفع نقدا وقيمتها 10', N'branch Has been Add Payment Process By Cash Payment And It Is Valaue 10')
GO
INSERT [dbo].[Words] ([Id], [Ar], [En]) VALUES (20228, N'اضافة حالة جديدة على استفسار ما', N'Add New Status On Some Enquiry')
GO
INSERT [dbo].[Words] ([Id], [Ar], [En]) VALUES (20229, N'لقد قام branch بـ وضع حالة جديد   ', N'branch Has Been Add New Status')
GO
INSERT [dbo].[Words] ([Id], [Ar], [En]) VALUES (20230, N'لقج تم انشاء حدث جديد', N'Created New Event')
GO
INSERT [dbo].[Words] ([Id], [Ar], [En]) VALUES (20231, N'لقد قام مدير فرع جدة بـ انشاء حدث جديد ', N'Gada Branch Manger Has Been Created New Event')
GO
INSERT [dbo].[Words] ([Id], [Ar], [En]) VALUES (20232, N'عملية دفع جديدة', N'New Payment Process')
GO
INSERT [dbo].[Words] ([Id], [Ar], [En]) VALUES (20233, N'لقد قام الموظف   branch باضافة عملية دفع عن طريق حولة بنكية وقيمتها 30', N'branch Has been Add Payment Process By Bank Transfer And It Is Valaue 30')
GO
INSERT [dbo].[Words] ([Id], [Ar], [En]) VALUES (20234, N'عملية دفع جديدة', N'New Payment Process')
GO
INSERT [dbo].[Words] ([Id], [Ar], [En]) VALUES (20235, N'لقد قام الموظف   branch باضافة عملية دفع عن طريق دفع نقدا وقيمتها 20', N'branch Has been Add Payment Process By Cash Payment And It Is Valaue 20')
GO
INSERT [dbo].[Words] ([Id], [Ar], [En]) VALUES (30220, N'مصر', N'eygept')
GO
INSERT [dbo].[Words] ([Id], [Ar], [En]) VALUES (30221, N'مصر', N'egypt')
GO
INSERT [dbo].[Words] ([Id], [Ar], [En]) VALUES (30222, N'القاهرة', N'cairo')
GO
INSERT [dbo].[Words] ([Id], [Ar], [En]) VALUES (30223, N'المنصورة', N'mansoura')
GO
INSERT [dbo].[Words] ([Id], [Ar], [En]) VALUES (30224, N'فرع المنصورة 1', N'mansoura branch 1')
GO
INSERT [dbo].[Words] ([Id], [Ar], [En]) VALUES (30225, N'فرع القاهرة 1', N'cairo branch 1')
GO
INSERT [dbo].[Words] ([Id], [Ar], [En]) VALUES (30226, N'عبر الاميل', N'by Email')
GO
INSERT [dbo].[Words] ([Id], [Ar], [En]) VALUES (30227, N' استفسار جدبد', N'New Enquiry')
GO
INSERT [dbo].[Words] ([Id], [Ar], [En]) VALUES (30228, N'لقد قام المدير بنشاء استفسار جديد', N'Manger Has been created new enqiry')
GO
INSERT [dbo].[Words] ([Id], [Ar], [En]) VALUES (30229, N'اضافة حالة جديدة على استفسار ما', N'Add New Status On Some Enquiry')
GO
INSERT [dbo].[Words] ([Id], [Ar], [En]) VALUES (30230, N'لقد قام AhmedMansBranch بـ وضع حالة جديد   ', N'AhmedMansBranch Has Been Add New Status')
GO
INSERT [dbo].[Words] ([Id], [Ar], [En]) VALUES (30231, N'اضافة حالة جديدة على استفسار ما', N'Add New Status On Some Enquiry')
GO
INSERT [dbo].[Words] ([Id], [Ar], [En]) VALUES (30232, N'لقد قام AhmedMansBranch بـ وضع حالة جديد   ', N'AhmedMansBranch Has Been Add New Status')
GO
INSERT [dbo].[Words] ([Id], [Ar], [En]) VALUES (30233, N'عملية دفع جديدة', N'New Payment Process')
GO
INSERT [dbo].[Words] ([Id], [Ar], [En]) VALUES (30234, N'لقد قام الموظف   AhmedMansBranch باضافة عملية دفع عن طريق حولة بنكية وقيمتها 50', N'AhmedMansBranch Has been Add Payment Process By Bank Transfer And It Is Valaue 50')
GO
INSERT [dbo].[Words] ([Id], [Ar], [En]) VALUES (30235, N'اضافة حالة جديدة على استفسار ما', N'Add New Status On Some Enquiry')
GO
INSERT [dbo].[Words] ([Id], [Ar], [En]) VALUES (30236, N'لقد قام AhmedMansBranch بـ وضع حالة جديد   ', N'AhmedMansBranch Has Been Add New Status')
GO
INSERT [dbo].[Words] ([Id], [Ar], [En]) VALUES (30237, N'البوم 2', N'album 2')
GO
INSERT [dbo].[Words] ([Id], [Ar], [En]) VALUES (30238, NULL, NULL)
GO
INSERT [dbo].[Words] ([Id], [Ar], [En]) VALUES (30239, NULL, NULL)
GO
INSERT [dbo].[Words] ([Id], [Ar], [En]) VALUES (30240, N'dsds', N'sdsd')
GO
INSERT [dbo].[Words] ([Id], [Ar], [En]) VALUES (30241, N'ssd', N'sdsd')
GO
INSERT [dbo].[Words] ([Id], [Ar], [En]) VALUES (30242, N'باجك جديد', N'new package')
GO
INSERT [dbo].[Words] ([Id], [Ar], [En]) VALUES (30243, N'باجك جديد
باجك جديد
باجك جديد', N'new package
new package
new package')
GO
INSERT [dbo].[Words] ([Id], [Ar], [En]) VALUES (30244, N'عدد الصور', N'image count')
GO
INSERT [dbo].[Words] ([Id], [Ar], [En]) VALUES (30245, N'5', N'5')
GO
INSERT [dbo].[Words] ([Id], [Ar], [En]) VALUES (30246, N'لقج تم انشاء حدث جديد', N'Created New Event')
GO
INSERT [dbo].[Words] ([Id], [Ar], [En]) VALUES (30247, N'لقد قام مدير فرع فرع القاهرة 1 بـ انشاء حدث جديد ', N'cairo branch 1 Branch Manger Has Been Created New Event')
GO
INSERT [dbo].[Words] ([Id], [Ar], [En]) VALUES (30248, N'عملية دفع جديدة', N'New Payment Process')
GO
INSERT [dbo].[Words] ([Id], [Ar], [En]) VALUES (30249, N'لقد قام الموظف   AhmedMansBranch باضافة عملية دفع عن طريق حولة بنكية وقيمتها 200', N'AhmedMansBranch Has been Add Payment Process By Bank Transfer And It Is Valaue 200')
GO
INSERT [dbo].[Words] ([Id], [Ar], [En]) VALUES (30250, N'عملية دفع جديدة', N'New Payment Process')
GO
INSERT [dbo].[Words] ([Id], [Ar], [En]) VALUES (30251, N'لقد قام الموظف   AhmedMansBranch باضافة عملية دفع عن طريق دفع نقدا وقيمتها 200', N'AhmedMansBranch Has been Add Payment Process By Cash Payment And It Is Valaue 200')
GO
INSERT [dbo].[Words] ([Id], [Ar], [En]) VALUES (30252, N'عملية دفع جديدة', N'New Payment Process')
GO
INSERT [dbo].[Words] ([Id], [Ar], [En]) VALUES (30253, N'لقد قام الموظف   AhmedMansBranch باضافة عملية دفع عن طريق دفع نقدا وقيمتها 50', N'AhmedMansBranch Has been Add Payment Process By Cash Payment And It Is Valaue 50')
GO
INSERT [dbo].[Words] ([Id], [Ar], [En]) VALUES (30254, N' الانتهاء من الاعداد والتنسيق', N'Coordinations Finshed')
GO
INSERT [dbo].[Words] ([Id], [Ar], [En]) VALUES (30255, N'لقد قام الموظف emp بـ انهاء مهام الاعداد والتنسيق للمناسبة ', N'emp Has been finshed coordinations for event')
GO
INSERT [dbo].[Words] ([Id], [Ar], [En]) VALUES (30256, N' استفسار جدبد', N'New Enquiry')
GO
INSERT [dbo].[Words] ([Id], [Ar], [En]) VALUES (30257, N'لقد قام العميل clinet  بنشاء استفسار جديد', N'clinet Has been created new enqiry')
GO
INSERT [dbo].[Words] ([Id], [Ar], [En]) VALUES (30258, N'متعاون', N'Helper')
GO
INSERT [dbo].[Words] ([Id], [Ar], [En]) VALUES (30259, N'فيس بوك', N'FaceBook')
GO
INSERT [dbo].[Words] ([Id], [Ar], [En]) VALUES (30260, N'انواع حسابات التواصل الاجتماعى', N'Social Media Account Types')
GO
INSERT [dbo].[Words] ([Id], [Ar], [En]) VALUES (30261, N'sd', N'sd')
GO
INSERT [dbo].[Words] ([Id], [Ar], [En]) VALUES (30262, N'df', N'we')
GO
INSERT [dbo].[Words] ([Id], [Ar], [En]) VALUES (30263, N'dsd', N'sdsd')
GO
INSERT [dbo].[Words] ([Id], [Ar], [En]) VALUES (30264, N'df', N'we`')
GO
INSERT [dbo].[Words] ([Id], [Ar], [En]) VALUES (30265, N'sd', N'asas')
GO
INSERT [dbo].[Words] ([Id], [Ar], [En]) VALUES (30266, N'مصور', N'Photographer')
GO
INSERT [dbo].[Words] ([Id], [Ar], [En]) VALUES (30267, N' الانتهاء من الاعداد والتنسيق', N'Coordinations Finshed')
GO
INSERT [dbo].[Words] ([Id], [Ar], [En]) VALUES (30268, N'لقد قام الموظف emp بـ انهاء مهام الاعداد والتنسيق للمناسبة ', N'emp Has been finshed coordinations for event')
GO
INSERT [dbo].[Words] ([Id], [Ar], [En]) VALUES (30269, N'مدفوعات الموظف', N'Employee Payments')
GO
INSERT [dbo].[Words] ([Id], [Ar], [En]) VALUES (30270, N'مدفوعات الاستفسار والمناسبة', N'Enquiry And Event Payments')
GO
INSERT [dbo].[Words] ([Id], [Ar], [En]) VALUES (30271, N'عملية دفع جديدة', N'New Payment Process')
GO
INSERT [dbo].[Words] ([Id], [Ar], [En]) VALUES (30272, N'لقد قام الموظف   AhmedMansBranch باضافة عملية دفع لـ الموظف HLL وقيمتها 50', N'AhmedMansBranch Has been Add Payment Process Fro HLL Employee And It Is Valaue 50')
GO
INSERT [dbo].[Words] ([Id], [Ar], [En]) VALUES (30273, N'عملية دفع جديدة', N'New Payment Process')
GO
INSERT [dbo].[Words] ([Id], [Ar], [En]) VALUES (30274, N'لقد قام الموظف   AhmedMansBranch باضافة عملية دفع لـ الموظف HLL وقيمتها 55', N'AhmedMansBranch Has been Add Payment Process Fro HLL Employee And It Is Valaue 55')
GO
INSERT [dbo].[Words] ([Id], [Ar], [En]) VALUES (30275, N'عملية دفع جديدة', N'New Payment Process')
GO
INSERT [dbo].[Words] ([Id], [Ar], [En]) VALUES (30276, N'لقد قام الموظف   AhmedMansBranch باضافة عملية دفع لـ الموظف HLL وقيمتها 78', N'AhmedMansBranch Has been Add Payment Process Fro HLL Employee And It Is Valaue 78')
GO
INSERT [dbo].[Words] ([Id], [Ar], [En]) VALUES (30277, N'عملية دفع جديدة', N'New Payment Process')
GO
INSERT [dbo].[Words] ([Id], [Ar], [En]) VALUES (30278, N'لقد قام الموظف   AhmedMansBranch باضافة عملية دفع لـ الموظف HLL وقيمتها 0', N'AhmedMansBranch Has been Add Payment Process Fro HLL Employee And It Is Valaue 0')
GO
INSERT [dbo].[Words] ([Id], [Ar], [En]) VALUES (30279, N'عملية دفع جديدة', N'New Payment Process')
GO
INSERT [dbo].[Words] ([Id], [Ar], [En]) VALUES (30280, N'لقد قام الموظف   AhmedMansBranch باضافة عملية دفع لـ الموظف HLL وقيمتها 22', N'AhmedMansBranch Has been Add Payment Process Fro HLL Employee And It Is Valaue 22')
GO
INSERT [dbo].[Words] ([Id], [Ar], [En]) VALUES (30281, N'عملية دفع جديدة', N'New Payment Process')
GO
INSERT [dbo].[Words] ([Id], [Ar], [En]) VALUES (30282, N'لقد تم دفع لك دفعة مالية عن طريق تحويل لنكى وقبمتها 50 ريال ', N'You have new payment by bank transfer and it is value 50 ')
GO
INSERT [dbo].[Words] ([Id], [Ar], [En]) VALUES (30283, N'عملية دفع جديدة', N'New Payment Process')
GO
INSERT [dbo].[Words] ([Id], [Ar], [En]) VALUES (30284, N'لقد قام الموظف   AhmedMansBranch باضافة عملية دفع لـ الموظف HLL وقيمتها 50', N'AhmedMansBranch Has been Add Payment Process Fro HLL Employee And It Is Valaue 50')
GO
INSERT [dbo].[Words] ([Id], [Ar], [En]) VALUES (30285, N'عملية دفع جديدة', N'New Payment Process')
GO
INSERT [dbo].[Words] ([Id], [Ar], [En]) VALUES (30286, N'لقد قام الموظف   AhmedMansBranch باضافة عملية دفع لـ الموظف HLL وقيمتها 50', N'AhmedMansBranch Has been Add Payment Process Fro HLL Employee And It Is Valaue 50')
GO
INSERT [dbo].[Words] ([Id], [Ar], [En]) VALUES (30287, N'عملية دفع جديدة', N'New Payment Process')
GO
INSERT [dbo].[Words] ([Id], [Ar], [En]) VALUES (30288, N'لقد قام الموظف   AhmedMansBranch باضافة عملية دفع لـ الموظف HLL وقيمتها 55', N'AhmedMansBranch Has been Add Payment Process Fro HLL Employee And It Is Valaue 55')
GO
INSERT [dbo].[Words] ([Id], [Ar], [En]) VALUES (30289, N'عملية دفع جديدة', N'New Payment Process')
GO
INSERT [dbo].[Words] ([Id], [Ar], [En]) VALUES (30290, N'لقد تمت الموافقة على الدفع الكاش لـ الموظف HLL', N'has been accept for cash payment for HLL employee')
GO
INSERT [dbo].[Words] ([Id], [Ar], [En]) VALUES (30291, N'عملية دفع جديدة', N'New Payment Process')
GO
INSERT [dbo].[Words] ([Id], [Ar], [En]) VALUES (30292, N'لقد تمت الموافقة على الدفع الكاش لـ الموظف HLL', N'has been accept for cash payment for HLL employee')
GO
INSERT [dbo].[Words] ([Id], [Ar], [En]) VALUES (30293, N'عملية دفع جديدة', N'New Payment Process')
GO
INSERT [dbo].[Words] ([Id], [Ar], [En]) VALUES (30294, N'لقد تم دفع لك دفعة مالية عن طريق دفع كاش وقبمتها 55 ريال ', N'You have new payment by cash payment and it is value 55 ')
GO
INSERT [dbo].[Words] ([Id], [Ar], [En]) VALUES (30295, N'عملية دفع جديدة', N'New Payment Process')
GO
INSERT [dbo].[Words] ([Id], [Ar], [En]) VALUES (30296, N'لقد قام الموظف   AhmedMansBranch باضافة عملية دفع لـ الموظف HLL وقيمتها 66', N'AhmedMansBranch Has been Add Payment Process Fro HLL Employee And It Is Valaue 66')
GO
INSERT [dbo].[Words] ([Id], [Ar], [En]) VALUES (30297, N'عملية دفع جديدة', N'New Payment Process')
GO
INSERT [dbo].[Words] ([Id], [Ar], [En]) VALUES (30298, N'لقد تم دفع لك دفعة مالية عن طريق تحويل لنكى وقبمتها 66 ريال ', N'You have new payment by bank transfer and it is value 66 ')
GO
INSERT [dbo].[Words] ([Id], [Ar], [En]) VALUES (30299, N'عملية دفع جديدة', N'New Payment Process')
GO
INSERT [dbo].[Words] ([Id], [Ar], [En]) VALUES (30300, N'لقد تم دفع لك دفعة مالية عن طريق تحويل بنكى وقبمتها 50 ريال ', N'You have new payment by bank transfer and it is value 50 ')
GO
INSERT [dbo].[Words] ([Id], [Ar], [En]) VALUES (30301, N'عملية دفع جديدة', N'New Payment Process')
GO
INSERT [dbo].[Words] ([Id], [Ar], [En]) VALUES (30302, N'هناك عملية دفع للموظف HLL وقيمتها 66 ريال', N'you have new paymetn to HLL employee and it is value 66  ')
GO
INSERT [dbo].[Words] ([Id], [Ar], [En]) VALUES (30303, N'انواع اسئلة الاستبيان', N'Survey Question Types')
GO
INSERT [dbo].[Words] ([Id], [Ar], [En]) VALUES (30304, N'اعدادات الاستبيان', N'Survey Setting')
GO
INSERT [dbo].[Words] ([Id], [Ar], [En]) VALUES (30307, N'ما رئيك فى الشركة', N'ما رئيك فى الشركة')
GO
INSERT [dbo].[Words] ([Id], [Ar], [En]) VALUES (30308, N'ما رئيك فى المصور الاول', N'ما رئيك فى المصور الاول')
GO
INSERT [dbo].[Words] ([Id], [Ar], [En]) VALUES (30309, N'اسئلة استبيان المناسبة الافتراضبة', N'Event Survey Questions Defult')
GO
INSERT [dbo].[Words] ([Id], [Ar], [En]) VALUES (30310, N'ما رئيك فى المعاملات المالية', N'ما رئيك فى المعاملات المالية')
GO
INSERT [dbo].[Words] ([Id], [Ar], [En]) VALUES (30311, N' الانتهاء من الاعداد والتنسيق', N'Coordinations Finshed')
GO
INSERT [dbo].[Words] ([Id], [Ar], [En]) VALUES (30312, N'لقد قام الموظف HLL بـ انهاء مهام الاعداد والتنسيق للمناسبة ', N'HLL Has been finshed coordinations for event')
GO
INSERT [dbo].[Words] ([Id], [Ar], [En]) VALUES (30313, N' الانتهاء من الاعداد والتنسيق', N'Coordinations Finshed')
GO
INSERT [dbo].[Words] ([Id], [Ar], [En]) VALUES (30314, N'لقد قام الموظف HLL بـ انهاء مهام الاعداد والتنسيق للمناسبة ', N'HLL Has been finshed coordinations for event')
GO
INSERT [dbo].[Words] ([Id], [Ar], [En]) VALUES (30315, N'انواع تسليم الملفات', N'Files Received Types')
GO
INSERT [dbo].[Words] ([Id], [Ar], [En]) VALUES (30317, N'USB', N'USB')
GO
INSERT [dbo].[Words] ([Id], [Ar], [En]) VALUES (30318, N'دروب بوك', N'DopBox')
GO
INSERT [dbo].[Words] ([Id], [Ar], [En]) VALUES (30319, N'عملية دفع جديدة', N'New Payment Process')
GO
INSERT [dbo].[Words] ([Id], [Ar], [En]) VALUES (30320, N'لقد قام الموظف   AhmedMansBranch باضافة عملية دفع لـ الموظف hekp33 وقيمتها 50', N'AhmedMansBranch Has been Add Payment Process Fro hekp33 Employee And It Is Valaue 50')
GO
INSERT [dbo].[Words] ([Id], [Ar], [En]) VALUES (30321, N'عملية دفع جديدة', N'New Payment Process')
GO
INSERT [dbo].[Words] ([Id], [Ar], [En]) VALUES (30322, N'لقد قام الموظف   AhmedMansBranch باضافة عملية دفع لـ الموظف hekp33 وقيمتها 20', N'AhmedMansBranch Has been Add Payment Process Fro hekp33 Employee And It Is Valaue 20')
GO
INSERT [dbo].[Words] ([Id], [Ar], [En]) VALUES (30323, N'عملية دفع جديدة', N'New Payment Process')
GO
INSERT [dbo].[Words] ([Id], [Ar], [En]) VALUES (30324, N'لقد قام الموظف   AhmedMansBranch باضافة عملية دفع لـ الموظف hekp33 وقيمتها 50', N'AhmedMansBranch Has been Add Payment Process Fro hekp33 Employee And It Is Valaue 50')
GO
INSERT [dbo].[Words] ([Id], [Ar], [En]) VALUES (30325, N'عملية دفع جديدة', N'New Payment Process')
GO
INSERT [dbo].[Words] ([Id], [Ar], [En]) VALUES (30326, N'لقد تمت الموافقة على الدفع الكاش لـ الموظف hekp33', N'has been accept for cash payment for hekp33 employee')
GO
INSERT [dbo].[Words] ([Id], [Ar], [En]) VALUES (30327, N'عملية دفع جديدة', N'New Payment Process')
GO
INSERT [dbo].[Words] ([Id], [Ar], [En]) VALUES (30328, N'لقد تم دفع لك دفعة مالية عن طريق دفع كاش وقبمتها 50 ريال ', N'You have new payment by cash payment and it is value 50 ')
GO
INSERT [dbo].[Words] ([Id], [Ar], [En]) VALUES (30329, N'عملية دفع جديدة', N'New Payment Process')
GO
INSERT [dbo].[Words] ([Id], [Ar], [En]) VALUES (30330, N'لقد قام الموظف   AhmedMansBranch باضافة عملية دفع لـ الموظف hekp33 وقيمتها 50', N'AhmedMansBranch Has been Add Payment Process Fro hekp33 Employee And It Is Valaue 50')
GO
INSERT [dbo].[Words] ([Id], [Ar], [En]) VALUES (30331, N'عملية دفع جديدة', N'New Payment Process')
GO
INSERT [dbo].[Words] ([Id], [Ar], [En]) VALUES (30332, N'لقد تمت الموافقة على الدفع الكاش لـ الموظف hekp33', N'has been accept for cash payment for hekp33 employee')
GO
INSERT [dbo].[Words] ([Id], [Ar], [En]) VALUES (30333, N'عملية دفع جديدة', N'New Payment Process')
GO
INSERT [dbo].[Words] ([Id], [Ar], [En]) VALUES (30334, N'لقد تم دفع لك دفعة مالية عن طريق دفع كاش وقبمتها 50 ريال ', N'You have new payment by cash payment and it is value 50 ')
GO
INSERT [dbo].[Words] ([Id], [Ar], [En]) VALUES (30335, N'عملية دفع جديدة', N'New Payment Process')
GO
INSERT [dbo].[Words] ([Id], [Ar], [En]) VALUES (30336, N'لقد قام الموظف   AhmedMansBranch باضافة عملية دفع لـ الموظف hekp33 وقيمتها 22', N'AhmedMansBranch Has been Add Payment Process Fro hekp33 Employee And It Is Valaue 22')
GO
INSERT [dbo].[Words] ([Id], [Ar], [En]) VALUES (30337, N'عملية دفع جديدة', N'New Payment Process')
GO
INSERT [dbo].[Words] ([Id], [Ar], [En]) VALUES (30338, N'لقد قام الموظف   AhmedMansBranch باضافة عملية دفع لـ الموظف hekp33 وقيمتها 50', N'AhmedMansBranch Has been Add Payment Process Fro hekp33 Employee And It Is Valaue 50')
GO
INSERT [dbo].[Words] ([Id], [Ar], [En]) VALUES (30339, N'عملية دفع جديدة', N'New Payment Process')
GO
INSERT [dbo].[Words] ([Id], [Ar], [En]) VALUES (30340, N'لقد تمت الموافقة على الدفع بالتحويل البنكى لـ الموظف hekp33', N'has been accept for bank transfer payment for hekp33 employee')
GO
INSERT [dbo].[Words] ([Id], [Ar], [En]) VALUES (30341, N'عملية دفع جديدة', N'New Payment Process')
GO
INSERT [dbo].[Words] ([Id], [Ar], [En]) VALUES (30342, N'لقد تم دفع لك دفعة مالية عن طريق تحويل بنكى وقبمتها 50 ريال ', N'You have new payment by bank transfer and it is value 50 ')
GO
INSERT [dbo].[Words] ([Id], [Ar], [En]) VALUES (30343, N'عملية دفع جديدة', N'New Payment Process')
GO
INSERT [dbo].[Words] ([Id], [Ar], [En]) VALUES (30344, N'هناك عملية دفع للموظف hekp33 وقيمتها 50 ريال', N'you have new paymetn to hekp33 employee and it is value 50  ')
GO
INSERT [dbo].[Words] ([Id], [Ar], [En]) VALUES (40315, N'عملية دفع جديدة', N'New Payment Process')
GO
INSERT [dbo].[Words] ([Id], [Ar], [En]) VALUES (40316, N'لقد قام الموظف   AhmedMansBranch باضافة عملية دفع لـ الموظف heel وقيمتها 50', N'AhmedMansBranch Has been Add Payment Process Fro heel Employee And It Is Valaue 50')
GO
INSERT [dbo].[Words] ([Id], [Ar], [En]) VALUES (40317, N'عملية دفع مقبولة', N'New Payment Process Accepted')
GO
INSERT [dbo].[Words] ([Id], [Ar], [En]) VALUES (40318, N'لقد تمت الموافقة على الدفع الكاش لـ الموظف heel', N'has been accept for cash payment for heel employee')
GO
INSERT [dbo].[Words] ([Id], [Ar], [En]) VALUES (40319, N'عملية دفع جديدة', N'New Payment Process')
GO
INSERT [dbo].[Words] ([Id], [Ar], [En]) VALUES (40320, N'لقد تم دفع لك دفعة مالية عن طريق دفع كاش وقبمتها 50 ريال ', N'You have new payment by cash payment and it is value 50 ')
GO
INSERT [dbo].[Words] ([Id], [Ar], [En]) VALUES (40321, N'عملية دفع جديدة', N'New Payment Process')
GO
INSERT [dbo].[Words] ([Id], [Ar], [En]) VALUES (40322, N'لقد قام الموظف   AhmedMansBranch باضافة عملية دفع لـ الموظف heel وقيمتها 100', N'AhmedMansBranch Has been Add Payment Process Fro heel Employee And It Is Valaue 100')
GO
INSERT [dbo].[Words] ([Id], [Ar], [En]) VALUES (40323, N'عملية دفع جديدة', N'New Payment Process')
GO
INSERT [dbo].[Words] ([Id], [Ar], [En]) VALUES (40324, N'لقد تم دفع لك دفعة مالية عن طريق تحويل لنكى وقبمتها 100 ريال ', N'You have new payment by bank transfer and it is value 100 ')
GO
INSERT [dbo].[Words] ([Id], [Ar], [En]) VALUES (40325, N'عملية دفع جديدة', N'New Payment Process')
GO
INSERT [dbo].[Words] ([Id], [Ar], [En]) VALUES (40326, N'هناك عملية دفع للموظف heel وقيمتها 80 ريال', N'you have new paymetn to heel employee and it is value 80  ')
GO
INSERT [dbo].[Words] ([Id], [Ar], [En]) VALUES (40327, N'عملية دفع جديدة', N'New Payment Process')
GO
INSERT [dbo].[Words] ([Id], [Ar], [En]) VALUES (40328, N'لقد تم دفع لك دفعة مالية عن طريق دفع كاش وقبمتها 80 ريال ', N'You have new payment by cash payment and it is value 80 ')
GO
INSERT [dbo].[Words] ([Id], [Ar], [En]) VALUES (40329, N'عملية دفع جديدة', N'New Payment Process')
GO
INSERT [dbo].[Words] ([Id], [Ar], [En]) VALUES (40330, N'لقد تم دفع لك دفعة مالية عن طريق تحويل بنكى وقبمتها 90 ريال ', N'You have new payment by bank transfer and it is value 90 ')
GO
INSERT [dbo].[Words] ([Id], [Ar], [En]) VALUES (40331, N'عملية دفع جديدة', N'New Payment Process')
GO
INSERT [dbo].[Words] ([Id], [Ar], [En]) VALUES (40332, N'هناك عملية دفع للموظف HLL وقيمتها 55 ريال', N'you have new paymetn to HLL employee and it is value 55  ')
GO
INSERT [dbo].[Words] ([Id], [Ar], [En]) VALUES (40333, N'عملية دفع جديدة', N'New Payment Process')
GO
INSERT [dbo].[Words] ([Id], [Ar], [En]) VALUES (40334, N'هناك عملية دفع للموظف HLL وقيمتها 55 ريال', N'you have new paymetn to HLL employee and it is value 55  ')
GO
INSERT [dbo].[Words] ([Id], [Ar], [En]) VALUES (40335, N'عملية دفع جديدة', N'New Payment Process')
GO
INSERT [dbo].[Words] ([Id], [Ar], [En]) VALUES (40336, N'هناك عملية دفع للموظف HLL وقيمتها 56666 ريال', N'you have new paymetn to HLL employee and it is value 56666  ')
GO
INSERT [dbo].[Words] ([Id], [Ar], [En]) VALUES (40341, N' استفسار جدبد', N'New Enquiry')
GO
INSERT [dbo].[Words] ([Id], [Ar], [En]) VALUES (40342, N'لقد قام شخص ما بـ انشاء استفسار جديد', N'Some people has been created new enqiry')
GO
INSERT [dbo].[Words] ([Id], [Ar], [En]) VALUES (40343, N' استفسار جدبد', N'New Enquiry')
GO
INSERT [dbo].[Words] ([Id], [Ar], [En]) VALUES (40344, N'لقد قام شخص ما بـ انشاء استفسار جديد', N'Some people has been created new enqiry')
GO
INSERT [dbo].[Words] ([Id], [Ar], [En]) VALUES (40345, N' استفسار جدبد', N'New Enquiry')
GO
INSERT [dbo].[Words] ([Id], [Ar], [En]) VALUES (40346, N'لقد قام شخص ما بـ انشاء استفسار جديد', N'Some people has been created new enqiry')
GO
INSERT [dbo].[Words] ([Id], [Ar], [En]) VALUES (40347, N' استفسار جدبد', N'New Enquiry')
GO
INSERT [dbo].[Words] ([Id], [Ar], [En]) VALUES (40348, N'لقد قام العميل clinet  بـ انشاء استفسار جديد', N'clinet Has been created new enqiry')
GO
INSERT [dbo].[Words] ([Id], [Ar], [En]) VALUES (40349, N' استفسار جدبد', N'New Enquiry')
GO
INSERT [dbo].[Words] ([Id], [Ar], [En]) VALUES (40350, N'لقد قام العميل clinet  بـ انشاء استفسار جديد', N'clinet Has been created new enqiry')
GO
INSERT [dbo].[Words] ([Id], [Ar], [En]) VALUES (40351, N' استفسار جدبد', N'New Enquiry')
GO
INSERT [dbo].[Words] ([Id], [Ar], [En]) VALUES (40352, N'لقد قام العميل clinet  بـ انشاء استفسار جديد', N'clinet Has been created new enqiry')
GO
INSERT [dbo].[Words] ([Id], [Ar], [En]) VALUES (40353, N'السعودية', N'soudi')
GO
INSERT [dbo].[Words] ([Id], [Ar], [En]) VALUES (40354, N' استفسار جدبد', N'New Enquiry')
GO
INSERT [dbo].[Words] ([Id], [Ar], [En]) VALUES (40355, N'لقد قام شخص ما بـ انشاء استفسار جديد', N'Some people has been created new enqiry')
GO
INSERT [dbo].[Words] ([Id], [Ar], [En]) VALUES (40356, N' استفسار جدبد', N'New Enquiry')
GO
INSERT [dbo].[Words] ([Id], [Ar], [En]) VALUES (40357, N'لقد قام شخص ما بـ انشاء استفسار جديد', N'Some people has been created new enqiry')
GO
INSERT [dbo].[Words] ([Id], [Ar], [En]) VALUES (40358, N' استفسار جدبد', N'New Enquiry')
GO
INSERT [dbo].[Words] ([Id], [Ar], [En]) VALUES (40359, N'لقد قام شخص ما بـ انشاء استفسار جديد', N'Some people has been created new enqiry')
GO
INSERT [dbo].[Words] ([Id], [Ar], [En]) VALUES (40360, N' استفسار جدبد', N'New Enquiry')
GO
INSERT [dbo].[Words] ([Id], [Ar], [En]) VALUES (40361, N'لقد قام العميل clinet  بـ انشاء استفسار جديد', N'clinet Has been created new enqiry')
GO
INSERT [dbo].[Words] ([Id], [Ar], [En]) VALUES (40362, N'عملية دفع جديدة', N'New Payment Process')
GO
INSERT [dbo].[Words] ([Id], [Ar], [En]) VALUES (40363, N'لقد قام الموظف   AhmedMansBranch باضافة عملية دفع عن طريق دفع نقدا وقيمتها 22', N'AhmedMansBranch Has been Add Payment Process By Cash Payment And It Is Valaue 22')
GO
INSERT [dbo].[Words] ([Id], [Ar], [En]) VALUES (40364, N'اضافة حالة جديدة على استفسار ما', N'Add New Status On Some Enquiry')
GO
INSERT [dbo].[Words] ([Id], [Ar], [En]) VALUES (40365, N'لقد قام AhmedMansBranch بـ وضع حالة جديد   ', N'AhmedMansBranch Has Been Add New Status')
GO
INSERT [dbo].[Words] ([Id], [Ar], [En]) VALUES (40366, N'لقج تم انشاء حدث جديد', N'Created New Event')
GO
INSERT [dbo].[Words] ([Id], [Ar], [En]) VALUES (40367, N'لقد قام مدير فرع فرع القاهرة 1 بـ انشاء حدث جديد ', N'cairo branch 1 Branch Manger Has Been Created New Event')
GO
INSERT [dbo].[Words] ([Id], [Ar], [En]) VALUES (40368, N'sdsd', N'sdsd')
GO
INSERT [dbo].[Words] ([Id], [Ar], [En]) VALUES (40369, N'عملية دفع جديدة', N'New Payment Process')
GO
INSERT [dbo].[Words] ([Id], [Ar], [En]) VALUES (40370, N'لقد قام المدير  باضافة عملية دفع عن طريق دفع نقدا وقيمتها 55', N'Manger Has been Add Payment Process By Cash Payment And It Is Valaue 55')
GO
INSERT [dbo].[Words] ([Id], [Ar], [En]) VALUES (40371, N'اضافة حالة جديدة على استفسار ما', N'Add New Status On Some Enquiry')
GO
INSERT [dbo].[Words] ([Id], [Ar], [En]) VALUES (40372, N'لقد قام المدير بـ وضع حالة جديد   ', N'المدير Has Been Add New Status')
GO
INSERT [dbo].[Words] ([Id], [Ar], [En]) VALUES (40373, N'عملية دفع جديدة', N'New Payment Process')
GO
INSERT [dbo].[Words] ([Id], [Ar], [En]) VALUES (40374, N'لقد قام المدير  باضافة عملية دفع عن طريق دفع نقدا وقيمتها 56', N'Manger Has been Add Payment Process By Cash Payment And It Is Valaue 56')
GO
INSERT [dbo].[Words] ([Id], [Ar], [En]) VALUES (40375, N'اضافة حالة جديدة على استفسار ما', N'Add New Status On Some Enquiry')
GO
INSERT [dbo].[Words] ([Id], [Ar], [En]) VALUES (40376, N'لقد قام المدير بـ وضع حالة جديد   ', N'المدير Has Been Add New Status')
GO
INSERT [dbo].[Words] ([Id], [Ar], [En]) VALUES (40377, N'عملية دفع جديدة', N'New Payment Process')
GO
INSERT [dbo].[Words] ([Id], [Ar], [En]) VALUES (40378, N'لقد قام المدير  باضافة عملية دفع عن طريق دفع نقدا وقيمتها 50', N'Manger Has been Add Payment Process By Cash Payment And It Is Valaue 50')
GO
INSERT [dbo].[Words] ([Id], [Ar], [En]) VALUES (40379, N'اضافة حالة جديدة على استفسار ما', N'Add New Status On Some Enquiry')
GO
INSERT [dbo].[Words] ([Id], [Ar], [En]) VALUES (40380, N'لقد قام المدير بـ وضع حالة جديد   ', N'المدير Has Been Add New Status')
GO
INSERT [dbo].[Words] ([Id], [Ar], [En]) VALUES (40381, N'العرض الاول مع الحفر مجانى', N'العرض الاول مع الحفر مجانى')
GO
INSERT [dbo].[Words] ([Id], [Ar], [En]) VALUES (40382, N'سيس', N'سيس')
GO
INSERT [dbo].[Words] ([Id], [Ar], [En]) VALUES (40383, N'5', N'5')
GO
INSERT [dbo].[Words] ([Id], [Ar], [En]) VALUES (40384, N'حفر فضى', N'حفر فضى')
GO
INSERT [dbo].[Words] ([Id], [Ar], [En]) VALUES (40385, NULL, NULL)
GO
INSERT [dbo].[Words] ([Id], [Ar], [En]) VALUES (40386, NULL, NULL)
GO
INSERT [dbo].[Words] ([Id], [Ar], [En]) VALUES (40387, NULL, NULL)
GO
INSERT [dbo].[Words] ([Id], [Ar], [En]) VALUES (40388, NULL, NULL)
GO
INSERT [dbo].[Words] ([Id], [Ar], [En]) VALUES (40389, NULL, NULL)
GO
INSERT [dbo].[Words] ([Id], [Ar], [En]) VALUES (40390, NULL, NULL)
GO
INSERT [dbo].[Words] ([Id], [Ar], [En]) VALUES (40391, NULL, NULL)
GO
INSERT [dbo].[Words] ([Id], [Ar], [En]) VALUES (40392, NULL, NULL)
GO
INSERT [dbo].[Words] ([Id], [Ar], [En]) VALUES (40393, NULL, NULL)
GO
INSERT [dbo].[Words] ([Id], [Ar], [En]) VALUES (40394, NULL, NULL)
GO
INSERT [dbo].[Words] ([Id], [Ar], [En]) VALUES (40395, NULL, NULL)
GO
INSERT [dbo].[Words] ([Id], [Ar], [En]) VALUES (40396, NULL, NULL)
GO
INSERT [dbo].[Words] ([Id], [Ar], [En]) VALUES (40397, NULL, NULL)
GO
INSERT [dbo].[Words] ([Id], [Ar], [En]) VALUES (40398, NULL, NULL)
GO
INSERT [dbo].[Words] ([Id], [Ar], [En]) VALUES (40399, NULL, NULL)
GO
INSERT [dbo].[Words] ([Id], [Ar], [En]) VALUES (40400, NULL, NULL)
GO
INSERT [dbo].[Words] ([Id], [Ar], [En]) VALUES (40401, NULL, NULL)
GO
INSERT [dbo].[Words] ([Id], [Ar], [En]) VALUES (40402, NULL, NULL)
GO
INSERT [dbo].[Words] ([Id], [Ar], [En]) VALUES (40403, NULL, NULL)
GO
INSERT [dbo].[Words] ([Id], [Ar], [En]) VALUES (40404, NULL, NULL)
GO
INSERT [dbo].[Words] ([Id], [Ar], [En]) VALUES (40405, NULL, NULL)
GO
INSERT [dbo].[Words] ([Id], [Ar], [En]) VALUES (40406, NULL, NULL)
GO
INSERT [dbo].[Words] ([Id], [Ar], [En]) VALUES (40407, NULL, NULL)
GO
INSERT [dbo].[Words] ([Id], [Ar], [En]) VALUES (40408, NULL, NULL)
GO
INSERT [dbo].[Words] ([Id], [Ar], [En]) VALUES (40409, NULL, NULL)
GO
INSERT [dbo].[Words] ([Id], [Ar], [En]) VALUES (40410, NULL, NULL)
GO
INSERT [dbo].[Words] ([Id], [Ar], [En]) VALUES (40411, NULL, NULL)
GO
INSERT [dbo].[Words] ([Id], [Ar], [En]) VALUES (40412, NULL, NULL)
GO
INSERT [dbo].[Words] ([Id], [Ar], [En]) VALUES (40413, NULL, NULL)
GO
INSERT [dbo].[Words] ([Id], [Ar], [En]) VALUES (40414, NULL, NULL)
GO
INSERT [dbo].[Words] ([Id], [Ar], [En]) VALUES (40415, NULL, NULL)
GO
INSERT [dbo].[Words] ([Id], [Ar], [En]) VALUES (40416, NULL, NULL)
GO
INSERT [dbo].[Words] ([Id], [Ar], [En]) VALUES (40417, NULL, NULL)
GO
INSERT [dbo].[Words] ([Id], [Ar], [En]) VALUES (40418, NULL, NULL)
GO
INSERT [dbo].[Words] ([Id], [Ar], [En]) VALUES (40419, N' استفسار جدبد', N'New Enquiry')
GO
INSERT [dbo].[Words] ([Id], [Ar], [En]) VALUES (40420, N'لقد قام المدير بـ انشاء استفسار جديد', N'Manger has been created new enqiry')
GO
INSERT [dbo].[Words] ([Id], [Ar], [En]) VALUES (40421, N'اضافة حالة جديدة على استفسار ما', N'Add New Status On Some Enquiry')
GO
INSERT [dbo].[Words] ([Id], [Ar], [En]) VALUES (40422, N'لقد قام المدير بـ وضع حالة جديد   ', N'المدير Has Been Add New Status')
GO
INSERT [dbo].[Words] ([Id], [Ar], [En]) VALUES (40423, N'اضافة حالة جديدة على استفسار ما', N'Add New Status On Some Enquiry')
GO
INSERT [dbo].[Words] ([Id], [Ar], [En]) VALUES (40424, N'لقد قام المدير بـ وضع حالة جديد   ', N'المدير Has Been Add New Status')
GO
INSERT [dbo].[Words] ([Id], [Ar], [En]) VALUES (40425, N'اضافة حالة جديدة على استفسار ما', N'Add New Status On Some Enquiry')
GO
INSERT [dbo].[Words] ([Id], [Ar], [En]) VALUES (40426, N'لقد قام المدير بـ وضع حالة جديد   ', N'المدير Has Been Add New Status')
GO
INSERT [dbo].[Words] ([Id], [Ar], [En]) VALUES (40427, N'اضافة حالة جديدة على استفسار ما', N'Add New Status On Some Enquiry')
GO
INSERT [dbo].[Words] ([Id], [Ar], [En]) VALUES (40428, N'لقد قام المدير بـ وضع حالة جديد   ', N'المدير Has Been Add New Status')
GO
INSERT [dbo].[Words] ([Id], [Ar], [En]) VALUES (40429, N'اضافة حالة جديدة على استفسار ما', N'Add New Status On Some Enquiry')
GO
INSERT [dbo].[Words] ([Id], [Ar], [En]) VALUES (40430, N'لقد قام المدير بـ وضع حالة جديد   ', N'المدير Has Been Add New Status')
GO
INSERT [dbo].[Words] ([Id], [Ar], [En]) VALUES (40431, N'اضافة حالة جديدة على استفسار ما', N'Add New Status On Some Enquiry')
GO
INSERT [dbo].[Words] ([Id], [Ar], [En]) VALUES (40432, N'لقد قام المدير بـ وضع حالة جديد   ', N'المدير Has Been Add New Status')
GO
INSERT [dbo].[Words] ([Id], [Ar], [En]) VALUES (40433, N'اضافة حالة جديدة على استفسار ما', N'Add New Status On Some Enquiry')
GO
INSERT [dbo].[Words] ([Id], [Ar], [En]) VALUES (40434, N'لقد قام المدير بـ وضع حالة جديد   ', N'المدير Has Been Add New Status')
GO
INSERT [dbo].[Words] ([Id], [Ar], [En]) VALUES (40435, N'اضافة حالة جديدة على استفسار ما', N'Add New Status On Some Enquiry')
GO
INSERT [dbo].[Words] ([Id], [Ar], [En]) VALUES (40436, N'لقد قام المدير بـ وضع حالة جديد   ', N'المدير Has Been Add New Status')
GO
INSERT [dbo].[Words] ([Id], [Ar], [En]) VALUES (40437, N'اضافة حالة جديدة على استفسار ما', N'Add New Status On Some Enquiry')
GO
INSERT [dbo].[Words] ([Id], [Ar], [En]) VALUES (40438, N'لقد قام المدير بـ وضع حالة جديد   ', N'المدير Has Been Add New Status')
GO
INSERT [dbo].[Words] ([Id], [Ar], [En]) VALUES (40439, N'اضافة حالة جديدة على استفسار ما', N'Add New Status On Some Enquiry')
GO
INSERT [dbo].[Words] ([Id], [Ar], [En]) VALUES (40440, N'لقد قام المدير بـ وضع حالة جديد   ', N'المدير Has Been Add New Status')
GO
INSERT [dbo].[Words] ([Id], [Ar], [En]) VALUES (40441, N'اضافة حالة جديدة على استفسار ما', N'Add New Status On Some Enquiry')
GO
INSERT [dbo].[Words] ([Id], [Ar], [En]) VALUES (40442, N'لقد قام المدير بـ وضع حالة جديد   ', N'المدير Has Been Add New Status')
GO
INSERT [dbo].[Words] ([Id], [Ar], [En]) VALUES (40443, N'اضافة حالة جديدة على استفسار ما', N'Add New Status On Some Enquiry')
GO
INSERT [dbo].[Words] ([Id], [Ar], [En]) VALUES (40444, N'لقد قام المدير بـ وضع حالة جديد   ', N'المدير Has Been Add New Status')
GO
INSERT [dbo].[Words] ([Id], [Ar], [En]) VALUES (40445, N'اضافة حالة جديدة على استفسار ما', N'Add New Status On Some Enquiry')
GO
INSERT [dbo].[Words] ([Id], [Ar], [En]) VALUES (40446, N'لقد قام المدير بـ وضع حالة جديد   ', N'المدير Has Been Add New Status')
GO
INSERT [dbo].[Words] ([Id], [Ar], [En]) VALUES (40447, N'اضافة حالة جديدة على استفسار ما', N'Add New Status On Some Enquiry')
GO
INSERT [dbo].[Words] ([Id], [Ar], [En]) VALUES (40448, N'لقد قام المدير بـ وضع حالة جديد   ', N'المدير Has Been Add New Status')
GO
INSERT [dbo].[Words] ([Id], [Ar], [En]) VALUES (40449, N'اضافة حالة جديدة على استفسار ما', N'Add New Status On Some Enquiry')
GO
INSERT [dbo].[Words] ([Id], [Ar], [En]) VALUES (40450, N'لقد قام المدير بـ وضع حالة جديد   ', N'المدير Has Been Add New Status')
GO
INSERT [dbo].[Words] ([Id], [Ar], [En]) VALUES (40451, N'عملية دفع جديدة', N'New Payment Process')
GO
INSERT [dbo].[Words] ([Id], [Ar], [En]) VALUES (40452, N'لقد قام المدير  باضافة عملية دفع عن طريق دفع نقدا وقيمتها 500', N'Manger Has been Add Payment Process By Cash Payment And It Is Valaue 500')
GO
INSERT [dbo].[Words] ([Id], [Ar], [En]) VALUES (40453, N'اضافة حالة جديدة على استفسار ما', N'Add New Status On Some Enquiry')
GO
INSERT [dbo].[Words] ([Id], [Ar], [En]) VALUES (40454, N'لقد قام المدير بـ وضع حالة جديد   ', N'المدير Has Been Add New Status')
GO
INSERT [dbo].[Words] ([Id], [Ar], [En]) VALUES (40455, N'فرع قاهرة 1', N'فرع قاهرة 1')
GO
INSERT [dbo].[Words] ([Id], [Ar], [En]) VALUES (40456, N'نوع جديد', N'new type')
GO
INSERT [dbo].[Words] ([Id], [Ar], [En]) VALUES (40457, N'اضافة حالة جديدة على استفسار ما', N'Add New Status On Some Enquiry')
GO
INSERT [dbo].[Words] ([Id], [Ar], [En]) VALUES (40458, N'لقد قام br بـ وضع حالة جديد   ', N'br Has Been Add New Status')
GO
INSERT [dbo].[Words] ([Id], [Ar], [En]) VALUES (40459, N'اضافة حالة جديدة على استفسار ما', N'Add New Status On Some Enquiry')
GO
INSERT [dbo].[Words] ([Id], [Ar], [En]) VALUES (40460, N'لقد قام br بـ وضع حالة جديد   ', N'br Has Been Add New Status')
GO
INSERT [dbo].[Words] ([Id], [Ar], [En]) VALUES (40461, N'اضافة حالة جديدة على استفسار ما', N'Add New Status On Some Enquiry')
GO
INSERT [dbo].[Words] ([Id], [Ar], [En]) VALUES (40462, N'لقد قام br بـ وضع حالة جديد   ', N'br Has Been Add New Status')
GO
INSERT [dbo].[Words] ([Id], [Ar], [En]) VALUES (40463, N'اضافة حالة جديدة على استفسار ما', N'Add New Status On Some Enquiry')
GO
INSERT [dbo].[Words] ([Id], [Ar], [En]) VALUES (40464, N'لقد قام المدير بـ وضع حالة جديد   ', N'المدير Has Been Add New Status')
GO
INSERT [dbo].[Words] ([Id], [Ar], [En]) VALUES (40465, N'اضافة حالة جديدة على استفسار ما', N'Add New Status On Some Enquiry')
GO
INSERT [dbo].[Words] ([Id], [Ar], [En]) VALUES (40466, N'لقد تم اضافة حالة العميل لم يرد على استفسار sdsd lklk', N'Ahmed has been adde status Not Answer  on enquiry sdsd lklk')
GO
INSERT [dbo].[Words] ([Id], [Ar], [En]) VALUES (40467, N'اضافة حالة جديدة على استفسار ما', N'Add New Status On Some Enquiry')
GO
INSERT [dbo].[Words] ([Id], [Ar], [En]) VALUES (40468, N'لقد تم اضافة حالة الموافقة التامة على استفسار sdsd lklk', N'Ahmed has been adde status Full Approval on enquiry sdsd lklk')
GO
INSERT [dbo].[Words] ([Id], [Ar], [En]) VALUES (40469, N'عملية دفع جديدة', N'New Payment Process')
GO
INSERT [dbo].[Words] ([Id], [Ar], [En]) VALUES (40470, N'لقد قام الموظف   br باضافة عملية دفع عن طريق دفع نقدا وقيمتها 55', N'br Has been Add Payment Process By Cash Payment And It Is Valaue 55')
GO
INSERT [dbo].[Words] ([Id], [Ar], [En]) VALUES (40471, N'اضافة حالة جديدة على استفسار ما', N'Add New Status On Some Enquiry')
GO
INSERT [dbo].[Words] ([Id], [Ar], [En]) VALUES (40472, N'لقد تم اضافة حالة الحجز بواسطة الدفع الكاش على استفسار sdsd lklk', N'Ahmed has been adde status Book By Cash on enquiry sdsd lklk')
GO
INSERT [dbo].[Words] ([Id], [Ar], [En]) VALUES (40473, N'نوع جديد', N'new type')
GO
INSERT [dbo].[Words] ([Id], [Ar], [En]) VALUES (40475, N'dsd', N'sdsd')
GO
INSERT [dbo].[Words] ([Id], [Ar], [En]) VALUES (40476, N'حزمة للتجربة', N'حزمة للتجربة')
GO
INSERT [dbo].[Words] ([Id], [Ar], [En]) VALUES (40477, N'21', N'212')
GO
INSERT [dbo].[Words] ([Id], [Ar], [En]) VALUES (40478, N'لقج تم انشاء حدث جديد', N'Created New Event')
GO
INSERT [dbo].[Words] ([Id], [Ar], [En]) VALUES (40479, N'لقد قام مدير فرع فرع قاهرة 1 بـ انشاء حدث جديد ', N'فرع قاهرة 1 Branch Manger Has Been Created New Event')
GO
INSERT [dbo].[Words] ([Id], [Ar], [En]) VALUES (40480, N'عملية دفع جديدة', N'New Payment Process')
GO
INSERT [dbo].[Words] ([Id], [Ar], [En]) VALUES (40481, N'لقد قام الموظف   br باضافة عملية دفع عن طريق حولة بنكية وقيمتها 50', N'br Has been Add Payment Process By Bank Transfer And It Is Valaue 50')
GO
INSERT [dbo].[Words] ([Id], [Ar], [En]) VALUES (40482, N'عملية دفع جديدة', N'New Payment Process')
GO
INSERT [dbo].[Words] ([Id], [Ar], [En]) VALUES (40483, N'لقد قام الموظف   br باضافة عملية دفع عن طريق دفع نقدا وقيمتها 50', N'br Has been Add Payment Process By Cash Payment And It Is Valaue 50')
GO
INSERT [dbo].[Words] ([Id], [Ar], [En]) VALUES (40484, N'عملية دفع جديدة', N'New Payment Process')
GO
INSERT [dbo].[Words] ([Id], [Ar], [En]) VALUES (40485, N'لقد قام الموظف   br باضافة عملية دفع عن طريق دفع نقدا وقيمتها 55', N'br Has been Add Payment Process By Cash Payment And It Is Valaue 55')
GO
INSERT [dbo].[Words] ([Id], [Ar], [En]) VALUES (40486, N'عملية دفع جديدة', N'New Payment Process')
GO
INSERT [dbo].[Words] ([Id], [Ar], [En]) VALUES (40487, N'لقد قام الموظف   br باضافة عملية دفع عن طريق دفع نقدا وقيمتها 500', N'br Has been Add Payment Process By Cash Payment And It Is Valaue 500')
GO
INSERT [dbo].[Words] ([Id], [Ar], [En]) VALUES (40488, N'عملية دفع جديدة', N'New Payment Process')
GO
INSERT [dbo].[Words] ([Id], [Ar], [En]) VALUES (40489, N'لقد قام الموظف   br باضافة عملية دفع عن طريق دفع نقدا وقيمتها 500', N'br Has been Add Payment Process By Cash Payment And It Is Valaue 500')
GO
INSERT [dbo].[Words] ([Id], [Ar], [En]) VALUES (40490, N' الانتهاء من الاعداد والتنسيق', N'Coordinations Finshed')
GO
INSERT [dbo].[Words] ([Id], [Ar], [En]) VALUES (40491, N'لقد قام الموظف emp1 بـ انهاء مهام الاعداد والتنسيق للمناسبة ', N'emp1 Has been finshed coordinations for event')
GO
INSERT [dbo].[Words] ([Id], [Ar], [En]) VALUES (40492, N' استفسار جدبد', N'New Enquiry')
GO
INSERT [dbo].[Words] ([Id], [Ar], [En]) VALUES (40493, N'لقد قام العميل sdsd  بـ انشاء استفسار جديد', N'sdsd Has been created new enqiry')
GO
INSERT [dbo].[Words] ([Id], [Ar], [En]) VALUES (40494, N' استفسار جدبد', N'New Enquiry')
GO
INSERT [dbo].[Words] ([Id], [Ar], [En]) VALUES (40495, N'لقد قام العميل sdsd  بـ انشاء استفسار جديد', N'sdsd Has been created new enqiry')
GO
INSERT [dbo].[Words] ([Id], [Ar], [En]) VALUES (40496, N' استفسار جدبد', N'New Enquiry')
GO
INSERT [dbo].[Words] ([Id], [Ar], [En]) VALUES (40497, N'لقد قام العميل sdsd  بـ انشاء استفسار جديد', N'sdsd Has been created new enqiry')
GO
INSERT [dbo].[Words] ([Id], [Ar], [En]) VALUES (40498, N' استفسار جدبد', N'New Enquiry')
GO
INSERT [dbo].[Words] ([Id], [Ar], [En]) VALUES (40499, N'لقد قام العميل sdsd  بـ انشاء استفسار جديد', N'sdsd Has been created new enqiry')
GO
INSERT [dbo].[Words] ([Id], [Ar], [En]) VALUES (40500, N' استفسار جدبد', N'New Enquiry')
GO
INSERT [dbo].[Words] ([Id], [Ar], [En]) VALUES (40501, N'لقد قام العميل sdsd  بـ انشاء استفسار جديد', N'sdsd Has been created new enqiry')
GO
INSERT [dbo].[Words] ([Id], [Ar], [En]) VALUES (40502, N' استفسار جدبد', N'New Enquiry')
GO
INSERT [dbo].[Words] ([Id], [Ar], [En]) VALUES (40503, N'لقد قام العميل sdsd  بـ انشاء استفسار جديد', N'sdsd Has been created new enqiry')
GO
INSERT [dbo].[Words] ([Id], [Ar], [En]) VALUES (40504, N' استفسار جدبد', N'New Enquiry')
GO
INSERT [dbo].[Words] ([Id], [Ar], [En]) VALUES (40505, N'لقد قام العميل sdsd  بـ انشاء استفسار جديد', N'sdsd Has been created new enqiry')
GO
INSERT [dbo].[Words] ([Id], [Ar], [En]) VALUES (40506, N'منصورة', N'منصوة')
GO
INSERT [dbo].[Words] ([Id], [Ar], [En]) VALUES (40507, N'انشاء الاستفسار', N'Create Enquiry')
GO
INSERT [dbo].[Words] ([Id], [Ar], [En]) VALUES (40508, N'انشاء حساب العميل', N'Create Clinet Account')
GO
INSERT [dbo].[Words] ([Id], [Ar], [En]) VALUES (40509, N'انشاء المناسبة', N'Create Event')
GO
INSERT [dbo].[Words] ([Id], [Ar], [En]) VALUES (40510, N'غلق الاستفسار', N'Close Enquiry')
GO
INSERT [dbo].[Words] ([Id], [Ar], [En]) VALUES (40511, N' استفسار جدبد', N'New Enquiry')
GO
INSERT [dbo].[Words] ([Id], [Ar], [En]) VALUES (40512, N'لقد قام المدير بـ انشاء استفسار جديد', N'Manger has been created new enqiry')
GO
INSERT [dbo].[Words] ([Id], [Ar], [En]) VALUES (40513, N'اضافة حالة جديدة على استفسار ما', N'Add New Status On Some Enquiry')
GO
INSERT [dbo].[Words] ([Id], [Ar], [En]) VALUES (40514, N'لقد تم اضافة حالة تم التواصل مع العميل  على استفسار sdsd sdsd', N'Ahmed has been adde status Customer Contacted on enquiry sdsd sdsd')
GO
INSERT [dbo].[Words] ([Id], [Ar], [En]) VALUES (40515, N' استفسار جدبد', N'New Enquiry')
GO
INSERT [dbo].[Words] ([Id], [Ar], [En]) VALUES (40516, N'لقد قام المدير بـ انشاء استفسار جديد', N'Manger has been created new enqiry')
GO
INSERT [dbo].[Words] ([Id], [Ar], [En]) VALUES (40517, N'اضافة حالة جديدة على استفسار ما', N'Add New Status On Some Enquiry')
GO
INSERT [dbo].[Words] ([Id], [Ar], [En]) VALUES (40518, N'لقد تم اضافة حالة تم التواصل مع العميل  على استفسار 222 645', N'Ahmed has been adde status Customer Contacted on enquiry 222 645')
GO
INSERT [dbo].[Words] ([Id], [Ar], [En]) VALUES (40519, N'عملية دفع جديدة', N'New Payment Process')
GO
INSERT [dbo].[Words] ([Id], [Ar], [En]) VALUES (40520, N'لقد قام الموظف   ahmed باضافة عملية دفع عن طريق دفع نقدا وقيمتها 20', N'ahmed Has been Add Payment Process By Cash Payment And It Is Valaue 20')
GO
INSERT [dbo].[Words] ([Id], [Ar], [En]) VALUES (40521, N'اضافة حالة جديدة على استفسار ما', N'Add New Status On Some Enquiry')
GO
INSERT [dbo].[Words] ([Id], [Ar], [En]) VALUES (40522, N'لقد تم اضافة حالة الحجز بواسطة الدفع الكاش على استفسار 222 645', N'Ahmed has been adde status Book By Cash on enquiry 222 645')
GO
INSERT [dbo].[Words] ([Id], [Ar], [En]) VALUES (40523, N'لقج تم انشاء حدث جديد', N'Created New Event')
GO
INSERT [dbo].[Words] ([Id], [Ar], [En]) VALUES (40524, N'لقد قام مدير فرع فرع قاهرة 1 بـ انشاء حدث جديد ', N'فرع قاهرة 1 Branch Manger Has Been Created New Event')
GO
INSERT [dbo].[Words] ([Id], [Ar], [En]) VALUES (40525, N'جدة', N'gada')
GO
INSERT [dbo].[Words] ([Id], [Ar], [En]) VALUES (40526, N' استفسار جدبد', N'New Enquiry')
GO
INSERT [dbo].[Words] ([Id], [Ar], [En]) VALUES (40527, N'لقد قام المدير بـ انشاء استفسار جديد', N'Manger has been created new enqiry')
GO
INSERT [dbo].[Words] ([Id], [Ar], [En]) VALUES (40528, N'عملية دفع جديدة', N'New Payment Process')
GO
INSERT [dbo].[Words] ([Id], [Ar], [En]) VALUES (40529, N'لقد قام المدير  باضافة عملية دفع عن طريق دفع نقدا وقيمتها 500', N'Manger Has been Add Payment Process By Cash Payment And It Is Valaue 500')
GO
INSERT [dbo].[Words] ([Id], [Ar], [En]) VALUES (40530, N'اضافة حالة جديدة على استفسار ما', N'Add New Status On Some Enquiry')
GO
INSERT [dbo].[Words] ([Id], [Ar], [En]) VALUES (40531, N'لقد تم اضافة حالة الحجز بواسطة الدفع الكاش على استفسار تجربة تجربة', N'Ahmed has been adde status Book By Cash on enquiry تجربة تجربة')
GO
INSERT [dbo].[Words] ([Id], [Ar], [En]) VALUES (40532, N'عملية دفع جديدة', N'New Payment Process')
GO
INSERT [dbo].[Words] ([Id], [Ar], [En]) VALUES (40533, N'لقد قام الموظف   lmmmmmmmmmmmm باضافة عملية دفع عن طريق حولة بنكية وقيمتها 200', N'lmmmmmmmmmmmm Has been Add Payment Process By Bank Transfer And It Is Valaue 200')
GO
INSERT [dbo].[Words] ([Id], [Ar], [En]) VALUES (40534, N'اضافة حالة جديدة على استفسار ما', N'Add New Status On Some Enquiry')
GO
INSERT [dbo].[Words] ([Id], [Ar], [En]) VALUES (40535, N'لقد تم اضافة حالة الحجز بواسطة الحوالة البنكية على استفسار تجربة تجربة', N'Ahmed has been adde status Book By Bank Transfer on enquiry تجربة تجربة')
GO
INSERT [dbo].[Words] ([Id], [Ar], [En]) VALUES (40536, N'عملية دفع جديدة', N'New Payment Process')
GO
INSERT [dbo].[Words] ([Id], [Ar], [En]) VALUES (40537, N'لقد قام المدير  باضافة عملية دفع عن طريق حولة بنكية وقيمتها 200', N'Manger Has been Add Payment Process By Bank Transfer And It Is Valaue 200')
GO
INSERT [dbo].[Words] ([Id], [Ar], [En]) VALUES (40538, N'اضافة حالة جديدة على استفسار ما', N'Add New Status On Some Enquiry')
GO
INSERT [dbo].[Words] ([Id], [Ar], [En]) VALUES (40539, N'لقد تم اضافة حالة الحجز بواسطة الحوالة البنكية على استفسار تجربة تجربة', N'Ahmed has been adde status Book By Bank Transfer on enquiry تجربة تجربة')
GO
INSERT [dbo].[Words] ([Id], [Ar], [En]) VALUES (40540, N'نوع الغلاف', N'type')
GO
INSERT [dbo].[Words] ([Id], [Ar], [En]) VALUES (40543, N'50', N'50')
GO
INSERT [dbo].[Words] ([Id], [Ar], [En]) VALUES (40544, N'حرارى', N'حرارى')
GO
INSERT [dbo].[Words] ([Id], [Ar], [En]) VALUES (40553, N'نوع جديد', N'new type')
GO
INSERT [dbo].[Words] ([Id], [Ar], [En]) VALUES (40554, N'نوع', N'type')
GO
INSERT [dbo].[Words] ([Id], [Ar], [En]) VALUES (40555, N'باكج للتجربة فى الفديو', N'باكج للتجربة فى الفديو')
GO
INSERT [dbo].[Words] ([Id], [Ar], [En]) VALUES (40556, N'باكج للتجربة فى الفديو باكج للتجربة فى الفديو', N'باكج للتجربة فى الفديو
باكج للتجربة فى الفديو')
GO
INSERT [dbo].[Words] ([Id], [Ar], [En]) VALUES (40557, N' الانتهاء من الاعداد والتنسيق', N'Coordinations Finshed')
GO
INSERT [dbo].[Words] ([Id], [Ar], [En]) VALUES (40558, N'لقد قام الموظف موظف اعداد بـ انهاء مهام الاعداد والتنسيق للمناسبة ', N'موظف اعداد Has been finshed coordinations for event')
GO
INSERT [dbo].[Words] ([Id], [Ar], [En]) VALUES (40559, NULL, NULL)
GO
INSERT [dbo].[Words] ([Id], [Ar], [En]) VALUES (40560, NULL, NULL)
GO
INSERT [dbo].[Words] ([Id], [Ar], [En]) VALUES (40561, NULL, NULL)
GO
INSERT [dbo].[Words] ([Id], [Ar], [En]) VALUES (40562, NULL, NULL)
GO
INSERT [dbo].[Words] ([Id], [Ar], [En]) VALUES (40563, NULL, NULL)
GO
INSERT [dbo].[Words] ([Id], [Ar], [En]) VALUES (40564, NULL, NULL)
GO
INSERT [dbo].[Words] ([Id], [Ar], [En]) VALUES (40565, NULL, NULL)
GO
INSERT [dbo].[Words] ([Id], [Ar], [En]) VALUES (40566, NULL, NULL)
GO
INSERT [dbo].[Words] ([Id], [Ar], [En]) VALUES (40567, NULL, NULL)
GO
INSERT [dbo].[Words] ([Id], [Ar], [En]) VALUES (40568, NULL, NULL)
GO
INSERT [dbo].[Words] ([Id], [Ar], [En]) VALUES (40569, NULL, NULL)
GO
INSERT [dbo].[Words] ([Id], [Ar], [En]) VALUES (40570, NULL, NULL)
GO
INSERT [dbo].[Words] ([Id], [Ar], [En]) VALUES (40571, NULL, NULL)
GO
INSERT [dbo].[Words] ([Id], [Ar], [En]) VALUES (40572, NULL, NULL)
GO
INSERT [dbo].[Words] ([Id], [Ar], [En]) VALUES (40573, NULL, NULL)
GO
INSERT [dbo].[Words] ([Id], [Ar], [En]) VALUES (40574, NULL, NULL)
GO
INSERT [dbo].[Words] ([Id], [Ar], [En]) VALUES (40575, NULL, NULL)
GO
INSERT [dbo].[Words] ([Id], [Ar], [En]) VALUES (40576, NULL, NULL)
GO
INSERT [dbo].[Words] ([Id], [Ar], [En]) VALUES (40577, NULL, NULL)
GO
INSERT [dbo].[Words] ([Id], [Ar], [En]) VALUES (40578, NULL, NULL)
GO
INSERT [dbo].[Words] ([Id], [Ar], [En]) VALUES (40579, NULL, NULL)
GO
INSERT [dbo].[Words] ([Id], [Ar], [En]) VALUES (40580, NULL, NULL)
GO
INSERT [dbo].[Words] ([Id], [Ar], [En]) VALUES (40581, N'عملية دفع جديدة', N'New Payment Process')
GO
INSERT [dbo].[Words] ([Id], [Ar], [En]) VALUES (40582, N'لقد تم دفع لك دفعة مالية عن طريق تحويل بنكى وقبمتها 50 ريال ', N'You have new payment by bank transfer and it is value 50 ')
GO
INSERT [dbo].[Words] ([Id], [Ar], [En]) VALUES (40583, N'عملية دفع جديدة', N'New Payment Process')
GO
INSERT [dbo].[Words] ([Id], [Ar], [En]) VALUES (40584, N'لقد قام الموظف   ahmed باضافة عملية دفع لـ الموظف Helper وقيمتها 500', N'ahmed Has been Add Payment Process Fro Helper Employee And It Is Valaue 500')
GO
INSERT [dbo].[Words] ([Id], [Ar], [En]) VALUES (40585, N'عملية دفع مقبولة', N'New Payment Process Accepted')
GO
INSERT [dbo].[Words] ([Id], [Ar], [En]) VALUES (40586, N'لقد تمت الموافقة على الدفع الكاش لـ الموظف Helper', N'has been accept for cash payment for Helper employee')
GO
INSERT [dbo].[Words] ([Id], [Ar], [En]) VALUES (40587, N'عملية دفع مقبولة', N'New Payment Process Accepted')
GO
INSERT [dbo].[Words] ([Id], [Ar], [En]) VALUES (40588, N'لقد تمت الموافقة على الدفع الكاش لـ الموظف Helper', N'has been accept for cash payment for Helper employee')
GO
INSERT [dbo].[Words] ([Id], [Ar], [En]) VALUES (40589, N'عملية دفع مرفوضة', N'New Payment Process Is Rejected')
GO
INSERT [dbo].[Words] ([Id], [Ar], [En]) VALUES (40590, N'يوجد عملية دفع مرفوضة خاصة بـ الموظف Helper', N'You have rejected payment process for Helper employee')
GO
INSERT [dbo].[Words] ([Id], [Ar], [En]) VALUES (40591, N'عملية دفع جديدة', N'New Payment Process')
GO
INSERT [dbo].[Words] ([Id], [Ar], [En]) VALUES (40592, N'لقد قام الموظف   ahmed باضافة عملية دفع لـ الموظف Helper وقيمتها 5050', N'ahmed Has been Add Payment Process Fro Helper Employee And It Is Valaue 5050')
GO
INSERT [dbo].[Words] ([Id], [Ar], [En]) VALUES (40593, N'عملية دفع جديدة', N'New Payment Process')
GO
INSERT [dbo].[Words] ([Id], [Ar], [En]) VALUES (40594, N'هناك عملية دفع للموظف Helper وقيمتها 50 ريال', N'you have new paymetn to Helper employee and it is value 50  ')
GO
INSERT [dbo].[Words] ([Id], [Ar], [En]) VALUES (40595, N'عملية دفع جديدة', N'New Payment Process')
GO
INSERT [dbo].[Words] ([Id], [Ar], [En]) VALUES (40596, N'لقد قام الموظف   ahmed باضافة عملية دفع لـ الموظف Helper وقيمتها 200', N'ahmed Has been Add Payment Process Fro Helper Employee And It Is Valaue 200')
GO
INSERT [dbo].[Words] ([Id], [Ar], [En]) VALUES (40597, N'عملية دفع مقبولة', N'New Payment Process Accepted')
GO
INSERT [dbo].[Words] ([Id], [Ar], [En]) VALUES (40598, N'لقد تم دفع لك دفعة مالية عن طريق دفع كاش وقبمتها 200 ريال ', N'You have new payment by cash payment and it is value 200 ')
GO
INSERT [dbo].[Words] ([Id], [Ar], [En]) VALUES (40599, N'عملية دفع مقبولة', N'New Payment Process Accepted')
GO
INSERT [dbo].[Words] ([Id], [Ar], [En]) VALUES (40600, N'لقد تمت الموافقة على الدفع الكاش لـ الموظف Helper', N'has been accept for cash payment for Helper employee')
GO
INSERT [dbo].[Words] ([Id], [Ar], [En]) VALUES (40601, N'عملية دفع جديدة', N'New Payment Process')
GO
INSERT [dbo].[Words] ([Id], [Ar], [En]) VALUES (40602, N'لقد تم دفع لك دفعة مالية عن طريق تحويل بنكى وقبمتها 1000 ريال ', N'You have new payment by bank transfer and it is value 1000 ')
GO
INSERT [dbo].[Words] ([Id], [Ar], [En]) VALUES (40603, N' استفسار جدبد', N'New Enquiry')
GO
INSERT [dbo].[Words] ([Id], [Ar], [En]) VALUES (40604, N'لقد قام المدير بـ انشاء استفسار جديد', N'Manger has been created new enqiry')
GO
INSERT [dbo].[Words] ([Id], [Ar], [En]) VALUES (40605, N'عملية دفع جديدة', N'New Payment Process')
GO
INSERT [dbo].[Words] ([Id], [Ar], [En]) VALUES (40606, N'لقد قام المدير  باضافة عملية دفع عن طريق دفع نقدا وقيمتها 300', N'Manger Has been Add Payment Process By Cash Payment And It Is Valaue 300')
GO
INSERT [dbo].[Words] ([Id], [Ar], [En]) VALUES (40607, N'اضافة حالة جديدة على استفسار ما', N'Add New Status On Some Enquiry')
GO
INSERT [dbo].[Words] ([Id], [Ar], [En]) VALUES (40608, N'لقد تم اضافة حالة الحجز بواسطة الدفع الكاش على استفسار sd sd', N'Ahmed has been adde status Book By Cash on enquiry sd sd')
GO
INSERT [dbo].[Words] ([Id], [Ar], [En]) VALUES (40609, N'البوم', N'البوم')
GO
INSERT [dbo].[Words] ([Id], [Ar], [En]) VALUES (40610, N'وصف البوم', N'وصف البوم')
GO
INSERT [dbo].[Words] ([Id], [Ar], [En]) VALUES (40611, N'ssd', N'sdd')
GO
INSERT [dbo].[Words] ([Id], [Ar], [En]) VALUES (40612, N'sd', N'sd')
GO
INSERT [dbo].[Words] ([Id], [Ar], [En]) VALUES (40613, N'ssd', N'ssas')
GO
INSERT [dbo].[Words] ([Id], [Ar], [En]) VALUES (40614, N'sdsd', N'sdsd')
GO
INSERT [dbo].[Words] ([Id], [Ar], [En]) VALUES (40615, N'عدد الصفح 1225', N'pages count')
GO
INSERT [dbo].[Words] ([Id], [Ar], [En]) VALUES (40616, N'sd', N'asas')
GO
INSERT [dbo].[Words] ([Id], [Ar], [En]) VALUES (40617, N'qwqw', N'qqwqwqw')
GO
INSERT [dbo].[Words] ([Id], [Ar], [En]) VALUES (40618, N'يي', N'sss')
GO
INSERT [dbo].[Words] ([Id], [Ar], [En]) VALUES (40619, N'المنتاجات', N'Products')
GO
INSERT [dbo].[Words] ([Id], [Ar], [En]) VALUES (40620, N'انواع المنتاجات', N'Product Types')
GO
INSERT [dbo].[Words] ([Id], [Ar], [En]) VALUES (40621, N'يسي', N'سيسي')
GO
INSERT [dbo].[Words] ([Id], [Ar], [En]) VALUES (40622, N'يسي', N'سيسي')
GO
INSERT [dbo].[Words] ([Id], [Ar], [En]) VALUES (40623, N'يسي', N'سيسي')
GO
INSERT [dbo].[Words] ([Id], [Ar], [En]) VALUES (40624, N'يسي', N'سيسي')
GO
INSERT [dbo].[Words] ([Id], [Ar], [En]) VALUES (40625, N'يسي', N'سيسي')
GO
INSERT [dbo].[Words] ([Id], [Ar], [En]) VALUES (40626, N'يسي', N'سيسي')
GO
INSERT [dbo].[Words] ([Id], [Ar], [En]) VALUES (40627, N'البومات', N'Albums')
GO
INSERT [dbo].[Words] ([Id], [Ar], [En]) VALUES (40628, N'مربعات', N'Boxes')
GO
INSERT [dbo].[Words] ([Id], [Ar], [En]) VALUES (40629, N'اكسسوارات', N'Accessories')
GO
INSERT [dbo].[Words] ([Id], [Ar], [En]) VALUES (40630, N'sd', N'sd')
GO
INSERT [dbo].[Words] ([Id], [Ar], [En]) VALUES (40631, N'المنتاجات', N'Products')
GO
INSERT [dbo].[Words] ([Id], [Ar], [En]) VALUES (40634, N'5', N'6')
GO
INSERT [dbo].[Words] ([Id], [Ar], [En]) VALUES (40637, N'5', N'6')
GO
INSERT [dbo].[Words] ([Id], [Ar], [En]) VALUES (40638, N'1', N'2')
GO
INSERT [dbo].[Words] ([Id], [Ar], [En]) VALUES (40639, N'4', N'5')
GO
INSERT [dbo].[Words] ([Id], [Ar], [En]) VALUES (40640, N'7', N'8')
GO
INSERT [dbo].[Words] ([Id], [Ar], [En]) VALUES (40643, N'منتج 2 منتج 2', N'منتج 3 منتج 3')
GO
INSERT [dbo].[Words] ([Id], [Ar], [En]) VALUES (40644, N'5', N'5')
GO
INSERT [dbo].[Words] ([Id], [Ar], [En]) VALUES (40645, N'22', N'22')
GO
INSERT [dbo].[Words] ([Id], [Ar], [En]) VALUES (40646, N'33', N'33')
GO
INSERT [dbo].[Words] ([Id], [Ar], [En]) VALUES (40647, N's', N'd')
GO
INSERT [dbo].[Words] ([Id], [Ar], [En]) VALUES (40648, N'wd', N'd')
GO
INSERT [dbo].[Words] ([Id], [Ar], [En]) VALUES (40649, N'فئات الشحن', N'Shipping Categories')
GO
INSERT [dbo].[Words] ([Id], [Ar], [En]) VALUES (40650, N'منتج جديد', N'منتج جديد')
GO
INSERT [dbo].[Words] ([Id], [Ar], [En]) VALUES (40651, N'منتج جديد منتج جديد منتج جديد', N'منتج جديد منتج جديد منتج جديد')
GO
INSERT [dbo].[Words] ([Id], [Ar], [En]) VALUES (40652, N'منتج جديد منتج جديد منتج جديد منتج جديد منتج جديد منتج جديد منتج جديد منتج جديد منتج جديد منتج جديد منتج جديد منتج جديد منتج جديد منتج جديد منتج جديد منتج جديد منتج جديد منتج جديد منتج جديد منتج جديد منتج جديد منتج جديد منتج جديد منتج جديد منتج جديد منتج جديد', N'منتج جديد منتج جديد منتج جديد منتج جديد منتج جديد منتج جديد منتج جديد منتج جديد منتج جديد منتج جديد منتج جديد منتج جديد منتج جديد منتج جديد منتج جديد منتج جديد منتج جديد منتج جديد منتج جديد منتج جديد منتج جديد منتج جديد منتج جديد منتج جديد منتج جديد منتج جديد')
GO
INSERT [dbo].[Words] ([Id], [Ar], [En]) VALUES (40653, N'حررارى', N'حررارى')
GO
INSERT [dbo].[Words] ([Id], [Ar], [En]) VALUES (40654, N'خشب', N'خشب')
GO
INSERT [dbo].[Words] ([Id], [Ar], [En]) VALUES (40655, N'فولاز', N'فولاز')
GO
INSERT [dbo].[Words] ([Id], [Ar], [En]) VALUES (40656, N'20', N'20')
GO
INSERT [dbo].[Words] ([Id], [Ar], [En]) VALUES (40657, N'30', N'30')
GO
INSERT [dbo].[Words] ([Id], [Ar], [En]) VALUES (40658, N'40', N'40')
GO
INSERT [dbo].[Words] ([Id], [Ar], [En]) VALUES (40659, N'50', N'50')
GO
INSERT [dbo].[Words] ([Id], [Ar], [En]) VALUES (40662, N'منتج جديد', N'منتج جديد')
GO
INSERT [dbo].[Words] ([Id], [Ar], [En]) VALUES (40663, N'خشب', N'خشب')
GO
INSERT [dbo].[Words] ([Id], [Ar], [En]) VALUES (40664, N'خدمة التوصيل', N'Delivery Service')
GO
INSERT [dbo].[Words] ([Id], [Ar], [En]) VALUES (40665, N'خدمة التوصيل', N'Delivery Service')
GO
INSERT [dbo].[Words] ([Id], [Ar], [En]) VALUES (40666, N'خدمة التوصيل', N'Delivery Service')
GO
INSERT [dbo].[Words] ([Id], [Ar], [En]) VALUES (40667, N'طلبات المصورين', N'Photographers Orders')
GO
INSERT [dbo].[Words] ([Id], [Ar], [En]) VALUES (40668, N'عملية دفع جديدة لـ طرلب رقم 3', N'New Payment Process For Order 3')
GO
INSERT [dbo].[Words] ([Id], [Ar], [En]) VALUES (40669, N'لقد قام العميل ahmed باضافة عملية دفع جديدة عن طرق حوالة بنكية وقيمتها 500', N'The customer ahmed has added a new payment for a bank transfer of 500')
GO
INSERT [dbo].[Words] ([Id], [Ar], [En]) VALUES (40670, N'عملية دفع جديدة لـ طرلب رقم 3', N'New Payment Process For Order 3')
GO
INSERT [dbo].[Words] ([Id], [Ar], [En]) VALUES (40671, N'لقد قام العميل ahmed باضافة عملية دفع جديدة عن طرق حوالة بنكية وقيمتها 500', N'The customer ahmed has added a new payment for a bank transfer of 500')
GO
INSERT [dbo].[Words] ([Id], [Ar], [En]) VALUES (40672, N'عملية دفع جديدة لـ طرلب رقم 3', N'New Payment Process For Order 3')
GO
INSERT [dbo].[Words] ([Id], [Ar], [En]) VALUES (40673, N'لقد قام العميل ahmed باضافة عملية دفع جديدة عن طرق حوالة بنكية وقيمتها 50', N'The customer ahmed has added a new payment for a bank transfer of 50')
GO
INSERT [dbo].[Words] ([Id], [Ar], [En]) VALUES (40674, N'عملية دفع جديدة لـ طرلب رقم 5', N'New Payment Process For Order 5')
GO
INSERT [dbo].[Words] ([Id], [Ar], [En]) VALUES (40675, N'لقد قام العميل ahmed باضافة عملية دفع جديدة عن طرق حوالة بنكية وقيمتها 50', N'The customer ahmed has added a new payment for a bank transfer of 50')
GO
INSERT [dbo].[Words] ([Id], [Ar], [En]) VALUES (40676, N'عملية دفع جديدة لـ طرلب رقم 5', N'New Payment Process For Order 5')
GO
INSERT [dbo].[Words] ([Id], [Ar], [En]) VALUES (40677, N'لقد قام العميل ahmed باضافة عملية دفع جديدة عن طرق حوالة بنكية وقيمتها 50', N'The customer ahmed has added a new payment for a bank transfer of 50')
GO
INSERT [dbo].[Words] ([Id], [Ar], [En]) VALUES (40678, N'عملية دفع جديدة لـ طرلب رقم 5', N'New Payment Process For Order 5')
GO
INSERT [dbo].[Words] ([Id], [Ar], [En]) VALUES (40679, N'لقد قام العميل ahmed باضافة عملية دفع جديدة عن طرق حوالة بنكية وقيمتها 87', N'The customer ahmed has added a new payment for a bank transfer of 87')
GO
INSERT [dbo].[Words] ([Id], [Ar], [En]) VALUES (40680, N'عملية دفع جديدة لـ طرلب رقم 5', N'New Payment Process For Order 5')
GO
INSERT [dbo].[Words] ([Id], [Ar], [En]) VALUES (40681, N'لقد قام العميل ahmed باضافة عملية دفع جديدة عن طرق حوالة بنكية وقيمتها 54', N'The customer ahmed has added a new payment for a bank transfer of 54')
GO
INSERT [dbo].[Words] ([Id], [Ar], [En]) VALUES (40682, N'5', N'5')
GO
INSERT [dbo].[Words] ([Id], [Ar], [En]) VALUES (40683, N'5', N'5')
GO
INSERT [dbo].[Words] ([Id], [Ar], [En]) VALUES (40684, N'5', N'5')
GO
INSERT [dbo].[Words] ([Id], [Ar], [En]) VALUES (40685, N'5', N'5')
GO
INSERT [dbo].[Words] ([Id], [Ar], [En]) VALUES (40686, N'5', N'5')
GO
INSERT [dbo].[Words] ([Id], [Ar], [En]) VALUES (40687, N'5', N'5')
GO
INSERT [dbo].[Words] ([Id], [Ar], [En]) VALUES (40688, N'5', N'5')
GO
INSERT [dbo].[Words] ([Id], [Ar], [En]) VALUES (40691, N'j', N'ailj')
GO
INSERT [dbo].[Words] ([Id], [Ar], [En]) VALUES (40694, N'ds', N'ds')
GO
INSERT [dbo].[Words] ([Id], [Ar], [En]) VALUES (40695, N'2', N'2')
GO
INSERT [dbo].[Words] ([Id], [Ar], [En]) VALUES (40698, N'lkqn', N'lknq')
GO
INSERT [dbo].[Words] ([Id], [Ar], [En]) VALUES (40699, N'5', N'5')
GO
INSERT [dbo].[Words] ([Id], [Ar], [En]) VALUES (40702, N'منتج جديد منتج جديد منتج جديد منتج جديد منتج جديد منتج جديد منتج جديد منتج جديد منتج جديد منتج جديد منتج جديد منتج جديد منتج جديد منتج جديد منتج جديد منتج جديد منتج جديد منتج جديد منتج جديد منتج جديد منتج جديد منتج جديد منتج جديد منتج جديد منتج جديد منتج جديد', N'منتج جديد منتج جديد منتج جديد منتج جديد منتج جديد منتج جديد منتج جديد منتج جديد منتج جديد منتج جديد منتج جديد منتج جديد منتج جديد منتج جديد منتج جديد منتج جديد منتج جديد منتج جديد منتج جديد منتج جديد منتج جديد منتج جديد منتج جديد منتج جديد منتج جديد منتج جديد')
GO
INSERT [dbo].[Words] ([Id], [Ar], [En]) VALUES (40703, N'حررارى', N'حررارى')
GO
INSERT [dbo].[Words] ([Id], [Ar], [En]) VALUES (40704, N'خشب', N'خشب')
GO
INSERT [dbo].[Words] ([Id], [Ar], [En]) VALUES (40705, N'فولاز', N'فولاز')
GO
INSERT [dbo].[Words] ([Id], [Ar], [En]) VALUES (40706, N'20', N'20')
GO
INSERT [dbo].[Words] ([Id], [Ar], [En]) VALUES (40707, N'30', N'30')
GO
INSERT [dbo].[Words] ([Id], [Ar], [En]) VALUES (40708, N'40', N'40')
GO
INSERT [dbo].[Words] ([Id], [Ar], [En]) VALUES (40709, N'50', N'50')
GO
INSERT [dbo].[Words] ([Id], [Ar], [En]) VALUES (40710, N'5', N'5')
GO
INSERT [dbo].[Words] ([Id], [Ar], [En]) VALUES (40711, N'5', N'5')
GO
INSERT [dbo].[Words] ([Id], [Ar], [En]) VALUES (40714, N'منتج جديد منتج جديد منتج جديد منتج جديد منتج جديد منتج جديد منتج جديد منتج جديد منتج جديد منتج جديد منتج جديد منتج جديد منتج جديد منتج جديد منتج جديد منتج جديد منتج جديد منتج جديد منتج جديد منتج جديد منتج جديد منتج جديد منتج جديد منتج جديد منتج جديد منتج جديد', N'منتج جديد منتج جديد منتج جديد منتج جديد منتج جديد منتج جديد منتج جديد منتج جديد منتج جديد منتج جديد منتج جديد منتج جديد منتج جديد منتج جديد منتج جديد منتج جديد منتج جديد منتج جديد منتج جديد منتج جديد منتج جديد منتج جديد منتج جديد منتج جديد منتج جديد منتج جديد')
GO
INSERT [dbo].[Words] ([Id], [Ar], [En]) VALUES (40715, N'حررارى', N'حررارى')
GO
INSERT [dbo].[Words] ([Id], [Ar], [En]) VALUES (40716, N'خشب', N'خشب')
GO
INSERT [dbo].[Words] ([Id], [Ar], [En]) VALUES (40717, N'فولاز', N'فولاز')
GO
INSERT [dbo].[Words] ([Id], [Ar], [En]) VALUES (40718, N'20', N'20')
GO
INSERT [dbo].[Words] ([Id], [Ar], [En]) VALUES (40719, N'30', N'30')
GO
INSERT [dbo].[Words] ([Id], [Ar], [En]) VALUES (40720, N'40', N'40')
GO
INSERT [dbo].[Words] ([Id], [Ar], [En]) VALUES (40721, N'50', N'50')
GO
INSERT [dbo].[Words] ([Id], [Ar], [En]) VALUES (40722, N'5', N'5')
GO
INSERT [dbo].[Words] ([Id], [Ar], [En]) VALUES (40723, N'5', N'5')
GO
INSERT [dbo].[Words] ([Id], [Ar], [En]) VALUES (40724, N'نسخة منتج جديد', N'نسخة منتج جديد')
GO
INSERT [dbo].[Words] ([Id], [Ar], [En]) VALUES (40725, N'منتج جديد منتج جديد منتج جديد', N'منتج جديد منتج جديد منتج جديد')
GO
INSERT [dbo].[Words] ([Id], [Ar], [En]) VALUES (40726, N'منتج جديد منتج جديد منتج جديد منتج جديد منتج جديد منتج جديد منتج جديد منتج جديد منتج جديد منتج جديد منتج جديد منتج جديد منتج جديد منتج جديد منتج جديد منتج جديد منتج جديد منتج جديد منتج جديد منتج جديد منتج جديد منتج جديد منتج جديد منتج جديد منتج جديد منتج جديد', N'منتج جديد منتج جديد منتج جديد منتج جديد منتج جديد منتج جديد منتج جديد منتج جديد منتج جديد منتج جديد منتج جديد منتج جديد منتج جديد منتج جديد منتج جديد منتج جديد منتج جديد منتج جديد منتج جديد منتج جديد منتج جديد منتج جديد منتج جديد منتج جديد منتج جديد منتج جديد')
GO
INSERT [dbo].[Words] ([Id], [Ar], [En]) VALUES (40727, N'حررارى', N'حررارى')
GO
INSERT [dbo].[Words] ([Id], [Ar], [En]) VALUES (40728, N'خشب', N'خشب')
GO
INSERT [dbo].[Words] ([Id], [Ar], [En]) VALUES (40729, N'فولاز', N'فولاز')
GO
INSERT [dbo].[Words] ([Id], [Ar], [En]) VALUES (40730, N'20', N'20')
GO
INSERT [dbo].[Words] ([Id], [Ar], [En]) VALUES (40731, N'30', N'30')
GO
INSERT [dbo].[Words] ([Id], [Ar], [En]) VALUES (40732, N'40', N'40')
GO
INSERT [dbo].[Words] ([Id], [Ar], [En]) VALUES (40733, N'50', N'50')
GO
INSERT [dbo].[Words] ([Id], [Ar], [En]) VALUES (40734, N'5', N'5')
GO
INSERT [dbo].[Words] ([Id], [Ar], [En]) VALUES (40735, N'5', N'5')
GO
INSERT [dbo].[Words] ([Id], [Ar], [En]) VALUES (40736, N'الاسم تجربة', N'test name')
GO
INSERT [dbo].[Words] ([Id], [Ar], [En]) VALUES (40737, N'منتج جديد 11', N'22منتج جديد')
GO
INSERT [dbo].[Words] ([Id], [Ar], [En]) VALUES (40738, N'منتج جديد منتج جديد منتج جديد


منتج جديد منتج جديد منتج جديد

منتج جديد منتج جديد منتج جديد', N'منتج جديد منتج جديد منتج جديد


منتج جديد منتج جديد منتج جديد

منتج جديد منتج جديد منتج جديد')
GO
INSERT [dbo].[Words] ([Id], [Ar], [En]) VALUES (40739, N'منتج جديد منتج جديد منتج جديد منتج جديد منتج جديد منتج جديد منتج جديد منتج جديد منتج جديد منتج جديد منتج جديد منتج جديد منتج جديد منتج جديد منتج جديد منتج جديد منتج جديد منتج جديد منتج جديد منتج جديد منتج جديد منتج جديد منتج جديد منتج جديد منتج جديد منتج جديد', N'منتج جديد منتج جديد منتج جديد منتج جديد منتج جديد منتج جديد منتج جديد منتج جديد منتج جديد منتج جديد منتج جديد منتج جديد منتج جديد منتج جديد منتج جديد منتج جديد منتج جديد منتج جديد منتج جديد منتج جديد منتج جديد منتج جديد منتج جديد منتج جديد منتج جديد منتج جديد')
GO
INSERT [dbo].[Words] ([Id], [Ar], [En]) VALUES (40740, N'حررارى', N'حررارى')
GO
INSERT [dbo].[Words] ([Id], [Ar], [En]) VALUES (40741, N'خشب', N'خشب')
GO
INSERT [dbo].[Words] ([Id], [Ar], [En]) VALUES (40742, N'فولاز', N'فولاز')
GO
INSERT [dbo].[Words] ([Id], [Ar], [En]) VALUES (40743, N'20', N'20')
GO
INSERT [dbo].[Words] ([Id], [Ar], [En]) VALUES (40744, N'30', N'30')
GO
INSERT [dbo].[Words] ([Id], [Ar], [En]) VALUES (40745, N'40', N'40')
GO
INSERT [dbo].[Words] ([Id], [Ar], [En]) VALUES (40746, N'50', N'50')
GO
INSERT [dbo].[Words] ([Id], [Ar], [En]) VALUES (40747, N'5', N'5')
GO
INSERT [dbo].[Words] ([Id], [Ar], [En]) VALUES (40748, N'5', N'5')
GO
INSERT [dbo].[Words] ([Id], [Ar], [En]) VALUES (40749, N'تجربة  11', N'تجربة  11')
GO
INSERT [dbo].[Words] ([Id], [Ar], [En]) VALUES (40750, N'تجربة  11', N'تجربة  11')
GO
INSERT [dbo].[Words] ([Id], [Ar], [En]) VALUES (40751, N'تجربة  11  وصف صور', N'تجربة  11  وصف صور')
GO
INSERT [dbo].[Words] ([Id], [Ar], [En]) VALUES (40752, N'30', N'30')
GO
INSERT [dbo].[Words] ([Id], [Ar], [En]) VALUES (40753, N'20', N'20')
GO
INSERT [dbo].[Words] ([Id], [Ar], [En]) VALUES (40754, N'تجربة  11 مستنسخ', N'تجربة  11')
GO
INSERT [dbo].[Words] ([Id], [Ar], [En]) VALUES (40755, N'تجربة  11', N'تجربة  11')
GO
INSERT [dbo].[Words] ([Id], [Ar], [En]) VALUES (40756, N'تجربة  11  وصف صور', N'تجربة  11  وصف صور')
GO
INSERT [dbo].[Words] ([Id], [Ar], [En]) VALUES (40757, N'30', N'30')
GO
INSERT [dbo].[Words] ([Id], [Ar], [En]) VALUES (40758, N'20', N'20')
GO
INSERT [dbo].[Words] ([Id], [Ar], [En]) VALUES (40759, N'خدمة التوصيل', N'Delivery Service')
GO
INSERT [dbo].[Words] ([Id], [Ar], [En]) VALUES (40760, N'خدمة التوصيل', N'Delivery Service')
GO
INSERT [dbo].[Words] ([Id], [Ar], [En]) VALUES (40761, N'تم الموافقة على عملية دفع لـ الطلب رقم 5', N'Accepted Payment Process For Order 5')
GO
INSERT [dbo].[Words] ([Id], [Ar], [En]) VALUES (40762, N'لقد قامت الادارة بـ الموافقة على عملية دفع جديدة عن طرق حوالة بنكية وقيمتها 54', N'The mangment has accepted youre new payment for a bank transfer of 54')
GO
INSERT [dbo].[Words] ([Id], [Ar], [En]) VALUES (40763, N'تم الموافقة على عملية دفع لـ الطلب رقم 3', N'Accepted Payment Process For Order 3')
GO
INSERT [dbo].[Words] ([Id], [Ar], [En]) VALUES (40764, N'لقد قامت الادارة بـ الموافقة على عملية دفع جديدة عن طرق حوالة بنكية وقيمتها 50', N'The mangment has accepted youre new payment for a bank transfer of 50')
GO
INSERT [dbo].[Words] ([Id], [Ar], [En]) VALUES (40765, N'تم الموافقة على عملية دفع لـ الطلب رقم 5', N'Accepted Payment Process For Order 5')
GO
INSERT [dbo].[Words] ([Id], [Ar], [En]) VALUES (40766, N'لقد قامت الادارة بـ الموافقة على عملية دفع جديدة عن طرق حوالة بنكية وقيمتها 87', N'The mangment has accepted youre new payment for a bank transfer of 87')
GO
INSERT [dbo].[Words] ([Id], [Ar], [En]) VALUES (40767, N'تم الموافقة على عملية دفع لـ الطلب رقم 5', N'Accepted Payment Process For Order 5')
GO
INSERT [dbo].[Words] ([Id], [Ar], [En]) VALUES (40768, N'لقد قامت الادارة بـ الموافقة على عملية دفع جديدة عن طرق حوالة بنكية وقيمتها 54', N'The mangment has accepted youre new payment for a bank transfer of 54')
GO
INSERT [dbo].[Words] ([Id], [Ar], [En]) VALUES (40769, N'تم رفض عملية دفع لـ الطلب رقم 5', N'Rejected Payment Process For Order 5')
GO
INSERT [dbo].[Words] ([Id], [Ar], [En]) VALUES (40770, N' لقد قامت الادارة بـ الرفض على عملية دفع جديدة عن طرق حوالة بنكية وقيمتها 50 ', N'The mangment has rejected youre new payment for a bank transfer of 50')
GO
INSERT [dbo].[Words] ([Id], [Ar], [En]) VALUES (40771, N'تم الموافقة على عملية دفع لـ الطلب رقم 3', N'Accepted Payment Process For Order 3')
GO
INSERT [dbo].[Words] ([Id], [Ar], [En]) VALUES (40772, N'لقد قامت الادارة بـ الموافقة على عملية دفع جديدة عن طرق حوالة بنكية وقيمتها 500', N'The mangment has accepted youre new payment for a bank transfer of 500')
GO
INSERT [dbo].[Words] ([Id], [Ar], [En]) VALUES (40773, N'تم الموافقة على عملية دفع لـ الطلب رقم 3', N'Accepted Payment Process For Order 3')
GO
INSERT [dbo].[Words] ([Id], [Ar], [En]) VALUES (40774, N'لقد قامت الادارة بـ الموافقة على عملية دفع جديدة عن طرق حوالة بنكية وقيمتها 50', N'The mangment has accepted youre new payment for a bank transfer of 50')
GO
INSERT [dbo].[Words] ([Id], [Ar], [En]) VALUES (40775, N'تم الموافقة على عملية دفع لـ الطلب رقم 3', N'Accepted Payment Process For Order 3')
GO
INSERT [dbo].[Words] ([Id], [Ar], [En]) VALUES (40776, N'لقد قامت الادارة بـ الموافقة على عملية دفع جديدة عن طرق حوالة بنكية وقيمتها 500', N'The mangment has accepted youre new payment for a bank transfer of 500')
GO
INSERT [dbo].[Words] ([Id], [Ar], [En]) VALUES (40777, N'مربعات', N'boces')
GO
INSERT [dbo].[Words] ([Id], [Ar], [En]) VALUES (40778, N'تصفيف', N'تصفيف')
GO
INSERT [dbo].[Words] ([Id], [Ar], [En]) VALUES (40779, N'حفر خشبى', N'حفر خشبى')
GO
INSERT [dbo].[Words] ([Id], [Ar], [En]) VALUES (40780, N'فضى', N'فضى')
GO
INSERT [dbo].[Words] ([Id], [Ar], [En]) VALUES (40781, N'الون', N'الون')
GO
INSERT [dbo].[Words] ([Id], [Ar], [En]) VALUES (40782, N'احترافى', N'احترافى')
GO
INSERT [dbo].[Words] ([Id], [Ar], [En]) VALUES (40783, N'بسيط', N'بسيط')
GO
INSERT [dbo].[Words] ([Id], [Ar], [En]) VALUES (40784, N'مشوش', N'مشوش')
GO
INSERT [dbo].[Words] ([Id], [Ar], [En]) VALUES (40785, N'حرير', N'حرير')
GO
INSERT [dbo].[Words] ([Id], [Ar], [En]) VALUES (40786, N'اسطورى', N'اسطورى')
GO
INSERT [dbo].[Words] ([Id], [Ar], [En]) VALUES (40787, N'لوحى', N'لوحى')
GO
INSERT [dbo].[Words] ([Id], [Ar], [En]) VALUES (40788, N'رفيع', N'رفيع')
GO
INSERT [dbo].[Words] ([Id], [Ar], [En]) VALUES (40789, N'سماوى', N'سماوى')
GO
INSERT [dbo].[Words] ([Id], [Ar], [En]) VALUES (40790, N'متعدد', N'متعدد')
GO
INSERT [dbo].[Words] ([Id], [Ar], [En]) VALUES (40791, N'مزغرف', N'مزغرف')
GO
INSERT [dbo].[Words] ([Id], [Ar], [En]) VALUES (40792, N'خشبى 1', N'خشبى 1')
GO
INSERT [dbo].[Words] ([Id], [Ar], [En]) VALUES (40793, N'خشبى 1 خشبى 1

خشبى 1
خشبى 1خشبى 1خشبى 1خشبى 1', N'خشبى 1 خشبى 1

خشبى 1
خشبى 1خشبى 1خشبى 1خشبى 1')
GO
INSERT [dbo].[Words] ([Id], [Ar], [En]) VALUES (40794, N'يجب تحميل صور واضحة بـ الاضافة الى سوف يتم حفظ الصور على الدروب بوكس', N'يجب تحميل صور واضحة بـ الاضافة الى سوف يتم حفظ الصور على الدروب بوكس')
GO
INSERT [dbo].[Words] ([Id], [Ar], [En]) VALUES (40795, N'اسود', N'اسود')
GO
INSERT [dbo].[Words] ([Id], [Ar], [En]) VALUES (40796, N'رمادى', N'رمادى')
GO
INSERT [dbo].[Words] ([Id], [Ar], [En]) VALUES (40797, N'احمر', N'احمر')
GO
INSERT [dbo].[Words] ([Id], [Ar], [En]) VALUES (40798, N'90', N'90')
GO
INSERT [dbo].[Words] ([Id], [Ar], [En]) VALUES (40799, N'80', N'80')
GO
INSERT [dbo].[Words] ([Id], [Ar], [En]) VALUES (40800, N'70', N'70')
GO
INSERT [dbo].[Words] ([Id], [Ar], [En]) VALUES (40801, N'60', N'60')
GO
INSERT [dbo].[Words] ([Id], [Ar], [En]) VALUES (40802, N'50', N'50')
GO
INSERT [dbo].[Words] ([Id], [Ar], [En]) VALUES (40803, N'خشبى 2', N'خشبى 2')
GO
INSERT [dbo].[Words] ([Id], [Ar], [En]) VALUES (40804, N'خشبى 1 خشبى 2

خشبى 1
خشبى 1خشبى 1خشبى 1خشبى 1', N'خشبى 1 خشبى 1

خشبى 1
خشبى 1خشبى 1خشبى 1خشبى 1')
GO
INSERT [dbo].[Words] ([Id], [Ar], [En]) VALUES (40805, N'يجب تحميل صور واضحة بـ الاضافة الى سوف يتم حفظ الصور على الدروب بوكس', N'يجب تحميل صور واضحة بـ الاضافة الى سوف يتم حفظ الصور على الدروب بوكس')
GO
INSERT [dbo].[Words] ([Id], [Ar], [En]) VALUES (40806, N'اسود', N'اسود')
GO
INSERT [dbo].[Words] ([Id], [Ar], [En]) VALUES (40807, N'رمادى', N'رمادى')
GO
INSERT [dbo].[Words] ([Id], [Ar], [En]) VALUES (40808, N'احمر', N'احمر')
GO
INSERT [dbo].[Words] ([Id], [Ar], [En]) VALUES (40809, N'90', N'90')
GO
INSERT [dbo].[Words] ([Id], [Ar], [En]) VALUES (40810, N'80', N'80')
GO
INSERT [dbo].[Words] ([Id], [Ar], [En]) VALUES (40811, N'70', N'70')
GO
INSERT [dbo].[Words] ([Id], [Ar], [En]) VALUES (40812, N'60', N'60')
GO
INSERT [dbo].[Words] ([Id], [Ar], [En]) VALUES (40813, N'50', N'50')
GO
INSERT [dbo].[Words] ([Id], [Ar], [En]) VALUES (40814, N'خدمة التوصيل', N'Delivery Service')
GO
INSERT [dbo].[Words] ([Id], [Ar], [En]) VALUES (40815, N'عملية دفع جديدة لـ طلب رقم 1', N'New Payment Process For Order 1')
GO
INSERT [dbo].[Words] ([Id], [Ar], [En]) VALUES (40816, N'لقد قام العميل ahmed باضافة عملية دفع جديدة عن طرق حوالة بنكية وقيمتها 500', N'The customer ahmed has added a new payment for a bank transfer of 500')
GO
INSERT [dbo].[Words] ([Id], [Ar], [En]) VALUES (40817, N'تم الموافقة على عملية دفع لـ الطلب رقم 1', N'Accepted Payment Process For Order 1')
GO
INSERT [dbo].[Words] ([Id], [Ar], [En]) VALUES (40818, N'لقد قامت الادارة بـ الموافقة على عملية دفع جديدة عن طرق حوالة بنكية وقيمتها 500', N'The mangment has accepted youre new payment for a bank transfer of 500')
GO
INSERT [dbo].[WorkTypes] ([Id], [FKWord_Id], [PageUrl]) VALUES (1, 20181, N'')
GO
INSERT [dbo].[WorkTypes] ([Id], [FKWord_Id], [PageUrl]) VALUES (2, 20182, NULL)
GO
INSERT [dbo].[WorkTypes] ([Id], [FKWord_Id], [PageUrl]) VALUES (3, 20183, N'/EEW/Coordinations')
GO
INSERT [dbo].[WorkTypes] ([Id], [FKWord_Id], [PageUrl]) VALUES (4, 20184, N'/EEW/Implementations')
GO
INSERT [dbo].[WorkTypes] ([Id], [FKWord_Id], [PageUrl]) VALUES (5, 20185, N'/EEW/ArchivingAndSaveing')
GO
INSERT [dbo].[WorkTypes] ([Id], [FKWord_Id], [PageUrl]) VALUES (6, 20186, NULL)
GO
INSERT [dbo].[WorkTypes] ([Id], [FKWord_Id], [PageUrl]) VALUES (7, 20187, NULL)
GO
INSERT [dbo].[WorkTypes] ([Id], [FKWord_Id], [PageUrl]) VALUES (8, 20188, NULL)
GO
INSERT [dbo].[WorkTypes] ([Id], [FKWord_Id], [PageUrl]) VALUES (9, 20189, NULL)
GO
INSERT [dbo].[WorkTypes] ([Id], [FKWord_Id], [PageUrl]) VALUES (10, 20190, NULL)
GO
INSERT [dbo].[WorkTypes] ([Id], [FKWord_Id], [PageUrl]) VALUES (11, 20191, NULL)
GO
INSERT [dbo].[WorkTypes] ([Id], [FKWord_Id], [PageUrl]) VALUES (12, 20192, NULL)
GO
INSERT [dbo].[WorkTypes] ([Id], [FKWord_Id], [PageUrl]) VALUES (13, 20193, NULL)
GO
INSERT [dbo].[WorkTypes] ([Id], [FKWord_Id], [PageUrl]) VALUES (14, 20194, NULL)
GO
/****** Object:  Index [IX_PoolQuestionTypes]    Script Date: 1/30/2020 7:50:36 PM ******/
CREATE NONCLUSTERED INDEX [IX_PoolQuestionTypes] ON [dbo].[EventSurveyQuestionTypes]
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Cities] ADD  CONSTRAINT [DF_Cities_ShippingPrice]  DEFAULT ((0)) FOR [ShippingPrice]
GO
ALTER TABLE [dbo].[Enquires] ADD  CONSTRAINT [DF_Enquires_IsCreatedEvent]  DEFAULT ((0)) FOR [IsCreatedEvent]
GO
ALTER TABLE [dbo].[Phot_Orders] ADD  CONSTRAINT [DF_Phot_Orders_IsActive]  DEFAULT ((1)) FOR [IsActive]
GO
ALTER TABLE [dbo].[Phot_Products] ADD  CONSTRAINT [DF_Phot_Products_Version]  DEFAULT ((1)) FOR [Version]
GO
ALTER TABLE [dbo].[Users] ADD  CONSTRAINT [DF_Users_IsActiveEmail]  DEFAULT ((0)) FOR [IsActiveEmail]
GO
ALTER TABLE [dbo].[AccountTypes]  WITH CHECK ADD  CONSTRAINT [FK_AccountTypes_Words] FOREIGN KEY([FkWord_Id])
REFERENCES [dbo].[Words] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AccountTypes] CHECK CONSTRAINT [FK_AccountTypes_Words]
GO
ALTER TABLE [dbo].[Albums]  WITH CHECK ADD  CONSTRAINT [FK_AlbumTypes_Words] FOREIGN KEY([FKWord_Id])
REFERENCES [dbo].[Words] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Albums] CHECK CONSTRAINT [FK_AlbumTypes_Words]
GO
ALTER TABLE [dbo].[AlbumsFiles]  WITH CHECK ADD  CONSTRAINT [FK_AlbumsFiles_Albums] FOREIGN KEY([FKAlbum_Id])
REFERENCES [dbo].[Albums] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AlbumsFiles] CHECK CONSTRAINT [FK_AlbumsFiles_Albums]
GO
ALTER TABLE [dbo].[Branches]  WITH CHECK ADD  CONSTRAINT [FK_Branches_Cities] FOREIGN KEY([FKCity_Id])
REFERENCES [dbo].[Cities] ([Id])
GO
ALTER TABLE [dbo].[Branches] CHECK CONSTRAINT [FK_Branches_Cities]
GO
ALTER TABLE [dbo].[Branches]  WITH CHECK ADD  CONSTRAINT [FK_Branches_Countries] FOREIGN KEY([FkCountry_Id])
REFERENCES [dbo].[Countries] ([Id])
GO
ALTER TABLE [dbo].[Branches] CHECK CONSTRAINT [FK_Branches_Countries]
GO
ALTER TABLE [dbo].[Branches]  WITH CHECK ADD  CONSTRAINT [FK_Branches_Words] FOREIGN KEY([FKWord_Id])
REFERENCES [dbo].[Words] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Branches] CHECK CONSTRAINT [FK_Branches_Words]
GO
ALTER TABLE [dbo].[Cities]  WITH CHECK ADD  CONSTRAINT [FK_Cities_Countries] FOREIGN KEY([FKCountry_Id])
REFERENCES [dbo].[Countries] ([Id])
GO
ALTER TABLE [dbo].[Cities] CHECK CONSTRAINT [FK_Cities_Countries]
GO
ALTER TABLE [dbo].[Cities]  WITH CHECK ADD  CONSTRAINT [FK_Cities_Words] FOREIGN KEY([FKWord_Id])
REFERENCES [dbo].[Words] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Cities] CHECK CONSTRAINT [FK_Cities_Words]
GO
ALTER TABLE [dbo].[Countries]  WITH CHECK ADD  CONSTRAINT [FK_Countries_Words] FOREIGN KEY([FKWord_Id])
REFERENCES [dbo].[Words] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Countries] CHECK CONSTRAINT [FK_Countries_Words]
GO
ALTER TABLE [dbo].[EmployeeDistributionTasks]  WITH CHECK ADD  CONSTRAINT [FK_EmployeeDistributionWorks_Branches] FOREIGN KEY([FKBranch_Id])
REFERENCES [dbo].[Branches] ([Id])
GO
ALTER TABLE [dbo].[EmployeeDistributionTasks] CHECK CONSTRAINT [FK_EmployeeDistributionWorks_Branches]
GO
ALTER TABLE [dbo].[EmployeeDistributionTasks]  WITH CHECK ADD  CONSTRAINT [FK_EmployeeDistributionWorks_Events] FOREIGN KEY([FKEvent_Id])
REFERENCES [dbo].[Events] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[EmployeeDistributionTasks] CHECK CONSTRAINT [FK_EmployeeDistributionWorks_Events]
GO
ALTER TABLE [dbo].[EmployeeDistributionTasks]  WITH CHECK ADD  CONSTRAINT [FK_EmployeeDistributionWorks_Users] FOREIGN KEY([FKEmployee_Id])
REFERENCES [dbo].[Users] ([Id])
GO
ALTER TABLE [dbo].[EmployeeDistributionTasks] CHECK CONSTRAINT [FK_EmployeeDistributionWorks_Users]
GO
ALTER TABLE [dbo].[EmployeeDistributionTasks]  WITH CHECK ADD  CONSTRAINT [FK_EmployeeDistributionWorks_WorkTypes] FOREIGN KEY([FKWorkType_Id])
REFERENCES [dbo].[WorkTypes] ([Id])
GO
ALTER TABLE [dbo].[EmployeeDistributionTasks] CHECK CONSTRAINT [FK_EmployeeDistributionWorks_WorkTypes]
GO
ALTER TABLE [dbo].[EmployeesWorks]  WITH CHECK ADD  CONSTRAINT [FK_EmployeesWorks_Users] FOREIGN KEY([FKUser_Id])
REFERENCES [dbo].[Users] ([Id])
GO
ALTER TABLE [dbo].[EmployeesWorks] CHECK CONSTRAINT [FK_EmployeesWorks_Users]
GO
ALTER TABLE [dbo].[EmployeesWorks]  WITH CHECK ADD  CONSTRAINT [FK_EmployeesWorks_WorkTypes] FOREIGN KEY([FkWorkType_Id])
REFERENCES [dbo].[WorkTypes] ([Id])
GO
ALTER TABLE [dbo].[EmployeesWorks] CHECK CONSTRAINT [FK_EmployeesWorks_WorkTypes]
GO
ALTER TABLE [dbo].[Enquires]  WITH CHECK ADD  CONSTRAINT [FK_Enquires_Branches] FOREIGN KEY([FKBranch_Id])
REFERENCES [dbo].[Branches] ([Id])
GO
ALTER TABLE [dbo].[Enquires] CHECK CONSTRAINT [FK_Enquires_Branches]
GO
ALTER TABLE [dbo].[Enquires]  WITH CHECK ADD  CONSTRAINT [FK_Enquires_Countries] FOREIGN KEY([FKPhoneCountry_Id])
REFERENCES [dbo].[Countries] ([Id])
GO
ALTER TABLE [dbo].[Enquires] CHECK CONSTRAINT [FK_Enquires_Countries]
GO
ALTER TABLE [dbo].[Enquires]  WITH CHECK ADD  CONSTRAINT [FK_EnquiryForms_Cities] FOREIGN KEY([FkCity_Id])
REFERENCES [dbo].[Cities] ([Id])
GO
ALTER TABLE [dbo].[Enquires] CHECK CONSTRAINT [FK_EnquiryForms_Cities]
GO
ALTER TABLE [dbo].[Enquires]  WITH CHECK ADD  CONSTRAINT [FK_EnquiryForms_Countries] FOREIGN KEY([FkCountry_Id])
REFERENCES [dbo].[Countries] ([Id])
GO
ALTER TABLE [dbo].[Enquires] CHECK CONSTRAINT [FK_EnquiryForms_Countries]
GO
ALTER TABLE [dbo].[Enquires]  WITH CHECK ADD  CONSTRAINT [FK_EnquiryForms_EnquiryTypes] FOREIGN KEY([FKEnquiryType_Id])
REFERENCES [dbo].[EnquiryTypes] ([Id])
GO
ALTER TABLE [dbo].[Enquires] CHECK CONSTRAINT [FK_EnquiryForms_EnquiryTypes]
GO
ALTER TABLE [dbo].[Enquires]  WITH CHECK ADD  CONSTRAINT [FK_EnquiryForms_Users] FOREIGN KEY([FKUserCreated_Id])
REFERENCES [dbo].[Users] ([Id])
GO
ALTER TABLE [dbo].[Enquires] CHECK CONSTRAINT [FK_EnquiryForms_Users]
GO
ALTER TABLE [dbo].[EnquiryPayments]  WITH CHECK ADD  CONSTRAINT [FK_EnquiryPayments_Enquires] FOREIGN KEY([FKEnquiry_Id])
REFERENCES [dbo].[Enquires] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[EnquiryPayments] CHECK CONSTRAINT [FK_EnquiryPayments_Enquires]
GO
ALTER TABLE [dbo].[EnquiryPayments]  WITH CHECK ADD  CONSTRAINT [FK_EnquiryPayments_Users] FOREIGN KEY([FKUserCreated_Id])
REFERENCES [dbo].[Users] ([Id])
GO
ALTER TABLE [dbo].[EnquiryPayments] CHECK CONSTRAINT [FK_EnquiryPayments_Users]
GO
ALTER TABLE [dbo].[EnquiryStatus]  WITH CHECK ADD  CONSTRAINT [FK_EnquiryStatus_Enquires] FOREIGN KEY([FKEnquiry_Id])
REFERENCES [dbo].[Enquires] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[EnquiryStatus] CHECK CONSTRAINT [FK_EnquiryStatus_Enquires]
GO
ALTER TABLE [dbo].[EnquiryStatus]  WITH CHECK ADD  CONSTRAINT [FK_EnquiryStatus_EnquiryPayments] FOREIGN KEY([FKEnquiryPayment_Id])
REFERENCES [dbo].[EnquiryPayments] ([Id])
GO
ALTER TABLE [dbo].[EnquiryStatus] CHECK CONSTRAINT [FK_EnquiryStatus_EnquiryPayments]
GO
ALTER TABLE [dbo].[EnquiryStatus]  WITH CHECK ADD  CONSTRAINT [FK_EnquiryStatus_EnquiryStatusTypes] FOREIGN KEY([FKEnquiryStatus_Id])
REFERENCES [dbo].[EnquiryStatusTypes] ([Id])
GO
ALTER TABLE [dbo].[EnquiryStatus] CHECK CONSTRAINT [FK_EnquiryStatus_EnquiryStatusTypes]
GO
ALTER TABLE [dbo].[EnquiryStatus]  WITH CHECK ADD  CONSTRAINT [FK_EnquiryStatus_Users] FOREIGN KEY([FKUserCreated_Id])
REFERENCES [dbo].[Users] ([Id])
GO
ALTER TABLE [dbo].[EnquiryStatus] CHECK CONSTRAINT [FK_EnquiryStatus_Users]
GO
ALTER TABLE [dbo].[EnquiryStatusTypes]  WITH CHECK ADD  CONSTRAINT [FK_EnquiryStatusTypes_Words] FOREIGN KEY([FKWord_Id])
REFERENCES [dbo].[Words] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[EnquiryStatusTypes] CHECK CONSTRAINT [FK_EnquiryStatusTypes_Words]
GO
ALTER TABLE [dbo].[EnquiryTypes]  WITH CHECK ADD  CONSTRAINT [FK_EnquiryTypes_Words] FOREIGN KEY([FKWord_Id])
REFERENCES [dbo].[Words] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[EnquiryTypes] CHECK CONSTRAINT [FK_EnquiryTypes_Words]
GO
ALTER TABLE [dbo].[EventArchives]  WITH CHECK ADD  CONSTRAINT [FK_EventArchives_Users] FOREIGN KEY([FKUser_Id])
REFERENCES [dbo].[Users] ([Id])
GO
ALTER TABLE [dbo].[EventArchives] CHECK CONSTRAINT [FK_EventArchives_Users]
GO
ALTER TABLE [dbo].[EventCoordinations]  WITH CHECK ADD  CONSTRAINT [FK_EventCoordination_Events] FOREIGN KEY([FKEvent_Id])
REFERENCES [dbo].[Events] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[EventCoordinations] CHECK CONSTRAINT [FK_EventCoordination_Events]
GO
ALTER TABLE [dbo].[EventCoordinations]  WITH CHECK ADD  CONSTRAINT [FK_EventCoordination_Users] FOREIGN KEY([FKUserCreated_Id])
REFERENCES [dbo].[Users] ([Id])
GO
ALTER TABLE [dbo].[EventCoordinations] CHECK CONSTRAINT [FK_EventCoordination_Users]
GO
ALTER TABLE [dbo].[EventPhotographers]  WITH CHECK ADD  CONSTRAINT [FK_EventPhotographers_Events] FOREIGN KEY([FKEvent_Id])
REFERENCES [dbo].[Events] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[EventPhotographers] CHECK CONSTRAINT [FK_EventPhotographers_Events]
GO
ALTER TABLE [dbo].[EventPhotographers]  WITH CHECK ADD  CONSTRAINT [FK_EventPhotographers_Users] FOREIGN KEY([FKUser_Id])
REFERENCES [dbo].[Users] ([Id])
GO
ALTER TABLE [dbo].[EventPhotographers] CHECK CONSTRAINT [FK_EventPhotographers_Users]
GO
ALTER TABLE [dbo].[Events]  WITH CHECK ADD  CONSTRAINT [FK_Events_Branches] FOREIGN KEY([FKBranch_Id])
REFERENCES [dbo].[Branches] ([Id])
GO
ALTER TABLE [dbo].[Events] CHECK CONSTRAINT [FK_Events_Branches]
GO
ALTER TABLE [dbo].[Events]  WITH CHECK ADD  CONSTRAINT [FK_Events_Enquires] FOREIGN KEY([Id])
REFERENCES [dbo].[Enquires] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Events] CHECK CONSTRAINT [FK_Events_Enquires]
GO
ALTER TABLE [dbo].[Events]  WITH CHECK ADD  CONSTRAINT [FK_Events_Packages] FOREIGN KEY([FKPackage_Id])
REFERENCES [dbo].[Packages] ([Id])
GO
ALTER TABLE [dbo].[Events] CHECK CONSTRAINT [FK_Events_Packages]
GO
ALTER TABLE [dbo].[Events]  WITH CHECK ADD  CONSTRAINT [FK_Events_PrintNamesTypes] FOREIGN KEY([FKPrintNameType_Id])
REFERENCES [dbo].[PrintNamesTypes] ([Id])
GO
ALTER TABLE [dbo].[Events] CHECK CONSTRAINT [FK_Events_PrintNamesTypes]
GO
ALTER TABLE [dbo].[Events]  WITH CHECK ADD  CONSTRAINT [FK_Events_Users] FOREIGN KEY([FKClinet_Id])
REFERENCES [dbo].[Users] ([Id])
GO
ALTER TABLE [dbo].[Events] CHECK CONSTRAINT [FK_Events_Users]
GO
ALTER TABLE [dbo].[EventSurveies]  WITH CHECK ADD  CONSTRAINT [FK_EventSurveies_Events] FOREIGN KEY([Id])
REFERENCES [dbo].[Events] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[EventSurveies] CHECK CONSTRAINT [FK_EventSurveies_Events]
GO
ALTER TABLE [dbo].[EventSurveyQuestionAnswerer]  WITH CHECK ADD  CONSTRAINT [FK_EventPoolQuestionAnswers_EventPoolQuestionAnswers] FOREIGN KEY([FKEventSurveyQuestion_Id])
REFERENCES [dbo].[EventSurveyQuestions] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[EventSurveyQuestionAnswerer] CHECK CONSTRAINT [FK_EventPoolQuestionAnswers_EventPoolQuestionAnswers]
GO
ALTER TABLE [dbo].[EventSurveyQuestionAnswerer]  WITH CHECK ADD  CONSTRAINT [FK_EventSurveyQuestionAnswers_EventSurveies] FOREIGN KEY([FKEventSurvey_Id])
REFERENCES [dbo].[EventSurveies] ([Id])
GO
ALTER TABLE [dbo].[EventSurveyQuestionAnswerer] CHECK CONSTRAINT [FK_EventSurveyQuestionAnswers_EventSurveies]
GO
ALTER TABLE [dbo].[EventSurveyQuestionAnswerer]  WITH CHECK ADD  CONSTRAINT [FK_EventSurveyQuestionAnswers_EventSurveyQuestionTypes] FOREIGN KEY([FKSurveyQuestionType_Id])
REFERENCES [dbo].[EventSurveyQuestionTypes] ([Id])
GO
ALTER TABLE [dbo].[EventSurveyQuestionAnswerer] CHECK CONSTRAINT [FK_EventSurveyQuestionAnswers_EventSurveyQuestionTypes]
GO
ALTER TABLE [dbo].[EventSurveyQuestions]  WITH CHECK ADD  CONSTRAINT [FK_EventPoolQuestions_EventPools] FOREIGN KEY([FKEvent_Id])
REFERENCES [dbo].[Events] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[EventSurveyQuestions] CHECK CONSTRAINT [FK_EventPoolQuestions_EventPools]
GO
ALTER TABLE [dbo].[EventSurveyQuestions]  WITH CHECK ADD  CONSTRAINT [FK_EventPoolQuestions_PoolQuestionTypes] FOREIGN KEY([FKSurveyQuestionType_Id])
REFERENCES [dbo].[EventSurveyQuestionTypes] ([Id])
GO
ALTER TABLE [dbo].[EventSurveyQuestions] CHECK CONSTRAINT [FK_EventPoolQuestions_PoolQuestionTypes]
GO
ALTER TABLE [dbo].[EventSurveyQuestionTypes]  WITH CHECK ADD  CONSTRAINT [FK_PoolQuestionTypes_Words] FOREIGN KEY([FKWord_Id])
REFERENCES [dbo].[Words] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[EventSurveyQuestionTypes] CHECK CONSTRAINT [FK_PoolQuestionTypes_Words]
GO
ALTER TABLE [dbo].[EventTaskStatusHistories]  WITH CHECK ADD  CONSTRAINT [FK_EventWorksStatus_AccountTypes] FOREIGN KEY([FKAccountType_Id])
REFERENCES [dbo].[AccountTypes] ([Id])
GO
ALTER TABLE [dbo].[EventTaskStatusHistories] CHECK CONSTRAINT [FK_EventWorksStatus_AccountTypes]
GO
ALTER TABLE [dbo].[EventTaskStatusHistories]  WITH CHECK ADD  CONSTRAINT [FK_EventWorksStatus_Events] FOREIGN KEY([FKEvent_Id])
REFERENCES [dbo].[Events] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[EventTaskStatusHistories] CHECK CONSTRAINT [FK_EventWorksStatus_Events]
GO
ALTER TABLE [dbo].[EventTaskStatusHistories]  WITH CHECK ADD  CONSTRAINT [FK_EventWorksStatus_Users] FOREIGN KEY([FKUsre_Id])
REFERENCES [dbo].[Users] ([Id])
GO
ALTER TABLE [dbo].[EventTaskStatusHistories] CHECK CONSTRAINT [FK_EventWorksStatus_Users]
GO
ALTER TABLE [dbo].[EventTaskStatusHistories]  WITH CHECK ADD  CONSTRAINT [FK_EventWorksStatus_WorkTypes] FOREIGN KEY([FKWorkType_Id])
REFERENCES [dbo].[WorkTypes] ([Id])
GO
ALTER TABLE [dbo].[EventTaskStatusHistories] CHECK CONSTRAINT [FK_EventWorksStatus_WorkTypes]
GO
ALTER TABLE [dbo].[EventTaskStatusHistories]  WITH CHECK ADD  CONSTRAINT [FK_EventWorksStatusHistory_Branches] FOREIGN KEY([FKBranch_Id])
REFERENCES [dbo].[Branches] ([Id])
GO
ALTER TABLE [dbo].[EventTaskStatusHistories] CHECK CONSTRAINT [FK_EventWorksStatusHistory_Branches]
GO
ALTER TABLE [dbo].[EventTaskStatusIsFinshed]  WITH CHECK ADD  CONSTRAINT [FK_EventWorksStatusIsFinshed_Events] FOREIGN KEY([EventId])
REFERENCES [dbo].[Events] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[EventTaskStatusIsFinshed] CHECK CONSTRAINT [FK_EventWorksStatusIsFinshed_Events]
GO
ALTER TABLE [dbo].[FilesReceivedTypes]  WITH CHECK ADD  CONSTRAINT [FK_FilesReceivedTypes_Words] FOREIGN KEY([FKWord_Id])
REFERENCES [dbo].[Words] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[FilesReceivedTypes] CHECK CONSTRAINT [FK_FilesReceivedTypes_Words]
GO
ALTER TABLE [dbo].[Menus]  WITH CHECK ADD  CONSTRAINT [FK_Menus_Words] FOREIGN KEY([FKWord_Id])
REFERENCES [dbo].[Words] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Menus] CHECK CONSTRAINT [FK_Menus_Words]
GO
ALTER TABLE [dbo].[Notifications]  WITH CHECK ADD  CONSTRAINT [FK_Notifications_Notifications] FOREIGN KEY([FKUser_Id])
REFERENCES [dbo].[Users] ([Id])
GO
ALTER TABLE [dbo].[Notifications] CHECK CONSTRAINT [FK_Notifications_Notifications]
GO
ALTER TABLE [dbo].[Notifications]  WITH CHECK ADD  CONSTRAINT [FK_Notifications_Pages] FOREIGN KEY([FKPage_Id])
REFERENCES [dbo].[Pages] ([Id])
GO
ALTER TABLE [dbo].[Notifications] CHECK CONSTRAINT [FK_Notifications_Pages]
GO
ALTER TABLE [dbo].[Notifications]  WITH CHECK ADD  CONSTRAINT [FK_Notifications_Words] FOREIGN KEY([FkWord_Id])
REFERENCES [dbo].[Words] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Notifications] CHECK CONSTRAINT [FK_Notifications_Words]
GO
ALTER TABLE [dbo].[Notifications]  WITH CHECK ADD  CONSTRAINT [FK_Notifications_Words1] FOREIGN KEY([FKDescriptionWord_Id])
REFERENCES [dbo].[Words] ([Id])
GO
ALTER TABLE [dbo].[Notifications] CHECK CONSTRAINT [FK_Notifications_Words1]
GO
ALTER TABLE [dbo].[NotificationsUser]  WITH CHECK ADD  CONSTRAINT [FK_NotificationsUser_Notifications] FOREIGN KEY([FKNotify_Id])
REFERENCES [dbo].[Notifications] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[NotificationsUser] CHECK CONSTRAINT [FK_NotificationsUser_Notifications]
GO
ALTER TABLE [dbo].[NotificationsUser]  WITH CHECK ADD  CONSTRAINT [FK_NotificationsUser_Users] FOREIGN KEY([FKUser_Id])
REFERENCES [dbo].[Users] ([Id])
GO
ALTER TABLE [dbo].[NotificationsUser] CHECK CONSTRAINT [FK_NotificationsUser_Users]
GO
ALTER TABLE [dbo].[PackageDetails]  WITH CHECK ADD  CONSTRAINT [FK_PackageDetails_PackageInputTypes] FOREIGN KEY([FKStaticField_Id])
REFERENCES [dbo].[StaticFields] ([Id])
GO
ALTER TABLE [dbo].[PackageDetails] CHECK CONSTRAINT [FK_PackageDetails_PackageInputTypes]
GO
ALTER TABLE [dbo].[PackageDetails]  WITH CHECK ADD  CONSTRAINT [FK_PackageDetails_Packages] FOREIGN KEY([FKPackage_Id])
REFERENCES [dbo].[Packages] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[PackageDetails] CHECK CONSTRAINT [FK_PackageDetails_Packages]
GO
ALTER TABLE [dbo].[PackageDetails]  WITH CHECK ADD  CONSTRAINT [FK_PackageDetails_Words] FOREIGN KEY([FKWord_Id])
REFERENCES [dbo].[Words] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[PackageDetails] CHECK CONSTRAINT [FK_PackageDetails_Words]
GO
ALTER TABLE [dbo].[Packages]  WITH CHECK ADD  CONSTRAINT [FK_Packages_AlbumTypes] FOREIGN KEY([FKAlbumType_Id])
REFERENCES [dbo].[Albums] ([Id])
GO
ALTER TABLE [dbo].[Packages] CHECK CONSTRAINT [FK_Packages_AlbumTypes]
GO
ALTER TABLE [dbo].[Pages]  WITH CHECK ADD  CONSTRAINT [FK_Pages_Menus] FOREIGN KEY([FkMenu_Id])
REFERENCES [dbo].[Menus] ([Id])
GO
ALTER TABLE [dbo].[Pages] CHECK CONSTRAINT [FK_Pages_Menus]
GO
ALTER TABLE [dbo].[Pages]  WITH CHECK ADD  CONSTRAINT [FK_Pages_Words] FOREIGN KEY([FKWord_Id])
REFERENCES [dbo].[Words] ([Id])
GO
ALTER TABLE [dbo].[Pages] CHECK CONSTRAINT [FK_Pages_Words]
GO
ALTER TABLE [dbo].[Phot_Orders]  WITH CHECK ADD  CONSTRAINT [FK_Ordersphotographer_Phot_Products] FOREIGN KEY([FKProduct_Id])
REFERENCES [dbo].[Phot_Products] ([Id])
GO
ALTER TABLE [dbo].[Phot_Orders] CHECK CONSTRAINT [FK_Ordersphotographer_Phot_Products]
GO
ALTER TABLE [dbo].[Phot_Orders]  WITH CHECK ADD  CONSTRAINT [FK_Ordersphotographer_Phot_ProductTypes] FOREIGN KEY([FKProductType_Id])
REFERENCES [dbo].[Phot_ProductTypes] ([Id])
GO
ALTER TABLE [dbo].[Phot_Orders] CHECK CONSTRAINT [FK_Ordersphotographer_Phot_ProductTypes]
GO
ALTER TABLE [dbo].[Phot_Orders]  WITH CHECK ADD  CONSTRAINT [FK_Ordersphotographer_Users] FOREIGN KEY([FKUserCreated])
REFERENCES [dbo].[Users] ([Id])
GO
ALTER TABLE [dbo].[Phot_Orders] CHECK CONSTRAINT [FK_Ordersphotographer_Users]
GO
ALTER TABLE [dbo].[Phot_Orders]  WITH CHECK ADD  CONSTRAINT [FK_Phot_Orders_Cities] FOREIGN KEY([Delivery_FKCity_Id])
REFERENCES [dbo].[Cities] ([Id])
GO
ALTER TABLE [dbo].[Phot_Orders] CHECK CONSTRAINT [FK_Phot_Orders_Cities]
GO
ALTER TABLE [dbo].[Phot_Orders]  WITH CHECK ADD  CONSTRAINT [FK_Phot_Orders_Countries] FOREIGN KEY([Delivery_FkCountry_Id])
REFERENCES [dbo].[Countries] ([Id])
GO
ALTER TABLE [dbo].[Phot_Orders] CHECK CONSTRAINT [FK_Phot_Orders_Countries]
GO
ALTER TABLE [dbo].[Phot_OrdersOptions]  WITH CHECK ADD  CONSTRAINT [FK_OrdersphotographerOptions_Ordersphotographer] FOREIGN KEY([FKOrder_Id])
REFERENCES [dbo].[Phot_Orders] ([Id])
GO
ALTER TABLE [dbo].[Phot_OrdersOptions] CHECK CONSTRAINT [FK_OrdersphotographerOptions_Ordersphotographer]
GO
ALTER TABLE [dbo].[Phot_OrdersOptions]  WITH CHECK ADD  CONSTRAINT [FK_OrdersphotographerOptions_Phot_ProductsOptions] FOREIGN KEY([FKProdutOption_Id])
REFERENCES [dbo].[Phot_ProductsOptions] ([Id])
GO
ALTER TABLE [dbo].[Phot_OrdersOptions] CHECK CONSTRAINT [FK_OrdersphotographerOptions_Phot_ProductsOptions]
GO
ALTER TABLE [dbo].[Phot_OrdersOptions]  WITH CHECK ADD  CONSTRAINT [FK_OrdersphotographerOptions_Phot_ProductsOptionsItems] FOREIGN KEY([FKProductOptionItem_Id])
REFERENCES [dbo].[Phot_ProductsOptionsItems] ([Id])
GO
ALTER TABLE [dbo].[Phot_OrdersOptions] CHECK CONSTRAINT [FK_OrdersphotographerOptions_Phot_ProductsOptionsItems]
GO
ALTER TABLE [dbo].[Phot_Products]  WITH CHECK ADD  CONSTRAINT [FK_Phot_Products_Phot_ProductTypes] FOREIGN KEY([FKProductType_Id])
REFERENCES [dbo].[Phot_ProductTypes] ([Id])
GO
ALTER TABLE [dbo].[Phot_Products] CHECK CONSTRAINT [FK_Phot_Products_Phot_ProductTypes]
GO
ALTER TABLE [dbo].[Phot_Products_Images]  WITH CHECK ADD  CONSTRAINT [FK_Phot_Products_Images_Phot_Products] FOREIGN KEY([FkProduct_Id])
REFERENCES [dbo].[Phot_Products] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Phot_Products_Images] CHECK CONSTRAINT [FK_Phot_Products_Images_Phot_Products]
GO
ALTER TABLE [dbo].[Phot_ProductsOptions]  WITH CHECK ADD  CONSTRAINT [FK_Phot_ProductsOptions_Phot_Products] FOREIGN KEY([FKProduct_Id])
REFERENCES [dbo].[Phot_Products] ([Id])
GO
ALTER TABLE [dbo].[Phot_ProductsOptions] CHECK CONSTRAINT [FK_Phot_ProductsOptions_Phot_Products]
GO
ALTER TABLE [dbo].[Phot_ProductsOptions]  WITH CHECK ADD  CONSTRAINT [FK_Phot_ProductsOptions_StaticFields] FOREIGN KEY([FKStaticField_Id])
REFERENCES [dbo].[StaticFields] ([Id])
GO
ALTER TABLE [dbo].[Phot_ProductsOptions] CHECK CONSTRAINT [FK_Phot_ProductsOptions_StaticFields]
GO
ALTER TABLE [dbo].[Phot_ProductsOptionsItems]  WITH CHECK ADD  CONSTRAINT [FK_Phot_ProductsOptionsItems_Phot_ProductsOptions] FOREIGN KEY([FKProductOption_Id])
REFERENCES [dbo].[Phot_ProductsOptions] ([Id])
GO
ALTER TABLE [dbo].[Phot_ProductsOptionsItems] CHECK CONSTRAINT [FK_Phot_ProductsOptionsItems_Phot_ProductsOptions]
GO
ALTER TABLE [dbo].[Phot_ProductsOptionsItems]  WITH CHECK ADD  CONSTRAINT [FK_Phot_ProductsOptionsItems_Words] FOREIGN KEY([FKWord_Value_Id])
REFERENCES [dbo].[Words] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Phot_ProductsOptionsItems] CHECK CONSTRAINT [FK_Phot_ProductsOptionsItems_Words]
GO
ALTER TABLE [dbo].[Phot_ProductTypes]  WITH CHECK ADD  CONSTRAINT [FK_Phot_ProductTypes_Words] FOREIGN KEY([FKWord_Name_Id])
REFERENCES [dbo].[Words] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Phot_ProductTypes] CHECK CONSTRAINT [FK_Phot_ProductTypes_Words]
GO
ALTER TABLE [dbo].[PrintNamesTypes]  WITH CHECK ADD  CONSTRAINT [FK_PrintNamesTypes_Words] FOREIGN KEY([FKWord_Id])
REFERENCES [dbo].[Words] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[PrintNamesTypes] CHECK CONSTRAINT [FK_PrintNamesTypes_Words]
GO
ALTER TABLE [dbo].[SocialAccountTypes]  WITH CHECK ADD  CONSTRAINT [FK_SocialAccounts_Words] FOREIGN KEY([FKWord_Id])
REFERENCES [dbo].[Words] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[SocialAccountTypes] CHECK CONSTRAINT [FK_SocialAccounts_Words]
GO
ALTER TABLE [dbo].[StaticFields]  WITH CHECK ADD  CONSTRAINT [FK_PackageInputTypes_Words] FOREIGN KEY([FKWord_Id])
REFERENCES [dbo].[Words] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[StaticFields] CHECK CONSTRAINT [FK_PackageInputTypes_Words]
GO
ALTER TABLE [dbo].[UserPrivileges]  WITH CHECK ADD  CONSTRAINT [FK_UserPrivileges_Pages] FOREIGN KEY([FKPage_Id])
REFERENCES [dbo].[Pages] ([Id])
GO
ALTER TABLE [dbo].[UserPrivileges] CHECK CONSTRAINT [FK_UserPrivileges_Pages]
GO
ALTER TABLE [dbo].[UserPrivileges]  WITH CHECK ADD  CONSTRAINT [FK_UserPrivileges_Users] FOREIGN KEY([FkUser_Id])
REFERENCES [dbo].[Users] ([Id])
GO
ALTER TABLE [dbo].[UserPrivileges] CHECK CONSTRAINT [FK_UserPrivileges_Users]
GO
ALTER TABLE [dbo].[Users]  WITH CHECK ADD  CONSTRAINT [FK_Users_AccountTypes] FOREIGN KEY([FKAccountType_Id])
REFERENCES [dbo].[AccountTypes] ([Id])
GO
ALTER TABLE [dbo].[Users] CHECK CONSTRAINT [FK_Users_AccountTypes]
GO
ALTER TABLE [dbo].[Users]  WITH CHECK ADD  CONSTRAINT [FK_Users_Branches] FOREIGN KEY([FKPranch_Id])
REFERENCES [dbo].[Branches] ([Id])
GO
ALTER TABLE [dbo].[Users] CHECK CONSTRAINT [FK_Users_Branches]
GO
ALTER TABLE [dbo].[Users]  WITH CHECK ADD  CONSTRAINT [FK_Users_Cities] FOREIGN KEY([FkCity_Id])
REFERENCES [dbo].[Cities] ([Id])
GO
ALTER TABLE [dbo].[Users] CHECK CONSTRAINT [FK_Users_Cities]
GO
ALTER TABLE [dbo].[Users]  WITH CHECK ADD  CONSTRAINT [FK_Users_Countries] FOREIGN KEY([FkCountry_Id])
REFERENCES [dbo].[Countries] ([Id])
GO
ALTER TABLE [dbo].[Users] CHECK CONSTRAINT [FK_Users_Countries]
GO
ALTER TABLE [dbo].[Users]  WITH CHECK ADD  CONSTRAINT [FK_Users_Languages] FOREIGN KEY([FKLanguage_Id])
REFERENCES [dbo].[Languages] ([Id])
GO
ALTER TABLE [dbo].[Users] CHECK CONSTRAINT [FK_Users_Languages]
GO
ALTER TABLE [dbo].[UserSocialAccounts]  WITH CHECK ADD  CONSTRAINT [FK_UserSocialAccounts_Users] FOREIGN KEY([FKUser_Id])
REFERENCES [dbo].[Users] ([Id])
GO
ALTER TABLE [dbo].[UserSocialAccounts] CHECK CONSTRAINT [FK_UserSocialAccounts_Users]
GO
ALTER TABLE [dbo].[WorkTypes]  WITH CHECK ADD  CONSTRAINT [FK_WorkTypes_Words] FOREIGN KEY([FKWord_Id])
REFERENCES [dbo].[Words] ([Id])
GO
ALTER TABLE [dbo].[WorkTypes] CHECK CONSTRAINT [FK_WorkTypes_Words]
GO
/****** Object:  StoredProcedure [dbo].[.Phot_ProductsOptions_CheckIfUsed]    Script Date: 1/30/2020 7:50:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[.Phot_ProductsOptions_CheckIfUsed]
@Id bigint
as begin 
select count(*) from Phot_OrdersOptions 
where FKProdutOption_Id=@Id
 
end 
GO
/****** Object:  StoredProcedure [dbo].[Albums_CheckIfUsed]    Script Date: 1/30/2020 7:50:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[Albums_CheckIfUsed] 
@Id int
as begin

select count(*)  from Packages where FKAlbumType_Id=@Id
 
end
GO
/****** Object:  StoredProcedure [dbo].[Albums_Delete]    Script Date: 1/30/2020 7:50:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[Albums_Delete]
@Id bigint,
@WordId bigint,
@WordDescriptionId bigint
as begin


delete  Albums
where Id=@Id
delete Words where Words.Id =@WordId or  Words.id=@WordDescriptionId

 
end
GO
/****** Object:  StoredProcedure [dbo].[Albums_Insert]    Script Date: 1/30/2020 7:50:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
 
CREATE  proc [dbo].[Albums_Insert]
@NameAr nvarchar(50),
@NameEn nvarchar(50),
@DescriptionAr nvarchar(50),
@DescriptionEn nvarchar(50),
@Files nvarchar(max) --Pass Like It 'vvcv,cvcv,cvcv'

as begin  

begin tran tran1
begin try
-- Insert Word 
declare @WordId bigint,@WorDescriptionId bigint ;
declare @FilesPathes table (pathFi ntext);

exec @WordId =   dbo.Words_Insert @NameAr,@NameEn
exec @WorDescriptionId =   dbo.Words_Insert @DescriptionAr,@DescriptionEn

-- Insert Target
INSERT INTO [dbo].[Albums]([FKWord_Id],FKWord_Description_Id) VALUES (@WordId,@WorDescriptionId)

declare  @Id int =@@identity;

--Insert Files
 if len(@Files) >0
insert AlbumsFiles (FileUrl,FKAlbum_Id) select value,@Id from STRING_SPLIT(@Files,',')

exec Albums_SelectByPk @Id

	commit tran tran1
end try
begin catch
	rollback tran  tran1
end catch

end


GO
/****** Object:  StoredProcedure [dbo].[Albums_SelectAll]    Script Date: 1/30/2020 7:50:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[Albums_SelectAll] 
as begin 

select   Albums.*,
Words.Ar as NameAr,
Words.En as NameEn ,
WordsDes.Ar as DescriptionAr,
WordsDes.En as DescriptionEn,
AlbumsFiles.FileUrl


from Albums
join AlbumsFiles on AlbumsFiles.FKAlbum_Id=Albums.Id
join Words on Words.Id= Albums.FKWord_Id
join Words WordsDes on WordsDes.Id= Albums.FKWord_Description_Id

end 
GO
/****** Object:  StoredProcedure [dbo].[Albums_SelectByFilter]    Script Date: 1/30/2020 7:50:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[Albums_SelectByFilter] 
@Skip int , 
@Take int 

as begin 

select Albums.*,
Words.Ar as NameAr,
Words.En as NameEn ,
WordsDes.Ar as DescriptionAr,
WordsDes.En as DescriptionEn 

from Albums

join Words on Words.Id= Albums.FKWord_Id
join Words WordsDes on WordsDes.Id= Albums.FKWord_Description_Id

order by Id desc
Offset @skip rows 
Fetch next @Take rows only 
end 
GO
/****** Object:  StoredProcedure [dbo].[Albums_SelectByPk]    Script Date: 1/30/2020 7:50:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[Albums_SelectByPk]-- 12
@id int
as begin 

select   Albums.*,
Words.Ar as NameAr,
Words.En as NameEn ,
WordsDes.Ar as DescriptionAr,
WordsDes.En as DescriptionEn,
ISNULL(AlbumsFiles.Id,0) as AlbumFileId,
AlbumsFiles.FileUrl


from Albums
left join AlbumsFiles on AlbumsFiles.FKAlbum_Id=Albums.Id
join Words on Words.Id= Albums.FKWord_Id
join Words WordsDes on WordsDes.Id= Albums.FKWord_Description_Id
where Albums.Id=@id
end 
GO
/****** Object:  StoredProcedure [dbo].[Albums_Update]    Script Date: 1/30/2020 7:50:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE  proc [dbo].[Albums_Update]
@Id int  , 
@NameAr nvarchar(50),
@NameEn nvarchar(50),
@WordId bigint,

@DescriptionAr nvarchar(50),
@DescriptionEn nvarchar(50),
@WordDescriptionId bigint,
@NewFiles nvarchar(max),
@DeleteFilesIds nvarchar(max)


as begin
begin tran tran1
	begin try
-- Update Word 
exec dbo.Words_Update @WordId, @NameAr,@NameEn
exec dbo.Words_Update @WordDescriptionId, @DescriptionAr,@DescriptionEn
 
 	

 --Delete Files 
 delete AlbumsFiles where Id in (select value from string_split(@DeleteFilesIds,','))
 --Insert New Files
 if len(@NewFiles) >0
 insert AlbumsFiles (FileUrl,FKAlbum_Id) select value,@Id from string_split(@NewFiles,',')


exec Albums_SelectByPk @Id

 commit tran tran1
 end try
begin catch
	rollback tran tran1
end catch

end


GO
/****** Object:  StoredProcedure [dbo].[Branches_CheckIfUsed]    Script Date: 1/30/2020 7:50:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[Branches_CheckIfUsed] 
@Id bigint
as begin

select count(*) from Enquires where Enquires.FKBranch_Id=@Id
union
select count(*) from Users    where Users.FKpranch_Id=@Id
 
end
GO
/****** Object:  StoredProcedure [dbo].[Branches_CheckIsBasicBranch]    Script Date: 1/30/2020 7:50:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[Branches_CheckIsBasicBranch]
@BranchId int 
as begin 

select count(*) from Branches where Id=@BranchId and IsBasic =1
end
GO
/****** Object:  StoredProcedure [dbo].[Branches_Delete]    Script Date: 1/30/2020 7:50:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[Branches_Delete]
@Id bigint
as begin
delete  Branches where Id=@Id
 
end
GO
/****** Object:  StoredProcedure [dbo].[Branches_Insert]    Script Date: 1/30/2020 7:50:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
 
CREATE  proc [dbo].[Branches_Insert]
@Id int output , 
@NameAr nvarchar(50),
@NameEn nvarchar(50),
@Address nvarchar(max),
@Phone nvarchar(50),
@CountryId int , 
@CityId int ,
@WordId int output,
@IsBasic bit
as begin
-- Reset All Branches IsBasic
 if(@IsBasic =1)
		   update Branches set IsBasic=0

-- Insert Word 
exec @WordId =   dbo.Words_Insert @NameAr,@NameEn


-- Insert Target
INSERT INTO [dbo].[Branches]
           ([Address]
           ,PhoneNo
           ,[FkCountry_Id]
           ,[FKCity_Id]
           ,[FKWord_Id],
		   IsBasic)
		   values (@Address,@Phone,@CountryId,@CityId,@WordId,
		   @IsBasic)

		  

		 select  @Id=@@identity
end


GO
/****** Object:  StoredProcedure [dbo].[Branches_SelectByAll]    Script Date: 1/30/2020 7:50:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[Branches_SelectByAll]
as begin 
select 
		Branches.*,
		BrancheWord.Ar as BranchNameAR,
		BrancheWord.En as BranchNameEn

from Branches
join Words BrancheWord on BrancheWord.Id=Branches.FKWord_Id
end
GO
/****** Object:  StoredProcedure [dbo].[Branches_SelectByFilter]    Script Date: 1/30/2020 7:50:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[Branches_SelectByFilter]
--Paging
	@Skip int , 
	@Take int 

as begin 
select 
		Branches.*,
		CountryWord.Ar as CountryNameAr,
		CountryWord.En as CountryNameEn,
		CityWord.Ar as CityNameAr,
		CityWord.En as CityNameEn,
		BrancheWord.Ar as BranchNameAR,
		BrancheWord.En as BranchNameEn,
		(select COUNT(Id) from Enquires where FKBranch_Id=Branches.Id) as EnquiresCount

from Branches

join Countries on Countries.Id=Branches.FkCountry_Id
join Words CountryWord on CountryWord.Id=Countries.FKWord_Id

join Cities on Cities.Id=Branches.FkCity_Id
join Words CityWord on CityWord.Id=Cities.FKWord_Id
 
join Words BrancheWord on BrancheWord.Id=Branches.FKWord_Id

	order by Branches.Id desc
	offset @Skip rows
	Fetch next @Take Rows Only

end
GO
/****** Object:  StoredProcedure [dbo].[Branches_SelectByPk]    Script Date: 1/30/2020 7:50:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[Branches_SelectByPk]
@Id bigint 
as begin 
select 
		Branches.*,
		CountryWord.Ar as CountryNameAr,
		CountryWord.En as CountryNameEn,
		CityWord.Ar as CityNameAr,
		CityWord.En as CityNameEn,
		BrancheWord.Ar as BrancheNameAr,
		BrancheWord.En as BrancheNameEn
 
from Branches

join Countries on Countries.Id=Branches.FkCountry_Id
join Words CountryWord on CountryWord.Id=Countries.FKWord_Id

join Cities on Cities.Id=Branches.FkCity_Id
join Words CityWord on CityWord.Id=Cities.FKWord_Id

join Words BrancheWord on BrancheWord.Id=Branches.FKWord_Id

 
where Branches.Id = @Id
end 
GO
/****** Object:  StoredProcedure [dbo].[Branches_Update]    Script Date: 1/30/2020 7:50:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
 
CREATE  proc [dbo].[Branches_Update]
@Id int  , 
@NameAr nvarchar(50),
@NameEn nvarchar(50),
@Address nvarchar(max),
@Phone nvarchar(50),
@CountryId int , 
@CityId int ,
@WordId bigint,
@IsBasic bit,
@FKArchivingAndSaveingEmployee_Id bigint,
@FKImplementationEmployeeId_Id bigint,
@FKCoordinationEmployee_Id bigint,
@FKArchivingAndSaveingAnotherBranch_Id int


as begin
-- Reset All Branches IsBasic
 if(@IsBasic =1)
		   update Branches set IsBasic=0;

-- Update Word 
exec  dbo.Words_Update @WordId, @NameAr,@NameEn

declare @BranchIsBeforUsed int;
exec @BranchIsBeforUsed=[dbo].[Branches_CheckIfUsed] @Id; 
-- Insert Target

--لا يمكن تعديل الدولة والمدينة اذا  كانت مستخدمة من قبل
if(@BranchIsBeforUsed =0)
update [dbo].[Branches]
           set [Address]=@Address
           ,PhoneNo=@Phone
           ,[FkCountry_Id]= @CountryId
           ,[FKCity_Id]=    @CityId,
		    IsBasic=@IsBasic,
			FKArchivingAndSaveingEmployee_Id=	@FKArchivingAndSaveingEmployee_Id,
			FKCoordinationEmployee_Id=	@FKCoordinationEmployee_Id,
			FKImplementationEmployeeId_Id=		@FKImplementationEmployeeId_Id,
			FKArchivingAndSaveingAnotherBranch_Id=@FKArchivingAndSaveingAnotherBranch_Id

			where Branches.Id=@Id
else
			update [dbo].[Branches]
           set [Address]=@Address
           ,PhoneNo=@Phone,
		    IsBasic=@IsBasic,
			FKArchivingAndSaveingEmployee_Id=	@FKArchivingAndSaveingEmployee_Id,
			FKCoordinationEmployee_Id=	@FKCoordinationEmployee_Id,
			FKImplementationEmployeeId_Id=		@FKImplementationEmployeeId_Id,
			FKArchivingAndSaveingAnotherBranch_Id=@FKArchivingAndSaveingAnotherBranch_Id

			where Branches.Id=@Id
end


GO
/****** Object:  StoredProcedure [dbo].[Cities_CheckIfUsed]    Script Date: 1/30/2020 7:50:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[Cities_CheckIfUsed] 
@Id bigint
as begin

select 
count(*)from Users where FkCity_Id=@Id
 
end
GO
/****** Object:  StoredProcedure [dbo].[Cities_Delete]    Script Date: 1/30/2020 7:50:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[Cities_Delete]
@Id bigint
as begin
delete  Cities where Id=@Id
 
end
GO
/****** Object:  StoredProcedure [dbo].[Cities_Insert]    Script Date: 1/30/2020 7:50:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
 
create  proc [dbo].[Cities_Insert]
@Id int output , 
@NameAr nvarchar(50),
@NameEn nvarchar(50),
@CountryId int

as begin
-- Insert Word 
declare @WordId int ;
exec @WordId =   dbo.Words_Insert @NameAr,@NameEn

-- Insert Target
INSERT INTO [dbo].[Cities]
           ([FKWord_Id]
           ,FKCountry_Id)
     VALUES
           (@WordId,@CountryId)

		 select  @Id=@@identity
end


GO
/****** Object:  StoredProcedure [dbo].[Cities_SelectAll]    Script Date: 1/30/2020 7:50:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[Cities_SelectAll] 

as begin 
select Cities.* ,
Words.Ar,
Words.En
from Cities
join Words on Words.Id=Cities.FKWord_Id
end 

 
GO
/****** Object:  StoredProcedure [dbo].[Cities_SelectByFilter]    Script Date: 1/30/2020 7:50:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[Cities_SelectByFilter] 
@CountryId int
as begin 
select Cities.* ,
Words.Ar,
Words.En
from Cities
join Words on Words.Id=Cities.FKWord_Id
where FKCountry_Id=@CountryId
end 

 
GO
/****** Object:  StoredProcedure [dbo].[Cities_SelectById]    Script Date: 1/30/2020 7:50:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[Cities_SelectById] 
@Id int  
as begin
select  top 1*  from Cities where Id=@Id

end 
GO
/****** Object:  StoredProcedure [dbo].[Cities_Update]    Script Date: 1/30/2020 7:50:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE  proc [dbo].[Cities_Update]
@Id int  , 
@NameAr nvarchar(50),
@NameEn nvarchar(50),
@WordId bigint

as begin
-- Update Word 
exec dbo.Words_Update @WordId, @NameAr,@NameEn

-- Update Target
 
end


GO
/****** Object:  StoredProcedure [dbo].[Cities_UpdatePrices]    Script Date: 1/30/2020 7:50:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[Cities_UpdatePrices] 
@Ids nvarchar(max),
@Prices nvarchar(max),
@UpdatingCount int
as begin
declare @CIds table(num int ,Id int);
declare @CPrices table(num int, Price decimal(18,2));

insert @CIds 
select ROW_NUMBER()over (order by (select null )) ,Value  from string_split(@Ids,',');
insert @CPrices   
select ROW_NUMBER()over (order by (select null )) ,Value  from string_split(@Prices,',');

declare @CurretnId int,@CurrentPrice decimal(18,2);
while @UpdatingCount>0
begin
set @CurretnId= (select top 1 Id from @CIds wheree where num=@UpdatingCount);
set @CurrentPrice= (select top 1 Price from @CPrices wheree where num=@UpdatingCount);

update Cities set ShippingPrice =@CurrentPrice where Id=@CurretnId

set @UpdatingCount=@UpdatingCount-1;
end

end
GO
/****** Object:  StoredProcedure [dbo].[Countries_CheckIfUsed]    Script Date: 1/30/2020 7:50:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[Countries_CheckIfUsed] 
@Id bigint
as begin
declare @count int ;
select 
(count(*)-1) as countr from countries 
left join users on users.FkCountry_Id=countries.Id
left join Branches on Branches.FkCountry_Id=countries.Id

where countries.Id=@Id
end
GO
/****** Object:  StoredProcedure [dbo].[Countries_Delete]    Script Date: 1/30/2020 7:50:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[Countries_Delete]
@Id bigint
as begin


delete Cities where FKCountry_Id=@Id
delete  Countries where Id=@Id
 
end
GO
/****** Object:  StoredProcedure [dbo].[Countries_Insert]    Script Date: 1/30/2020 7:50:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create  proc [dbo].[Countries_Insert]
@Id int output , 
@NameAr nvarchar(50),
@NameEn nvarchar(50),
@IsoCode nvarchar(50)

as begin
-- Insert Word 
declare @WordId int ;
exec @WordId =   dbo.Words_Insert @NameAr,@NameEn

-- Insert Target
INSERT INTO [dbo].[Countries]
           ([FKWord_Id]
           ,[IsoCode])
     VALUES
           (@WordId,@IsoCode)

		 select  @Id=@@identity
end


GO
/****** Object:  StoredProcedure [dbo].[Countries_IsoCodeBeforUsed]    Script Date: 1/30/2020 7:50:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[Countries_IsoCodeBeforUsed] 
@Id bigint,
@IsoCode nvarchar(50)
as begin

select count(*) from Countries where IsoCode=@IsoCode
and (@Id = 0 or @Id is null or Id!=@Id) 

end
GO
/****** Object:  StoredProcedure [dbo].[Countries_SelectAll]    Script Date: 1/30/2020 7:50:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[Countries_SelectAll] 

as begin 
select Countries.* ,
Words.Ar,
Words.En
from Countries
join Words on Words.Id=Countries.FKWord_Id
end 

 
GO
/****** Object:  StoredProcedure [dbo].[Countries_SelectByFilter]    Script Date: 1/30/2020 7:50:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[Countries_SelectByFilter] 
@Skip int , 
@Take int 

as begin 

select Countries.*,
Words.Ar as NameAr,
Words.En as NameEn from Countries

join Words on Words.Id= Countries.FKWord_Id

order by Id desc
Offset @skip rows 
Fetch next @Take rows only 
end 
GO
/****** Object:  StoredProcedure [dbo].[Countries_SelectWithCitiesByPk]    Script Date: 1/30/2020 7:50:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[Countries_SelectWithCitiesByPk] 
@Id int 
as begin 
select Countries.* ,
Words.Ar as CountryNameAr,
Words.En as CountryNameEn ,

Cities.Id as CityId, 
Cities.FKWord_Id as CityFkWord_Id,
CityWord.Ar as CityNameAr,
CityWord.En as CityNameEn 

from Countries
join Words on Words.Id=Countries.FKWord_Id
left join Cities on Cities.FKCountry_Id=Countries.Id
left join Words as CityWord on CityWord.Id=Cities.FKWord_Id

where Countries.Id=@Id
end 

 
GO
/****** Object:  StoredProcedure [dbo].[Countries_Update]    Script Date: 1/30/2020 7:50:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create  proc [dbo].[Countries_Update]
@Id int  , 
@NameAr nvarchar(50),
@NameEn nvarchar(50),
@IsoCode nvarchar(50),
@WordId bigint

as begin
-- Update Word 
exec dbo.Words_Update @WordId, @NameAr,@NameEn

-- Update Target
update Countries 
set IsoCode=@IsoCode
where Id=@Id

end


GO
/****** Object:  StoredProcedure [dbo].[CRM_EnquiryPayments]    Script Date: 1/30/2020 7:50:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
 
create proc [dbo].[CRM_EnquiryPayments]
@EnquiryId bigint
as begin

select 
EnquiryPayments.*, 
Users.FullName as UserCreatedName
from EnquiryPayments  
join Users on Users.Id=EnquiryPayments.FKUserCreated_Id

where FKEnquiry_Id=@EnquiryId

order by Id desc
end 
GO
/****** Object:  StoredProcedure [dbo].[CRM_EnquiryStatus]    Script Date: 1/30/2020 7:50:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
 
 CREATE proc [dbo].[CRM_EnquiryStatus]
@EnquiyId bigint 
as begin 
select 
EnquiryStatus.FKEnquiryStatus_Id as EnquiryStatusId,
		WordEnquiryStatusType.Ar as Status_NameAr,
		WordEnquiryStatusType.En as Status_NameEn,
		EnquiryStatus.DateTime as Status_CreateDateTime,
		EnquiryStatus.FKUserCreated_Id as Status_UserCreatedId,
		isnull(UserCreatedStatus.FullName,N'شخص ما') as Status_CreatedUserNameAr,
		isnull(UserCreatedStatus.FullName,N'Someone') as Status_CreatedUserNameEn

from EnquiryStatus
 
left join Users as UserCreatedStatus on UserCreatedStatus.Id=EnquiryStatus.FKUserCreated_Id

 join EnquiryStatusTypes on EnquiryStatusTypes.Id=EnquiryStatus.FKEnquiryStatus_Id
 join Words  as WordEnquiryStatusType on WordEnquiryStatusType.Id=EnquiryStatusTypes.FKWord_Id

 join Enquires on Enquires.Id =@EnquiyId
 join EnquiryTypes on EnquiryTypes.Id=Enquires.FKEnquiryType_Id


where EnquiryStatus.FKEnquiry_Id = @EnquiyId
order by EnquiryStatus.Id desc
end 
GO
/****** Object:  StoredProcedure [dbo].[CRM_EventTaskStatusHistories]    Script Date: 1/30/2020 7:50:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[CRM_EventTaskStatusHistories]
@eventId bigint
as begin 

select EventTaskStatusHistories.*,
Users.FullName,
Word.Ar as WorkTypeNameAr,
Word.En as WorkTypeNameEn
from EventTaskStatusHistories 
join Users on
Users.Id=EventTaskStatusHistories.FKUsre_Id

join WorkTypes on WorkTypes.Id=EventTaskStatusHistories.FKWorkType_Id
join Words as Word on Word.Id=WorkTypes.FkWord_Id
where FKEvent_Id=@eventId

end 
GO
/****** Object:  StoredProcedure [dbo].[EmployeeDistributionTasks_CheckIfInserted]    Script Date: 1/30/2020 7:50:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[EmployeeDistributionTasks_CheckIfInserted]
 
@WorkTypeId int,
--@EmployeeId bigint,
@EventId bigint,
@BranchId int,
@IsAnotherBranch bit
as begin
select  count(*) from  [dbo].[EmployeeDistributionTasks]
where [FKWorkType_Id]=@WorkTypeId 
--and	  [FKEmployee_Id]=@EmployeeId
and   FKEvent_Id=@EventId
and FKBranch_Id=@BranchId
and IsAnotherBranch=@isAnotherBranch
		    
end


GO
/****** Object:  StoredProcedure [dbo].[EmployeeDistributionTasks_Delete]    Script Date: 1/30/2020 7:50:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[EmployeeDistributionTasks_Delete]
@Id bigint
as begin
DELETE FROM [dbo].EmployeeDistributionTasks
      where Id=@Id
end 


GO
/****** Object:  StoredProcedure [dbo].[EmployeeDistributionTasks_Insert]    Script Date: 1/30/2020 7:50:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[EmployeeDistributionTasks_Insert]
@Id	bigint	output,
@WorkTypeId int,
@EmployeeId bigint,
@EventId bigint,
@IsAnotherBranch bit,
@BranchId int
as begin
INSERT INTO [dbo].EmployeeDistributionTasks
           ([FKWorkType_Id]
           ,[FKEmployee_Id],
		   FKEvent_Id,
		   IsAnotherBranch,
		   FKBranch_Id)
     VALUES
           (@WorkTypeId,@EmployeeId,@EventId,
		   @IsAnotherBranch,
		   @BranchId)

		   select @Id=@@IDENTITY



		   select EmployeeDistributionTasks.*,
Users.UserName,
Users.FKAccountType_Id,
	CONVERT(bit,0) as IsFinshed,
	 words.Ar as BranchNameAr,
	 words.En as BranchNameEn
		from  EmployeeDistributionTasks
		join Users on users.Id = EmployeeDistributionTasks.FKEmployee_Id
		join Branches on Branches.Id=EmployeeDistributionTasks.FKBranch_Id
		join words on words.Id=Branches.FKWord_Id
where EmployeeDistributionTasks.Id=@Id


end


GO
/****** Object:  StoredProcedure [dbo].[EmployeeDistributionTasks_SelectByEventId]    Script Date: 1/30/2020 7:50:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[EmployeeDistributionTasks_SelectByEventId] 
@EventId bigint

as begin 

select EmployeeDistributionTasks.*,
Users.UserName,
Users.FKAccountType_Id,
	ISNULL((select top 1 IsFinshed from EventTaskStatusHistories
	where FKEvent_Id=@EventId 
	and FKWorkType_Id=EmployeeDistributionTasks.FKWorkType_Id 
	and FKUsre_Id=EmployeeDistributionTasks.FKEmployee_Id	
	 ),0)	as IsFinshed,
	 words.Ar as BranchNameAr,
	 words.En as BranchNameEn
		from  EmployeeDistributionTasks
		

		join Users on users.Id = EmployeeDistributionTasks.FKEmployee_Id
		join Branches on Branches.Id=EmployeeDistributionTasks.FKBranch_Id
		join words on words.Id=Branches.FKWord_Id
where FKEvent_Id=@EventId

end 
GO
/****** Object:  StoredProcedure [dbo].[Employees_CheckAllowAccessToEventForUpdateWorks]    Script Date: 1/30/2020 7:50:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[Employees_CheckAllowAccessToEventForUpdateWorks] 
@IsAdmin bit , 
@IsClint bit,
@IsBranchManger bit , 
@eventId bigint,
@workTypeId int,
@userLoggedId bigint,
@BranchId int 
as begin 

--اذا كان المدير العام فيجب يرجع بـ ترو
if(@IsAdmin=1) select 1
--اذا كان عميل فيجب ان يكون هوا صاحب تلك المناسبة
else if (@IsClint=1)
select count(*) from Events where Id=@eventId and FKClinet_Id=@userLoggedId

-- اذا كان مدير فرع اذا يجب ان يكون هوا مدير على هذة المناسبة
else if (@IsBranchManger=1)
select count(*) from Events where Id=@eventId and FKBranch_Id=@BranchId

/*
او التحقق من اى شخص موجود لهذا المناسبة مثل الشخص المتعاون او الموظق او المصور
*/
else  
select count(*) from EmployeeDistributionTasks 
where FKEvent_Id=@eventId
and FKWorkType_Id=@workTypeId
and FKEmployee_Id=@userLoggedId
 



end
GO
/****** Object:  StoredProcedure [dbo].[Employees_SelectWorks]    Script Date: 1/30/2020 7:50:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[Employees_SelectWorks]
@EmpId bigint
as begin 
select EmployeesWorks.*,
Words.Ar as WorkNameAr,
Words.En as WorkNameEn,
WorkTypes.PageUrl,

(select count(Id) from EmployeeDistributionTasks 
		where 
		FKWorkType_Id=EmployeesWorks.FKWorkType_Id 
		and FKEmployee_Id=@EmpId  
		--يجب ان يكون هذة المناسبة انتهت فى المهمة السابقة
		and  dbo.EventTaskStatusIsFinsed_CheckIfFinshedFun(EmployeeDistributionTasks.FKEvent_Id,EmployeeDistributionTasks.FKWorkType_Id-1) = 1 ) as WorksCount

from WorkTypes 
  join EmployeesWorks on EmployeesWorks.FKUser_Id=@EmpId and EmployeesWorks.FkWorkType_Id=WorkTypes.Id
  join Words on Words.Id=WorkTypes.FKWord_Id

end
GO
/****** Object:  StoredProcedure [dbo].[EmployeesWorks_CheckIfInserted]    Script Date: 1/30/2020 7:50:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[EmployeesWorks_CheckIfInserted]

@WorkTypeId int ,
@UserId bigint
as begin 

select count(*)  from EmployeesWorks 
 where FkWorkType_Id=@WorkTypeId and FKUser_Id=@UserId 

end 
GO
/****** Object:  StoredProcedure [dbo].[EmployeesWorks_Delete]    Script Date: 1/30/2020 7:50:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[EmployeesWorks_Delete]
@UserId bigint
as begin 
delete EmployeesWorks where FKUser_Id=@UserId

end 
GO
/****** Object:  StoredProcedure [dbo].[EmployeesWorks_Insert]    Script Date: 1/30/2020 7:50:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[EmployeesWorks_Insert]
@WorkType_Id	int, 
@UserId	bigint 
as begin 
insert EmployeesWorks (FkWorkType_Id,FKUser_Id)values(@WorkType_Id,@UserId)
end 
GO
/****** Object:  StoredProcedure [dbo].[EmployeesWorks_SelectByUserId]    Script Date: 1/30/2020 7:50:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[EmployeesWorks_SelectByUserId] 
@UserId bigint

as begin 

select * from EmployeesWorks where FKUser_Id=@UserId

end 
GO
/****** Object:  StoredProcedure [dbo].[Enquires_CheckFromOwner]    Script Date: 1/30/2020 7:50:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[Enquires_CheckFromOwner]
@EnquiryOrEventId bigint,
@UsereLoggadId bigint 
as begin
select count(*) from Enquires where FkClinet_Id=@UsereLoggadId and Id=@EnquiryOrEventId

end 
GO
/****** Object:  StoredProcedure [dbo].[Enquires_CheckIfCreatedEvent]    Script Date: 1/30/2020 7:50:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[Enquires_CheckIfCreatedEvent]
@EnquiryId bigint 

as begin 
select count(*) from Events where Id=@EnquiryId

end 
GO
/****** Object:  StoredProcedure [dbo].[Enquires_CheckIfWithBranch]    Script Date: 1/30/2020 7:50:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[Enquires_CheckIfWithBranch]
@EnquiryId bigint
as begin 

select count(*) from Enquires where Id=@EnquiryId and IsWithBranch=1

end
GO
/****** Object:  StoredProcedure [dbo].[Enquires_Closed]    Script Date: 1/30/2020 7:50:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[Enquires_Closed]
@EnquiryId bigint ,
@DateTime datetime
as begin 
--اغلاق الاستفسار
 update Enquires
	  set IsClosed=1 , 
	  ClosedDateTime = @DateTime,
	  IsWithBranch=1
	  
	  where Id=@EnquiryId 


	  --ارجاع معرفات جوجل من اجل حذفهم
 select 
	           events.ClendarEventId as Event_ClendarEventId,
			   events.VistToCoordinationClendarEventId,
			   EnquiryStatus.ScheduleVisitDateClendarEventId
	from events 
	join EnquiryStatus on EnquiryStatus.FKEnquiry_Id=Events.Id and ScheduleVisitDateClendarEventId is not null
	  where events.Id=@EnquiryId
end 
GO
/****** Object:  StoredProcedure [dbo].[Enquires_Delete]    Script Date: 1/30/2020 7:50:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
 CREATE proc [dbo].[Enquires_Delete]
 @Id bigint 
 as begin
 delete Enquires where Id =@Id
 delete EventArchives where FKEvent_Id=@Id
 
end

GO
/****** Object:  StoredProcedure [dbo].[Enquires_Insert]    Script Date: 1/30/2020 7:50:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
 CREATE proc [dbo].[Enquires_Insert]
 @Id bigint output,
 @FirstName nvarchar(50),
 @LastName nvarchar(50),
 @PhoneNo nvarchar(50),
 @Day int ,
 @Month int , 
 @Year int ,
 @FkCountry_Id int,
 @FkCity_Id int,
 @FKEnquiryType_Id int,
 @FKUserCreated_Id bigint,
 @Clinet_Id bigint,
 @CreateDateTime datetime,
 @BranchId int,
 @IsLinkedClinet bit,
 @IFWithBranch  bit,
 @PhoneCountryId int


 as begin
 set @Id= (select Isnull(max(Id),0)+1 from Enquires);
 if(@FKEnquiryType_Id =0)
	set @FKEnquiryType_Id=null
 
 if(@BranchId =0)
	set @BranchId=null
	
INSERT INTO [dbo].[Enquires]
           (Id,[FirstName]
           ,[LastName]
           ,[PhoneNo]
           ,[FkCountry_Id]
           ,[FkCity_Id]
           ,[FKEnquiryType_Id]
           ,[FKUserCreated_Id]
           ,[CreateDateTime],
		   [Day],
		   [Month],
		   [Year],
		   FKBranch_Id,
		   IsLinkedClinet,
		   FkClinet_Id,
		   IsWithBranch,FKPhoneCountry_Id
		   )
     VALUES
          (@Id,@FirstName,  
           @LastName,
           @PhoneNo,
           @FkCountry_Id, 
           @FkCity_Id,
           @FKEnquiryType_Id, 
           @FKUserCreated_Id,
           @CreateDateTime,
		   @Day,
		   @Month,
		   @Year,
		   @BranchId,
		   @IsLinkedClinet,
		   @Clinet_Id,
		   @IFWithBranch,@PhoneCountryId 
		   )

end

GO
/****** Object:  StoredProcedure [dbo].[Enquires_IsClosed]    Script Date: 1/30/2020 7:50:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[Enquires_IsClosed] 
@EnquiryId bigint 
as begin 

select count(*) from Enquires where Id=@EnquiryId and IsClosed=1

end 
GO
/****** Object:  StoredProcedure [dbo].[Enquires_SelectByFilter]    Script Date: 1/30/2020 7:50:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[Enquires_SelectByFilter]
--Paging
	@Skip int , 
	@Take int ,
--Filter
	@FirstName nvarchar(50),
	@LastName nvarchar(50),
	@Phone nvarchar(50),
	@Day int ,
	@Month int ,
	@Year int ,
	@CreateDateTimeFrom datetime,
	@CreateDateTimeTo datetime,
	@CountryId int , 
	@CityId int ,
	@EnquiryId int, 
	@BranchId int,
	@IsForCurrentUser bit,
	@CurrentUserLoggadId bigint,
	@IsLinkedClinet bit,
	@CurrentUserBranch bit
	


as begin 
select 
		Enquires.*,
		PhoneCountry.IsoCode as PhoneIsoCode,
		CountryWord.Ar as CountryNameAr,
		CountryWord.En as CountryNameEn,
		CityWord.Ar as CityNameAr,
		CityWord.En as CityNameEn,
		EnquiryTypeWord.Ar as EnquiryTypeNameAr,
		EnquiryTypeWord.En as EnquiryTypeNameEn,
		BrancheWord.Ar as BranchNameAR,
		BrancheWord.En as BranchNameEn,
		UserCreated.UserName as EnquiryCreatedUserName,
				dbo.EnquiryPayments_CheckIfPaymentDeposit(Enquires.Id) as IsDepositPaymented

from Enquires

join Countries PhoneCountry on PhoneCountry.Id=Enquires.FKPhoneCountry_Id
join Countries on Countries.Id=Enquires.FkCountry_Id
join Words CountryWord on CountryWord.Id=Countries.FKWord_Id

join Cities on Cities.Id=Enquires.FkCity_Id
join Words CityWord on CityWord.Id=Cities.FKWord_Id

left join EnquiryTypes on EnquiryTypes.Id=Enquires.FKEnquiryType_Id
left join Words EnquiryTypeWord on EnquiryTypeWord.Id=EnquiryTypes.FKWord_Id

left join Branches on Branches.Id=Enquires.FKBranch_Id
left join Words BrancheWord on BrancheWord.Id=Branches.FKWord_Id


left join Users as UserCreated on UserCreated.Id=Enquires.FKUserCreated_Id

where 
	(@IsLinkedClinet is null  or  [Enquires].IsLinkedClinet=@IsLinkedClinet)
 	and 
 	(@IsForCurrentUser = 0 or [Enquires].FKUserCreated_Id=@CurrentUserLoggadId or [Enquires].FkClinet_Id=@CurrentUserLoggadId)
	
	and
	(@EnquiryId is null  or Enquires.FKEnquiryType_Id=@EnquiryId) 
	and 				 
	(@CountryId is null  or Enquires.FkCountry_Id=@CountryId) 
	and 
	(@CityId is null   or Enquires.FkCity_Id=@CityId) 
	and 
	(@Day is null  or [Enquires].[Day]=@Day)
	and 
	(@Month is null  or [Enquires].[Month]=@Month)
	and 
	(@Year is null  or [Enquires].[Year]=@Year)
	and 
	(@CreateDateTimeFrom is null  or Enquires.CreateDateTime>=@CreateDateTimeFrom) 
	and 
	(@CreateDateTimeTo is null  or Enquires.CreateDateTime<=@CreateDateTimeTo) 
	and 
	(@Phone = ''  or Enquires.PhoneNo like '%'+@Phone+'%') 
	and 
	(@FirstName = ''  or Enquires.FirstName like '%'+@FirstName+'%') 
	and 
	(@LastName = ''  or Enquires.LastName like '%'+@LastName+'%') 
	and 
	/*
	مدير الفرع يمكنة مشاهدة الاستفسارات الذى تخص الفرع الخاص بة او الذى قام بـ اشنئها فقط 
	وايضا نظهر فقط الاستفسارات الذى لم تربط بـ مناسبات
	*/	
  (@CurrentUserBranch is null  
   or (Enquires.FKBranch_Id =@BranchId or  Enquires.FKUserCreated_Id=@CurrentUserLoggadId) )
	


	order by Enquires.Id desc
	offset @Skip rows
	Fetch next @Take Rows Only

end
GO
/****** Object:  StoredProcedure [dbo].[Enquires_SelectByPk]    Script Date: 1/30/2020 7:50:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[Enquires_SelectByPk]
@EnquiyId bigint 
as begin 
select 
		Enquires.*,
		PhoneCountry.IsoCode as PhoneIsoCode,
		CountryWord.Ar as CountryNameAr,
		CountryWord.En as CountryNameEn,
		CityWord.Ar as CityNameAr,
		CityWord.En as CityNameEn,
		EnquiryTypeWord.Ar as EnquiryTypeNameAr,
		EnquiryTypeWord.En as EnquiryTypeNameEn,
		BrancheWord.Ar as BranchNameAR,
		BrancheWord.En as BranchNameEn,
		UserCreated.UserName as EnquiryCreatedUserName,
		dbo.EnquiryPayments_CheckIfPaymentDeposit(Enquires.Id) as IsDepositPaymented

from Enquires

join Countries PhoneCountry on PhoneCountry.Id=Enquires.FKPhoneCountry_Id
join Countries on Countries.Id=Enquires.FkCountry_Id
join Words CountryWord on CountryWord.Id=Countries.FKWord_Id

join Cities on Cities.Id=Enquires.FkCity_Id
join Words CityWord on CityWord.Id=Cities.FKWord_Id

left join EnquiryTypes on EnquiryTypes.Id=Enquires.FKEnquiryType_Id
left join Words EnquiryTypeWord on EnquiryTypeWord.Id=EnquiryTypes.FKWord_Id

left join Branches on Branches.Id=Enquires.FKBranch_Id
left join Words BrancheWord on BrancheWord.Id=Branches.FKWord_Id

left join Users as UserCreated on UserCreated.Id=Enquires.FKUserCreated_Id




where Enquires.Id = @EnquiyId
end 
GO
/****** Object:  StoredProcedure [dbo].[Enquires_SelectByPk_SimpleData]    Script Date: 1/30/2020 7:50:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[Enquires_SelectByPk_SimpleData] 
@EnauiryId bigint 
as begin 
select Enquires.*,

		dbo.EnquiryPayments_CheckIfPaymentDeposit(Enquires.Id) as IsDepositPaymented


from Enquires where Id=@EnauiryId
end 
GO
/****** Object:  StoredProcedure [dbo].[Enquires_Update]    Script Date: 1/30/2020 7:50:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
 CREATE proc [dbo].[Enquires_Update]
 @Id bigint,
 @FirstName nvarchar(50),
 @LastName nvarchar(50),
 @PhoneNo nvarchar(50),
 @Day int , 
 @Month int ,
 @Year int,
 @FkCountry_Id int,
 @FkCity_Id int,
 @FKEnquiryType_Id int,
 @NotesCreateDateTime datetime,
 @NotesFkUsereCreatedId bigint,
 @BranchId int,
 @IsWithBranch bit

 as begin
 UPDATE [dbo].[Enquires]
   SET [FirstName] =@FirstName  ,
      [LastName] =@LastName ,
      [PhoneNo] = @PhoneNo,
      [FkCountry_Id] =@FkCountry_Id ,
      [FkCity_Id] =@FkCity_Id ,
      [FKEnquiryType_Id] =@FKEnquiryType_Id,
	  [Day]=@Day,
	  [Month]=@Month,
	  [Year]=@Year,
	  FKBranch_Id=@BranchId,
	  IsWithBranch=@IsWithBranch
    
 WHERE Id=@Id
end

GO
/****** Object:  StoredProcedure [dbo].[Enquiries_ChangeCreateEventState]    Script Date: 1/30/2020 7:50:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[Enquiries_ChangeCreateEventState]
@Id bigint,
@IsCreatedEvent bit
as begin 
update Enquires 
	   set IsCreatedEvent=@IsCreatedEvent 
	   where Id=   @Id    
end 
GO
/****** Object:  StoredProcedure [dbo].[EnquiryPayments_AcceptFromManger]    Script Date: 1/30/2020 7:50:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[EnquiryPayments_AcceptFromManger]
@Id	bigint,
@IsDeposit bit,
@EnquiryId bigint
as begin

update [dbo].[EnquiryPayments]
      set [IsAcceptFromManger]=1
	  where Id=@Id
end
GO
/****** Object:  StoredProcedure [dbo].[EnquiryPayments_CheckIfPaymentedDeposit]    Script Date: 1/30/2020 7:50:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[EnquiryPayments_CheckIfPaymentedDeposit]
@EnquiryId bigint 
as begin 

select dbo.EnquiryPayments_CheckIfPaymentDeposit(@EnquiryId)
end 
GO
/****** Object:  StoredProcedure [dbo].[EnquiryPayments_Insert]    Script Date: 1/30/2020 7:50:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[EnquiryPayments_Insert]
@Id	bigint output,
@Amount  decimal(18,2),
@IsDeposit bit,
@IsBankTransfer bit,
@TransferImage nvarchar(max),
@IsAcceptFromManger bit,
@DateTime datetime,
@FKEnquiry_Id bigint,
@FKUserCreated_Id bigint
		   
as begin
-- اذا كان هذا دفع كاش اذا يعتبر المدير موافق تلقائى 
if(@IsBankTransfer =0)
set @IsAcceptFromManger=1

INSERT INTO [dbo].[EnquiryPayments]
           ([Amount]
           ,[IsDeposit]
           ,[IsBankTransfer]
           ,[TransferImage]
           ,[IsAcceptFromManger]
           ,[DateTime]
           ,[FKEnquiry_Id]
           ,[FKUserCreated_Id])
     VALUES
           (@Amount,
           @IsDeposit,
           @IsBankTransfer,
           @TransferImage,  
           @IsAcceptFromManger,
           @DateTime, 
           @FKEnquiry_Id,
           @FKUserCreated_Id)

		   select @Id=@@IDENTITY
end
GO
/****** Object:  StoredProcedure [dbo].[EnquiryPayments_SelectByEnquiryId]    Script Date: 1/30/2020 7:50:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[EnquiryPayments_SelectByEnquiryId]
@EnquiryId bigint
as begin

select 
EnquiryPayments.*, 
Users.FullName as UserCreatedName
from EnquiryPayments  
join Users on Users.Id=EnquiryPayments.FKUserCreated_Id

where FKEnquiry_Id=@EnquiryId

order by Id desc
end 
GO
/****** Object:  StoredProcedure [dbo].[EnquiryStatus_Insert]    Script Date: 1/30/2020 7:50:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[EnquiryStatus_Insert]
@Notes nvarchar(max),
@DateTime datetime , 
@EnquiryId bigint,
@EnquiryStatusId int, 
@ScheduleVisitDateTime datetime,

@UserCreatedId bigint,
@IFWithBranch  bit,
@EnquiryPaymentId bigint
as begin
INSERT INTO [dbo].[EnquiryStatus]
           ([Notes]
           ,[DateTime]
           ,[FKEnquiry_Id]
           ,[FKEnquiryStatus_Id]
           ,[ScheduleVisitDateTime],
		   FKUserCreated_Id,
		   FKEnquiryPayment_Id)
     VALUES (@Notes,@DateTime,@EnquiryId,@EnquiryStatusId,@ScheduleVisitDateTime,@UserCreatedId,@EnquiryPaymentId)


if(@IFWithBranch is not null)
 update Enquires
	  set IsWithBranch=@IFWithBranch where Id=@EnquiryId 
   
           
		   
end

GO
/****** Object:  StoredProcedure [dbo].[EnquiryStatus_ResetClendersIdsToNull]    Script Date: 1/30/2020 7:50:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[EnquiryStatus_ResetClendersIdsToNull]
@EnquiryId bigint 
as begin 
update EnquiryStatus set ScheduleVisitDateClendarEventId=null
where FKEnquiry_Id=@EnquiryId
end 
GO
/****** Object:  StoredProcedure [dbo].[EnquiryStatus_SelectByEnquiryId]    Script Date: 1/30/2020 7:50:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
 CREATE proc [dbo].[EnquiryStatus_SelectByEnquiryId]
@EnquiyId bigint 
as begin 
select 
		EnquiryStatus.Id as Status_Id,
		WordEnquiryStatusType.Ar as Status_NameAr,
		WordEnquiryStatusType.En as Status_NameEn,
		EnquiryStatus.Notes as Status_Notes,
		EnquiryStatus.DateTime as Status_CreateDateTime,
		EnquiryStatus.ScheduleVisitDateTime as Status_ScheduleVisitDateTime,
		EnquiryStatus.FKUserCreated_Id as Status_UserCreatedId,
		EnquiryStatus.FKEnquiryPayment_Id	as Status_EnquiryPaymentId,
		EnquiryPayments.Amount,
	isnull(UserCreatedStatus.FullName,N'شخص ما') as Status_CreatedUserNameAr,
		isnull(UserCreatedStatus.FullName,N'Someone') as Status_CreatedUserNameEn

from EnquiryStatus
 
 left join Users as UserCreatedStatus on UserCreatedStatus.Id=EnquiryStatus.FKUserCreated_Id

 join EnquiryStatusTypes on EnquiryStatusTypes.Id=EnquiryStatus.FKEnquiryStatus_Id
 join Words  as WordEnquiryStatusType on WordEnquiryStatusType.Id=EnquiryStatusTypes.FKWord_Id
left join EnquiryPayments on EnquiryPayments.Id=EnquiryStatus.FKEnquiryPayment_Id

where EnquiryStatus.FKEnquiry_Id = @EnquiyId
order by EnquiryStatus.Id desc
end 
GO
/****** Object:  StoredProcedure [dbo].[EnquiryStatus_SelectByFilter]    Script Date: 1/30/2020 7:50:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[EnquiryStatus_SelectByFilter]
@EnquiryId bigint ,
@StatusId int
as begin 
select * from EnquiryStatus where FKEnquiry_Id=@EnquiryId 
and (@StatusId is null or  FKEnquiryStatus_Id=@StatusId)
end
GO
/****** Object:  StoredProcedure [dbo].[EnquiryStatus_Update]    Script Date: 1/30/2020 7:50:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[EnquiryStatus_Update]
@Id bigint ,
@ScheduleVisitDateClendarEventId nvarchar(max)
as begin 
--نقوم بتحديث معرف التاريخ  الخاص بكلندر جوجول
update EnquiryStatus set ScheduleVisitDateClendarEventId=@ScheduleVisitDateClendarEventId
where Id=@Id
--ومعنى ذالك ان المعرفات  الاخرى ملغية لانة يجب  ان تكون زيارة واحدة فقط هى الذى موجودة فى الكلندر 
--ونحن نحذفها حتى نحذفها مرة آخرى من جوجل

update EnquiryStatus set ScheduleVisitDateClendarEventId=null
where Id!=@Id
end

GO
/****** Object:  StoredProcedure [dbo].[EnquiryStatusTypes_SelectByPK]    Script Date: 1/30/2020 7:50:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[EnquiryStatusTypes_SelectByPK]
@Id int
as begin

select Words.Ar,Words.En from EnquiryStatusTypes 
join Words on Words.Id=EnquiryStatusTypes.FKWord_Id
where EnquiryStatusTypes.Id=@Id
end
GO
/****** Object:  StoredProcedure [dbo].[EnquiryTypes_CheckIfUsed]    Script Date: 1/30/2020 7:50:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[EnquiryTypes_CheckIfUsed] 
@Id bigint
as begin

select 
count(*)from Enquires where FKEnquiryType_Id=@Id
 
end
GO
/****** Object:  StoredProcedure [dbo].[EnquiryTypes_Delete]    Script Date: 1/30/2020 7:50:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[EnquiryTypes_Delete]
@Id bigint,
@WordId bigint
as begin

delete  EnquiryTypes where Id=@Id
delete Words where Words.Id =@WordId
 
end
GO
/****** Object:  StoredProcedure [dbo].[EnquiryTypes_Insert]    Script Date: 1/30/2020 7:50:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
 
create  proc [dbo].[EnquiryTypes_Insert]
@Id int output , 
@NameAr nvarchar(50),
@NameEn nvarchar(50)

as begin
-- Insert Word 
declare @WordId int ;
exec @WordId =   dbo.Words_Insert @NameAr,@NameEn

-- Insert Target
INSERT INTO [dbo].[EnquiryTypes]
           ([FKWord_Id])
     VALUES
           (@WordId)

		 select  @Id=@@identity
end


GO
/****** Object:  StoredProcedure [dbo].[EnquiryTypes_SelectAll]    Script Date: 1/30/2020 7:50:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
 
create proc [dbo].[EnquiryTypes_SelectAll] 

as begin 

select EnquiryTypes.*,
Words.Ar as NameAr,
Words.En as NameEn from EnquiryTypes

join Words on Words.Id= EnquiryTypes.FKWord_Id

order by Id desc
end 
GO
/****** Object:  StoredProcedure [dbo].[EnquiryTypes_SelectByFilter]    Script Date: 1/30/2020 7:50:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[EnquiryTypes_SelectByFilter] 
@Skip int , 
@Take int 

as begin 

select EnquiryTypes.*,
Words.Ar as NameAr,
Words.En as NameEn from EnquiryTypes

join Words on Words.Id= EnquiryTypes.FKWord_Id

order by Id desc
Offset @skip rows 
Fetch next @Take rows only 
end 
GO
/****** Object:  StoredProcedure [dbo].[EnquiryTypes_Update]    Script Date: 1/30/2020 7:50:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE  proc [dbo].[EnquiryTypes_Update]
@Id int  , 
@NameAr nvarchar(50),
@NameEn nvarchar(50),
@WordId bigint

as begin
-- Update Word 
exec dbo.Words_Update @WordId, @NameAr,@NameEn

-- Update Target
 

end


GO
/****** Object:  StoredProcedure [dbo].[EventArchives_Insert]    Script Date: 1/30/2020 7:50:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[EventArchives_Insert] 
@Id					bigint	output,
@FKEvent_Id			bigint	,
@HDNumber			nvarchar(50)	,
@FolderName			nvarchar(50)	,
@DateTime			datetime,
@UserId				bigint
as begin

set @Id   =(select ISNULL(max(Id),0)+1 from EventArchives where FKEvent_Id=@FKEvent_Id);

insert EventArchives   (
Id					,
FKEvent_Id			,
HardDiskNumber			,
FolderName,
DateTime			,
FKUser_Id				
)
values (
@Id					,
@FKEvent_Id			,
@FolderName,
@HDNumber			,
@DateTime			,
@UserId				
)


end 
GO
/****** Object:  StoredProcedure [dbo].[EventArchives_SelectAll]    Script Date: 1/30/2020 7:50:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[EventArchives_SelectAll]
@EventId bigint,
@UserId bigint
as begin

select 
		ev.Id				as EV_Id,
		ev.FKEvent_Id		as EV_EventId,
		ev.FKUser_Id   	 	as EV_UserId,
		ev.FolderName		as EV_FolderName,
		ev.HardDiskNumber	as EV_HardDiskName,
		ev.DateTime			as EV_DateTime,
		
		evd.Id					as EVD_Id,
		evd.DateTime			as EVD_DateTime,
		evd.MemoryId			as EVD_MemoryId,
		evd.MemoryType			as EVD_MemoryType,
		evd.Notes				as EVD_Notes,
		evd.PhotoNumberFrom		as EVD_PhotoNumberFrom,
		evd.PhotoNumberTo		as EVD_PhotoNumberTo,
		evd.PhotoStartName		as EVD_PhotoStartName

from EventArchives ev
left join EventArchiveDetails evd on evd.FKEventArchive_Id=ev.Id and evd.FKEvent_Id=ev.FKEvent_Id
where ev.FKEvent_Id=@EventId and ev.FKUser_Id=@UserId


end 
GO
/****** Object:  StoredProcedure [dbo].[EventArchives_Update]    Script Date: 1/30/2020 7:50:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[EventArchives_Update] 
@Id					int	 ,
@FKEvent_Id			bigint	,
@HDNumber			nvarchar(50)	,
@FolderName			nvarchar(50)	
as begin


update EventArchives   

set HardDiskNumber	=@HDNumber		,
FolderName =@FolderName

where 
Id					=@Id and 
FKEvent_Id			=@FKEvent_Id

end 
GO
/****** Object:  StoredProcedure [dbo].[EventArchivesDetails_Delete]    Script Date: 1/30/2020 7:50:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[EventArchivesDetails_Delete] 
@Id					bigint,
@EventId bigint ,
@EventArchifId int
as begin

delete EventArchiveDetails where Id=@Id and FKEvent_Id=@EventId and FKEventArchive_Id=@EventArchifId


end 
GO
/****** Object:  StoredProcedure [dbo].[EventArchivesDetails_Inserrt]    Script Date: 1/30/2020 7:50:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[EventArchivesDetails_Inserrt] 
@Id	bigint outPut,
@EventId bigint ,
@EventArchiveId int,
@MemoryId nvarchar(50),
@MemoryType nvarchar(50),
@PhotoStartName	nvarchar(50),
@PhotoNumberFrom int ,
@PhotoNumberTo int,
@Notes nvarchar(max),
@DateTime datetime
as begin

set @Id=(select ISNULL(max(Id),0)+1 from EventArchiveDetails where FKEvent_Id=@EventId and FKEventArchive_Id=@EventArchiveId);

insert EventArchiveDetails	 
(Id,FKEvent_Id,FKEventArchive_Id,MemoryId,MemoryType,PhotoStartName,PhotoNumberFrom,PhotoNumberTo,Notes,DateTime)
values
(@Id,@EventId,@EventArchiveId,@MemoryId,@MemoryType,@PhotoStartName,@PhotoNumberFrom,@PhotoNumberTo,@Notes,@DateTime)


end 
GO
/****** Object:  StoredProcedure [dbo].[EventCoordinations_Delete]    Script Date: 1/30/2020 7:50:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[EventCoordinations_Delete]
			 
            @Id bigint
			as begin
delete [dbo].[EventCoordinations]
where Id=@Id
			end
GO
/****** Object:  StoredProcedure [dbo].[EventCoordinations_Insert]    Script Date: 1/30/2020 7:50:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[EventCoordinations_Insert]
			@TaskNumber int,
            @Task nvarchar(50),
            @StartTime time(7),
            @EndTime time(7),
            @Notes nvarchar(max),
            @FKEvent_Id bigint,
            @FKUserCreated_Id bigint
			as begin
INSERT INTO [dbo].[EventCoordinations]
           (TaskNumber
           ,[Task]
           ,[StartTime]
           ,[EndTime]
           ,[Notes]
           ,[FKEvent_Id]
           ,[FKUserCreated_Id])
     VALUES
           (@TaskNumber  ,
 			@Task ,
			@StartTime,
			@EndTime ,
			@Notes ,
			@FKEvent_Id ,
			@FKUserCreated_Id )

			end
GO
/****** Object:  StoredProcedure [dbo].[EventCoordinations_SelectByEventId]    Script Date: 1/30/2020 7:50:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[EventCoordinations_SelectByEventId]
			 
            @EventId bigint
			as begin
select EventCoordinations.*,Users.UserName,
EventTaskStatusIsFinshed.* from 
EventCoordinations
join Users on Users.Id=EventCoordinations.FKUserCreated_Id
join EventTaskStatusIsFinshed on EventTaskStatusIsFinshed.EventId=@EventId
where EventCoordinations.FKEvent_Id=@EventId
			end
GO
/****** Object:  StoredProcedure [dbo].[EventCoordinations_SelectTasksNumber]    Script Date: 1/30/2020 7:50:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[EventCoordinations_SelectTasksNumber]
			 
            @EventId bigint
			as begin
select EventCoordinations.TaskNumber from 
EventCoordinations

where EventCoordinations.FKEvent_Id=@EventId
			end
GO
/****** Object:  StoredProcedure [dbo].[EventPhotographers_CheckCanBeAccess]    Script Date: 1/30/2020 7:50:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[EventPhotographers_CheckCanBeAccess]
@UsereId bigint ,
@EventId bigint
as begin 

/*
لـ نتتحقق بـ ان المصور الحالى يمكنة الوصول الى المناسبة 
ويجب على هذة المناسبة ان تكون مكتملة الاعداد والتنسيق
*/

select count(*) from EventPhotographers 
join EventTaskStatusIsFinshed f on  f.EventId=@EventId
where FKEvent_Id=@EventId and FKUser_Id=@UsereId and f.Coordination=1

end 
GO
/****** Object:  StoredProcedure [dbo].[EventPhotographers_Delete]    Script Date: 1/30/2020 7:50:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[EventPhotographers_Delete]

@FKEvent_Id bigint 

as begin

delete EventPhotographers where FKEvent_Id=@FKEvent_Id
end 
GO
/****** Object:  StoredProcedure [dbo].[EventPhotographers_Insert]    Script Date: 1/30/2020 7:50:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[EventPhotographers_Insert]

@Id bigint output,
@FKEvent_Id bigint ,
@FkUser_Id bigint , 
@CreateDateTime DateTime 

as begin

set @Id=(select isnull(MAX(Id),0)+1 from EventPhotographers where FKEvent_Id=@FKEvent_Id);

insert EventPhotographers values(@Id,@FKEvent_Id,@FkUser_Id,@CreateDateTime)

end 
GO
/****** Object:  StoredProcedure [dbo].[EventPhotographers_SelectAll]    Script Date: 1/30/2020 7:50:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[EventPhotographers_SelectAll]
@EventId bigint 
as begin 

select 
	EventPhotographers.Id,
	EventPhotographers.CreateDateTime ,
	EventPhotographers.FKUser_Id,
	Users.UserName,
	Users.FullName,
	Users.FKAccountType_Id as AccountTypeNameId,
	Words.Ar as AccountTypeNameAr,
	Words.En as AccountTypeNameEn

from EventPhotographers
		join Users on Users.Id=EventPhotographers.FKUser_Id
		join AccountTypes on AccountTypes.Id=Users.FKAccountType_Id
		join Words on Words.Id=AccountTypes.FkWord_Id

where FKEvent_Id=@eventId
end 
GO
/****** Object:  StoredProcedure [dbo].[EventPhotographers_SelectAllByEventId]    Script Date: 1/30/2020 7:50:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[EventPhotographers_SelectAllByEventId]

@FKEvent_Id bigint 

as begin
select * from EventPhotographers where FKEvent_Id=@FKEvent_Id
end 
GO
/****** Object:  StoredProcedure [dbo].[EventPhotographers_SelectAllUsers]    Script Date: 1/30/2020 7:50:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[EventPhotographers_SelectAllUsers]

@FKEvent_Id bigint 

as begin
select users.*,
EventPhotographers.CreateDateTime as EveCreateDateTime,
EventPhotographers.Id as EveId
		from users 
left join EventPhotographers on EventPhotographers.FKUser_Id = Users.Id and FKEvent_Id=@FKEvent_Id
where
	(Users.IsActive=1 or EventPhotographers.Id!=null) 
and (
    Users.FKAccountType_Id=7 or --Photograhper 
    Users.FKAccountType_Id=6 --	Helper
	)
and Users.FKPranch_Id=(select top 1 FKPranch_Id from events where Id=@FKEvent_Id)   

order by Id desc
end 
GO
/****** Object:  StoredProcedure [dbo].[EventPhotographers_SelectEventsByFilter]    Script Date: 1/30/2020 7:50:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
 
CREATE proc [dbo].[EventPhotographers_SelectEventsByFilter]
		   --Paging
		   @Skip int , 
		   @Take int ,
		   --Filter
		   @IsClinetCustomLogo            bit,
           @IsNamesAr                  bit,
           @NameGroom				   nvarchar(50),
           @NameBride				   nvarchar(50),
           @EventDateTimeTo			   datetime,
           @EventDateTimeFrom			   datetime,
           @FKPackage_Id				int,
		   @EmplolyeeId bigint
as begin 

select Events.* ,
	   EventTaskStatusIsFinshed.*,
	   Enquires.FirstName +' '+ Enquires.LastName as EnquiryName ,
	   Enquires.IsClosed ,
	   WordBranche.Ar	as Branch_NameAr, 
	   WordBranche.En	as Branch_NameEn,
	   WordPackage.Ar	as Package_NameAr, 
	   WordPackage.En	as Package_NameEn,
	   WordPrintNamesType.Ar	as WordPrintNamesType_NameAr, 
	   WordPrintNamesType.En	as WordPrintNamesType_NameEn

	from Events
	
	join EventPhotographers 
	on EventPhotographers.FKUser_Id=@EmplolyeeId and EventPhotographers.FKEvent_Id=Events.Id
 	join Enquires on Enquires.Id = Events.Id
	join Branches   on Branches.Id = Events.FKBranch_Id
	join Packages   on Packages.Id = Events.FKPackage_Id
	left join PrintNamesTypes   on PrintNamesTypes.Id = Events.FKPrintNameType_Id
	join Words as WordBranche   on WordBranche.Id = Branches.FKWord_Id
	join Words as WordPackage   on WordPackage.Id = Packages.FkWordName_Id
	left join Words as WordPrintNamesType   on WordPrintNamesType.Id = PrintNamesTypes.FKWord_Id
	join EventTaskStatusIsFinshed on EventTaskStatusIsFinshed.EventId=Events.Id
	where 
	--جلب المناسبات الذى لم تغلق فقط
	(Enquires.IsClosed=0 or Enquires.IsClosed is null)  and 
	--التحقق بان المهمة السابقة قد انتهت
 EventTaskStatusIsFinshed.Coordination             	=1
	and
	-- الفيلتر
	(     @IsClinetCustomLogo	is null or	Events.IsClinetCustomLogo	=@IsClinetCustomLogo	)																					
	and(  @IsNamesAr           	is null or	Events.IsNamesAr           	=@IsNamesAr				)					
	and(  @NameGroom			is null or	Events.NameGroom			=@NameGroom				)					
	and(  @NameBride			is null or	Events.NameBride			=@NameBride				)					
	and(  @EventDateTimeFrom	is null or	Events.EventDateTime>=		@EventDateTimeFrom			)					
	and(  @EventDateTimeTo		is null or	Events.EventDateTime<=		@EventDateTimeTo			)					
	and(  @FKPackage_Id			is null or	Events.FKPackage_Id			=@FKPackage_Id			)					
	


	order by Id  desc
	Offset @skip rows
	Fetch Next @Take rows only



end
GO
/****** Object:  StoredProcedure [dbo].[Events_CheckFromDateEventIsFinshed]    Script Date: 1/30/2020 7:50:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[Events_CheckFromDateEventIsFinshed]--27,null
@EventId bigint,
@DateTime DateTime
as begin 

select count(*) from Events where Id=@EventId and Events.EventDateTime<@DateTime
end
GO
/****** Object:  StoredProcedure [dbo].[Events_CheckFromDateEventIsFinshedBranchId]    Script Date: 1/30/2020 7:50:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[Events_CheckFromDateEventIsFinshedBranchId]
@EventId bigint,
@BranchId int
as begin 
select count(*) from Events where Id=@EventId and FKBranch_Id=@BranchId
end
GO
/****** Object:  StoredProcedure [dbo].[Events_CountsByYear]    Script Date: 1/30/2020 7:50:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[Events_CountsByYear]
@Year int
as begin
select count(*)
		from Events
		where year(Events.EventDateTime)=@Year
end
GO
/****** Object:  StoredProcedure [dbo].[Events_Insert]    Script Date: 1/30/2020 7:50:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[Events_Insert]
		   @Id	bigint  ,
		   @IsClinetCustomLogo            bit,
           @LogoFilePath               nvarchar(max),
           @IsNamesAr                  bit,
           @NameGroom				   nvarchar(50),
           @NameBride				   nvarchar(50),
           @EventDateTime			   datetime,
           @CreateDateTime			   datetime,
           @FKPackage_Id				int,
           @FKPrintNameType_Id			int,
           @FKClinet_Id					bigint,
           @Notes						nvarchar(max),
           @FKUserCreaed_Id				bigint,
           @FKBranch_Id					int,
		   @PackagePrice decimal(18,2),
		   @PackageNamsArExtraPrice decimal(18,2),
		   @VistToCoordinationDateTime datetime,
		   @NamesPrintingPrice decimal(18,2)

as begin
--نتحقق هل هوا استكمل البيانات ام لاء
declare @IsDataPerfection bit ;
if(@NameGroom is not null and @NameBride is not null )
set @IsDataPerfection=1;

INSERT INTO [dbo].[Events]
           (Id,[IsClinetCustomLogo] ,[LogoFilePath]
           ,[IsNamesAr],[NameGroom],[NameBride],[EventDateTime]
           ,[CreateDateTime],[FKPackage_Id]
           ,[FKPrintNameType_Id],[FKClinet_Id],[Notes]
           ,[FKUserCreaed_Id],[FKBranch_Id],PackagePrice ,PackageNamsArExtraPrice ,
		   VistToCoordinationDateTime,NamesPrintingPrice)
     VALUES
           (@Id,@IsClinetCustomLogo,@LogoFilePath,
			@IsNamesAr,@NameGroom,
			@NameBride,@EventDateTime,
			@CreateDateTime,@FKPackage_Id,
			@FKPrintNameType_Id,@FKClinet_Id,	
			@Notes,@FKUserCreaed_Id,	
			@FKBranch_Id,@PackagePrice ,
		    @PackageNamsArExtraPrice,@VistToCoordinationDateTime,
			@NamesPrintingPrice)

		
insert EventTaskStatusIsFinshed (EventId,Booking,DataPerfection)
values (@Id,1,@IsDataPerfection)

			 
end
GO
/****** Object:  StoredProcedure [dbo].[Events_SelectByFilter]    Script Date: 1/30/2020 7:50:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[Events_SelectByFilter]
		   --Paging
		   @Skip int , 
		   @Take int ,
		   --Filter
		   @IsClinetCustomLogo            bit,
           @IsNamesAr                  bit,
           @NameGroom				   nvarchar(50),
           @NameBride				   nvarchar(50),
           @EventDateTimeTo			   datetime,
           @EventDateTimeFrom			   datetime,
           @CreateDateTimeTo			   datetime,
           @CreateDateTimeFrom			   datetime,
           @FKPackage_Id				int,
           @FKPrintNameType_Id			int,
           @FKBranch_Id					int,
		   @IsForCurrentClinet bit,
		   @CurrentClinetId bigint


		   
as begin 

select Events.* ,
	   Enquires.FirstName +' '+ Enquires.LastName as EnquiryName ,
	   Enquires.IsClosed ,
	   WordBranche.Ar	as Branch_NameAr, 
	   WordBranche.En	as Branch_NameEn,
	   WordPackage.Ar	as Package_NameAr, 
	   WordPackage.En	as Package_NameEn,
		WordPrintNamesType.Ar	as WordPrintNamesType_NameAr, 
		WordPrintNamesType.En	as WordPrintNamesType_NameEn,
	   dbo.EnquiryPayments_CheckIfPaymentDeposit(Events.Id) as IsDepositPaymented,
	 dbo.EnquiryPayments_TotalPaymentsActive(Events.Id) as   TotalPaymentsActivated,
	 evf.DataPerfection as EventTaskStatusIsFinshed_DataPerfection

	from Events

left	join Enquires on Enquires.Id = Events.Id
	
	join Branches   on Branches.Id = Events.FKBranch_Id
	join Packages   on Packages.Id = Events.FKPackage_Id
left join PrintNamesTypes   on PrintNamesTypes.Id = Events.FKPrintNameType_Id

	join Words as WordBranche   on WordBranche.Id = Branches.FKWord_Id
	join Words as WordPackage   on WordPackage.Id = Packages.FkWordName_Id
left join Words as WordPrintNamesType   on WordPrintNamesType.Id = PrintNamesTypes.FKWord_Id
join EventTaskStatusIsFinshed evf on evf.EventId=Events.Id 
	where 
	(     @IsClinetCustomLogo	is null or	Events.IsClinetCustomLogo	=@IsClinetCustomLogo	)																					
	and(  @IsNamesAr           	is null or	Events.IsNamesAr           	=@IsNamesAr				)					
	and(  @NameGroom			is null or	Events.NameGroom			=@NameGroom				)					
	and(  @NameBride			is null or	Events.NameBride			=@NameBride				)					
	and(  @EventDateTimeFrom	is null or	Events.EventDateTime>=		@EventDateTimeFrom			)					
	and(  @EventDateTimeTo		is null or	Events.EventDateTime<=		@EventDateTimeTo			)					
	and(  @CreateDateTimeFrom	is null or	Events.CreateDateTime>=		@CreateDateTimeFrom		)					
	and(  @CreateDateTimeTo		is null or	Events.CreateDateTime<=		@CreateDateTimeTo		)					
	and(  @FKPackage_Id			is null or	Events.FKPackage_Id			=@FKPackage_Id			)					
	and(  @FKPrintNameType_Id	is null or	Events.FKPrintNameType_Id	=@FKPrintNameType_Id	)					
	and(  @FKBranch_Id			is null or	Events.FKBranch_Id			=@FKBranch_Id			)						
	and(  @IsForCurrentClinet	is null or	Events.FKClinet_Id =@CurrentClinetId)					


	order by Id  desc
	Offset @skip rows
	Fetch Next @Take rows only



end
GO
/****** Object:  StoredProcedure [dbo].[Events_SelectByFilterForEmployee]    Script Date: 1/30/2020 7:50:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
 
CREATE proc [dbo].[Events_SelectByFilterForEmployee]
		   --Paging
		   @Skip int , 
		   @Take int ,
		   --Filter
		   @IsClinetCustomLogo            bit,
           @IsNamesAr                  bit,
           @NameGroom				   nvarchar(50),
           @NameBride				   nvarchar(50),
           @EventDateTimeTo			   datetime,
           @EventDateTimeFrom			   datetime,
           @FKPackage_Id				int,
           @FKPrintNameType_Id			int,
		   @WorkTypeId	int,
		   @EmplolyeeId bigint,
		   @IsFinshed bit
as begin 

select Events.* ,
	   EventTaskStatusIsFinshed.*,
	   Enquires.FirstName +' '+ Enquires.LastName as EnquiryName ,
	   Enquires.IsClosed ,
	   WordBranche.Ar	as Branch_NameAr, 
	   WordBranche.En	as Branch_NameEn,
	   WordPackage.Ar	as Package_NameAr, 
	   WordPackage.En	as Package_NameEn,
	   WordPrintNamesType.Ar	as WordPrintNamesType_NameAr, 
	   WordPrintNamesType.En	as WordPrintNamesType_NameEn

	from Events
	
	join EmployeeDistributionTasks
	on EmployeeDistributionTasks.FKEvent_Id=Events.Id and 
	EmployeeDistributionTasks.FKEmployee_Id=@EmplolyeeId and 
	EmployeeDistributionTasks.FKWorkType_Id=@WorkTypeId

 	join Enquires on Enquires.Id = Events.Id
	join Branches   on Branches.Id = Events.FKBranch_Id
	join Packages   on Packages.Id = Events.FKPackage_Id
	left join PrintNamesTypes   on PrintNamesTypes.Id = Events.FKPrintNameType_Id
	join Words as WordBranche   on WordBranche.Id = Branches.FKWord_Id
	join Words as WordPackage   on WordPackage.Id = Packages.FkWordName_Id
	left join Words as WordPrintNamesType   on WordPrintNamesType.Id = PrintNamesTypes.FKWord_Id
	join EventTaskStatusIsFinshed on EventTaskStatusIsFinshed.EventId=Events.Id
	where 
	--جلب المناسبات الذى لم تغلق فقط
	(Enquires.IsClosed=0 or Enquires.IsClosed is null)  and 
	--التحقق بان المهمة السابقة قد انتهت
	(
	--التحقق بان مثلا اذا كانت هذة عملية التنسيق فيجب عملية استكمال البيانات تكون انتهت
	(@WorkTypeId =3 and EventTaskStatusIsFinshed. DataPerfection           	=1)
or	(@WorkTypeId =4 and EventTaskStatusIsFinshed. Coordination             	=1)
or	(@WorkTypeId =5 and EventTaskStatusIsFinshed. Implementation           	=1)
or	(@WorkTypeId =6 and EventTaskStatusIsFinshed. ArchivingAndSaveing      	=1)
or	(@WorkTypeId =7 and EventTaskStatusIsFinshed. ProcessingProducts        	=1)
or	(@WorkTypeId =8 and EventTaskStatusIsFinshed. Choosing                	=1)
or	(@WorkTypeId =9 and EventTaskStatusIsFinshed. DigitalProcessing        	=1)
or	(@WorkTypeId =10 and EventTaskStatusIsFinshed.PreparingForPrinting     	=1)
or	(@WorkTypeId =11 and EventTaskStatusIsFinshed.Manufacturing            	=1)
or	(@WorkTypeId =12 and EventTaskStatusIsFinshed.QualityAndReview         	=1)
or	(@WorkTypeId =13 and EventTaskStatusIsFinshed.Packaging                	=1)
or	(@WorkTypeId =14 and EventTaskStatusIsFinshed.TransmissionAndDelivery  	=1)
	) 
	--/التحقق بان المهمة السابقة قد انتهت
	and
	-- الفيلتر
	(     @IsClinetCustomLogo	is null or	Events.IsClinetCustomLogo	=@IsClinetCustomLogo	)																					
	and(  @IsNamesAr           	is null or	Events.IsNamesAr           	=@IsNamesAr				)					
	and(  @NameGroom			is null or	Events.NameGroom			=@NameGroom				)					
	and(  @NameBride			is null or	Events.NameBride			=@NameBride				)					
	and(  @EventDateTimeFrom	is null or	Events.EventDateTime>=		@EventDateTimeFrom			)					
	and(  @EventDateTimeTo		is null or	Events.EventDateTime<=		@EventDateTimeTo			)					
	and(  @FKPackage_Id			is null or	Events.FKPackage_Id			=@FKPackage_Id			)					
	and(  @FKPrintNameType_Id	is null or	Events.FKPrintNameType_Id	=@FKPrintNameType_Id	)
	and(  @IsFinshed			is null or	dbo.Events_CheckIfTaskFinshed(Events.Id,@WorkTypeId,@EmplolyeeId)=@IsFinshed	)
	

	


	order by Id  desc
	Offset @skip rows
	Fetch Next @Take rows only



end
GO
/****** Object:  StoredProcedure [dbo].[Events_SelectByPK]    Script Date: 1/30/2020 7:50:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[Events_SelectByPK]
@Id bigint
as begin 

select Events.*,
dbo.EnquiryPayments_TotalPayments(@Id) as TotalPayments,
dbo.EnquiryPayments_TotalPaymentsActive(@Id) as TotalPaymentsActivated

from Events

	where Events.Id=@Id
end
GO
/****** Object:  StoredProcedure [dbo].[Events_SelectInformation]    Script Date: 1/30/2020 7:50:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[Events_SelectInformation]
@Id bigint
as begin 

select Events.* ,
EventTaskStatusIsFinshed.* ,
	   Enquires.FirstName +' '+ Enquires.LastName as EnquiryName ,
	   Enquires.IsClosed ,
	   PackageWord.Ar as Package_NameAr,
	   PackageWord.En as Package_NameEn ,
	   Packages.IsPrintNamesFree as Package_IsPrintNamesFree,
	   PrintNameTypeWord.Ar as PrintNameType_NameAr,
	   PrintNameTypeWord.En as PrintNameType_NameEn ,
	    
	   BranchWord.Ar as Branch_NameAr,
	   BranchWord.En as Branch_NameEn ,
	   
	   Clinet.UserName as Clinet_UserName,
	   UserCreated.UserName as UserCreated_UserName,
	   dbo.EnquiryPayments_TotalPayments(@Id) as TotalPayments,
dbo.EnquiryPayments_TotalPaymentsActive(@Id) as TotalPaymentsActivated
	   
	from Events

left	join Enquires on Enquires.Id = Events.Id
	
	join Packages on Packages.Id = Events.FKPackage_Id
	join Words as PackageWord  on PackageWord.Id = Packages.FkWordName_Id
	
left	join PrintNamesTypes on PrintNamesTypes.Id = Events.FKPrintNameType_Id
left	join Words as PrintNameTypeWord  on PrintNameTypeWord.Id = PrintNamesTypes.FKWord_Id
	
	 
	join Branches on Branches.Id = Events.FKBranch_Id
	join Words as BranchWord  on BranchWord.Id = Branches.FKWord_Id


	join Users as Clinet  on Clinet.Id = Events.FKClinet_Id
	join Users as UserCreated  on UserCreated.Id = Events.FKUserCreaed_Id
join EventTaskStatusIsFinshed on EventTaskStatusIsFinshed.EventId=Events.Id

	where Events.Id=@Id
end
GO
/****** Object:  StoredProcedure [dbo].[Events_Update]    Script Date: 1/30/2020 7:50:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[Events_Update]
		   @Id	bigint  ,
		   @IsClinetCustomLogo            bit,
           @LogoFilePath               nvarchar(max),
           @IsNamesAr                  bit,
           @NameGroom				   nvarchar(50),
           @NameBride				   nvarchar(50),
           @EventDateTime			   datetime,
           @FKPackage_Id				int,
           @FKPrintNameType_Id			int,
           @Notes						nvarchar(max),
		   @PackagePrice decimal(18,2),
		   @PackageNamsArExtraPrice decimal(18,2),
		   @VistToCoordinationDateTime datetime,
		   @NamesPrintingPrice decimal(18,2)

as begin

--نتحقق هل هوا استكمل البيانات ام لاء
declare @IsDataPerfection bit ;
if(@NameGroom is not null and @NameBride is not null )
set @IsDataPerfection=1;

update [dbo].[Events]
          set [IsClinetCustomLogo]  =@IsClinetCustomLogo    										 
           ,[LogoFilePath]			=@LogoFilePath           
           ,[IsNamesAr]				=@IsNamesAr              
           ,[NameGroom]				=@NameGroom				 
           ,[NameBride]				=@NameBride				 
           ,[EventDateTime]			=@EventDateTime			 
           ,[FKPackage_Id]			=@FKPackage_Id			 
           ,[FKPrintNameType_Id]	=@FKPrintNameType_Id		 
           ,[Notes]					=@Notes	,
		    PackagePrice= @PackagePrice ,
		    PackageNamsArExtraPrice= @PackageNamsArExtraPrice ,
			VistToCoordinationDateTime=@VistToCoordinationDateTime,
			NamesPrintingPrice=@NamesPrintingPrice
			where Id=@Id
   
   -- نقوم بتحديث مرحلة استكمال البيانات بانها انتهت
   if(@IsDataPerfection =1)
    exec EventTaskStatusIsFinshed_Update @Id,1,2


end									
			 
			 
			 
			 
			
			
			
			
			
			
			
				
				
			
				
			
GO
/****** Object:  StoredProcedure [dbo].[Events_Update2]    Script Date: 1/30/2020 7:50:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[Events_Update2]
		   @Id	bigint  ,
		   @IsClinetCustomLogo            bit,
           @LogoFilePath               nvarchar(max),
           @IsNamesAr                  bit,
           @NameGroom				   nvarchar(50),
           @NameBride				   nvarchar(50),
           @FKPrintNameType_Id			int,
		      @PackagePrice decimal(18,2),
		   @PackageNamsArExtraPrice decimal(18,2),
		   @NamesPrintingPrice decimal(18,2)

as begin
--نتحقق هل هوا استكمل البيانات ام لاء
declare @IsDataPerfection bit ;
if(@NameGroom is not null and @NameBride is not null )
set @IsDataPerfection=1;

update [dbo].[Events]
          set [IsClinetCustomLogo]  =@IsClinetCustomLogo    										 
           ,[LogoFilePath]			=@LogoFilePath           
           ,[IsNamesAr]				=@IsNamesAr              
           ,[NameGroom]				=@NameGroom				 
           ,[NameBride]				=@NameBride				 
           ,[FKPrintNameType_Id]	=@FKPrintNameType_Id	,	 
		     PackagePrice= @PackagePrice ,
		  PackageNamsArExtraPrice= @PackageNamsArExtraPrice ,
		  NamesPrintingPrice=@NamesPrintingPrice
   
			where Id=@Id
   
   -- نقوم بتحديث مرحلة استكمال البيانات بانها انتهت
   if(@IsDataPerfection =1)
   exec EventWorksStatusIsFinshed_Update @Id,1,2

end									
			 
			 
			 
			 
			
			
			
			
			
			
			
				
				
			
				
			
GO
/****** Object:  StoredProcedure [dbo].[Events_UpdateCalendarEventId]    Script Date: 1/30/2020 7:50:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
 CREATE proc [dbo].[Events_UpdateCalendarEventId]
 @EventId bigint,
 @ClendarEventId nvarchar(max),
 @VistToCoordinationClendarEventId nvarchar(max),
 @IsUpdateVistClendar bit,
 @IsUpdateClendar bit

 as begin

 if(@IsUpdateClendar =1)
 update Events
 set ClendarEventId=@ClendarEventId
 where Id=@EventId

 if(@IsUpdateVistClendar=1)
  update Events
 set VistToCoordinationClendarEventId=@VistToCoordinationClendarEventId
 where Id=@EventId
  

 end
GO
/****** Object:  StoredProcedure [dbo].[EventSurveies_ChartByYear]    Script Date: 1/30/2020 7:50:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[EventSurveies_ChartByYear]
@Year int
as begin
select 
		Events.EventDateTime,
		(select count(*) from EventSurveies where Id=Events.Id and IsSatisfied=1)as CountIsSatisfied
		from Events
		where year(Events.EventDateTime)=@Year
end
GO
/****** Object:  StoredProcedure [dbo].[EventSurveies_DeleteByEventId]    Script Date: 1/30/2020 7:50:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[EventSurveies_DeleteByEventId]
@EventID bigint
as begin
delete EventSurveies where Id=@EventID

		   end

GO
/****** Object:  StoredProcedure [dbo].[EventSurveies_Insert]    Script Date: 1/30/2020 7:50:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[EventSurveies_Insert]
@EventId bigint,
@ClinetId bigint, 
@IsSatisfied bit
as begin 
INSERT INTO [dbo].[EventSurveies]
           ([Id]
           ,[FKClinet_Id]
           ,[IsSatisfied])
     VALUES
           (@EventId,@ClinetId,@IsSatisfied)
end
GO
/****** Object:  StoredProcedure [dbo].[EventSurveies_Insert_DeleteByEventId]    Script Date: 1/30/2020 7:50:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[EventSurveies_Insert_DeleteByEventId]
@EventId bigint
as begin
delete EventSurveies where Id=@EventId

		   end

GO
/****** Object:  StoredProcedure [dbo].[EventSurveies_SelectByPK]    Script Date: 1/30/2020 7:50:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[EventSurveies_SelectByPK]
@EventId bigint 
as begin 
select * from EventSurveies where Id=@EventId
end
GO
/****** Object:  StoredProcedure [dbo].[EventSurvey_CheckIfIsInserted]    Script Date: 1/30/2020 7:50:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[EventSurvey_CheckIfIsInserted] 
@EventId bigint
as begin 
select count(*) from EventSurveyQuestionAnswerer where FKEventSurvey_Id=@EventId 

end 
GO
/****** Object:  StoredProcedure [dbo].[EventSurveyQuestionAnswerer_DeleteByEventSurveyId]    Script Date: 1/30/2020 7:50:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[EventSurveyQuestionAnswerer_DeleteByEventSurveyId]
@EventSurveyId bigint
as begin
delete EventSurveyQuestionAnswerer where FKEventSurvey_Id=@EventSurveyId

		   end

GO
/****** Object:  StoredProcedure [dbo].[EventSurveyQuestionAnswerer_Insert]    Script Date: 1/30/2020 7:50:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[EventSurveyQuestionAnswerer_Insert]
@EventSurveyQuestionId bigint,
@Answer nvarchar(max),
@DateTime DateTime,
@SurveyQuestionTypeId int,
@EventSurveyId bigint
as begin
INSERT INTO [dbo].[EventSurveyQuestionAnswerer]
           ([FKEventSurveyQuestion_Id]
           ,Answerer
           ,[DateTime]
           ,[FKSurveyQuestionType_Id]
           ,[FKEventSurvey_Id])
     VALUES
           (@EventSurveyQuestionId,@Answer,@DateTime,@SurveyQuestionTypeId,@EventSurveyId)

		   end

GO
/****** Object:  StoredProcedure [dbo].[EventSurveyQuestions_CheckIfInserted]    Script Date: 1/30/2020 7:50:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[EventSurveyQuestions_CheckIfInserted]
@SurveyQuestionTypeId int 
as begin 
select count(*) from EventSurveyQuestions  where EventSurveyQuestions.IsDefault=1 and FKSurveyQuestionType_Id=@SurveyQuestionTypeId
end
GO
/****** Object:  StoredProcedure [dbo].[EventSurveyQuestions_CheckIfUsed]    Script Date: 1/30/2020 7:50:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[EventSurveyQuestions_CheckIfUsed]
@Id bigint 
as begin

select count(*) from EventSurveyQuestionAnswerer 
where FKEventSurveyQuestion_Id=@Id
end


GO
/****** Object:  StoredProcedure [dbo].[EventSurveyQuestions_Delete]    Script Date: 1/30/2020 7:50:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[EventSurveyQuestions_Delete]
@Id bigint 
as begin

delete [dbo].[EventSurveyQuestions]
		   where Id=@Id
end


GO
/****** Object:  StoredProcedure [dbo].[EventSurveyQuestions_Insert]    Script Date: 1/30/2020 7:50:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[EventSurveyQuestions_Insert]
@Id bigint output,
@IsDefault bit ,
@FKSurveyQuestionType_Id int,
@FKEvent_Id bigint,
@IsActive bit
as begin

INSERT INTO [dbo].[EventSurveyQuestions]
           ([IsDefault]
           ,[FKSurveyQuestionType_Id]
           ,[FKEvent_Id],
		   IsActive)
     VALUES
           (@IsDefault,@FKSurveyQuestionType_Id,@FKEvent_Id,@IsActive)

		   Select @Id=@@IDENTITY
end


GO
/****** Object:  StoredProcedure [dbo].[EventSurveyQuestions_RemoveByEventId]    Script Date: 1/30/2020 7:50:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[EventSurveyQuestions_RemoveByEventId]
@EventId bigint 
as begin 

delete EventSurveyQuestions where FKEvent_Id = @EventId

end
GO
/****** Object:  StoredProcedure [dbo].[EventSurveyQuestions_SelectAll]    Script Date: 1/30/2020 7:50:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[EventSurveyQuestions_SelectAll]
as begin
select EventSurveyQuestions.*,
 Words.Ar as SurveyQuestionNameAr,
 Words.En as SurveyQuestionNameEn
 from EventSurveyQuestions
join EventSurveyQuestionTypes on EventSurveyQuestionTypes.Id = EventSurveyQuestions.FKSurveyQuestionType_Id
join Words on Words.Id=EventSurveyQuestionTypes.FKWord_Id
where IsDefault=1	
end 
GO
/****** Object:  StoredProcedure [dbo].[EventSurveyQuestions_SelectByEventId]    Script Date: 1/30/2020 7:50:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[EventSurveyQuestions_SelectByEventId]
@EventId bigint 
as begin 

select EventSurveyQuestions.Id,
		EventSurveyQuestionTypes.Id as SurveyQuestionTypeId,
		Words.Ar					as SurveyQuestionTypeNameAr,
		Words.En					as SurveyQuestionTypeNameEn,
		EventSurveyQuestionAnswerer.Answerer
		from EventSurveyQuestions

join EventSurveyQuestionTypes on EventSurveyQuestionTypes.Id=EventSurveyQuestions.FKSurveyQuestionType_Id
join Words on Words.Id=EventSurveyQuestionTypes.FKWord_Id

left join EventSurveyQuestionAnswerer on EventSurveyQuestionAnswerer.FKEventSurvey_Id=@EventId and EventSurveyQuestionAnswerer.FKSurveyQuestionType_Id=EventSurveyQuestions.FKSurveyQuestionType_Id

where EventSurveyQuestions.FKEvent_Id=@EventId

end 
GO
/****** Object:  StoredProcedure [dbo].[EventSurveyQuestions_SelectDefault]    Script Date: 1/30/2020 7:50:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[EventSurveyQuestions_SelectDefault]
@IsActive bit
as begin
select EventSurveyQuestions.*,
 Words.Ar as SurveyQuestionNameAr,
 Words.En as SurveyQuestionNameEn
 from EventSurveyQuestions
join EventSurveyQuestionTypes on EventSurveyQuestionTypes.Id = EventSurveyQuestions.FKSurveyQuestionType_Id
join Words on Words.Id=EventSurveyQuestionTypes.FKWord_Id
where IsDefault=1	and (@IsActive is null or IsActive=@IsActive)
end 
GO
/****** Object:  StoredProcedure [dbo].[EventSurveyQuestions_Update]    Script Date: 1/30/2020 7:50:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[EventSurveyQuestions_Update]
@Id bigint ,
@IsDefault bit ,
@IsActive bit
as begin

update [dbo].[EventSurveyQuestions]
          set [IsDefault]=@IsDefault,
		   IsActive=@IsActive
		   where Id=@Id
end


GO
/****** Object:  StoredProcedure [dbo].[EventSurveyQuestions_WithEvent]    Script Date: 1/30/2020 7:50:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[EventSurveyQuestions_WithEvent] 
@EventId bigint 

as begin 

select  distinct 
	EventSurveyQuestionTypes.Id as SurveyQuestionTypeId ,
	@EventId as FKEvent_Id,
	isnull(EventSurveyQuestions.Id,0) as IsSelected,
	Words.Ar as SurveyQuestionTypeAr, 
	Words.En as SurveyQuestionTypeEn

from EventSurveyQuestionTypes
left join EventSurveyQuestions on EventSurveyQuestions.FKSurveyQuestionType_Id=EventSurveyQuestionTypes.Id 
and EventSurveyQuestions.FKEvent_Id=@EventId
join Words on Words.Id=EventSurveyQuestionTypes.FKWord_Id
end
GO
/****** Object:  StoredProcedure [dbo].[EventSurveyQuestionTypes_CheckIfUsed]    Script Date: 1/30/2020 7:50:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
 
CREATE proc [dbo].[EventSurveyQuestionTypes_CheckIfUsed]
@Id int
as begin

select count(*)  from EventSurveyQuestions where FKSurveyQuestionType_Id=@Id
 
end
GO
/****** Object:  StoredProcedure [dbo].[EventSurveyQuestionTypes_Delete]    Script Date: 1/30/2020 7:50:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
 
CREATE proc [dbo].[EventSurveyQuestionTypes_Delete]
@Id int,
@WordId bigint
as begin

delete  EventSurveyQuestionTypes 
where Id=@Id
delete Words where Words.Id =@WordId
 
end
GO
/****** Object:  StoredProcedure [dbo].[EventSurveyQuestionTypes_Insert]    Script Date: 1/30/2020 7:50:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
 
CREATE  proc [dbo].[EventSurveyQuestionTypes_Insert]
@Id int output , 
@NameAr nvarchar(50),
@NameEn nvarchar(50),
@InputType int

as begin
-- Insert Word 
declare @WordId int ;
exec @WordId =   dbo.Words_Insert @NameAr,@NameEn

-- Insert Target
INSERT INTO [dbo].EventSurveyQuestionTypes
           ([FKWord_Id],InputType

           )
     VALUES
           (@WordId,@InputType)

		 select  @Id=@@identity
end


GO
/****** Object:  StoredProcedure [dbo].[EventSurveyQuestionTypes_SelectAll]    Script Date: 1/30/2020 7:50:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[EventSurveyQuestionTypes_SelectAll] 
as begin 

select EventSurveyQuestionTypes.*,
Words.Ar as NameAr,
Words.En as NameEn from EventSurveyQuestionTypes

join Words on Words.Id= EventSurveyQuestionTypes.FKWord_Id

end 
GO
/****** Object:  StoredProcedure [dbo].[EventSurveyQuestionTypes_SelectByFilter]    Script Date: 1/30/2020 7:50:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[EventSurveyQuestionTypes_SelectByFilter] 
@Skip int , 
@Take int 

as begin 

select EventSurveyQuestionTypes.*,
Words.Ar as NameAr,
Words.En as NameEn from EventSurveyQuestionTypes

join Words on Words.Id= EventSurveyQuestionTypes.FKWord_Id

order by Id desc
Offset @skip rows 
Fetch next @Take rows only 
end 
GO
/****** Object:  StoredProcedure [dbo].[EventSurveyQuestionTypes_Update]    Script Date: 1/30/2020 7:50:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE  proc [dbo].[EventSurveyQuestionTypes_Update]
@Id int  , 
@NameAr nvarchar(50),
@NameEn nvarchar(50),
@WordId bigint,
@InputType int

as begin
-- Update Word 
exec dbo.Words_Update @WordId, @NameAr,@NameEn

-- Update Target
update EventSurveyQuestionTypes
set InputType=@InputType
where Id=@Id
end


GO
/****** Object:  StoredProcedure [dbo].[EventTaskStatusHistories_CheckIfTaskFinshedWithBranch]    Script Date: 1/30/2020 7:50:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

 CREATE proc 
 [dbo].[EventTaskStatusHistories_CheckIfTaskFinshedWithBranch] 
 --24,5,5,0
 @EventId bigint,
 @BranchId int,
 @WorkTypeId int,
 @ForIsCurrentBranch bit
 as
 begin
 select isnull((
 select top 1 IsFinshed from EventTaskStatusHistories 
 where 
   FKEvent_Id=@EventId 
 and FKWorkType_Id=@WorkTypeId 
 and (@ForIsCurrentBranch =1 or FKBranch_Id!=@BranchId)
 and (@ForIsCurrentBranch =0 or FKBranch_Id=@BranchId)
 order by EventTaskStatusHistories.Id desc
 ),0)

 
 end
GO
/****** Object:  StoredProcedure [dbo].[EventTaskStatusHistories_Insert]    Script Date: 1/30/2020 7:50:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[EventTaskStatusHistories_Insert]
@IsFinshed bit,
@DateTime datetime,
@FKEvent_Id bigint,
@FKWorkType_Id int,
@FKUsre_Id  bigint,
@FKAccountType_Id int,
@BranchId int
as begin
INSERT INTO [dbo].EventTaskStatusHistories
           ([IsFinshed]
           ,[DateTime]
           ,[FKEvent_Id]
           ,[FKWorkType_Id]
           ,[FKUsre_Id]
           ,[FKAccountType_Id],
		   FKBranch_Id)
     VALUES
          (@IsFinshed ,
@DateTime ,
@FKEvent_Id ,
@FKWorkType_Id ,
@FKUsre_Id  ,
@FKAccountType_Id,
@BranchId)
end


GO
/****** Object:  StoredProcedure [dbo].[EventTaskStatusHistories_SelectByEventId]    Script Date: 1/30/2020 7:50:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[EventTaskStatusHistories_SelectByEventId]
@eventId bigint
as begin 

select EventTaskStatusHistories.*,Users.FullName,
Word.Ar	as AccountTypeAr,
Word.En	as AccountTypeEn 
from EventTaskStatusHistories 
join Users on
Users.Id=EventTaskStatusHistories.FKUsre_Id

join AccountTypes on AccountTypes.Id=Users.FKAccountType_Id
join Words as Word on Word.Id=AccountTypes.FkWord_Id
where FKEvent_Id=@eventId

end 
GO
/****** Object:  StoredProcedure [dbo].[EventTaskStatusHistories_SelectLast]    Script Date: 1/30/2020 7:50:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[EventTaskStatusHistories_SelectLast]
@eventId bigint,
@WorkTypeId int
as begin 

select top 1 EventTaskStatusHistories.*,Users.UserName
from EventTaskStatusHistories 
join Users on
Users.Id=EventTaskStatusHistories.FKUsre_Id

where FKEvent_Id=@eventId and EventTaskStatusHistories.FKWorkType_Id=@WorkTypeId 

order by EventTaskStatusHistories.Id desc
end 
GO
/****** Object:  StoredProcedure [dbo].[EventTaskStatusIsFinsed_CheckIfFinshed]    Script Date: 1/30/2020 7:50:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[EventTaskStatusIsFinsed_CheckIfFinshed] 
@eventId bigint,
@workTypeId int
as begin
/* Works Types
	Booking                =1  , DataPerfection         =2  ,
	Coordination           =3  , Implementation         =4  ,
	ArchivingAndSaveing    =5  , ProductProcessing      =6  ,
	Chooseing              =7  , DigitalProcessing      =8  ,
	PreparingForPrinting   =9  , Manufacturing          =10 ,
	QualityAndReview       =11 , Packaging              =12 ,
	TransmissionAndDelivery=13 , Archiving              =14 ,*/
	select ISNULL(dbo.[EventTaskStatusIsFinsed_CheckIfFinshedFun](@eventId,@workTypeId),0) 
	end
GO
/****** Object:  StoredProcedure [dbo].[EventTaskStatusIsFinshed_Update]    Script Date: 1/30/2020 7:50:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[EventTaskStatusIsFinshed_Update]
@EventId bigint,
@IsFinshed bit,
@WorkTypeId int
as begin 
	/* Works Types
	Booking                =1  , DataPerfection         =2  ,
	Coordination           =3  , Implementation         =4  ,
	ArchivingAndSaveing    =5  , ProcessingProducts      =6  ,
	Choosing              =7  , DigitalProcessing      =8  ,
	PreparingForPrinting   =9  , Manufacturing          =10 ,
	QualityAndReview       =11 , Packaging              =12 ,
	TransmissionAndDelivery=13 , Archiving              =14 ,*/

if(@WorkTypeId = 1)       UPDATE EventTaskStatusIsFinshed set Booking=@IsFinshed where EventId=@EventId
else if(@WorkTypeId = 2)  UPDATE EventTaskStatusIsFinshed set DataPerfection=@IsFinshed where EventId=@EventId
else if(@WorkTypeId = 3)  UPDATE EventTaskStatusIsFinshed set Coordination=@IsFinshed where EventId=@EventId
else if(@WorkTypeId = 4)  UPDATE EventTaskStatusIsFinshed set Implementation=@IsFinshed where EventId=@EventId
else if(@WorkTypeId = 5)  UPDATE EventTaskStatusIsFinshed set ArchivingAndSaveing=@IsFinshed where EventId=@EventId
else if(@WorkTypeId = 6)  UPDATE EventTaskStatusIsFinshed set ProcessingProducts=@IsFinshed where EventId=@EventId
else if(@WorkTypeId = 7)  UPDATE EventTaskStatusIsFinshed set Choosing=@IsFinshed where EventId=@EventId
else if(@WorkTypeId = 8)  UPDATE EventTaskStatusIsFinshed set DigitalProcessing=@IsFinshed where EventId=@EventId
else if(@WorkTypeId = 9)  UPDATE EventTaskStatusIsFinshed set PreparingForPrinting=@IsFinshed where EventId=@EventId
else if(@WorkTypeId = 10) UPDATE EventTaskStatusIsFinshed set Manufacturing=@IsFinshed where EventId=@EventId
else if(@WorkTypeId = 11) UPDATE EventTaskStatusIsFinshed set QualityAndReview=@IsFinshed where EventId=@EventId
else if(@WorkTypeId = 12) UPDATE EventTaskStatusIsFinshed set Packaging=@IsFinshed where EventId=@EventId
else if(@WorkTypeId = 13) UPDATE EventTaskStatusIsFinshed set TransmissionAndDelivery=@IsFinshed where EventId=@EventId
else if(@WorkTypeId = 14) UPDATE EventTaskStatusIsFinshed set Archiving=@IsFinshed where EventId=@EventId

end
GO
/****** Object:  StoredProcedure [dbo].[FilesReceivedTypes_CheckIfUsed]    Script Date: 1/30/2020 7:50:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[FilesReceivedTypes_CheckIfUsed] 
@Id bigint
as begin

-- فيما بعد سوف نربط هذة
select 0 
 
end
GO
/****** Object:  StoredProcedure [dbo].[FilesReceivedTypes_Delete]    Script Date: 1/30/2020 7:50:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[FilesReceivedTypes_Delete]
@Id bigint,
@WordId bigint
as begin
delete  FilesReceivedTypes where Id=@Id
delete Words where Words.Id =@WordId
 
end
GO
/****** Object:  StoredProcedure [dbo].[FilesReceivedTypes_Insert]    Script Date: 1/30/2020 7:50:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
 
create  proc [dbo].[FilesReceivedTypes_Insert]
@Id int output , 
@NameAr nvarchar(50),
@NameEn nvarchar(50)

as begin
-- Insert Word 
declare @WordId int ;
exec @WordId =   dbo.Words_Insert @NameAr,@NameEn

-- Insert Target
INSERT INTO [dbo].[FilesReceivedTypes]
           ([FKWord_Id]
           )
     VALUES
           (@WordId)

		 select  @Id=@@identity
end


GO
/****** Object:  StoredProcedure [dbo].[FilesReceivedTypes_SelectAll]    Script Date: 1/30/2020 7:50:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[FilesReceivedTypes_SelectAll] 
as begin 

select FilesReceivedTypes.*,
Words.Ar as NameAr,
Words.En as NameEn from FilesReceivedTypes

join Words on Words.Id= FilesReceivedTypes.FKWord_Id

end 
GO
/****** Object:  StoredProcedure [dbo].[FilesReceivedTypes_SelectByFilter]    Script Date: 1/30/2020 7:50:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[FilesReceivedTypes_SelectByFilter] 
@Skip int , 
@Take int 

as begin 

select FilesReceivedTypes.*,
Words.Ar as NameAr,
Words.En as NameEn from FilesReceivedTypes

join Words on Words.Id= FilesReceivedTypes.FKWord_Id

order by Id desc
Offset @skip rows 
Fetch next @Take rows only 
end 
GO
/****** Object:  StoredProcedure [dbo].[FilesReceivedTypes_Update]    Script Date: 1/30/2020 7:50:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create  proc [dbo].[FilesReceivedTypes_Update]
@Id int  , 
@NameAr nvarchar(50),
@NameEn nvarchar(50),
@WordId bigint

as begin
-- Update Word 
exec dbo.Words_Update @WordId, @NameAr,@NameEn

-- Update Target
 
end


GO
/****** Object:  StoredProcedure [dbo].[Menus_SelectAll]    Script Date: 1/30/2020 7:50:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[Menus_SelectAll]

as begin
 select 
		Menus.*,
		Words.Ar as MenuNameAr,
		Words.En as MenuNameEn

		from Menus 
 join Words on Words.Id=Menus.FKWord_Id

 order by Menus.OrderByNumber 
 end
GO
/****** Object:  StoredProcedure [dbo].[Menus_SelectAllByUser_Id]    Script Date: 1/30/2020 7:50:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[Menus_SelectAllByUser_Id]
@UserId bigint
as begin
 select 
 Menus.*,
		Words.Ar as MenuNameAr,
		Words.En as MenuNameEn,
		PageWord.Ar as PageNameAr,
		PageWord.En as PageNameEn
 from Menus 

 join Pages 
 on Pages.FkMenu_Id=Menus.Id 

 join Words on Words.Id=Menus.FKWord_Id
 join PageWord as PageWord on PageWord.Id=Pages.FKWord_Id

 join UsersPrivileges 
 on (@UserId is null or UsersPrivileges.FkEmployee_Id=@UserId	 	 )
 and UsersPrivileges.FkPage_Id=Pages.Id

 order by Menus.OrderByNumber 
 end
GO
/****** Object:  StoredProcedure [dbo].[Menus_SelectAllForUserCanBeAccess]    Script Date: 1/30/2020 7:50:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[Menus_SelectAllForUserCanBeAccess]	 
 
@UserId bigint ,
@IsPublicMenus bit

as begin
--نتحقق اذا كان يريد القوءم التى بها لـ المستخدم العادى نقوم بجلبها مباشرة اذا بها صفح ولا يوجد هنا تحققات لان المستخدم العادى ليس له صلاحيات وله صفح خاصة بة 
if(@IsPublicMenus =1 )
select distinct Menus.*,
		Words.Ar as MenuNameAr,
		Words.En as		MenuNameEn from Menus 

 join Words on Words.Id=Menus.FKWord_Id 
 join Pages on Pages.FkMenu_Id=Menus.Id 
 where Pages.IsForClient=1 and Pages.IsHide=0

		order by Menus.OrderByNumber
--**********************************************************
--**********************************************************
else if(@UserId is null or @UserId =0 )
 select Menus.*,
		Words.Ar as MenuNameAr,
		Words.En as		MenuNameEn from Menus 
 join Words on Words.Id=Menus.FKWord_Id

		order by Menus.OrderByNumber 

 else
--**********************************************************
--**********************************************************
 -- جلب كل القوائم التى يمكن المستخدم الوصول اليها بشكل مباشر
  select 
		Menus.*,
		Words.Ar as MenuNameAr,
		Words.En as		MenuNameEn
		from Menus 

 join Pages on Pages.FkMenu_Id=Menus.Id 
 join Words on Words.Id=Menus.FKWord_Id
 join UserPrivileges on UserPrivileges.FkUser_Id=@UserId 
 and UserPrivileges.FkPage_Id=Pages.Id 
 where     Pages.IsHide=0

 union 
 -- جلب كل القوائم الرئيسية بناء ع القوائم الفرعية المسموح لها بـ الظهور
  select 
		Parent.*,
  		Words.Ar as MenuNameAr,
		Words.En as	MenuNameEn
		from Menus 

 join Menus as Parent on Parent.Id=Menus.Parent_Id 
 join Pages on Pages.FkMenu_Id=Menus.Id 
 join Words on Words.Id=Parent.FKWord_Id
 join UserPrivileges on UserPrivileges.FkUser_Id=@UserId 
      and UserPrivileges.FkPage_Id=Pages.Id

where 
 Menus.Parent_Id is not null   
 and Pages.IsHide=0

 order by Menus.OrderByNumber 
 end
GO
/****** Object:  StoredProcedure [dbo].[Notifications_Insert]    Script Date: 1/30/2020 7:50:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE proc [dbo].[Notifications_Insert]
	@Id bigint output,
	@DateTime datetime,
	@TargetId bigint,
	@PageId bigint,
	@UserId bigint,
	@NameAr nvarchar(max),
	@NameEn nvarchar(max),
	@DescriptionAr nvarchar(max),
	@DescriptionEn nvarchar(max),
	@RedirectUrl nvarchar(max),
	@UserTargrtId bigint
as begin
declare @WordId bigint,
@WordDescriptionId bigint

exec @WordId = Words_Insert @NameAr,@NameEn;
exec @WordDescriptionId = Words_Insert @DescriptionAr,@DescriptionEn;

INSERT INTO [dbo].[Notifications]
           ([DateTime],[Target_Id],[FKPage_Id],[FKUser_Id],[FkWord_Id],[FKDescriptionWord_Id],RedirectUrl)
     VALUES (@DateTime,@TargetId,@PageId,@UserId,@WordId,@WordDescriptionId,@RedirectUrl)

select @id=@@IDENTITY
	 exec NotificationsUser_Insert @id,@UserTargrtId

end

GO
/****** Object:  StoredProcedure [dbo].[Notifications_SelectByFilter]    Script Date: 1/30/2020 7:50:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[Notifications_SelectByFilter]
--Paging
@Skip int  ,
@Take int , 
--Filter
@PagedId int , 
@IsRead bit ,
@CuurentUserLoggadId bigint
as begin
declare @NotificationsCount int = dbo.GetNotificationsCountIsNotRead(@CuurentUserLoggadId)
select Notifications.* ,
TitleWord.Ar as TitleAr,
TitleWord.En as TitleEn,
DescWord.Ar as DescriptionAr,
DescWord.En as DescriptionEn,
@NotificationsCount as NotificationsCount,
NotificationsUser.IsRead
from NotificationsUser  
	join Notifications on Notifications.Id=NotificationsUser.FKNotify_Id
	join Words as  TitleWord on TitleWord.Id=Notifications.FkWord_Id
	join Words  as DescWord on DescWord.Id=Notifications.FKDescriptionWord_Id

where 
NotificationsUser.FKUser_Id=@CuurentUserLoggadId 
and 
(@PagedId is null or Notifications.FKPage_Id=@PagedId)
and 
(@IsRead is null or NotificationsUser.IsRead=@IsRead)

order by Notifications.Id desc
offset @Skip Rows
Fetch Next @Take Rows Only
end 
GO
/****** Object:  StoredProcedure [dbo].[NotificationsUser_Insert]    Script Date: 1/30/2020 7:50:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[NotificationsUser_Insert]
@NotifyId bigint ,
@UserId bigint
as begin
INSERT INTO [dbo].[NotificationsUser]
           ([FKNotify_Id]
           ,[FKUser_Id]
           ,[IsRead])
     VALUES
           (@NotifyId,@UserId,0)
end

GO
/****** Object:  StoredProcedure [dbo].[NotificationsUser_Read]    Script Date: 1/30/2020 7:50:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[NotificationsUser_Read] 
@NotifyId bigint , 
@UserId	bigint
as begin

update NotificationsUser 
set IsRead=1
where FKNotify_Id=@NotifyId and FKUser_Id=@UserId

end
GO
/****** Object:  StoredProcedure [dbo].[Package_CheckIfUsed]    Script Date: 1/30/2020 7:50:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[Package_CheckIfUsed] 
@Id int
as begin

select 
isnull(count(*),0)  from Events where FKPackage_Id=@Id
 
end
GO
/****** Object:  StoredProcedure [dbo].[PackageDetails_Delete]    Script Date: 1/30/2020 7:50:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[PackageDetails_Delete]
@Id int 

as begin
delete PackageDetails where Id=@Id
end 
GO
/****** Object:  StoredProcedure [dbo].[PackageDetails_DeleteAllByPackageId]    Script Date: 1/30/2020 7:50:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[PackageDetails_DeleteAllByPackageId]
@PackageId int 

as begin
delete PackageDetails where FKPackage_Id=@PackageId
end 
GO
/****** Object:  StoredProcedure [dbo].[PackageDetails_Insert]    Script Date: 1/30/2020 7:50:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[PackageDetails_Insert]
@Id int output,
@Package_Id int , 
@ValueAr nvarchar(max),
@ValueEn nvarchar(max),
@StaticFieldId int 
as begin
declare @WordId int ;
exec @WordId =   dbo.Words_Insert @ValueAr,@ValueEn
INSERT INTO [dbo].[PackageDetails]
           ([FKWord_Id]
           ,[FKStaticField_Id]
           ,[FKPackage_Id])
     VALUES
           (@WordId,@StaticFieldId,@Package_Id)
		   select @Id=@@IDENTITY
end 
GO
/****** Object:  StoredProcedure [dbo].[Packages_Delete]    Script Date: 1/30/2020 7:50:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[Packages_Delete]
@Id int ,
@WordNameId bigint,
@WordDescriptionId bigint
as begin

delete Packages where Id=@Id
 exec dbo.Words_Delete  @WordNameId
 exec dbo.Words_Delete  @WordDescriptionId



end


GO
/****** Object:  StoredProcedure [dbo].[Packages_Insert]    Script Date: 1/30/2020 7:50:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[Packages_Insert]
@Id int output,
@NameAr nvarchar(50),
@NameEn nvarchar(50),
@DescriptionAr nvarchar(50),
@DescriptionEn nvarchar(50),
@IsPrintNamesFree bit,
@AlbumTypeId int,
@Price decimal(18,2),
@NamsArExtraPrice decimal(18,2)

as begin
declare @WordNameId bigint, 
@WordDescriptionId bigint;
exec @WordNameId =   dbo.Words_Insert @NameAr,@NameEn
exec @WordDescriptionId =   dbo.Words_Insert @DescriptionAr,@DescriptionEn


INSERT INTO [dbo].[Packages]
           ([FkWordName_Id]
           ,IsPrintNamesFree
           ,[FkWordDescription_Id]
           ,[FKAlbumType_Id],Price,NamsArExtraPrice
            )
     VALUES
           (@WordNameId,@IsPrintNamesFree,@WordDescriptionId,
		   @AlbumTypeId,@Price,@NamsArExtraPrice)


		   select * from Packages where Id= @@IDENTITY
end


GO
/****** Object:  StoredProcedure [dbo].[Packages_SelectAll]    Script Date: 1/30/2020 7:50:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
 
CREATE proc [dbo].[Packages_SelectAll] 

as begin 

select Packages.*,
Words.Ar as NameAr,
Words.En as NameEn from Packages

join Words on Words.Id= Packages.FKWordName_Id

order by Id desc
end 
GO
/****** Object:  StoredProcedure [dbo].[Packages_SelectByPaging]    Script Date: 1/30/2020 7:50:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[Packages_SelectByPaging] 
--Paging
@Skip int , 
@Take int 
as begin 

select Packages.*,
WordName.Ar as NameAr,
WordName.En as NameEn ,
WordDescription.Ar as DescriptionAr,
WordDescription.En as DescriptionEn

from Packages
join Words as WordName on WordName.Id= Packages.FKWordName_Id
join Words  as WordDescription on WordDescription.Id= Packages.FkWordDescription_Id

order by Id desc
Offset @Skip rows
Fetch next @Take rows only
end 
GO
/****** Object:  StoredProcedure [dbo].[Packages_SelectByPK]    Script Date: 1/30/2020 7:50:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
 
CREATE proc [dbo].[Packages_SelectByPK]  
@Id int
as begin 

select Packages.*,
	WordName.Ar as NameAr,
	WordName.En as NameEn ,
	WordDescription.Ar as DescriptionAr,
	WordDescription.En as DescriptionEn,
	PackageDetails.Id as PackageDetailsId,
	WordPackageDetail.Ar as PackageDetailValueAr ,
	WordPackageDetail.En as PackageDetailValueEn ,
	PackageDetails.FKStaticField_Id as FKStaticField_Id ,
	WordPackageInputType.Ar as PackageInputTypeAr,
	WordPackageInputType.En as PackageInputTypeEn,
              WordAlbumTypes.Ar as   AlbumType_NameAr,
              WordAlbumTypes.En as   AlbumType_NameEn
from Packages

join Words as WordName on WordName.Id= Packages.FKWordName_Id
join Words as WordDescription on WordDescription.Id= Packages.FkWordDescription_Id
left join PackageDetails on PackageDetails.FKPackage_Id=Packages.Id
left join StaticFields on StaticFields.Id=PackageDetails.FKStaticField_Id
left join Words as WordPackageInputType on WordPackageInputType.Id= StaticFields.FKWord_Id
left join Words as WordPackageDetail on WordPackageDetail.Id= PackageDetails.FKWord_Id


left join Albums on Albums.Id=Packages.FKAlbumType_Id
left join Words as WordAlbumTypes on WordAlbumTypes.Id= Albums.FKWord_Id
where Packages.Id=@Id
end 
GO
/****** Object:  StoredProcedure [dbo].[Packages_Update]    Script Date: 1/30/2020 7:50:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[Packages_Update]
@Id int ,
@NameAr nvarchar(50),
@NameEn nvarchar(50),
@DescriptionAr nvarchar(50),
@DescriptionEn nvarchar(50),
@IsPrintNamesFree bit,
@AlbumTypeId int,
@WordNameId bigint,
@WordDescriptionId bigint,

@Price decimal(18,2),
@NamsArExtraPrice decimal(18,2)
as begin

 exec dbo.Words_Update @WordNameId,@NameAr,@NameEn
 exec dbo.Words_Update @WordDescriptionId,@DescriptionAr,@DescriptionEn


update [Packages]
          set 
           IsPrintNamesFree=@IsPrintNamesFree
           ,[FKAlbumType_Id]=@AlbumTypeId,
		   Price =@Price ,
		   NamsArExtraPrice=@NamsArExtraPrice

where Id=@Id
end


GO
/****** Object:  StoredProcedure [dbo].[Pages_SelectAllByUser_Id]    Script Date: 1/30/2020 7:50:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[Pages_SelectAllByUser_Id]
@UserId bigint
as begin
 select Pages.*,
 PageWord.Ar as PageNameAr,
		PageWord.En as PageNameEn
		from  Pages 
 join PageWord as PageWord on PageWord.Id=Pages.FKWord_Id

 join UserPrivileges 
 on (@UserId is null or UserPrivileges.FkUser_Id=@UserId	 	 )
 and UserPrivileges.FkPage_Id=Pages.Id

 end
GO
/****** Object:  StoredProcedure [dbo].[Pages_SelectAllForUserCanBeAccess]    Script Date: 1/30/2020 7:50:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc  [dbo].[Pages_SelectAllForUserCanBeAccess]
   @UserId bigint,
@IsPublicMenus bit
as begin 
--نتحقق اذا كان يريد الصفح التى بها لـ المستخدم العادى نقوم بجلبها مباشرة  ولا يوجد هنا تحققات لان المستخدم العادى ليس له صلاحيات وله صفح خاصة بة 
if(@IsPublicMenus =1 )
select 
Pages.*,
	PageWord.Ar as PageNameAr,
	PageWord.En as PageNameEn
	
from Pages 
 join Words as PageWord on PageWord.Id=Pages.FKWord_Id
 where Pages.IsForClient=1 
 and pages.IsHide!=1

order by Pages.OrderByNumber

else if(@UserId is null or @userId=0)
select 
	Pages.*,
	PageWord.Ar as PageNameAr,
	PageWord.En as PageNameEn
	
from Pages 
 join Words as PageWord on PageWord.Id=Pages.FKWord_Id
 where Pages.IsForAdmin=1
 and pages.IsHide!=1

order by Pages.OrderByNumber

else 
select 
	Pages.*,
	PageWord.Ar as PageNameAr,
	PageWord.En as PageNameEn
	
from Pages 

 join Words as PageWord on PageWord.Id=Pages.FKWord_Id
 join UserPrivileges on UserPrivileges.FkUser_Id=@UserId 
 and UserPrivileges.FkPage_Id=Pages.Id
 where Pages.IsForAdmin=1
 and pages.IsHide!=1
order by Pages.OrderByNumber
 end
GO
/****** Object:  StoredProcedure [dbo].[Phot_OrderPayments_Accept]    Script Date: 1/30/2020 7:50:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[Phot_OrderPayments_Accept]
@Id bigint ,
@OrderId bigint ,
@IsAcceptFromManger bit,
@Notes  nvarchar(max)
as begin

	update Phot_OrderPayments 
	set IsAcceptFromManger=@IsAcceptFromManger,-- وذالك لان العملية مممن ان ترفض 
	AcceptNotes=@Notes,
	AcceptDateTime=GETDATE()
	where Id=@Id and FkOrder_Id=@OrderId

end 
GO
/****** Object:  StoredProcedure [dbo].[Phot_OrderPayments_Insert]    Script Date: 1/30/2020 7:50:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[Phot_OrderPayments_Insert]
@OrderId bigint,
@Amount decimal,
@TransferImage	nvarchar(max),
@IsBankTransfer bit ,
@UserId	bigint
as begin

declare @Id bigint =(select isnull(max(Id),0)+1 from Phot_OrderPayments);

insert Phot_OrderPayments (Id,FkOrder_Id,PaymentDateTime,IsBankTransfer,FKUserCreated_Id,Amount,TransferImage)
values(@Id,@OrderId,GetDate(),@IsBankTransfer,@UserId,@Amount,@TransferImage)

select @Id
end 
GO
/****** Object:  StoredProcedure [dbo].[Phot_OrderPayments_SelectByOrderId]    Script Date: 1/30/2020 7:50:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[Phot_OrderPayments_SelectByOrderId]
@OrderId bigint
as begin
select * from Phot_OrderPayments where FkOrder_Id=@OrderId order by Id desc
end 
GO
/****** Object:  StoredProcedure [dbo].[Phot_Orders_Cancel]    Script Date: 1/30/2020 7:50:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[Phot_Orders_Cancel] 
@id bigint ,
@CurretnUserId bigint
as begin 

update Phot_Orders 
set IsActive=0,
DateTimeCancel=GetDate(),
FkUserCancel_Id=@CurretnUserId
where Id=@id


end
GO
/****** Object:  StoredProcedure [dbo].[Phot_Orders_CheckIfCancled]    Script Date: 1/30/2020 7:50:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[Phot_Orders_CheckIfCancled] 
@OrderId bigint 
as begin

select IsActive from Phot_Orders where Id=@OrderId

end
GO
/****** Object:  StoredProcedure [dbo].[Phot_Orders_Insert]    Script Date: 1/30/2020 7:50:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE proc [dbo].[Phot_Orders_Insert]-- 3,2,30061,N'3:8,'
@ProductTypeId bigint,
@ProductId bigint , 
@UserCreated bigint,
@OptionsItems nvarchar(max),--Pass As OptionId:ItemId,OptionId:ItemId,OptionId:ItemId
@Delivery_IsReceiptFromTheBranch bit,
@Delivery_Address nvarchar(max),
@Delivery_FkCountry_Id int ,
@Delivery_FKCity_Id int 
as begin 
--Insert Order
declare @Id bigint =(select isnull(max(Id),0)+1 from Phot_Orders);
insert Phot_Orders(Id ,FKProductType_Id,FKProduct_Id,CreateDateTime ,FKUserCreated,Delivery_IsReceiptFromTheBranch,Delivery_Address,Delivery_FkCountry_Id,Delivery_FKCity_Id)
values (@Id,@ProductTypeId,@ProductId,GetDate(),@UserCreated,
@Delivery_IsReceiptFromTheBranch,@Delivery_Address,@Delivery_FkCountry_Id,@Delivery_FKCity_Id)

--Insert Order Options
if (select Len(@OptionsItems))>0
begin 
	declare @Options table (num int , optionAndItemId nvarchar(max));
	insert @Options select ROW_NUMBER() over (order by (select null)) , value from string_split(@OptionsItems,',') where value is not null and value!='';
	declare @OptionCount int =(select count(*) from @Options),
	@OptionAndItemTarger nvarchar(max);
	while @OptionCount > 0 
	begin 
	set @OptionAndItemTarger =(select top 1 optionAndItemId from @Options where num=@OptionCount);
		--Insert Now
		exec Phot_OrdersOptions_Insert @Id,@OptionAndItemTarger 
		set @OptionCount=@OptionCount-1
	end
end


select @Id

end 
GO
/****** Object:  StoredProcedure [dbo].[Phot_Orders_SelectByFilter]    Script Date: 1/30/2020 7:50:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[Phot_Orders_SelectByFilter]
@Skip int ,
@Take int , 
@UserId bigint 
as begin 

select 
oph.*,
ptword.Ar as ProductTypeNameAr ,
ptword.En as ProductTypeNameEn,
pword.Ar as ProductNameAr ,
pword.En as ProductNameEn,
UserCreated.UserName as UserCreated_UserName,
UserCreated.FullName as UserCreated_FullName

from Phot_Orders oph

join Phot_ProductTypes pt on pt.Id=oph.FKProductType_Id
join Phot_Products p on p.Id=oph.FKProduct_Id

join words ptword on ptword.Id=pt.FKWord_Name_Id
join words pword on pword.Id=p.FKWord_Name_Id

join Users UserCreated on UserCreated.Id=oph.FKUserCreated

where 
oph.FKUserCreated=@UserId

order by oph.Id desc 
offset @Skip rows
fetch next @Take rows only
end
GO
/****** Object:  StoredProcedure [dbo].[Phot_Orders_SelectByFilterV2]    Script Date: 1/30/2020 7:50:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
 
CREATE proc [dbo].[Phot_Orders_SelectByFilterV2]
@Skip int ,
@Take int , 
@productTypeId int,
@productId bigint,
@userCreatedId bigint,
@createDateFrom datetime,
@createDateTo datetime,
@isActive bit
as begin 

select 
ord.*,
ptword.Ar as ProductTypeNameAr ,
ptword.En as ProductTypeNameEn,
pword.Ar as ProductNameAr ,
pword.En as ProductNameEn,
UserCreated.UserName as UserCreated_UserName,
UserCreated.FullName as UserCreated_FullName,
UserCancled.UserName as UserCancled_UserName,
UserCancled.FullName as UserCancled_FullName


from Phot_Orders ord

join Phot_ProductTypes pt on pt.Id=ord.FKProductType_Id
join Phot_Products p on p.Id=ord.FKProduct_Id

join words ptword on ptword.Id=pt.FKWord_Name_Id
join words pword on pword.Id=p.FKWord_Name_Id

join Users UserCreated on UserCreated.Id=ord.FKUserCreated
left join Users UserCancled on UserCancled.Id=ord.FkUserCancel_Id

where 
	(@productTypeId	 is null or ord.FKProductType_Id=@productTypeId	 )	 
and (@productId		 is null or ord.FKProduct_Id=@productId		 )	 
and (@userCreatedId	 is null or ord.FKUserCreated=@userCreatedId	 )	 
and (@createDateFrom is null or cast(ord.CreateDateTime as date)>=cast(@createDateFrom as date))	 
and (@createDateTo	 is null or cast(ord.CreateDateTime as date)<=cast(@createDateTo	as date)	 )	 
and (@isActive		 is null or ord.IsActive=@isActive		 )	 





order by ord.Id desc 
offset @Skip rows
fetch next @Take rows only
end
GO
/****** Object:  StoredProcedure [dbo].[Phot_Orders_SelectById]    Script Date: 1/30/2020 7:50:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[Phot_Orders_SelectById] --3
@Id bigint
as begin 
select 
oph.*,	
op.FKProdutOption_Id,
op.FKProductOptionItem_Id,

ptw.Ar as ProductTypeNameAr,
ptw.En as ProductTypeNameEn,
pt.ImageUrl as ProductTypeImage,
UserCreated.UserName as UserCreated_UserName,
UserCreated.FullName as UserCreated_FullName

from Phot_Orders oph
join Users UserCreated on UserCreated.Id=oph.FKUserCreated 
join Phot_OrdersOptions op on op.FKOrder_Id= oph.Id 
join Phot_ProductTypes pt on pt.Id= oph.FKProductType_Id 
join Words  ptw on ptw.Id= pt.FKWord_Name_Id
where oph.Id=@Id


end
GO
/****** Object:  StoredProcedure [dbo].[Phot_Orders_SelectFullDetailsById]    Script Date: 1/30/2020 7:50:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[Phot_Orders_SelectFullDetailsById] --6
@Id bigint
as begin 
select 
oph.*,	


ptw.Ar as ProductTypeNameAr,
ptw.En as ProductTypeNameEn,
pt.ImageUrl as ProductTypeImage,
UserCreated.UserName as UserCreated_UserName,
UserCreated.FullName as UserCreated_FullName,

optionWord.Ar   as OptionNameAr,
optionWord.En   as OptionNameEn,
optionItemWord.Ar  as OptionItemValueAr,
optionItemWord.En  as OptionItemValueEn,

countryWord.Ar as Delivery_CountryNameAr,
countryWord.Ar as Delivery_CountryNameEn,
cityWord.Ar	   as Delivery_CityNameAr,
cityWord.Ar	   as Delivery_CityNameEn


from Phot_Orders oph
join Users UserCreated on UserCreated.Id=oph.FKUserCreated 

join Phot_OrdersOptions op on op.FKOrder_Id= oph.Id 
join Phot_ProductsOptions pOption on pOption.Id=op.FKProdutOption_Id 
join StaticFields staticField on staticField.Id= pOption.FKStaticField_Id 
join Words  optionWord on optionWord.Id= staticField.FKWord_Id

join Phot_ProductsOptionsItems pOptionItem on pOptionItem.Id=op.FKProductOptionItem_Id and pOptionItem.FKProductOption_Id=pOption.Id 
join Words  optionItemWord on optionItemWord.Id= pOptionItem.FKWord_Value_Id

join Phot_ProductTypes pt on pt.Id= oph.FKProductType_Id 
join Words  ptw on ptw.Id= pt.FKWord_Name_Id


left join Countries on Countries.Id=oph.Delivery_FkCountry_Id
left join Words  countryWord on countryWord.Id= Countries.FKWord_Id
left join Cities on Cities.Id=oph.Delivery_FKCity_Id
left join Words  cityWord on cityWord.Id= Cities.FKWord_Id


where oph.Id=@Id


end
GO
/****** Object:  StoredProcedure [dbo].[Phot_Orders_UpdateDropboxFolderPath]    Script Date: 1/30/2020 7:50:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[Phot_Orders_UpdateDropboxFolderPath]
@OrderId bigint ,
@DropboxFolderPath nvarchar(max)
as begin

update Phot_Orders 
set DropboxFolderPath=@DropboxFolderPath
where Id=@OrderId

end
GO
/****** Object:  StoredProcedure [dbo].[Phot_OrderServicePrices_Insert]    Script Date: 1/30/2020 7:50:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--create table  Phot_OrderServicePrices 
--(
--	Id bigint primary key,
--	FkOrder_Id bigint ,
--	FkUser_Id bigint  ,
--	FKWord_Id bigint , 
--	Price decimal(18,2),
--	CreateDateTime DateTime
--)

CREATE proc [dbo].[Phot_OrderServicePrices_Insert]
@OrderId bigint ,  
@UserId bigint, 
@WordAndPricesJson nvarchar(max)
    --'{
    --  "Prices": [
    --    {
    --      "Price"  : "iPhone",
    --      "WordId": "0123-4567-8888"
    --    },
    --  ]
    --}'
as begin
declare @Prices table (Num int , Price decimal(18,2),WordId bigint,IsProcessed bit );
declare @Id bigint ,@PriceRowNumber int ;
insert @Prices
    SELECT ROW_NUMBER()over(order by (select null)), Price, WordId,0
    FROM OPENJSON( @WordAndPricesJson, '$' ) 
    WITH (Price decimal(18,2) '$.Price', WordId NVARCHAR(25) '$.WordId');

	while (select count(*) from @Prices where IsProcessed=0)>0
	begin

	set @Id=(select isnull(max(Id),0)+1 from Phot_OrderServicePrices where FkOrder_Id=@OrderId and FkUser_Id=@UserId);
	set @PriceRowNumber=(select top 1 Num  from @Prices where IsProcessed=0);
	
	--Insert Nnow
	insert Phot_OrderServicePrices select @Id,@OrderId,@UserId,WordId,Price,GETDATE() from @Prices where Num=@PriceRowNumber

	--Update Is Processd = true 
	update @Prices set IsProcessed=1 where Num=@PriceRowNumber
	  
	end

end
GO
/****** Object:  StoredProcedure [dbo].[Phot_OrderServicePrices_InsertCustom]    Script Date: 1/30/2020 7:50:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--create table  Phot_OrderServicePrices 
--(
--	Id bigint primary key,
--	FkOrder_Id bigint ,
--	FkUser_Id bigint  ,
--	FKWord_Id bigint , 
--	Price decimal(18,2),
--	CreateDateTime DateTime
--)

CREATE proc [dbo].[Phot_OrderServicePrices_InsertCustom]
@OrderId bigint ,  
@UserId bigint, 
@Price decimal,
@NameEn nvarchar(max),
@NameAr nvarchar(max)
as begin
declare  @Id bigint =(select isnull(max(Id),0)+1 from Phot_OrderServicePrices where FkOrder_Id=@OrderId and FkUser_Id=@UserId),
  @WordId bigint;
  exec @WordId=Words_Insert @NameAr,@NameEn

--Insert Nnow
	insert Phot_OrderServicePrices values(@Id,@OrderId,@UserId,@WordId,@Price,GETDATE())
end
GO
/****** Object:  StoredProcedure [dbo].[Phot_OrderServicePrices_SelectByOrderId]    Script Date: 1/30/2020 7:50:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[Phot_OrderServicePrices_SelectByOrderId]
@OrderId bigint,
@UserId bigint
as begin

select Phot_OrderServicePrices.*,
Words.Ar as ServiceNameAr,
Words.En as ServiceNameEn
from Phot_OrderServicePrices 

join Words on Words.Id=FKWord_Id

where FkOrder_Id=@OrderId 
and FkUser_Id=@UserId
order by Id desc

end 
GO
/****** Object:  StoredProcedure [dbo].[Phot_OrdersOptions_Insert]    Script Date: 1/30/2020 7:50:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[Phot_OrdersOptions_Insert] --1,N'3:8'
@OrderId bigint ,
@OptionAndItem nvarchar(max) --Pass As OptionId:ItemId
as begin
declare @OptionsIds table (id bigint , num int );
insert @OptionsIds 
select Value,ROW_NUMBER() over(order by (select null))  from string_split(@OptionAndItem,':')
declare @Id bigint =(select isnull(max(Id),0)+1 from Phot_OrdersOptions);
insert Phot_OrdersOptions (Id , FKOrder_Id,FKProdutOption_Id,FKProductOptionItem_Id)
values (@Id,@OrderId,(select id  from @OptionsIds where num=1),(select id  from @OptionsIds where num=2))
end 
GO
/****** Object:  StoredProcedure [dbo].[Phot_Products_CheckIfActive]    Script Date: 1/30/2020 7:50:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[Phot_Products_CheckIfActive]
@Id bigint
as begin 

select top 1 IsActive from Phot_Products where Id=@Id
end
GO
/****** Object:  StoredProcedure [dbo].[Phot_Products_CheckIfUsed]    Script Date: 1/30/2020 7:50:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[Phot_Products_CheckIfUsed]
@Id bigint
as begin 

select count(*) from Phot_Orders where FKProduct_Id=@Id
end
GO
/****** Object:  StoredProcedure [dbo].[Phot_Products_Delete]    Script Date: 1/30/2020 7:50:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[Phot_Products_Delete]
@Id bigint,
@WordNameId bigint,
@WordDescriptionId bigint,
@WordUplaodFileNotesId bigint
as begin 

delete Words where Id = @WordNameId or Id = @WordDescriptionId or Id = @WordUplaodFileNotesId

--Delete Options Items
delete Phot_ProductsOptionsItems where FKProductOption_Id in (select Id from Phot_ProductsOptions where FKProduct_Id=@Id)
-- Delete Options
delete Phot_ProductsOptions where FKProduct_Id=@Id
--Delete Products
delete Phot_Products where Id=@Id
end
GO
/****** Object:  StoredProcedure [dbo].[Phot_Products_Images_Insert]    Script Date: 1/30/2020 7:50:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[Phot_Products_Images_Insert] 
@ProductId bigint ,
@ImagesUrls nvarchar(max)
as begin

declare @Pathes table (Num bigint ,Path nvarchar(max));
declare @NewId bigint , @CountPathes int ;
insert @Pathes select ROW_NUMBER()  OVER(ORDER BY (select null)  ) AS Row,value from string_split(@ImagesUrls,',');

set @CountPathes=(select count(*) from @Pathes);

while @CountPathes>0
begin
set @NewId=(select isnull(max(id),0)+1 from Phot_Products_Images );

insert Phot_Products_Images values(@NewId ,(select top 1 Path from @Pathes where Num=@CountPathes), @ProductId)
set @CountPathes=@CountPathes-1;
end 


end 
GO
/****** Object:  StoredProcedure [dbo].[Phot_Products_Insert]    Script Date: 1/30/2020 7:50:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*
[Id] [bigint] NOT NULL,
	[FKWord_Name_Id] [bigint] NOT NULL,
	[FKWord_Description_Id] [bigint] NOT NULL,
	[FKProductType_Id] [bigint] NOT NULL,
	[FKWord_UplaodFilesNotes_Id] [bigint] NOT NULL,
*/


CREATE proc [dbo].[Phot_Products_Insert]
	@NameAr nvarchar(max), 
	@NameEn nvarchar(max), 
	@DescriptionAr nvarchar(max), 
	@DescriptionEn nvarchar(max), 
	@UplaodFileNotesAr nvarchar(max), 
	@UplaodFileNotesEn nvarchar(max), 
	@Images nvarchar(max), 
	@ProductTypeId bigint  ,
	@UserId bigint,
	@IsActive bit,
	@Version int,
	@ProductParentId bigint
as begin begin tran tranc begin try

declare 
		@Id bigint ,
		@WordNameId bigint ,
		@WordDescriptionId bigint ,
		@WordUpdlodFileNotesId bigint ;

set @Id = (select isnull(max(Id),0)+1 from Phot_Products);
exec @WordNameId = Words_Insert @NameAr,@NameEn;
exec @WordDescriptionId = Words_Insert @DescriptionAr,@DescriptionEn;
exec @WordUpdlodFileNotesId = Words_Insert @UplaodFileNotesAr,@UplaodFileNotesEn;



insert Phot_Products (Id,	FKProductType_Id,	FKWord_Name_Id,	FKWord_Description_Id,	FKWord_UplaodFilesNotes_Id,FKUser_Id,IsActive,CreateDateTime,Version,FkProductParent_Id	)
			  values (@Id,	@ProductTypeId,		@WordNameId,	@WordDescriptionId,		@WordUpdlodFileNotesId ,@UserId,@IsActive,GETDATE(),@Version,@ProductParentId		)

--Insert Images
exec Phot_Products_Images_Insert @Id,@Images

select @Id

commit tran tranc end try begin catch rollback tran tranc end catch end 
GO
/****** Object:  StoredProcedure [dbo].[Phot_Products_SelectByFilter]    Script Date: 1/30/2020 7:50:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[Phot_Products_SelectByFilter]
@Skip int,
@Take int
as begin 

select 
Phot_Products.*,
names.Ar as NameAr,
names.En as NameEn,
prodNames.Ar as ProductTypeNameAr,
prodNames.En as ProductTypeNameEn 

from Phot_Products

join Words names on names.Id=Phot_Products.FKWord_Name_Id
join Phot_ProductTypes ptype on ptype.Id=Phot_Products.FKProductType_Id
join Words prodNames on prodNames.Id=ptype.FKWord_Name_Id


order by id desc
Offset @skip rows
fetch next @take rows only 

end
GO
/****** Object:  StoredProcedure [dbo].[Phot_Products_SelectByPK]    Script Date: 1/30/2020 7:50:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[Phot_Products_SelectByPK] 
@Id bigint 
as begin

select pr.*,
		wName.Ar as NameAr,
		wName.En as NameEn,
		dName.Ar as DescriptionAr,
		dName.En as DescriptionEn,
		nName.Ar as UploadNotesAr,
		nName.En as UploadNotesEn,
		img.Id as ProductImageId,
		img.ImageUrl

		from Phot_Products pr
join Words wName on wName.Id=pr.FKWord_Name_Id
join Words dName on dName.Id=pr.FKWord_Description_Id
join Words nName on nName.Id=pr.FKWord_UplaodFilesNotes_Id
left join Phot_Products_Images img on img.FkProduct_Id=pr.ID
where pr.Id=@Id
end 
GO
/****** Object:  StoredProcedure [dbo].[Phot_Products_SelectByProductId]    Script Date: 1/30/2020 7:50:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE  proc [dbo].[Phot_Products_SelectByProductId] 
@ProductTypeId bigint  
as begin 

select pr.* ,
WordName.Ar NameAr,
WordName.En NameEn,

Phot_Products_Images.ImageUrl

from Phot_Products pr
	
	join Words WordName on WordName.Id=pr.FKWord_Name_Id
	join Phot_Products_Images on Phot_Products_Images.FkProduct_Id=pr.Id
where pr.FKProductType_Id=@ProductTypeId
and IsActive=1



end 
GO
/****** Object:  StoredProcedure [dbo].[Phot_Products_Update]    Script Date: 1/30/2020 7:50:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
 

CREATE proc [dbo].[Phot_Products_Update]
	@Id bigint ,
	@WordNameId bigint ,
	@WordDescriptionId bigint ,
	@WordUpdlodFileNotesId bigint ,
	@NameAr nvarchar(max), 
	@NameEn nvarchar(max), 
	@DescriptionAr nvarchar(max), 
	@DescriptionEn nvarchar(max), 
	@UplaodFileNotesAr nvarchar(max), 
	@UplaodFileNotesEn nvarchar(max), 
	@Images nvarchar(max), 
	@ImageIdsDeleting nvarchar(max), 
	@ProductTypeId bigint,
	@IsActive bit
as begin 
		
exec Words_Update @WordNameId, @NameAr,@NameEn;
exec Words_Update @WordDescriptionId , @DescriptionAr,@DescriptionEn;
exec Words_Update @WordUpdlodFileNotesId,  @UplaodFileNotesAr,@UplaodFileNotesEn;

update Phot_Products set IsActive=@IsActive where Id=@Id
--Update Product Type If Not Passing Null
if @ProductTypeId > 0
update Phot_Products set FKProductType_Id=@ProductTypeId where Id=@Id

--Insert Images
if LEN(@Images) > 0
exec Phot_Products_Images_Insert @Id,@Images
--Delete Images
delete Phot_Products_Images where ID in (select value from string_split(@ImageIdsDeleting,','))

end 
GO
/****** Object:  StoredProcedure [dbo].[Phot_ProductsOptionItems_CheckIfUsed]    Script Date: 1/30/2020 7:50:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[Phot_ProductsOptionItems_CheckIfUsed]
@ItemId bigint
as begin 
select count(*) from Phot_OrdersOptions 
where FKProductOptionItem_Id=@ItemId
 
end 
GO
/****** Object:  StoredProcedure [dbo].[Phot_ProductsOptionItems_Insert]    Script Date: 1/30/2020 7:50:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[Phot_ProductsOptionItems_Insert] 
@OptionId bigint,
@ItemsNamesAr nvarchar(max),
@ItemsNamesEn nvarchar(max),
@ItemsPrices nvarchar(max),
@ItemsCount int
as begin 

begin tran tranc 
		begin try
		declare 
		@NameAr nvarchar(max),
		@NameEn nvarchar(max);
--Insert Products Options Items
 Declare @NamesAr table (num bigint,val nvarchar(max));
 Declare @NamesEn table (num bigint,val nvarchar(max));
 Declare @Prices table (num bigint,val nvarchar(max));
 
 insert @NamesAr select ROW_NUMBER() over(order by (select null) desc ), value from string_split(@ItemsNamesAr,',');
 insert @NamesEn select ROW_NUMBER() over(order by (select null) desc ), value from string_split(@ItemsNamesEn,',');
 insert @Prices select ROW_NUMBER() over(order by (select null) desc ), value from string_split(@ItemsPrices,',');

 while @ItemsCount>0
begin 
declare 
		@NeweWordId bigint;
set @NameAr=(select top 1 val from @NamesAr where num=@ItemsCount);
set @NameEn=(select top 1 val from @NamesEn where num=@ItemsCount);
exec @NeweWordId=Words_Insert @NameAr,@NameEn

insert Phot_ProductsOptionsItems values(
(select isnull(max(Id),0)+1 from Phot_ProductsOptionsItems),@NeweWordId,(select top 1 val from @Prices where num=@ItemsCount),@OptionId)

set @ItemsCount=@ItemsCount-1;
end

commit tran tranc 
	end try 
	begin catch 
		rollback tran tranc 
	end catch
end 
GO
/****** Object:  StoredProcedure [dbo].[Phot_ProductsOptionItems_Update]    Script Date: 1/30/2020 7:50:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[Phot_ProductsOptionItems_Update] 
@OptionId bigint,
@ItemsIds nvarchar(max),
@ItemsNamesAr nvarchar(max),
@ItemsNamesEn nvarchar(max),
@ItemWordNamdsIds nvarchar(max),
@ItemsPrices nvarchar(max),
@ItemsCount int
as begin 

begin tran tranc 
		begin try
		declare 
		@NameAr nvarchar(max),
		@NameEn nvarchar(max),
		@Id bigint ,
		@WordId bigint ;
--Insert Products Options Items
 Declare @NamesAr table (num bigint,val nvarchar(max));
 Declare @NamesEn table (num bigint,val nvarchar(max));
 Declare @Prices table (num bigint,val nvarchar(max));
 Declare @Ids table (num bigint,val bigint);
 Declare @WordNAmeIds table (num bigint,val bigint);
  
 
 insert @Ids select ROW_NUMBER() over(order by (select null)   ), value from string_split(@ItemsIds,',');
 insert @NamesAr select ROW_NUMBER() over(order by (select null)   ), value from string_split(@ItemsNamesAr,',');
 insert @NamesEn select ROW_NUMBER() over(order by (select null)   ), value from string_split(@ItemsNamesEn,',');
 insert @WordNAmeIds select ROW_NUMBER() over(order by (select null)   ), value from string_split(@ItemWordNamdsIds,',');
 insert @Prices select ROW_NUMBER() over(order by (select null)   ), value from string_split(@ItemsPrices,',');

 
 while @ItemsCount>0
begin 
set @Id=(select top 1 val from @NamesAr where num=@ItemsCount);
set @NameAr=(select top 1 val from @NamesAr where num=@ItemsCount);
set @NameEn=(select top 1 val from @NamesEn where num=@ItemsCount);
set @WordId=(select top 1 val from @WordNAmeIds where num=@ItemsCount);

exec Words_Update @WordId, @NameAr,@NameEn

update Phot_ProductsOptionsItems set Price=(select top 1 val from @Prices where num=@ItemsCount) where Id=@Id

set @ItemsCount=@ItemsCount-1;
end

commit tran tranc 
	end try 
	begin catch 
		rollback tran tranc 
	end catch
end 
GO
/****** Object:  StoredProcedure [dbo].[Phot_ProductsOptions_Delete]    Script Date: 1/30/2020 7:50:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[Phot_ProductsOptions_Delete] 
@Id bigint 
as begin 

delete Phot_ProductsOptionsItems where FKProductOption_Id=@Id
delete Phot_ProductsOptions where Id=@Id

end 
GO
/****** Object:  StoredProcedure [dbo].[Phot_ProductsOptions_Insert]    Script Date: 1/30/2020 7:50:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[Phot_ProductsOptions_Insert] 
@StaticFieldId int,
@ProductId bigint,
@ItemsJson nvarchar(max)
as begin 
 
declare @OptionsItems table (num int,ValueAr nvarchar(max) , valueEn nvarchar(max),Price decimal(18,2),IsProsessd bit);
insert @OptionsItems
select ROW_NUMBER()over(order by (select null)), ValueAr,ValueEn,Price,0 from 
 OPENJSON(@ItemsJson,'$')
WITH (
     
    ValueAr NVARCHAR(50) '$.ValueAr',
    ValueEn NVARCHAR(50) '$.ValueEn',
    Price decimal(18,2) '$.Price'
  );

declare @OptionId bigint =(select isnull(max(Id),0)+1 from Phot_ProductsOptions),
		@NumTarget int,
		@Price decimal(18,2),
		@NameAr nvarchar(max),
		@NameEn nvarchar(max);

--Insert Products Options
insert Phot_ProductsOptions values(@OptionId,@StaticFieldId,@ProductId);

--Insert Products Options Items
 while (select count(*) from @OptionsItems  where IsProsessd=0)>0
begin 
declare @NeweWordId bigint;
set @NumTarget=(select top 1 num from @OptionsItems  where IsProsessd=0);
set @NameAr=(select top 1 ValueAr from @OptionsItems  where IsProsessd=0);
set @NameEn=(select top 1 valueEn from @OptionsItems  where IsProsessd=0);
set @Price=(select  top 1 Price   from @OptionsItems  where IsProsessd=0);

exec @NeweWordId=Words_Insert @NameAr,@NameEn

insert Phot_ProductsOptionsItems values((select isnull(max(Id),0)+1 from Phot_ProductsOptionsItems),@NeweWordId,@Price,@OptionId)
update @OptionsItems set IsProsessd=1 where num=@NumTarget; 
 end

end 
GO
/****** Object:  StoredProcedure [dbo].[Phot_ProductsOptions_SelectByProductId]    Script Date: 1/30/2020 7:50:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[Phot_ProductsOptions_SelectByProductId] 
@ProductId bigint
as begin

select op.*,
	stacWord.Ar as NameAr,
	stacWord.En as NameEn,
	itemWord.Ar as ValueAr,
	itemWord.En as ValueEn,
	opi.Id as OptionItemId,
	isnull(opi.Price,0) as Price,
	opi.FKWord_Value_Id
from Phot_ProductsOptions op
	join StaticFields stat on stat.Id=op.FKStaticField_Id
	join Words stacWord on stacWord.Id=stat.FKWord_Id


left join Phot_ProductsOptionsItems opi on opi.FKProductOption_Id=op.Id
left join Words itemWord on itemWord.Id=opi.FKWord_Value_Id

where op.FKProduct_Id=@ProductId
end
GO
/****** Object:  StoredProcedure [dbo].[Phot_ProductsOptions_Update]    Script Date: 1/30/2020 7:50:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[Phot_ProductsOptions_Update]
@Id bigint,
@StaticFieldId int,
@IdDeleted nvarchar(max)
as begin 
update Phot_ProductsOptions set FKStaticField_Id=@StaticFieldId where Id=@Id;
--Delete Items
delete Phot_ProductsOptionsItems where id in (select cast(value as bigint) from string_split(@IdDeleted,','))
 
end 
GO
/****** Object:  StoredProcedure [dbo].[Phot_ProductsOptionsItems_SelectByIds]    Script Date: 1/30/2020 7:50:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[Phot_ProductsOptionsItems_SelectByIds]
@Ids nvarchar(max)
as begin
select 
Phot_ProductsOptionsItems.*,staticFeild.FKWord_Id as StaticFieldWordId  from Phot_ProductsOptionsItems

join Phot_ProductsOptions optin on optin.Id=Phot_ProductsOptionsItems.FKProductOption_Id
join StaticFields staticFeild on staticFeild.Id=optin.FKStaticField_Id

where Phot_ProductsOptionsItems.Id in (select value from string_split(@Ids,','))
end
GO
/****** Object:  StoredProcedure [dbo].[Phot_ProductTypes_CheckIfUed]    Script Date: 1/30/2020 7:50:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[Phot_ProductTypes_CheckIfUed]
	@Id bigint
as begin
select count(*) from Phot_Products where FKProductType_Id=@Id
end
GO
/****** Object:  StoredProcedure [dbo].[Phot_ProductTypes_Delete]    Script Date: 1/30/2020 7:50:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[Phot_ProductTypes_Delete]
	@Id bigint
as begin
delete Phot_ProductTypes where Id=@Id

end
GO
/****** Object:  StoredProcedure [dbo].[Phot_ProductTypes_Insert]    Script Date: 1/30/2020 7:50:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[Phot_ProductTypes_Insert]
	@NameAr nvarchar(50),
	@NameEn nvarchar(50),
	@ImageUrl nvarchar(max)
as begin 
begin tran tranc
begin try 


declare @Id bigint =(select isnull(max(Id),0)+1 from Phot_ProductTypes), 
	@WordId bigint ;

exec @WordId= Words_Insert @NameAr,@NameEn;
insert Phot_ProductTypes values (@Id,@WordId,@ImageUrl);

exec Phot_ProductTypes_SelectByPK @Id
commit tran tranc
end try
begin catch rollback tran tranc end catch

end
GO
/****** Object:  StoredProcedure [dbo].[Phot_ProductTypes_SelectByAll]    Script Date: 1/30/2020 7:50:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[Phot_ProductTypes_SelectByAll]
as begin 

select 
Phot_ProductTypes.*,
Words.Ar as NameAr,
Words.En as NameEn
from Phot_ProductTypes
join Words on Words.Id = Phot_ProductTypes.FKWord_Name_Id

end
GO
/****** Object:  StoredProcedure [dbo].[Phot_ProductTypes_SelectByFilter]    Script Date: 1/30/2020 7:50:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[Phot_ProductTypes_SelectByFilter]
@Skip int ,
@Take int 
as begin 

select pt.*,
Words.Ar NameAr,
Words.En NameEn
from Phot_ProductTypes pt 
join Words on Words.Id=pt.FKWord_Name_Id

order by Id desc 
offset @skip Rows
fetch next @take rows only
end
GO
/****** Object:  StoredProcedure [dbo].[Phot_ProductTypes_SelectByPK]    Script Date: 1/30/2020 7:50:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[Phot_ProductTypes_SelectByPK]
@id bigint 
as begin 

select pt.*,
Words.Ar NameAr,
Words.En NameEn
from Phot_ProductTypes pt 
join Words on Words.Id=pt.FKWord_Name_Id
where pt.Id=@id

end
GO
/****** Object:  StoredProcedure [dbo].[Phot_ProductTypes_Update]    Script Date: 1/30/2020 7:50:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[Phot_ProductTypes_Update]
	@Id bigint,
	@WordId bigint,
	@NameAr nvarchar(50),
	@NameEn nvarchar(50),
	@ImageUrl nvarchar(max)
as begin 
	begin tran tranc begin try
	
	update Phot_ProductTypes set ImageUrl=@ImageUrl where Id=@Id
	exec Words_Update @WordId, @NameAr,@NameEn;

	commit tran tranc end try begin catch rollback tran tranc end catch
end
GO
/****** Object:  StoredProcedure [dbo].[PrintNamesTypes_CheckIfUsed]    Script Date: 1/30/2020 7:50:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[PrintNamesTypes_CheckIfUsed] 
@Id bigint
as begin

select 
isnull(count(*),0)  from Events where FKPrintNameType_Id=@Id
 
end
GO
/****** Object:  StoredProcedure [dbo].[PrintNamesTypes_Delete]    Script Date: 1/30/2020 7:50:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[PrintNamesTypes_Delete]
@Id bigint,
@WordId bigint
as begin
delete  PrintNamesTypes where Id=@Id
delete Words where Words.Id =@WordId
 
end
GO
/****** Object:  StoredProcedure [dbo].[PrintNamesTypes_Insert]    Script Date: 1/30/2020 7:50:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
 
CREATE  proc [dbo].[PrintNamesTypes_Insert]
@Id int output , 
@NameAr nvarchar(50),
@NameEn nvarchar(50),
@Price decimal(18,2)

as begin
-- Insert Word 
declare @WordId int ;
exec @WordId =   dbo.Words_Insert @NameAr,@NameEn

-- Insert Target
INSERT INTO [dbo].[PrintNamesTypes]
           ([FKWord_Id],Price
           )
     VALUES
           (@WordId,@Price)

		 select  @Id=@@identity
end


GO
/****** Object:  StoredProcedure [dbo].[PrintNamesTypes_SelectByFilter]    Script Date: 1/30/2020 7:50:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[PrintNamesTypes_SelectByFilter] 
@Skip int , 
@Take int 

as begin 

select PrintNamesTypes.*,
Words.Ar as NameAr,
Words.En as NameEn from PrintNamesTypes

join Words on Words.Id= PrintNamesTypes.FKWord_Id

order by Id desc
Offset @skip rows 
Fetch next @Take rows only 
end 
GO
/****** Object:  StoredProcedure [dbo].[PrintNamesTypes_Update]    Script Date: 1/30/2020 7:50:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE  proc [dbo].[PrintNamesTypes_Update]
@Id int  , 
@NameAr nvarchar(50),
@NameEn nvarchar(50),
@WordId bigint,
@Price decimal(18,2)

as begin
-- Update Word 
exec dbo.Words_Update @WordId, @NameAr,@NameEn



-- Update Target
 update PrintNamesTypes set Price=@Price where Id=@Id
end


GO
/****** Object:  StoredProcedure [dbo].[PrintNameTypes_SelectAll]    Script Date: 1/30/2020 7:50:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[PrintNameTypes_SelectAll] 
as begin 

select PrintNamesTypes.*,
Words.Ar as NameAr,
Words.En as NameEn from PrintNamesTypes

join Words on Words.Id= PrintNamesTypes.FKWord_Id

end 
GO
/****** Object:  StoredProcedure [dbo].[PrintNameTypes_SelectByPK]    Script Date: 1/30/2020 7:50:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[PrintNameTypes_SelectByPK]
@Id int 
as begin
select top 1 * from PrintNamesTypes where Id=@Id
end
GO
/****** Object:  StoredProcedure [dbo].[Products_Disactive]    Script Date: 1/30/2020 7:50:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[Products_Disactive]
@Id bigint ,
@IsActive bit
as begin 

update Phot_Products set IsActive=@IsActive where Id=@Id
end 
GO
/****** Object:  StoredProcedure [dbo].[Products_DisActiveParentAndChildren]    Script Date: 1/30/2020 7:50:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[Products_DisActiveParentAndChildren] 
@ProductId bigint 
as begin 

update Phot_Products set IsActive=0 where Id=@ProductId

end 
GO
/****** Object:  StoredProcedure [dbo].[SocialAccountTypes_CheckIfUsed]    Script Date: 1/30/2020 7:50:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[SocialAccountTypes_CheckIfUsed] 
@Id int
as begin

select 
isnull(count(*),0)  from UserSocialAccounts where FKSocialAccountType_Id=@Id
 
end
GO
/****** Object:  StoredProcedure [dbo].[SocialAccountTypes_Delete]    Script Date: 1/30/2020 7:50:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[SocialAccountTypes_Delete]
@Id int,
@WordId bigint
as begin
delete  SocialAccountTypes where Id=@Id
delete Words where Words.Id =@WordId
 
end
GO
/****** Object:  StoredProcedure [dbo].[SocialAccountTypes_Insert]    Script Date: 1/30/2020 7:50:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
 
CREATE  proc [dbo].[SocialAccountTypes_Insert]  
@Id int output , 
@NameAr nvarchar(50),
@NameEn nvarchar(50)

as begin
-- Insert Word 
declare @WordId bigint ;
exec @WordId =   dbo.Words_Insert @NameAr,@NameEn

-- Insert Target
INSERT INTO [dbo].[SocialAccountTypes]
           ([FKWord_Id]
           )
     VALUES
           (@WordId)

		 select  @Id=@@identity
end


GO
/****** Object:  StoredProcedure [dbo].[SocialAccountTypes_SelectAll]    Script Date: 1/30/2020 7:50:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[SocialAccountTypes_SelectAll] 
as begin 

select SocialAccountTypes.*,
Words.Ar as NameAr,
Words.En as NameEn from SocialAccountTypes

join Words on Words.Id= SocialAccountTypes.FKWord_Id

end 
GO
/****** Object:  StoredProcedure [dbo].[SocialAccountTypes_SelectByFilter]    Script Date: 1/30/2020 7:50:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[SocialAccountTypes_SelectByFilter] 
@Skip int , 
@Take int 

as begin 

select SocialAccountTypes.*,
Words.Ar as NameAr,
Words.En as NameEn from SocialAccountTypes

join Words on Words.Id= SocialAccountTypes.FKWord_Id

order by Id desc
Offset @skip rows 
Fetch next @Take rows only 
end 
GO
/****** Object:  StoredProcedure [dbo].[SocialAccountTypes_Update]    Script Date: 1/30/2020 7:50:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create  proc [dbo].[SocialAccountTypes_Update]
@Id int  , 
@NameAr nvarchar(50),
@NameEn nvarchar(50),
@WordId bigint

as begin
-- Update Word 
exec dbo.Words_Update @WordId, @NameAr,@NameEn

-- Update Target
 
end


GO
/****** Object:  StoredProcedure [dbo].[StaticFields_CheckIfUsed]    Script Date: 1/30/2020 7:50:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[StaticFields_CheckIfUsed] 
@Id int
as begin

select isnull(count(*),0)  from PackageDetails where FKStaticField_Id=@Id
 union
select isnull(count(*),0)  from Phot_ProductsOptions where FKStaticField_Id=@Id

end
GO
/****** Object:  StoredProcedure [dbo].[StaticFields_Delete]    Script Date: 1/30/2020 7:50:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[StaticFields_Delete]
@Id bigint
as begin
delete Words where Words.Id in (select  FKWord_Id from Cities where Id=@Id)
delete  StaticFields where Id=@Id
 
end
GO
/****** Object:  StoredProcedure [dbo].[StaticFields_Insert]    Script Date: 1/30/2020 7:50:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
 
CREATE  proc [dbo].[StaticFields_Insert]
@Id int output , 
@NameAr nvarchar(50),
@NameEn nvarchar(50)

as begin
-- Insert Word 
declare @WordId int ;
exec @WordId =   dbo.Words_Insert @NameAr,@NameEn

-- Insert Target
INSERT INTO [dbo].[StaticFields]
           ([FKWord_Id]
           )
     VALUES
           (@WordId)

		 select  @Id=@@identity
end


GO
/****** Object:  StoredProcedure [dbo].[StaticFields_SelectAll]    Script Date: 1/30/2020 7:50:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[StaticFields_SelectAll] 
as begin 

select StaticFields.*,
Words.Ar as NameAr,
Words.En as NameEn from StaticFields

join Words on Words.Id= StaticFields.FKWord_Id

end 
GO
/****** Object:  StoredProcedure [dbo].[StaticFields_SelectByFilter]    Script Date: 1/30/2020 7:50:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[StaticFields_SelectByFilter] 
@Skip int , 
@Take int 

as begin 

select StaticFields.*,
Words.Ar as NameAr,
Words.En as NameEn from StaticFields

join Words on Words.Id= StaticFields.FKWord_Id

order by Id desc
Offset @skip rows 
Fetch next @Take rows only 
end 
GO
/****** Object:  StoredProcedure [dbo].[StaticFields_Update]    Script Date: 1/30/2020 7:50:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create  proc [dbo].[StaticFields_Update]
@Id int  , 
@NameAr nvarchar(50),
@NameEn nvarchar(50),
@WordId bigint

as begin
-- Update Word 
exec dbo.Words_Update @WordId, @NameAr,@NameEn

-- Update Target
 
end


GO
/****** Object:  StoredProcedure [dbo].[UserPayments_Insert]    Script Date: 1/30/2020 7:50:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[UserPayments_Insert]
@Id bigint output,
@Amount  decimal(18,2),
@DateTime datetime,
@IsAcceptFromManger bit,
@FKUserTo_Id bigint,
@FKUserFrom_Id bigint,
 @Notes nvarchar(max),
 @IsBankTransfer bit,
 @PaymentImage nvarchar(max)
as begin 
INSERT INTO [dbo].[UserPayments]
           ([Amount]
           ,[DateTime]
           ,[IsAcceptFromManger]
           ,[FKUserTo_Id]
           ,[FKUserFrom_Id],
		   Notes  ,
		   IsBankTransfer ,
           PaymentImage )
		   values(
		   @Amount  ,
		   @DateTime ,
		   @IsAcceptFromManger ,
		   @FKUserTo_Id ,
		   @FKUserFrom_Id ,
		   @Notes ,
		   @IsBankTransfer ,
		   @PaymentImage 


		   )
select @Id=@@IDENTITY
end


GO
/****** Object:  StoredProcedure [dbo].[UserPayments_SelectByPK]    Script Date: 1/30/2020 7:50:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[UserPayments_SelectByPK]
@Id bigint 
as begin

	select * from UserPayments where
	Id=@Id

end 
GO
/****** Object:  StoredProcedure [dbo].[UserPayments_SelectByUserToId]    Script Date: 1/30/2020 7:50:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[UserPayments_SelectByUserToId]
@Id bigint,
@Skip int , 
@Take int 
as begin 
select UserPayments.*,
UserFrom.UserName,

 dbo.UserPayments_CheckIsClosed(UserPayments.IsAcceptFromManger,UserPayments.PaymentImage) as IsClosed
from UserPayments 
join Users UserFrom on UserFrom.Id=UserPayments.FKUserFrom_Id
where UserPayments.FKUserTo_Id=@Id


order by UserPayments.Id desc
offset @skip rows
fetch next @Take rows only
end


GO
/****** Object:  StoredProcedure [dbo].[UserPayments_Update]    Script Date: 1/30/2020 7:50:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[UserPayments_Update]
@Id bigint ,
@IsAcceptFromManger bit,
 @Notes nvarchar(max),
 @IsBankTransfer bit,
 @PaymentImage nvarchar(max)
as begin 
update [dbo].[UserPayments]
set
           IsAcceptFromManger= @IsAcceptFromManger,
		   Notes =@Notes				,
		   IsBankTransfer =@IsBankTransfer		,
           PaymentImage=@PaymentImage 

		   where Id=@Id
end


GO
/****** Object:  StoredProcedure [dbo].[UserPrivileges_Insert]    Script Date: 1/30/2020 7:50:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[UserPrivileges_Insert]
	@PageId int ,
	@UserId bigint,
	@CanAdd bit , 
	@CanEdit bit , 
	@CanDelete bit ,
	@CanDisplay bit 

	as 
SET NOCOUNT ON;

BEGIN TRY
BEGIN TRAN


INSERT [dbo].[UserPrivileges]
(
		[FkUser_Id],
		[FkPage_Id],
		[CanAdd],
		[CanEdit],
		[CanDelete],
		[CanDisplay]
)
VALUES
(
		@UserId,
		@PageId,
		@CanAdd,
		@CanEdit,
		@CanDelete,
		@CanDisplay
)


COMMIT TRAN
END TRY

BEGIN CATCH
ROLLBACK TRAN

DECLARE @ErrorNumber_INT INT;
DECLARE @ErrorSeverity_INT INT;
DECLARE @ErrorProcedure_VC VARCHAR(200);
DECLARE @ErrorLine_INT INT;
DECLARE @ErrorMessage_NVC NVARCHAR(4000);

SELECT
		@ErrorMessage_NVC = ERROR_MESSAGE(),
		@ErrorSeverity_INT = ERROR_SEVERITY(),
		@ErrorNumber_INT = ERROR_NUMBER(),
		@ErrorProcedure_VC = ERROR_PROCEDURE(),
		@ErrorLine_INT = ERROR_LINE()

RAISERROR(@ErrorMessage_NVC,@ErrorSeverity_INT,1);

END CATCH
GO
/****** Object:  StoredProcedure [dbo].[UserPrivileges_RemoveByMenuIdAndUserId]    Script Date: 1/30/2020 7:50:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[UserPrivileges_RemoveByMenuIdAndUserId] 
	@MenuId int , 
	@UserId bigint
/*
حذف جميع الامتيازات بناء على المنيو

*/
	as begin 

	delete UserPrivileges 
	where 
	FkUser_Id=@UserId and 
	(select COUNT(*) from Pages 
	where Pages.Id=UserPrivileges.FkPage_Id and Pages.FkMenu_Id=@MenuId)>0

	end
GO
/****** Object:  StoredProcedure [dbo].[UserPrivileges_SelectByUserId]    Script Date: 1/30/2020 7:50:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[UserPrivileges_SelectByUserId]
@pageId int , 
@userId bigint
as begin 

select * from UserPrivileges where FkUser_Id=@userId and FkPage_Id=@pageId

end 
GO
/****** Object:  StoredProcedure [dbo].[Users_ActiveEmail]    Script Date: 1/30/2020 7:50:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[Users_ActiveEmail] 
@UserId bigint,
@ActiveCode nvarchar(50)
as begin 
declare @OldActiveCode nvarchar(50) = (select top 1 ActiveCode from users where Id=@UserId);

if(@OldActiveCode =@ActiveCode)
	Update Users 
	set IsActiveEmail =1 
	where Id=@UserId

select * from users where Id=@UserId
end 
GO
/****** Object:  StoredProcedure [dbo].[Users_CheckCompeleteAccountInformation]    Script Date: 1/30/2020 7:50:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc 
[dbo].[Users_CheckCompeleteAccountInformation] 
--10023,6
@UserId bigint ,
@AccountTypeId int 

as begin 
/*
نتحقق ان معلومات المستخدم المهمة تم ادخالها بناء على نوع الحساب الخاص بة
		ProjectManager = 1,
        Supervisor = 2,
        BranchManager = 3,
        Clinet = 4,
        Employee=5,
        Helper= 6,
        Photographer=7
*/

declare @counte int = (select count(*) from Users    

where Id=@UserId
and 
-- (
-- (@AccountTypeId =4 or @AccountTypeId= 6 or @AccountTypeId=7) 
-- and
-- (Email is null  or FullName is null or NationalityNumber is null or PhoneNo is null or DateOfBirth is  null )
-- )
--)
(
 Email is null  or FullName is null or NationalityNumber is null or PhoneNo is null or DateOfBirth is  null 
 ))
if(@counte > 0)
select 1;
else 
select 0

end 
GO
/****** Object:  StoredProcedure [dbo].[Users_CheckFromActiveCode]    Script Date: 1/30/2020 7:50:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[Users_CheckFromActiveCode]
@Id bigint , 
@ActiveCode nvarchar(50)
as begin

select ISNULL(count(*),0) from Users where Id=@Id and ActiveCode=@ActiveCode


end 
GO
/****** Object:  StoredProcedure [dbo].[Users_CheckIfActive]    Script Date: 1/30/2020 7:50:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[Users_CheckIfActive]
@UserId bigint 
as begin 
select count(*) from Users where Id=@UserId and IsActive=1
end 
GO
/****** Object:  StoredProcedure [dbo].[Users_CheckIfEmailActivated]    Script Date: 1/30/2020 7:50:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[Users_CheckIfEmailActivated] 
@UserId bigint
as begin 
select isnull(IsActiveEmail,0) from Users where Id=@UserId

end 
GO
/****** Object:  StoredProcedure [dbo].[Users_EmailBeforUsed]    Script Date: 1/30/2020 7:50:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[Users_EmailBeforUsed] 
@UserId bigint,
@Email nvarchar(50)
as begin

select count(*) from Users where LOWER(Email)=LOWER(@Email) 
and (@UserId = 0 or @UserId is null or Id!=@UserId) 

end
GO
/****** Object:  StoredProcedure [dbo].[Users_Insert]    Script Date: 1/30/2020 7:50:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[Users_Insert]
			@Id bigint output,
			@UserName nvarchar(50),
           @Email nvarchar(50),
           @PhoneNo nvarchar(50),
           @FKAccountType_Id int,
           @Address nvarchar(250),
           @FkCountry_Id int,
           @FkCity_Id int,
           @Password nvarchar(50),
           @ActiveCode nvarchar(50),
		   @CreateDateTime datetime,
		   @LanguageId int,
		   @BranchId int,
		   @EnquiryId	bigint,
		   @DateOfBirth  date,
		   @IsActive bit,
		   @FullName nvarchar(150),
		  		   @NationalityNumber nvarchar(20) ,

		   @WebSite nvarchar(500)
as begin

set @Id=(select max(ISNULL(Id,0))+1 from Users)
INSERT INTO [dbo].[Users]
           (
		   Id,
		   [UserName]
           ,[Email]
           ,[PhoneNo]
           ,[FKAccountType_Id]
           ,[Address]
           ,[FkCountry_Id]
           ,[FkCity_Id]
           ,[Password]
           ,[ActiveCode],
		   CreateDateTime,
		   FKLanguage_Id,
		   FKPranch_Id,
		   DateOfBirth,isActive,
		   
		   FullName,
		   NationalityNumber,
		   WebSite)
     VALUES
           (
		   @Id,
		   @UserName,
           @Email, 
           @PhoneNo,
           @FKAccountType_Id, 
           @Address, 
           @FkCountry_Id,
           @FkCity_Id,
           @Password, 
           @ActiveCode,
		  @CreateDateTime,
		   @LanguageId,
		   @BranchId,
		   @DateOfBirth,
		   @IsActive,
		   @FullName,
		   @NationalityNumber,
		   @WebSite)

		   --نقوم بتحيث الاستفسار الان
		   if(@EnquiryId is not null)
		   update Enquires set IsLinkedClinet=1 , FkClinet_Id =@@IDENTITY where Enquires.Id=@EnquiryId




end 
GO
/****** Object:  StoredProcedure [dbo].[Users_NationalityNumberBeforUsed]    Script Date: 1/30/2020 7:50:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[Users_NationalityNumberBeforUsed] 
@UserId bigint,
@NationalityNumber nvarchar(50)
as begin

select count(*) from Users where NationalityNumber=@NationalityNumber
and (@UserId = 0 or @UserId is null or Id!=@UserId) 

end
GO
/****** Object:  StoredProcedure [dbo].[Users_PhoneNumberBeforUsed]    Script Date: 1/30/2020 7:50:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[Users_PhoneNumberBeforUsed] 
@UserId bigint,
@PhoneNumber nvarchar(50)
as begin

select count(*) from Users where PhoneNo=@PhoneNumber 
and (@UserId = 0 or @UserId is null or Id!=@UserId) 

end
GO
/****** Object:  StoredProcedure [dbo].[Users_SelectAllEmployees]    Script Date: 1/30/2020 7:50:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[Users_SelectAllEmployees]

as begin 

select 
	Users.*,
	WordAccountType.Ar as AccountTypeNameAr,
	WordAccountType.En as AccountTypeNameEn,
	WordCountry.Ar as CountryNameAr,
	WordCountry.En as CountryNameEn,
	WordCity.Ar as CityNameAr,
	WordCity.En as CityNameEn

from Users

join AccountTypes on AccountTypes.Id=users.FKAccountType_Id
left join Countries on Countries.Id=users.FkCountry_Id
left join Cities on Cities.Id=users.FkCity_Id

join Words as WordAccountType on WordAccountType.Id=AccountTypes.FKWord_Id
left join Words as WordCountry on WordCountry.Id=Countries.FKWord_Id
left join Words as WordCity on WordCity.Id=Cities.FKWord_Id
where 
	Users.IsActive=1 and 
	Users.FKAccountType_Id =2 or 
	Users.FKAccountType_Id =3 or 
	Users.FKAccountType_Id =5

end 
GO
/****** Object:  StoredProcedure [dbo].[Users_SelectAllForUsersPrivileges]    Script Date: 1/30/2020 7:50:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[Users_SelectAllForUsersPrivileges]
/*
  ProjectManager = 1,
        Supervisor = 2,
        BranchManager = 3,
        Clinet = 4,
        Employee=5,
        Helper= 6,
        Photographer=7
*/
as begin 

select 
	Users.*,
	WordAccountType.Ar as AccountTypeNameAr,
	WordAccountType.En as AccountTypeNameEn,
	WordCountry.Ar as CountryNameAr,
	WordCountry.En as CountryNameEn,
	WordCity.Ar as CityNameAr,
	WordCity.En as CityNameEn

from Users

join AccountTypes on AccountTypes.Id=users.FKAccountType_Id
left join Countries on Countries.Id=users.FkCountry_Id
left join Cities on Cities.Id=users.FkCity_Id

join Words as WordAccountType on WordAccountType.Id=AccountTypes.FKWord_Id
left join Words as WordCountry on WordCountry.Id=Countries.FKWord_Id
left join Words as WordCity on WordCity.Id=Cities.FKWord_Id
where 
	Users.IsActive=1 and 
	Users.FKAccountType_Id =2 or 
	Users.FKAccountType_Id =3 
end 
GO
/****** Object:  StoredProcedure [dbo].[Users_SelectByAccountType]    Script Date: 1/30/2020 7:50:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[Users_SelectByAccountType]
@AccountTypeId int
as begin 


select * from Users 

where FKAccountType_Id=@AccountTypeId

end
GO
/****** Object:  StoredProcedure [dbo].[Users_SelectByBaicBranchWithWorkTypes]    Script Date: 1/30/2020 7:50:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[Users_SelectByBaicBranchWithWorkTypes]  

as begin 
select 
	Users.*,
	ISNULL(EmployeesWorks.FkWorkType_Id,0) as FkWorkType_Id,
	Branches.IsBasic
from Users 
  join EmployeesWorks on EmployeesWorks.FKUser_Id=Users.Id
  join Branches on Branches.Id=Users.FKPranch_Id 
  where 
  Branches.IsBasic =1
  

  and IsActive=1
end 
GO
/****** Object:  StoredProcedure [dbo].[Users_SelectByBranchId]    Script Date: 1/30/2020 7:50:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[Users_SelectByBranchId]
@BranchId int ,
@AccountTypeId int 
as begin
select Users.*,
EmployeesWorks.FkWorkType_Id
from Users 
left join EmployeesWorks on EmployeesWorks.FKUser_Id=Users.Id
Where FKPranch_Id=@BranchId and FKAccountType_Id=@AccountTypeId and IsActive=1
end
GO
/****** Object:  StoredProcedure [dbo].[Users_SelectByBranchIdWithWorkTypes]    Script Date: 1/30/2020 7:50:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[Users_SelectByBranchIdWithWorkTypes]  
@BranchId bigint

as begin 
select 
	Users.*,
	ISNULL(EmployeesWorks.FkWorkType_Id,0) as FkWorkType_Id
from Users 
  join EmployeesWorks on EmployeesWorks.FKUser_Id=Users.Id
  
  where 
  users.FKPranch_Id=@BranchId
  

  and IsActive=1
end 
GO
/****** Object:  StoredProcedure [dbo].[Users_SelectByFilter]    Script Date: 1/30/2020 7:50:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc   [dbo].[Users_SelectByFilter]
--Paging
@Skip  int ,
@Take int , 

--Filter
@UserName nvarchar(50),
@Email nvarchar(50),
@PhoneNumber nvarchar(50),
@Adddress nvarchar(50),
@CreateDateTo date,
@CreateDateFrom date,
@CountryId int,
@CityId int,
@AccountTypeId int,
@LanguageId int,
@BranchId bigint
as begin
select 
	Users.*,
	WordAccountType.Ar as AccountTypeNameAr,
	WordAccountType.En as AccountTypeNameEn,
	WordCountry.Ar as CountryNameAr,
	WordCountry.En as CountryNameEn,
	WordCity.Ar as CityNameAr,
	WordCity.En as CityNameEn

from users 
join AccountTypes on AccountTypes.Id=users.FKAccountType_Id
left join Countries on Countries.Id=users.FkCountry_Id
left join Cities on Cities.Id=users.FkCity_Id

join Words as WordAccountType on WordAccountType.Id=AccountTypes.FKWord_Id
left join Words as WordCountry on WordCountry.Id=Countries.FKWord_Id
left join Words as WordCity on WordCity.Id=Cities.FKWord_Id
where 
(@UserName		is null  or @UserName		 is null or users.UserName like '%'+@UserName+'%')and
(@Email  		is null  or @Email  		 is null or users.Email like '%'+@Email+'%')and
(@PhoneNumber   is null  or @PhoneNumber    is null or users.PhoneNo like '%'+@PhoneNumber+'%')and
(@Adddress		is null  or @Adddress		  is null or users.Address like '%'+@Adddress+'%')and
(@CreateDateTo  	is null or users.CreateDateTime<=@CreateDateTo )and
(@CreateDateFrom  	is null or users.CreateDateTime>=@CreateDateFrom)and
(@CountryId 		is null or users.FkCountry_Id=@CountryId)and
(@CityId  			is null or users.FkCity_Id=@CityId)and
(@AccountTypeId 	= 0 or users.FKAccountType_Id=@AccountTypeId)and
(@LanguageId 		= 0 or users.FKLanguage_Id=@LanguageId) and
(@BranchId 			= 0 or users.FKPranch_Id=@BranchId) 

order by Id Desc
Offset @Skip rows
fetch next @Take rows only
end 
GO
/****** Object:  StoredProcedure [dbo].[Users_SelectByPk]    Script Date: 1/30/2020 7:50:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[Users_SelectByPk]
@Id bigint as begin 

select 
	Users.*,
	WordAccountType.Ar as AccountTypeNameAr,
	WordAccountType.En as AccountTypeNameEn,
	WordCountry.Ar as CountryNameAr,
	WordCountry.En as CountryNameEn,
	WordCity.Ar as CityNameAr,
	WordCity.En as CityNameEn

from Users

join AccountTypes on AccountTypes.Id=users.FKAccountType_Id
left join Countries on Countries.Id=users.FkCountry_Id
left join Cities on Cities.Id=users.FkCity_Id

join Words as WordAccountType on WordAccountType.Id=AccountTypes.FKWord_Id
left join Words as WordCountry on WordCountry.Id=Countries.FKWord_Id
left join Words as WordCity on WordCity.Id=Cities.FKWord_Id
where Users.Id=@Id
end 
GO
/****** Object:  StoredProcedure [dbo].[Users_SelectByUserNameAndPassword]    Script Date: 1/30/2020 7:50:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[Users_SelectByUserNameAndPassword]
@UserName nvarchar(50),
@Password nvarchar(50) 
 as begin 
select 
	Users.*,
	WordAccountType.Ar as AccountTypeNameAr,
	WordAccountType.En as AccountTypeNameEn,
	WordCountry.Ar as CountryNameAr,
	WordCountry.En as CountryNameEn,
	WordCity.Ar as CityNameAr,
	WordCity.En as CityNameEn
from Users
join AccountTypes on AccountTypes.Id=users.FKAccountType_Id
left join Countries on Countries.Id=users.FkCountry_Id
left join Cities on Cities.Id=users.FkCity_Id
join Words as WordAccountType on WordAccountType.Id=AccountTypes.FKWord_Id
left join Words as WordCountry on WordCountry.Id=Countries.FKWord_Id
left join Words as WordCity on WordCity.Id=Cities.FKWord_Id
where Users.UserName=@UserName and Users.Password=@Password
end 
GO
/****** Object:  StoredProcedure [dbo].[Users_UpateActiveCodeAndEmail]    Script Date: 1/30/2020 7:50:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[Users_UpateActiveCodeAndEmail] 
@UserId bigint,
@ActiveCode nvarchar(50),
@Email nvarchar(50)
as begin 
--تحديث الكود
Update Users 
set ActiveCode =@ActiveCode 
where Id=@UserId

 
end 
GO
/****** Object:  StoredProcedure [dbo].[Users_Update]    Script Date: 1/30/2020 7:50:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[Users_Update]
			@Id bigint  ,
			@UserName nvarchar(50),
           @Email nvarchar(50),
           @PhoneNo nvarchar(50),
           @Address nvarchar(250),
           @FkCountry_Id int,
           @FkCity_Id int,
           @Password nvarchar(50),
		   @LanguageId int,
		   @DateOfBirth date,
		   @IsActive bit,
		   @FullName nvarchar(150),
		   @NationalityNumber nvarchar(20) ,
		   @WebSite nvarchar(500)
as begin
update [dbo].[Users] set
          -- [UserName]			= @UserName,		
           [Email]				=@Email ,
           [PhoneNo]			=@PhoneNo ,
           [Address]			=@Address ,
           [FkCountry_Id]		=@FkCountry_Id ,
           [FkCity_Id]			=@FkCity_Id ,
           [Password]			=@Password ,
		   FKLanguage_Id		=@LanguageId ,
		   DateOfBirth=@DateOfBirth,
		   IsActive=@IsActive,
		     FullName=@FullName,
		   NationalityNumber=@NationalityNumber,
		   WebSite=@WebSite

   where Id=@Id and @Password is not null

   update [dbo].[Users] set
           [UserName]			= @UserName,		
           [Email]				=@Email ,
           [PhoneNo]			=@PhoneNo ,
           [Address]			=@Address ,
           [FkCountry_Id]		=@FkCountry_Id ,
           [FkCity_Id]			=@FkCity_Id ,
		   FKLanguage_Id		=@LanguageId ,
		   DateOfBirth=@DateOfBirth ,
		   IsActive=@IsActive,
		   FullName=@FullName,
		   NationalityNumber=@NationalityNumber,
		   WebSite=@WebSite

   where Id=@Id and @Password is  null
end 
GO
/****** Object:  StoredProcedure [dbo].[Users_UpdateLangage]    Script Date: 1/30/2020 7:50:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[Users_UpdateLangage]
@Id bigint,
@languageId int 
 as begin 
 update Users set FKLanguage_Id=@languageId where Id=@Id
select 
	Users.*,
	WordAccountType.Ar as AccountTypeNameAr,
	WordAccountType.En as AccountTypeNameEn,
	WordCountry.Ar as CountryNameAr,
	WordCountry.En as CountryNameEn,
	WordCity.Ar as CityNameAr,
	WordCity.En as CityNameEn

from Users

join AccountTypes on AccountTypes.Id=users.FKAccountType_Id
left join Countries on Countries.Id=users.FkCountry_Id
left join Cities on Cities.Id=users.FkCity_Id

join Words as WordAccountType on WordAccountType.Id=AccountTypes.FKWord_Id
left join Words as WordCountry on WordCountry.Id=Countries.FKWord_Id
left join Words as WordCity on WordCity.Id=Cities.FKWord_Id
where Users.Id=@Id
end 
GO
/****** Object:  StoredProcedure [dbo].[Users_UserNameBeforUsed]    Script Date: 1/30/2020 7:50:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[Users_UserNameBeforUsed] 
@UserId bigint,
@UserName nvarchar(50)
as begin

select count(*) from Users where LOWER(UserName)=LOWER(@UserName) 
and (@UserId = 0 or @UserId is null or Id!=@UserId) 

end
GO
/****** Object:  StoredProcedure [dbo].[UserSocialAccounts_Delete]    Script Date: 1/30/2020 7:50:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[UserSocialAccounts_Delete]
@Id bigint
as begin

delete UserSocialAccounts where Id=@Id
end
GO
/****** Object:  StoredProcedure [dbo].[UserSocialAccounts_Insert]    Script Date: 1/30/2020 7:50:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[UserSocialAccounts_Insert]
@Id bigint output,
@FKSocialAccountType_Id int , 
@Link nvarchar(max),
@FKUser_Id bigint
as begin

INSERT INTO [dbo].[UserSocialAccounts]
           ([FKSocialAccountType_Id]
           ,[Link]
           ,[FKUser_Id])
     VALUES
           (@FKSocialAccountType_Id,@Link,@FKUser_Id)
		   select @Id=@@IDENTITY
end
GO
/****** Object:  StoredProcedure [dbo].[UserSocialAccounts_SelectAllByUserId]    Script Date: 1/30/2020 7:50:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[UserSocialAccounts_SelectAllByUserId]
@UserId bigint
as begin

select 
UserSocialAccounts.*,
Words.Ar as AccountTypeNameAr,
Words.Ar as AccountTypeNameEn

from UserSocialAccounts
join SocialAccountTypes on SocialAccountTypes.Id=UserSocialAccounts.FKSocialAccountType_Id
join Words on Words.Id=SocialAccountTypes.FkWord_Id
where FKUser_Id=@UserId
end
GO
/****** Object:  StoredProcedure [dbo].[UsersPrivileges_ChekcIfIsClosed]    Script Date: 1/30/2020 7:50:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[UsersPrivileges_ChekcIfIsClosed]
@Id bigint 
as begin 



select count(*) from UserPayments where Id=@Id 
and dbo.UserPayments_CheckIsClosed(UserPayments.IsAcceptFromManger,UserPayments.PaymentImage)  =1
end
GO
/****** Object:  StoredProcedure [dbo].[UsersPrivileges_SelectByMenuId]    Script Date: 1/30/2020 7:50:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[UsersPrivileges_SelectByMenuId]
@menuId int , 
@userId bigint 
as begin 

select  
		Pages.Id as Page_Id , 
		Pages.Url as Pages_Url, 
		Pages.OrderByNumber as Pages_OrderByNumber,
		PageWord.Ar as Pages_NameAr,
		PageWord.En as Pages_NameEn,
		
		UserPrivileges.Id as UsersPrivileges_Id,
		UserPrivileges.CanAdd as UsersPrivileges_CanAdd,
		UserPrivileges.CanDelete as UsersPrivileges_CanDelete,
		UserPrivileges.CanDisplay as UsersPrivileges_CanDisplay,
		UserPrivileges.CanEdit as UsersPrivileges_CanEdit


from Pages

join Words as PageWord on PageWord.Id=Pages.FKWord_Id
left join UserPrivileges on UserPrivileges.FKPage_Id=Pages.Id and UserPrivileges.FkUser_Id=@userId

where 
Pages.FkMenu_Id=@menuId
and Pages.IsForAdmin =1
end 
GO
/****** Object:  StoredProcedure [dbo].[Words_Delete]    Script Date: 1/30/2020 7:50:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[Words_Delete]
@Id bigint 
as begin 
delete Words where Id=@Id

end 
GO
/****** Object:  StoredProcedure [dbo].[Words_DeleteList]    Script Date: 1/30/2020 7:50:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[Words_DeleteList]
@Ids nvarchar(max)
as begin 

declare @ides table(id bigint)
insert @ides
select value from string_split(@Ids,',');

delete Words where Id in (select id from @ides)

end
GO
/****** Object:  StoredProcedure [dbo].[Words_Insert]    Script Date: 1/30/2020 7:50:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[Words_Insert] 
@ar nvarchar(max),@en nvarchar(max)
as begin
declare @Id bigint ;
set @Id=(select isnull(max(Id),0)+1 from Words);
insert Words (Id,Ar,En) values (@Id,@ar,@en)
return @Id

end 
GO
/****** Object:  StoredProcedure [dbo].[Words_Update]    Script Date: 1/30/2020 7:50:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[Words_Update]
@Id bigint,
@Ar nvarchar(max),
@En nvarchar(max)
as begin

update Words set Ar=@Ar,
En=@En
where Id=@Id

end
GO
USE [master]
GO
ALTER DATABASE [Layal] SET  READ_WRITE 
GO

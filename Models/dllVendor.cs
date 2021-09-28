using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.SqlClient;

namespace CitySeva.Models
{
    public class dllVendor
    {
        public DataTable GetVendorContactDetails(int vendorId)
        {
            SqlParameter[] pram = { new SqlParameter("@VendorId", vendorId) };
            return DataHealper.DbExecuteDataTable("usp_get_vendor_details_by_Id", pram);
        }


        public string UpdateVendorContactDetails(int vendorId, string fname,
            string lname, string email, string mobile, string address, string city, string pinCode, string state)
        {
            SqlParameter[] pram = {
             new SqlParameter("@VendorId", vendorId),
             new SqlParameter("@fname", fname),
             new SqlParameter("@lname", lname),
             new SqlParameter("@email", email),
             new SqlParameter("@mobile", mobile),
             new SqlParameter("@address", address),
             new SqlParameter("@city", city),
             new SqlParameter("@PinCode", pinCode),
             new SqlParameter("@State", state),
            };


            return DataHealper.DbExecuteExecuteScalar("usp_get_vendor_details_update", pram).ToString();
        }


        public DataTable GetVendorBusinessDetails(int vendorId)
        {
            SqlParameter[] pram = { new SqlParameter("@vendorId", vendorId) };
            return DataHealper.DbExecuteDataTable("UspVendorBusinessContactGet", pram);
        }

        public string UpdateVendorBusinessDetails(int vandor_Id, string business_name,
            string business_address, string category, string city, string other_city, string travel_and_stay, string business_running_from, string pinCode, string state)
        {
            SqlParameter[] pram = {
             new SqlParameter("@vandor_Id", vandor_Id),
             new SqlParameter("@business_name", business_name),
             new SqlParameter("@business_address", business_address),
             new SqlParameter("@category", category),
             new SqlParameter("@city", city),
             new SqlParameter("@other_city", other_city),
             new SqlParameter("@travel_and_stay", travel_and_stay),
             new SqlParameter("@business_running_from", business_running_from),
             new SqlParameter("@pinCode", pinCode),
             new SqlParameter("@state", state),
            };


            return DataHealper.DbExecuteExecuteScalar("UspVendorBusinessContactInsertUpdate", pram).ToString();
        }


        public DataTable GetIProductIems()
        {
            return DataHealper.DbExecuteDataTable("usp_items_get_list");

        }
        public DataTable GetIServicesIems()
        {
            return DataHealper.DbExecuteDataTable("usp_Service_get_list");

        }
        public string SaveVendorImage(int Id, string ImageName, string ImagePath, int addedBy)
        {
            SqlParameter[] pram = {new SqlParameter("@Id", Id), new SqlParameter("@ImageName", ImageName),
                new SqlParameter("@ImagePath", ImagePath), new SqlParameter("@AddedBy", addedBy) };

            return DataHealper.DbExecuteExecuteScalar("uspVendorImagesInsert", pram).ToString();
        }
        public DataTable GetVendorImages(int Id)
        {
            SqlParameter[] pram = { new SqlParameter("@VendorId", Id) };
            return DataHealper.DbExecuteDataTable("uspVendorImagesGet", pram);
        }
        public DataTable GetVendorImagesById(int Id)
        {
            SqlParameter[] pram = { new SqlParameter("@Id", Id) };
            return DataHealper.DbExecuteDataTable("uspVendorImagesGetById", pram);
        }
        public DataTable GetBusinessInfoById(int Id)
        {
            SqlParameter[] pram = { new SqlParameter("@UserId", Id) };
            return DataHealper.DbExecuteDataTable("usp_BusinessInfo_get_by_Id", pram);
        }
        public string SaveBusinessInfo(int Id, string BusinessInfo, int addedBy)
        {
            SqlParameter[] pram = {new SqlParameter("@Id", Id), new SqlParameter("@BusinessInfo", BusinessInfo),
                  new SqlParameter("@AddedBy", addedBy) };

            return DataHealper.DbExecuteExecuteScalar("usp_BusinessInfo_add_update", pram).ToString();
        }

        public string SaveServiceAndProduct(int Id, string ServiceType, string PerPlatePrice, int NumOfGuest, int addedBy)
        {
            SqlParameter[] pram = {new SqlParameter("@Id", Id)
                    , new SqlParameter("@ServiceType", ServiceType)
                    ,  new SqlParameter("@PerPlatePrice", PerPlatePrice)
                    ,  new SqlParameter("@NumOfGuest", NumOfGuest)
                    ,  new SqlParameter("@AddedBy", addedBy)

            };

            return DataHealper.DbExecuteExecuteScalar("[usp_ProductAndServiceInsert]", pram).ToString();
        }
        public string SaveServiceItem(Int32 ProductServiceId, string CookingItem, string ItemType, string ItemName, bool IsItem)
        {
            SqlParameter[] pram = {new SqlParameter("@ProductServiceId", ProductServiceId)
                    , new SqlParameter("@CookingItem", CookingItem)
                    ,  new SqlParameter("@ItemType", ItemType)
                    ,  new SqlParameter("@ItemName", ItemName)
                    ,  new SqlParameter("@IsItem", IsItem)


            };

            return DataHealper.DbExecuteExecuteScalar("[Usp_ServiceItem_insert]", pram).ToString();
        }

        public string SaveServiceOffered(Int32 ServiceProductId, string ServiceOfferedId)
        {
            SqlParameter[] pram = {new SqlParameter("@ServiceProductId", ServiceProductId)
                    , new SqlParameter("@ServiceOfferedId", ServiceOfferedId)
                   


            };

            return DataHealper.DbExecuteExecuteScalar("[Usp_ServiceOffered_insert]", pram).ToString();
        }
        public DataSet GetSerivceTpye(Int32 Id, string ServiceType)
        {
            SqlParameter[] pram = { new SqlParameter("@AddedBy", Id), new SqlParameter("@ServiceType", ServiceType) };
            return DataHealper.DbExecuteDataSet("Usp_GetPlaterSystes", pram);
        }
    }
}
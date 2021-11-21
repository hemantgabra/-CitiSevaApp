using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.SqlClient;
namespace CitySeva.Models
{
    public class dllVendeRregistration
    {



        public string VendeRregistrationAdd(string name, string mobile, string address, string emalId, string catis, string locationI
            , string img1_url, string img2_url, string img3_url, string img4_url, string img5_url,
             string business_name, string business_address, string price_start_from, string number_of_guest, string package, string service_name, string payment_mode, string booking_amount,
             string description, string price_per_plate_from, string cooking_package, string Service_offer, string Cancellation_Order)
        {
            string result = "";
            try
            {


                SqlParameter[] pram =
              {
              new SqlParameter("@name",name.Trim()),
               new SqlParameter("@mobile",mobile),
               new SqlParameter("@address",address),
               new SqlParameter("@email",emalId),
              // new SqlParameter("@date",emalId),
               new SqlParameter("@category",catis),
               new SqlParameter("@sub_category",locationI),

                new SqlParameter("@img1_url",img1_url),
                 new SqlParameter("@img2_url",img2_url),
                  new SqlParameter("@img3_url",img3_url),
                   new SqlParameter("@img4_url",img4_url),
                    new SqlParameter("@img5_url",img5_url),

                     new SqlParameter("@business_name",business_name),
                      new SqlParameter("@business_address",business_address),
                       new SqlParameter("@price_start_from",price_start_from),
                        new SqlParameter("@number_of_guest",number_of_guest),
                         new SqlParameter("@package",package),
                          new SqlParameter("@service_name",service_name),
                           new SqlParameter("@payment_mode",payment_mode),
                            new SqlParameter("@booking_amount",booking_amount),
                            new SqlParameter("@description",description),
                            new SqlParameter("@price_per_plate_from",price_per_plate_from),
                            new SqlParameter("@cooking_package",cooking_package),

                            new SqlParameter("@Service_offer",Service_offer),
                            new SqlParameter("@Cancellation_Order",Cancellation_Order),

           };

                result = DataHealper.DbExecuteExecuteScalar("dbo.[usp_tbl_venderregistration_add]", pram).ToString();

            }
            catch (Exception ex)
            {

                throw;
            }
            return result;

        }


        public string VendeRregistrationUpdate(int venderId, string name, string mobile, string address, string emalId, string catis, string location
              , string img1_url, string img2_url, string img3_url, string img4_url, string img5_url,

             string business_name, string business_address, string price_start_from, string number_of_guest, string package, string service_name, string payment_mode, string booking_amount,
              string description, string price_per_plate_from, string cooking_package, string Service_offer, string Cancellation_Order)
        {
            string result = "";
            try
            {


                SqlParameter[] pram =
              {
               new SqlParameter("@id",venderId),
              new SqlParameter("@name",name.Trim()),
               new SqlParameter("@mobile",mobile.Trim()),
               new SqlParameter("@address",address.Trim()),
               new SqlParameter("@email",emalId.Trim()),
              // new SqlParameter("@date",emalId),
               new SqlParameter("@category",catis.Trim()),
               new SqlParameter("@sub_category",location.Trim()),

                new SqlParameter("@img1_url",img1_url),
               new SqlParameter("@img2_url",img2_url),
                 new SqlParameter("@img3_url",img3_url),
                   new SqlParameter("@img4_url",img4_url),
                    new SqlParameter("@img5_url",img5_url),

                     new SqlParameter("@business_name",business_name.Trim()),
                      new SqlParameter("@business_address",business_address.Trim()),
                       new SqlParameter("@price_start_from",price_start_from.Trim()),
                        new SqlParameter("@number_of_guest",number_of_guest.Trim()),
                         new SqlParameter("@package",package.Trim()),
                          new SqlParameter("@service_name",service_name.Trim()),
                           new SqlParameter("@payment_mode",payment_mode.Trim()),
                            new SqlParameter("@booking_amount",booking_amount.Trim()),
                            new SqlParameter("@description",description),
                            new SqlParameter("@price_per_plate_from",price_per_plate_from),
                            new SqlParameter("@cooking_package",cooking_package),
                            new SqlParameter("@Service_offer",Service_offer),
                            new SqlParameter("@Cancellation_Order",Cancellation_Order),


           };

                result = DataHealper.DbExecuteExecuteScalar("dbo.[usp_tbl_venderregistration_update]", pram).ToString();

            }
            catch (Exception ex)
            {

                throw;
            }
            return result;

        }

        public DataTable GetAllVendorById(int vendorid)
        {
            SqlParameter[] pram =
            {
              new SqlParameter("@Id",vendorid)


            };

            return DataHealper.DbExecuteDataTable("usp_venderregistration_GetById", pram);

        }

        public DataTable GetAllVendor()
        {
            return DataHealper.DbExecuteDataTable("dbo.[usp_tbl_venderregistration_GetAlladmin]");

        }
        public DataTable GetAllVendorSearch(string service, string location)
        {
            SqlParameter[] pram =
            {
              new SqlParameter("@service",service.Trim()),
               new SqlParameter("@location",location.Trim())

            };

            return DataHealper.DbExecuteDataTable("usp_tbl_venderregistration_GetAllBySearch", pram);

        }


        public DataTable GetVendorListingstring(string service, string location)
        {
            SqlParameter[] pram =
            {
              new SqlParameter("@service",service.Trim()),
               new SqlParameter("@location",location.Trim())

            };

            return DataHealper.DbExecuteDataTable("usp_GetVendorListing", pram);

        }
        public string DeleteVendeRregistration(int ID)
        {
            SqlParameter[] pram =
           {
               new SqlParameter("@Id",ID) ,


           };

            return DataHealper.DbExecuteExecuteScalar("usp_venderregistration_DeleteById", pram).ToString();

        }


        public DataTable GetAllVendorLostForOrder()
        {
            return DataHealper.DbExecuteDataTable("dbo.[usp_venderregistration_GetList]");

        }
        public DataTable GetCategoryListForVendorOrder()
        {
            return DataHealper.DbExecuteDataTable("dbo.[Usp_GetCategoryListForVendorOrder]");

        }

        public DataTable GetAllVendorLostForOrderByid(int catid)
        {
            SqlParameter[] pram =
            {
              new SqlParameter("@catID",catid)


            };

            return DataHealper.DbExecuteDataTable("dbo.[usp_venderregistration_GetListByID]", pram);

        }
    }
}
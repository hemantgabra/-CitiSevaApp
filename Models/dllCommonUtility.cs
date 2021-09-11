using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.SqlClient;

namespace CitySeva.Models
{
    public class dllCommonUtility
    {
        public DataTable GetCategoryList()
        {
            DataTable dt = DataHealper.DbExecuteDataTable("usp_category_GetList");
            return dt;
        }
        public DataTable GetLocationList()
        {
            DataTable dt = DataHealper.DbExecuteDataTable("dbo.usp_location_GetList");
            return dt;
        }

        public DataTable GetLocationCategoryDisplayOrder(string ListType)
        {
            SqlParameter[] pram = { new SqlParameter("@SelectType",ListType),
          };
            DataTable dt = DataHealper.DbExecuteDataTable("dbo.USP_GetLocationAndCategory", pram);
            return dt;
        }
        public string GetLocationCategoryUpdateOrder(string order, string ListType)
        {
            SqlParameter[] pram = { new SqlParameter("@Order_str",order),
                new SqlParameter("@SelectType",ListType)
          };
            return DataHealper.DbExecuteExecuteScalar("dbo.USP_SetOrder", pram).ToString();

        }

        public string VenderregistrationSetOrder(string order)
        {
            SqlParameter[] pram = { new SqlParameter("@Order_str",order)

          };
            return DataHealper.DbExecuteExecuteScalar("dbo.USP_venderregistrationSetOrder", pram).ToString();

        }
        public string RequestQuoteAdd(string FullName, string Email_Id, string PhoneNumber,
            string EventDate, string MessageRequest, string BusinessId)
        {
            SqlParameter[] pram = { new SqlParameter("@FullName",FullName.Trim()),
                 new SqlParameter("@Email_Id",Email_Id.Trim()),
                  new SqlParameter("@PhoneNumber",PhoneNumber.Trim()),
                   new SqlParameter("@EventDate",EventDate.Trim()),
                new SqlParameter("@MessageRequest",MessageRequest),
                new SqlParameter("@BusinessId",BusinessId)

          };
            return DataHealper.DbExecuteExecuteScalar("dbo.usp_tbl_RequestQuote_add", pram).ToString();

        }
        public DataTable GetRequestList()
        {
            DataTable dt = DataHealper.DbExecuteDataTable("dbo.usp_RequestQuoteGet");
            return dt;
        }

        public string RequestActiveInActive(string UserId, bool IsActive)
        {
            string result = "";
            try
            {

                SqlParameter[] pram =
              {
               new SqlParameter("@userID",UserId),
              new SqlParameter("@IsActive",IsActive),



           };

                result = DataHealper.DbExecuteExecuteScalar("dbo.[usp_tbl_RequestQuote_ActiveInactive]", pram).ToString();

            }
            catch (Exception ex)
            {

                throw;
            }
            return result;

        }

    }
}
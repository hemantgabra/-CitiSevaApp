using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web; 
namespace CitySeva.Models
{
    public class dllAddCategory
    {
        public string AddCategoryName(string categoryName, string description, bool isActive)
        {
            SqlParameter[] pram =
           {
              new SqlParameter("@catgory_name",categoryName.Trim()),
               new SqlParameter("@description",description),
               new SqlParameter("@is_active",isActive),

           };
            
            return DataHealper.DbExecuteExecuteScalar("dbo.[usp_category_add]", pram).ToString();

        }
        public string UpdateCategoryName(int CategoryID, string categoryName, string description, bool isActive)
        {
            SqlParameter[] pram =
           {
               new SqlParameter("@categoryId",CategoryID) ,
               new SqlParameter("@catgory_name",categoryName.Trim()),
               new SqlParameter("@description",description),
               new SqlParameter("@is_active",isActive),

           };

            return DataHealper.DbExecuteExecuteScalar("dbo.[usp_category_update]", pram).ToString();

        }

        public DataTable GetAllCategories()
        {
            return DataHealper.DbExecuteDataTable("dbo.[usp_category_GetAll]");

        }
        public DataTable GetAllCategoriesList()
        {
            return DataHealper.DbExecuteDataTable("dbo.[usp_category_GetList]");

        }

        public DataTable GetCategoryById(int CategoryID)
        {
            SqlParameter[] pram = { new SqlParameter("@categoryId", CategoryID) };
            return DataHealper.DbExecuteDataTable("dbo.[usp_category_GetById]", pram);

        }

        public string DeleteCategoryName(int CategoryID)
        {
            SqlParameter[] pram =
           {
               new SqlParameter("@categoryId",CategoryID) ,


           };

            return DataHealper.DbExecuteExecuteScalar("dbo.usp_category_DeleteById", pram).ToString();

        }

    }
}
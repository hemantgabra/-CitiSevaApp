using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.SqlClient;

namespace CitySeva.Models
{
    public class dllLocation
    {

        public string Addlocation(string location, string description, bool isActive)
        {
            SqlParameter[] pram =
           {
              new SqlParameter("@location",location.Trim()),
               new SqlParameter("@description",description),
               new SqlParameter("@is_active",isActive),

           };

            return DataHealper.DbExecuteExecuteScalar("dbo.[usp_location_add]", pram).ToString();

        }
        public string Updatelocation(int Id, string location, string description, bool isActive)
        {
            SqlParameter[] pram =
           {
               new SqlParameter("@Id",Id) ,
               new SqlParameter("@location",location.Trim()),
               new SqlParameter("@descritpion",description),
               new SqlParameter("@is_active",isActive),

           };

            return DataHealper.DbExecuteExecuteScalar("dbo.[usp_location_update]", pram).ToString();

        }

        public DataTable GetAlllocation()
        {
            return DataHealper.DbExecuteDataTable("dbo.[usp_location_GetAll]");

        }

        public DataTable GetlocationById(int Id)
        {
            SqlParameter[] pram = { new SqlParameter("@Id", Id) };
            return DataHealper.DbExecuteDataTable("dbo.[usp_location_GetById]", pram);

        }

        public string Deletelocation(int id)
        {
            SqlParameter[] pram =
           {
               new SqlParameter("@id",id) ,


           };

            return DataHealper.DbExecuteExecuteScalar("usp_location_DeleteById", pram).ToString();

        }
    }
}
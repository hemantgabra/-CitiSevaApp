using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.SqlClient;
namespace CitySeva.Models
{
    public class dllPlanningTool
    {


        public string AddTools(string tool_id, string tool_name, string description, string heding, bool isActive)
        {
            SqlParameter[] pram =
           {
              new SqlParameter("@tool_id",tool_id.Trim()),
              new SqlParameter("@tool_name",tool_name.Trim()),
              new SqlParameter("@tool_description",description.Trim()),
               new SqlParameter("@heding",heding),
               new SqlParameter("@is_active",isActive),
                new SqlParameter("@val",1),

           };

            return DataHealper.DbExecuteExecuteScalar("dbo.[add_planning_tool_master]", pram).ToString();

        }
        public string UpdateTools(string tool_id, string tool_name, string description, string heding, bool isActive)
        {
            SqlParameter[] pram =
           {
               new SqlParameter("@tool_id",tool_id.Trim()),
              new SqlParameter("@tool_name",tool_name.Trim()),
              new SqlParameter("@tool_description",description.Trim()),
               new SqlParameter("@heding",heding),
               new SqlParameter("@is_active",isActive),
                new SqlParameter("@val",3),

           };

            return DataHealper.DbExecuteExecuteScalar("dbo.[add_planning_tool_master]", pram).ToString();

        }

        public DataTable GetAllTools()
        {
            SqlParameter[] pram =
             {

                new SqlParameter("@val",4),

           };
            return DataHealper.DbExecuteDataTable("dbo.[add_planning_tool_master]", pram);

        }

        public DataTable GetAllToolsUser()
        {

            return DataHealper.DbExecuteDataTable("dbo.[usp_tbl_planning_checklist]");

        }


        public DataTable GetToolsById(int id)
        {
            SqlParameter[] pram =
             {

                 new SqlParameter("@tool_id",id),
                new SqlParameter("@val",5),

           };
            return DataHealper.DbExecuteDataTable("dbo.[add_planning_tool_master]", pram);

        }

        public string DeleteTools(int Id)
        {
            SqlParameter[] pram =
           {
                 new SqlParameter("@tool_id",Id) ,
               new SqlParameter("@val",2) ,


           };

            return DataHealper.DbExecuteExecuteScalar("add_planning_tool_master", pram).ToString();

        }

        public string UserPlanningToolSave(string UserId, string ToolIds)

        {
            string result = "";
            try
            {

                SqlParameter[] pram =
              {
               new SqlParameter("@UserId",UserId),
              new SqlParameter("@ToolsIds",ToolIds)




           };

                result = DataHealper.DbExecuteExecuteScalar("dbo.[usp_user_planning_tools_add]", pram).ToString();

            }
            catch (Exception ex)
            {

                throw;
            }
            return result;

        }



        public DataTable GetToolsUserById(int userId)
        {
            SqlParameter[] pram =
             {

                 new SqlParameter("@UserId",userId)


           };
            return DataHealper.DbExecuteDataTable("dbo.[usp_user_planning_tools_Get]", pram);

        }

        public DataTable GetPlanningToolsAlUsers()
        {
            return DataHealper.DbExecuteDataTable("dbo.[usp_user_planning_tools_GetAllUsers]");

        }
    }
}
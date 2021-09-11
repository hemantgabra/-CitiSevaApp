using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data.SqlClient;
using System.Data;
namespace CitySeva.Models
{
    public class dllUserRegistration
    {
        public string UserRregistrationAdd(string fname, string lname, string email, string password, string date, string mobile
           , string username, string address)
        {
            string result = "";
            try
            {

                SqlParameter[] pram =
              {
              new SqlParameter("@fname",fname.Trim()),
               new SqlParameter("@lname",lname),
               new SqlParameter("@email",email.Trim()),
               new SqlParameter("@password",password),
               new SqlParameter("@date",date),
               new SqlParameter("@mobile",mobile),
               new SqlParameter("@username",username),
                new SqlParameter("@address",address)



           };

                result = DataHealper.DbExecuteExecuteScalar("dbo.[Usp_Registartion_Add]", pram).ToString();

            }
            catch (Exception ex)
            {

                throw;
            }
            return result;

        }

        public string UserRregistrationUpdate(string UserId, string fname, string lname, string date, string mobile
         , string username, string address)
        {
            string result = "";
            try
            {

                SqlParameter[] pram =
              {
                    new SqlParameter("@UserId",UserId),
              new SqlParameter("@fname",fname.Trim()),
               new SqlParameter("@lname",lname),
               new SqlParameter("@date",date),
               new SqlParameter("@mobile",mobile),
               new SqlParameter("@username",username),
                new SqlParameter("@address",address)



           };

                result = DataHealper.DbExecuteExecuteScalar("dbo.[Usp_Registartion_Update]", pram).ToString();

            }
            catch (Exception ex)
            {

                throw;
            }
            return result;

        }


        public DataTable GetUserDetails(string userId)
        {
            DataTable dt = new DataTable();
            try
            {

                SqlParameter[] pram =
              {
              new SqlParameter("@UserId",userId.Trim())

           };

                dt = DataHealper.DbExecuteDataTable("dbo.[Usp_Registartion_ByUserId]", pram);

            }
            catch (Exception ex)
            {

                throw;
            }
            return dt;

        }


        public string UserRregistrationChangePassword(string UserId, string oldPassword, string newPassword)

        {
            string result = "";
            try
            {

                SqlParameter[] pram =
              {
               new SqlParameter("@UserId",UserId),
              new SqlParameter("@oldPassword",oldPassword),
               new SqlParameter("@newPassword",newPassword),



           };

                result = DataHealper.DbExecuteExecuteScalar("dbo.[Usp_Registartion_ChangePassword]", pram).ToString();

            }
            catch (Exception ex)
            {

                throw;
            }
            return result;

        }

        public DataTable ForgetPasswordByEmail(string EmailId)
        {
            DataTable dt = new DataTable();
            try
            {

                SqlParameter[] pram =
              {
              new SqlParameter("@emailId",EmailId.Trim())

           };

                dt = DataHealper.DbExecuteDataTable("dbo.[Usp_Registartion_ForGotPassword]", pram);

            }
            catch (Exception ex)
            {

                throw;
            }
            return dt;

        }
        public string UserRregistrationActiveInActive(string UserId, bool IsActive)
        {
            string result = "";
            try
            {

                SqlParameter[] pram =
              {
               new SqlParameter("@userID",UserId),
              new SqlParameter("@IsActive",IsActive),



           };

                result = DataHealper.DbExecuteExecuteScalar("dbo.[usp_registartion_ActiveInactive]", pram).ToString();

            }
            catch (Exception ex)
            {

                throw;
            }
            return result;

        }




    }
}
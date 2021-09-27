using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace CitySeva.Models
{
    public class DataHealper
    {
        private static string DbConnection = string.Empty;
        static DataHealper()
        {
            DbConnection = ConfigurationManager.ConnectionStrings["conn"].ConnectionString;
        }

        public static object DbExecuteExecuteScalar(string commandText, params SqlParameter[] commandParameters)
        {

            using (var connection = new SqlConnection(DbConnection))
            using (var command = new SqlCommand(commandText, connection))
            {
                connection.Open();
                command.CommandType = CommandType.StoredProcedure;
                command.Parameters.AddRange(commandParameters);

                return command.ExecuteScalar();
            }

        }

        public static DataTable DbExecuteDataTable(string commandText, params SqlParameter[] parameters)
        {
            using (var connection = new SqlConnection(DbConnection))
            using (var command = new SqlCommand(commandText, connection))
            {
                DataTable dataTable = new DataTable();
                command.CommandType = CommandType.StoredProcedure;
                command.Parameters.AddRange(parameters);
                SqlDataAdapter da = new SqlDataAdapter(command);
                da.Fill(dataTable);
                connection.Close();
                return dataTable;
            }
        }
        public static DataSet DbExecuteDataSet(string commandText, params SqlParameter[] parameters)
        {
            DataSet ds = new DataSet();
            using (var connection = new SqlConnection(DbConnection))
            using (var command = new SqlCommand(commandText, connection))
            {
                DataTable dataTable = new DataTable();
                command.CommandType = CommandType.StoredProcedure;
                command.Parameters.AddRange(parameters);
                SqlDataAdapter da = new SqlDataAdapter(command);
                da.Fill(ds);
                connection.Close();
                return ds;
            }
        }


        public static DataTable DbExecuteDataTable(string commandText)
        {
            using (var connection = new SqlConnection(DbConnection))
            using (var command = new SqlCommand(commandText, connection))
            {
                DataTable dataTable = new DataTable();
                command.CommandType = CommandType.StoredProcedure;
                SqlDataAdapter da = new SqlDataAdapter(command);
                da.Fill(dataTable);
                connection.Close();
                return dataTable;
            }
        }
        public static DataTable ExecuteDataTable(string sql)
        {
            DataTable dtTable = new DataTable("Result");
            SqlConnection con = new SqlConnection(DbConnection);
            try
            {
                con.Open();
                SqlCommand cmd = new SqlCommand(sql, con);
                cmd.CommandTimeout = 0;
                dtTable.Load(cmd.ExecuteReader(CommandBehavior.CloseConnection));
                cmd.Connection.Close();
                cmd.Dispose();
            }

            catch (Exception ex)
            {
                throw ex;

            }
            finally
            {
                if (con.State == ConnectionState.Open) con.Close();
                con.Dispose();
            }

            return dtTable;
        }
    }
}
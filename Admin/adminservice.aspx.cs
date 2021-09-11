using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Services;
using CitySeva.Models;
namespace QaToolApp
{
    public partial class adminservice : System.Web.UI.Page
    {

        protected void Page_Load(object sender, EventArgs e)
        {
        }

        [WebMethod]
        public static List<EntityCategory> getCategory(string CatName) 
        {
            List<EntityCategory> CatObj = new List<EntityCategory>();
            string cs = ConfigurationManager.ConnectionStrings["conn"].ToString();
            try
            {
                using (SqlConnection con = new SqlConnection(cs))
                {
                    using (SqlCommand com = new SqlCommand())
                    {
                        com.CommandText = string.Format("select categoryId,catgory_name from tbl_category where  catgory_name like '{0}%'", CatName);
                        com.Connection = con;
                        con.Open();
                        SqlDataReader sdr = com.ExecuteReader();
                        EntityCategory Cat = null;
                        while (sdr.Read())
                        {
                            Cat = new EntityCategory();
                            // Cat.catgory_name = Convert.ToInt32(sdr["catgory_name"]);
                            Cat.catgory_name = Convert.ToString(sdr["catgory_name"]);
                            //Cat.Address = Convert.ToString(sdr["Address"]);
                            CatObj.Add(Cat);
                        }
                    }
                }
            }
            catch (Exception ex)
            {
                Console.WriteLine("Error {0}", ex.Message);
            }
            return CatObj;
        }

        [WebMethod]
        public  static string UpdateOrder(string order , string type)
        {
            dllCommonUtility commonUtilityOBJ = new dllCommonUtility();
            string result = commonUtilityOBJ.GetLocationCategoryUpdateOrder(order, type);
            return result;


        }

        [WebMethod]
        public static string VenderregistrationSetOrder(string order) 
        {
            dllCommonUtility commonUtilityOBJ = new dllCommonUtility();
            string result = commonUtilityOBJ.VenderregistrationSetOrder(order);
            return result;


        }
    }
}
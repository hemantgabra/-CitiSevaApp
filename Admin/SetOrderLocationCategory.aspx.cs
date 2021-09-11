using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using CitySeva.Models;
namespace CitySeva.Admin
{
    public partial class SetOrderLocationCategory : System.Web.UI.Page
    {
        dllCommonUtility commonUtilityOBJ = new dllCommonUtility();
        protected void Page_Load(object sender, EventArgs e)
        {

        }



        //protected void btnSubmit_Click(object sender, EventArgs e)
        //{
        //    string list = "";
           
        //    for (int i = 0; i < lstCatLoc.Items.Count-1; i++)
        //    {

        //        list += lstCatLoc.Items[i].Value + "^" +( lstCatLoc.SelectedIndex + 1)+",";
        //    }
        //    list = list.Substring(0, list.Length-1);
        //   string result=  commonUtilityOBJ.GetLocationCategoryUpdateOrder(list, ddlListType.SelectedValue);
        //    if (result == "1")
        //    {
        //        ShowMessage("Order Updated Successfully");
        //    }
        //    else
        //    {
        //        ShowMessage("Order no Updated");
        //    }
        //}

        protected void ddlListType_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (ddlListType.SelectedValue == "0")
            {

                ShowMessage("Please list type");
            }
            else
            {
                DataTable dt = commonUtilityOBJ.GetLocationCategoryDisplayOrder(ddlListType.SelectedValue);
                if (dt.Rows.Count > 0)
                {
                    lstCatLoc.SelectedIndex = -1;
                    lstCatLoc.DataSource = dt;
                    lstCatLoc.DataValueField = "ItemID";
                    lstCatLoc.DataTextField = "ItemText";
                    lstCatLoc.DataBind();



                }


            }
        }
        void ShowMessage(string msg)
        {
            ClientScript.RegisterStartupScript(Page.GetType(), "validation", "<script language = 'javascript' > alert('" + msg + "');</ script > ");
        }
    }
}
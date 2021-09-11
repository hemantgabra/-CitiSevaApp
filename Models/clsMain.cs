using System;
using System.Data;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;


namespace CitySeva.Models
{
    internal class clsUserInfo
    {

        #region Property List For User

        string strUserName;
        string strEmailID = "";
        string strUserRole = "";

        public Int32 UserID
        {
            get;
            set;
        }


        public string UserName
        {
            get { return strUserName; }

            set { strUserName = value; }
        }

        public string EmailID
        {
            get { return strEmailID; }

            set { strEmailID = value; }
        }



        public Int32 IsActive
        {
            get;
            set;
        }

        public Int32 IsExternal
        {
            get;
            set;
        }

        public Int32 RoleID
        {
            get;
            set;
        }

        #endregion

    }

    internal class clsMain
    {

        #region "" DATA SECURITY ""

        /// <summary> 
        /// This function will Clean the Input data and replace Single Quotes and "SCRIPT" tag and make it WEB Save and prevent Hacking 
        /// </summary> 
        /// <param name="SourceData">Variable to be replaced</param> 
        /// <returns>Cleaned Data</returns> 
        /// <remarks></remarks> 
        public static string Clean(string SourceData)
        {
            string CleanedData = Clean(SourceData, true, false);
            return CleanedData;
        }

        public static string Clean(string SourceData, bool HTMLAllowed, bool scriptTagAllowed)
        {
            string SRC;
            SRC = "";
            if (SourceData != "" & SourceData != null)
            {

                SRC = SourceData;
                // SRC = SourceData.Trim();
                // Replace single quote 
                SRC = SRC.Replace("'", "''");
                SRC = SRC.Replace("<", "&lt;");
                SRC = SRC.Replace(">", "&gt;");

                if (HTMLAllowed == false)
                {
                    SRC = HttpContext.Current.Server.UrlEncode(SRC);
                }
                else
                {
                    if (scriptTagAllowed == false)
                    {
                        // Replace SCRIPT Tag 

                        SRC = SRC.Replace("<script", "&lt;script");
                        SRC = SRC.Replace("</script", "&lt;/script");

                        SRC = SRC.Replace("<input", "&lt;input");
                        SRC = SRC.Replace("</input", "&lt;/input");

                        SRC = SRC.Replace("<form", "&lt;form");
                        SRC = SRC.Replace("</form", "&lt;/form");

                        SRC = SRC.Replace("<embed", "&lt;embed");
                        SRC = SRC.Replace("</embed", "&lt;/embed");


                        SRC = SRC.Replace("<textarea", "&lt;textarea");
                        SRC = SRC.Replace("</textarea", "&lt;/textarea");

                        SRC = SRC.Replace("<select", "&lt;select");
                        SRC = SRC.Replace("</select", "&lt;/select");


                        SRC = SRC.Replace("<img", "&lt;img");
                        SRC = SRC.Replace("</img", "&lt;/img");

                    }
                }
            }

            return SRC;
        }
        #endregion


        #region ""  Authentication for Administrator Level User  ""

        public static string requiredFlag()
        {
            if (HttpContext.Current.Session["RequiredFlag"] != null)
            {
                return HttpContext.Current.Session["RequiredFlag"].ToString();
            }
            else
            {
                HttpContext.Current.Session["RequiredFlag"] = "false";
                return "false";
            }
        }

        /// <summary>
        /// This function will logout the user
        /// </summary>
        /// <remarks></remarks>
        public static void LogOut()
        {
            HttpContext.Current.Session["UserInfo"] = null;
            HttpContext.Current.Session.Abandon();
            //HttpContext.Current.Session["CurrentCountryID"] = null;
            //HttpContext.Current.Session["Change_CountryID_flag"] = null;
        }

        /// <summary>
        /// This function checks if any user is logged on current machine or not
        /// </summary>
        /// <returns>True if user is logged in, False otherwise</returns>
        public static bool LoggedIn()
        {
            return (!LoggedOut());
        }

        /// <summary>
        /// This function checks if any user is logged on current machine or not
        /// </summary>
        /// <returns>True if user is logged out, False otherwise</returns>
        public static bool LoggedOut()
        {
            if (HttpContext.Current.Session["UserInfo"] == null)
                return true;
            else
                return false;
        }


        /// <summary>
        /// Function to Grant Access to Admin user.
        /// </summary>
        /// <param name="Username">Username to be authenticated</param>
        /// <param name="Password">Password to be authenticated</param>
        /// <param name="Password">CountryID to be authenticated</param>
        /// <returns>True if User is Authenticated, False otherwise</returns>
        public static bool requestAccess(string Password, string Username)
        {
            if (Username.Trim() == "")
            {
                return false;
            }

            string SQL = string.Empty;
            DataTable dt = new DataTable();
            SQL = "Exec USP_UserLogin '" + Password + "' , '" + Clean(Username.Trim()) + "'  ";

            dt = DataHealper.ExecuteDataTable(SQL);

            if (dt.Rows.Count > 0)
            {
                clsUserInfo Userinfo = new clsUserInfo();

                if (!String.IsNullOrEmpty(dt.Rows[0]["UserID"].ToString()))
                    Userinfo.UserID = Convert.ToInt32(dt.Rows[0]["UserID"]);
                else
                    Userinfo.UserID = -1;

                if (!String.IsNullOrEmpty(dt.Rows[0]["email"].ToString()))
                    Userinfo.EmailID = dt.Rows[0]["email"].ToString();
                else
                    Userinfo.EmailID = "-1";

                if (!String.IsNullOrEmpty(dt.Rows[0]["FName"].ToString()))
                    Userinfo.UserName = dt.Rows[0]["FName"].ToString() + " " + dt.Rows[0]["LName"].ToString();
                else
                    Userinfo.UserName = "-1";


                if (!String.IsNullOrEmpty(dt.Rows[0]["IsActive"].ToString()))
                    Userinfo.IsActive = Convert.ToInt32(dt.Rows[0]["IsActive"]);
                else
                    Userinfo.IsActive = -1;
                /*
                if (!String.IsNullOrEmpty(dt.Rows[0]["IsExternal"].ToString()))
                    Userinfo.IsExternal = Convert.ToInt32(dt.Rows[0]["IsExternal"]);
                else
                    Userinfo.IsExternal = -1;

                if (!String.IsNullOrEmpty(dt.Rows[0]["RoleID"].ToString()))
                    Userinfo.RoleID = Convert.ToInt32(dt.Rows[0]["RoleID"]);
                else
                    Userinfo.RoleID = -1;
                */
                HttpContext.Current.Session["UserInfo"] = Userinfo;

                return true;
            }
            else
            {
                return false;
            }
        }

        public static bool isActiveUser()
        {
            if (HttpContext.Current.Session["UserInfo"] != null)
            {
                clsUserInfo objUserInfo = new clsUserInfo();
                objUserInfo = (clsUserInfo)HttpContext.Current.Session["UserInfo"];
                if (objUserInfo.IsActive == 1)
                {
                    return true;
                }
                else
                {
                    return false;
                }
            }
            else
            {
                return false;
            }
        }

        public static bool getIsExternal()
        {
            if (HttpContext.Current.Session["UserInfo"] != null)
            {
                clsUserInfo objUserInfo = new clsUserInfo();
                objUserInfo = (clsUserInfo)HttpContext.Current.Session["UserInfo"];
                if (objUserInfo.IsExternal == 1)
                {
                    return true;
                }
                else
                {
                    return false;
                }
            }
            else
            {
                return false;
            }
        }

        public static int getLoggedUserID()
        {
            if (HttpContext.Current.Session["UserInfo"] != null)
            {
                clsUserInfo objUserInfo = new clsUserInfo();
                objUserInfo = (clsUserInfo)HttpContext.Current.Session["UserInfo"];
                return objUserInfo.UserID;
            }
            else
            {
                return -1;
            }
        }

        public static int getLoggedUserRoleID()
        {
            if (HttpContext.Current.Session["UserInfo"] != null)
            {
                clsUserInfo objUserInfo = new clsUserInfo();
                objUserInfo = (clsUserInfo)HttpContext.Current.Session["UserInfo"];
                return objUserInfo.RoleID;
            }
            else
            {
                return -1;
            }
        }

        public static string getLoggedUserName()
        {
            if (HttpContext.Current.Session["UserInfo"] != null)
            {
                clsUserInfo objUserInfo = new clsUserInfo();
                objUserInfo = (clsUserInfo)HttpContext.Current.Session["UserInfo"];
                return objUserInfo.UserName;
            }
            else
            {
                return "";
            }
        }

        public static string getLoggedUserEmail()
        {
            if (HttpContext.Current.Session["UserInfo"] != null)
            {
                clsUserInfo objUserInfo = new clsUserInfo();
                objUserInfo = (clsUserInfo)HttpContext.Current.Session["UserInfo"];
                return objUserInfo.EmailID;
            }
            else
            {
                return "";
            }
        }



        #endregion

        #region "" Page Level Functions And Methods ""

        public static bool IsDate(string strDate)
        {
            try
            {
                DateTime dt = DateTime.Parse(strDate);
                //if ((dt.Month != System.DateTime.Now.Month) || (dt.Day < 1 && dt.Day > 31) || dt.Year != System.DateTime.Now.Year)
                //return false;
                //else
                return true;
            }
            catch
            {
                return false;
            }
        }

        public static void ConfirmationMsg(string strMsg, Label lbl_Msg, string msgType)
        {
            lbl_Msg.Text = strMsg;

            if (msgType == "Success")
            {
                lbl_Msg.CssClass = "Success";
            }
            else if (msgType == "Error")
            {
                lbl_Msg.CssClass = "Error";
            }

        }

        public static void ClearControls(ControlCollection ctrls)
        {
            foreach (Control ctrl in ctrls)
            {
                if (ctrl is TextBox)
                    ((TextBox)ctrl).Text = string.Empty;
                else if (ctrl is DropDownList)
                    ((DropDownList)ctrl).ClearSelection(); //ctrl.SelectedIndex = 0;
                else if (ctrl is CheckBox)
                    ((CheckBox)ctrl).Checked = false;
                else if (ctrl is CheckBoxList)
                    ((CheckBox)ctrl).Checked = false;
                else if (ctrl is RadioButton)
                    ((CheckBox)ctrl).Checked = false;
                else if (ctrl is RadioButtonList)
                    ((CheckBox)ctrl).Checked = false;

                ClearControls(ctrl.Controls);
            }
        }



        //public static DataTable GetLoggedUser_AllCountry()
        //{
        //    int userID = getLoggedUserID();

        //    string strSql = " Exec USP_getLoggedUser_AllCountry '" + userID + "' ";
        //    return DataHealper.ExecuteDataTable(strSql);
        //}

        //public static DataTable GetSelectedCountrys(string CountryIds)
        //{
        //    string strSql = " Exec USP_getSelectedCountrys '" + CountryIds + "' ";
        //    return DataHealper.ExecuteDataTable(strSql);
        //}


        #endregion


        #region $$$ Page Activity Functions  $$$


        public static bool checkPagewiseActivity(int ActivityID, DataTable dt)
        {
            bool flag = false;
            if (ActivityID > 0)
            {
                foreach (DataRow dr in dt.Rows)
                {
                    if (flag == false)
                    {
                        if (dr["ActivityRowID"].ToString() == ActivityID.ToString())
                            return true;
                        else
                            flag = false;
                    }
                }

            }

            return false;
        }


        public static bool checkRoleActivity(int ActivityID, DataTable dt)
        {
            bool flag = false;
            if (ActivityID > 0)
            {
                foreach (DataRow dr in dt.Rows)
                {
                    if (flag == false)
                    {
                        if (dr["RefActivityID"].ToString() == ActivityID.ToString())
                            return true;
                        else
                            flag = false;
                    }
                }

            }

            return false;
        }
        #endregion

        public static void ConfirmationMsg(string strMsg, Label lbl_Msg, MessageType msgType)
        {
            lbl_Msg.Text = strMsg;

            if (msgType.ToString() == "Success")
            {
                lbl_Msg.CssClass = "Success";
            }
            else if (msgType.ToString() == "Error")
            {
                lbl_Msg.CssClass = "Error";
            }

        }
        public enum MessageType
        {
            Success,
            Error
        }


        public static void BindListBox(ListBox lst, DataTable dt, string strTextField, string strValueField, string strDefaultSelectedText, bool InsertItemAtZeroIndex)
        {
            lst.DataSource = dt;
            lst.DataTextField = strTextField;
            lst.DataValueField = strValueField;
            lst.DataBind();

            if (InsertItemAtZeroIndex == true)
                lst.Items.Insert(0, new ListItem(strDefaultSelectedText, "0"));

        }

    }
}
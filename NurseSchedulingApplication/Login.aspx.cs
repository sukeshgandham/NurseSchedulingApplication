using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace NurseSchedulingApplication
{
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {


        }
        int userId = 0; string glblusertype = ""; int glblID = 0; 
        /// <summary>
        /// Used to check username and password against the database, by passing
        /// the username and passwprd. Only authenticated used would be able to login
        /// </summary>
        /// <param name="username"></param>
        /// <param name="password"></param>
        protected void LoginButton_Click(object sender, EventArgs e)
        {

            string constr = ConfigurationManager.ConnectionStrings["conString"].ConnectionString;
            using (SqlConnection con = new SqlConnection(constr))
            {
                using (SqlCommand cmd = new SqlCommand("Validate_User"))
                {
                    

                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@Username", UserName.Text);
                    cmd.Parameters.AddWithValue("@Password", Password.Text);
                    cmd.Connection = con;
                    con.Open();
                    userId = Convert.ToInt32(cmd.ExecuteScalar());
                    con.Close();
                }
              
                switch (userId)
                {
                    case -1:
                        Label1.Text = "Username and/or password is incorrect.";
                        break;
                    case -2:
                        Label1.Text = "Account has not been activated.";
                        break;
                    default:
                        GetUserType(userId);
                        if (glblusertype == "Nurse")
                        {
                            Response.Cookies["Username"].Value = UserName.Text;
                            Response.Cookies["UserID"].Value =Convert.ToString(glblID);
                            Response.Redirect("/NurseHome.aspx?ID=" + glblID + "");
                        }
                        else if (glblusertype == "Hospital")
                        {
                            Response.Cookies["Username"].Value = UserName.Text;
                            Response.Cookies["UserID"].Value = Convert.ToString(glblID);
                            Response.Redirect("/Hospital.aspx?ID=" + glblID + "");
                        }
                        else if (glblusertype == "Agency")
                        {
                            Response.Cookies["Username"].Value = UserName.Text;
                            Response.Cookies["UserID"].Value = Convert.ToString(glblID);
                            Response.Redirect("/AgencyInterface.aspx?ID=" + glblID + "");
                        }

                     //   FormsAuthentication.RedirectFromLoginPage(UserName.Text, false);
                        break;
                }
            }

        }

        /// <summary>
        /// Get the user type from the database
        /// </summary>
        /// <example>Nurse, Agenyc, Hospital</example>
        /// <param name="auserID"></param>
        public void GetUserType(int auserID)
        {
            string constr = ConfigurationManager.ConnectionStrings["conString"].ConnectionString;
            using (SqlConnection con = new SqlConnection(constr))
            {
                using (SqlCommand cmd = new SqlCommand())
                {
                    cmd.CommandType = CommandType.Text;
                    cmd.CommandText = @"select* from Users where UserId = '" + auserID + "'";
                    cmd.Connection = con;
                    con.Open();
                    using (SqlDataReader sdr = cmd.ExecuteReader())
                    {
                        while (sdr.Read())
                        {
                            glblusertype = Convert.ToString(sdr["UserType"]);
                            glblID = Convert.ToInt32(sdr["ID"]);

                        }
                    }
                }
                con.Close();
            }
        }

    }


}
    
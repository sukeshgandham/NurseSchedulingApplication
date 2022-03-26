using NurseSchedulingApplication.Helper;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace NurseSchedulingApplication
{
    public partial class AgencyRegistration : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        /// <summary>
        /// Handles the Click event of the btnAgencyReg control.
        /// </summary>
        /// <param name="sender">The source of the event.</param>
        /// <param name="e">The <see cref="EventArgs"/> instance containing the event data.</param>
        protected void btnAgencyReg_Click(object sender, EventArgs e)
        {
            try
            {
                String strConnString = ConfigurationManager.ConnectionStrings["conString"].ConnectionString;
                SqlConnection con = new SqlConnection(strConnString);
                SqlCommand cmd = new SqlCommand();
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.CommandText = storedprocedures.spRegisterasAgency;
                cmd.Connection = con;
                cmd.Parameters.Add("@regno", SqlDbType.NVarChar).Value = Convert.ToString(txtAgencyRegNum.Value);
                cmd.Parameters.Add("@Name", SqlDbType.NVarChar).Value = Convert.ToString(txtbxagencyname.Value);
                cmd.Parameters.Add("@address", SqlDbType.NVarChar).Value = Convert.ToString(txtbxaddress.Value);
                cmd.Parameters.Add("@securityquestion", SqlDbType.NVarChar).Value = Convert.ToString(selectquestion.Value);
                cmd.Parameters.Add("@securityanswer", SqlDbType.NVarChar).Value = Convert.ToString(txtbxanswer.Value);
                cmd.Parameters.Add("@userid", SqlDbType.NVarChar).Value = Convert.ToString(txtbxUserID.Value);
                cmd.Parameters.Add("@password", SqlDbType.NVarChar).Value = Convert.ToString(txtbxpassword.Value);
                cmd.Parameters.Add("@conpassword", SqlDbType.NVarChar).Value = Convert.ToString(txtbxcnfrmpassword.Value);
                cmd.Parameters.Add("@createdby", SqlDbType.NVarChar).Value = Convert.ToString(txtbxagencyname.Value);
                cmd.Parameters.Add("@email", SqlDbType.NVarChar).Value = Convert.ToString(txtbxemail.Value);
                cmd.Parameters.Add("@location", SqlDbType.NVarChar).Value = Convert.ToString(txtbxlocation.Value);
                cmd.Parameters.Add("@new_identity", SqlDbType.Int).Direction = ParameterDirection.Output;
                con.Open();
                cmd.ExecuteNonQuery();
                int ID = Convert.ToInt32(cmd.Parameters["@new_identity"].Value);
                con.Close();
                Inserttouserstable(txtbxUserID.Value, txtbxpassword.Value, txtbxemail.Value, "Agency", ID);
                if (ID != 0)
                {
                    DisplayMessage();
                    // Response.Redirect("/Login.aspx");

                }
            }
            catch (Exception ex)
            {

                throw ex;
            }
        }

        /// <summary>
        /// Inserttouserstables the specified ausername.
        /// </summary>
        /// <param name="ausername">The ausername.</param>
        /// <param name="apassword">The apassword.</param>
        /// <param name="aemail">The aemail.</param>
        /// <param name="ausertype">The ausertype.</param>
        /// <param name="aID">a identifier.</param>
        protected void Inserttouserstable(string ausername, string apassword, string aemail, string ausertype, int aID)
        {
            string constr = ConfigurationManager.ConnectionStrings["conString"].ConnectionString;

            using (SqlConnection con = new SqlConnection(constr))
            {
                using (SqlCommand cmd = new SqlCommand())
                {
                    cmd.Connection = con;
                    cmd.CommandType = CommandType.Text;
                    cmd.CommandText = @"Insert into Users (Username,Password,Email,UserType,ID) values (@Username,@Password,@Email,@UserType,@ID)";

                    cmd.Parameters.Add("@Username", SqlDbType.NVarChar).Value = ausername;
                    cmd.Parameters.Add("@Password", SqlDbType.NVarChar).Value = apassword;
                    cmd.Parameters.Add("@Email", SqlDbType.NVarChar).Value = aemail;
                    cmd.Parameters.Add("@UserType", SqlDbType.NVarChar).Value = ausertype;
                    cmd.Parameters.Add("@ID", SqlDbType.Int).Value = aID;
                    cmd.Parameters.Add("@new_identity", SqlDbType.Int).Direction = ParameterDirection.Output;
                    con.Open();
                    cmd.ExecuteNonQuery();
                    // int insertedID = Convert.ToInt32(cmd.Parameters["@new_identity"].Value);
                    con.Close();
                }
            }
        }

        /// <summary>
        /// Displays the message.
        /// </summary>
        protected void DisplayMessage()
        {
            string message = "Registered Succesfully,Please Login.";
            System.Text.StringBuilder sb = new System.Text.StringBuilder();
            sb.Append("<script type = 'text/javascript'>");
            sb.Append("window.onload=function(){");
            sb.Append("alert('");
            sb.Append(message);
            sb.Append("')};");
            sb.Append("</script>");
            ClientScript.RegisterClientScriptBlock(this.GetType(), "alert", sb.ToString());
        }
    }
}
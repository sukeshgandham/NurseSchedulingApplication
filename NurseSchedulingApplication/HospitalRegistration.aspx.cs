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
    public partial class HospitalRegistration : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnHospitalReg_Click(object sender, EventArgs e)
        {

        }
        /// <summary>
        /// Handles the Click1 event of the btnHospitalReg control.
        /// registers the hospital user to the database
        /// </summary>
        /// <param name="sender">The source of the event.</param>
        /// <param name="e">The <see cref="EventArgs"/> instance containing the event data.</param>
        protected void btnHospitalReg_Click1(object sender, EventArgs e)
        {
            try
            {
                String strConnString = ConfigurationManager.ConnectionStrings["conString"].ConnectionString;
                SqlConnection con = new SqlConnection(strConnString);
                SqlCommand cmd = new SqlCommand();
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.CommandText = storedprocedures.spRegisterashospital;
                cmd.Connection = con;
                cmd.Parameters.Add("@Name", SqlDbType.NVarChar).Value = Convert.ToString(txtbxihospitalname.Value);
                cmd.Parameters.Add("@regno", SqlDbType.NVarChar).Value = Convert.ToString(txtbxhospitalauthID.Value);
                cmd.Parameters.Add("@address", SqlDbType.NVarChar).Value = Convert.ToString(txtbxiAddress.Value);
                cmd.Parameters.Add("@location", SqlDbType.NVarChar).Value = Convert.ToString(txtbxhospitalLocation.Value);
                cmd.Parameters.Add("@phone", SqlDbType.NVarChar).Value = Convert.ToInt32(txtbxihospitalphone.Value);
                cmd.Parameters.Add("@email", SqlDbType.NVarChar).Value = Convert.ToString(txtbxhospitalemail.Value);
                cmd.Parameters.Add("@securityquestion", SqlDbType.NVarChar).Value = Convert.ToString(selectsecurityques.Value);
                cmd.Parameters.Add("@securityanswer", SqlDbType.NVarChar).Value = Convert.ToString(txtbxihospitalAnswer.Value);
                cmd.Parameters.Add("@userid", SqlDbType.NVarChar).Value =Convert.ToString(txtbxhospiuserid.Value);
                cmd.Parameters.Add("@password", SqlDbType.NVarChar).Value = Convert.ToString(txtbxhospitalpwd.Value);
                cmd.Parameters.Add("@conpassword", SqlDbType.NVarChar).Value = Convert.ToString(txtbxhospitalcnfmpwd.Value);
                cmd.Parameters.Add("@created", SqlDbType.NVarChar).Value = DateTime.Today;
                cmd.Parameters.Add("@createdby", SqlDbType.NVarChar).Value = txtbxihospitalname.Value;
                cmd.Parameters.Add("@new_identity", SqlDbType.Int).Direction = ParameterDirection.Output;
                con.Open();
                cmd.ExecuteNonQuery();
                int ID = Convert.ToInt32(cmd.Parameters["@new_identity"].Value);
                con.Close();
                Inserttouserstable(txtbxhospiuserid.Value, txtbxhospitalpwd.Value, txtbxhospitalemail.Value, "Hospital", ID);
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
            string message = "Registered Succesfully, Please login.";
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
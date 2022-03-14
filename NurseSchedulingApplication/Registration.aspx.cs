using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;
using System.Data;
using NurseSchedulingApplication.Helper;

namespace NurseSchedulingApplication
{
    public partial class Registration : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {


        }
        /// <summary>
        /// Handles the Click event of the btnSave control.
        /// </summary>
        /// <param name="sender">The source of the event.</param>
        /// <param name="e">The <see cref="EventArgs"/> instance containing the event data.</param>
        protected void btnSave_Click(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {

        }
        /// <summary>
        /// Handles the Click event of the btnNurseRegister control.
        /// </summary>
        /// <param name="sender">The source of the event.</param>
        /// <param name="e">The <see cref="EventArgs"/> instance containing the event data.</param>
        protected void btnNurseRegister_Click(object sender, EventArgs e)
        {
            Page.Validate("Nurse");
            
            try
            {
                String strConnString = ConfigurationManager.ConnectionStrings["conString"].ConnectionString;
                SqlConnection con = new SqlConnection(strConnString);
                // SqlDbType sql = new SqlDbType();

                SqlCommand cmd = new SqlCommand();
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.CommandText = storedprocedures.spRegisterasNurse;
                cmd.Connection = con;
                cmd.Parameters.Add("@firstName", SqlDbType.NVarChar).Value = Convert.ToString(txtbxnfirstname.Value);
                cmd.Parameters.Add("@middleName", SqlDbType.NVarChar).Value = Convert.ToString(txtbxnfirstname.Value);
                cmd.Parameters.Add("@lastName", SqlDbType.NVarChar).Value = Convert.ToString(txtbxnrlastname.Value);
                cmd.Parameters.Add("@dob", SqlDbType.DateTime).Value = txtbxndob.Value;
                cmd.Parameters.Add("@qualifications", SqlDbType.NVarChar).Value = Convert.ToString(selectqualifications.Value);
                cmd.Parameters.Add("@designations", SqlDbType.NVarChar).Value = Convert.ToString(selectdesignation.Value);
                cmd.Parameters.Add("@praticeofyears", SqlDbType.Int).Value = Convert.ToString(selectyearsofexp.Value);
                cmd.Parameters.Add("@phone", SqlDbType.Int).Value = Convert.ToInt32(txtEmpphone.Value);
                cmd.Parameters.Add("@email", SqlDbType.NVarChar).Value = Convert.ToString(txtbxemail.Value);
                cmd.Parameters.Add("@userid", SqlDbType.NVarChar).Value = txtbxUserID.Value;
                cmd.Parameters.Add("@password", SqlDbType.NVarChar).Value = Convert.ToString(txtbxpwd.Value);
                cmd.Parameters.Add("@conpassword", SqlDbType.NVarChar).Value = Convert.ToString(txtbxconpwd.Value);
                cmd.Parameters.Add("@secquestion", SqlDbType.NVarChar).Value = Convert.ToString(selectsecurityques.Value);
                cmd.Parameters.Add("@secanswer", SqlDbType.NVarChar).Value = Convert.ToString(txtbxsecanswer.Value);
                cmd.Parameters.Add("@created", SqlDbType.NVarChar).Value = DateTime.Today;
                cmd.Parameters.Add("@createdby", SqlDbType.NVarChar).Value = "";
                cmd.Parameters.Add("@new_identity", SqlDbType.Int).Direction = ParameterDirection.Output;
               
                con.Open();
              cmd.ExecuteNonQuery();
                int ID = Convert.ToInt32(cmd.Parameters["@new_identity"].Value);
                con.Close();

                Insertuserstable(txtbxUserID.Value, txtbxpwd.Value, txtbxemail.Value,"Nurse", ID);

                
                if (ID!=0)
                {
                    
                    DisplayMessage();
                    Response.Redirect("Login.aspx");
                }
            }
            catch (Exception ex)
            {

                throw ex;
            }

        }

        protected void btnHospitalReg_Click(object sender, EventArgs e)
        {
            

        }

        protected void btnAgencyReg_Click(object sender, EventArgs e)
        {

        }


        /// <summary>
        /// Insertuserstables the specified ausername.
        /// </summary>
        /// <param name="ausername">The ausername.</param>
        /// <param name="apassword">The apassword.</param>
        /// <param name="aemail">The aemail.</param>
        /// <param name="ausertype">The ausertype.</param>
        /// <param name="aID">a identifier.</param>
        protected void Insertuserstable(string ausername, string apassword, string aemail, string ausertype, int aID)
        {
            string constr = ConfigurationManager.ConnectionStrings["conString"].ConnectionString;

            using (SqlConnection con = new SqlConnection(constr))
            {
                using (SqlCommand cmd = new SqlCommand())
                {
                    cmd.Connection = con;
                    cmd.CommandType = CommandType.Text;
                    cmd.CommandText = @"Insert into Users (Username,Password,Email,UserType,ID) values (@Username,@Password,@Email,@UserType,@ID)";
                  
                    cmd.Parameters.Add("@Username", SqlDbType.NVarChar).Value =ausername;
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
        /// Displays the message to the user.
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
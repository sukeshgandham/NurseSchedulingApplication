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
    public partial class ResetPassword : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnResetpassword_Click(object sender, EventArgs e)
        {
            
        }
        /// <summary>
        /// Handles the Click event of the btnreset control.
        /// </summary>
        /// <param name="sender">The source of the event.</param>
        /// <param name="e">The <see cref="EventArgs"/> instance containing the event data.</param>
        protected void btnreset_Click(object sender, EventArgs e)
        {
            int Id=0; string query; int ireturn=0;
            if (selectusertype.Value == "Nurse")
            {
                query = "select Id from nur_registration where nur_userId = '"+ txtbxUserID.Value+"' and nur_secQuestion = '"+selectquestion.Value+"' and nur_secAnswer = '"+txtbxanswer.Value+"'";
            }
            else if (selectusertype.Value == "Hospital")
            {
                query = "select Id from h_registration where h_user_id = '" + txtbxUserID.Value + "' and h_sec_ques='" + selectquestion.Value + "' and h_sec_ans='" + txtbxanswer.Value + "'";
            }
            else { query = "select Id from a_registration where a_userid = '" + txtbxUserID.Value + "' and a_sec_question='" + selectquestion.Value + "' and a_sec_answer='" + txtbxanswer.Value + "'"; }

            string constr = ConfigurationManager.ConnectionStrings["conString"].ConnectionString;
            using (SqlConnection con = new SqlConnection(constr))
            {
                using (SqlCommand cmd = new SqlCommand())
                {
                    cmd.CommandType = CommandType.Text;
                    cmd.CommandText = query;
                    cmd.Connection = con;
                    con.Open();
                  
                    using (SqlDataReader sdr = cmd.ExecuteReader())
                    {
                        while (sdr.Read())
                        {
                            Id = Convert.ToInt32(sdr["Id"]);

                        }
                    }
                }
                con.Close();
                if (Id != 0)
                {
                    ireturn= UpdateUsersTable(Id);
                }
            }
            if (ireturn!=0)
            {

            }
           
        }

        protected int UpdateUsersTable(int arowID)
        {
            string constr = ConfigurationManager.ConnectionStrings["conString"].ConnectionString;
            int Id;
            using (SqlConnection con = new SqlConnection(constr))
            {
                using (SqlCommand cmd = new SqlCommand())
                {
                    cmd.CommandType = CommandType.Text;
                    cmd.CommandText = "update Users set Password='"+ txtbxpassword.Value+"' where ID='"+arowID+"' and Username='"+txtbxUserID.Value +"'";
                    cmd.Connection = con;
                    con.Open();
                    Id= cmd.ExecuteNonQuery();
                    con.Close();
                    
                }
            }
            return Id;
        }
    }
}
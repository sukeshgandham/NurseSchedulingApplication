using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Collections;
using NurseSchedulingApplication.Helper;
using Newtonsoft.Json;
using System.Configuration;
using System.Data;

namespace NurseSchedulingApplication
{
    public partial class Hopsital : System.Web.UI.Page
    {
        /// <summary>
        /// Handles the Load event of the Page control.
        /// </summary>
        /// <param name="sender">The source of the event.</param>
        /// <param name="e">The <see cref="EventArgs"/> instance containing the event data.</param>
        protected void Page_Load(object sender, EventArgs e)
        {
            Calendar1.Visible = false;
            Calendar1.TodaysDate = DateTime.Today;

            lblloggedinusername.Text = Convert.ToString(Request.Cookies["Username"].Value);
        }
        //Save entries to hospital requests        
        /// <summary>
        /// Handles the Click event of the btnRegister control.
        /// </summary>
        /// <param name="sender">The source of the event.</param>
        /// <param name="e">The <see cref="EventArgs"/> instance containing the event data.</param>
        protected void btnRegister_Click(object sender, EventArgs e)
        {

            try
            {
                HospitalPreferences hospitalPreferences = new HospitalPreferences();
                DateTime calFrom; 
                calFrom = Calendar1.SelectedDate;
                string strlocation = Convert.ToString(ddllocation.SelectedItem.Text);
                int allocated = 0;
                List<HospitalPreferences> lstCollhospitalPreferences = new List<HospitalPreferences>();
                lstCollhospitalPreferences.Add(new HospitalPreferences() {
                    h_id = 1,
                    h_shiftDate = calFrom,
                    h_s1 = Convert.ToInt32(txtbxShift1.Text),
                    h_s2 = Convert.ToInt32(txtbxShift2.Text),
                    h_s3 = Convert.ToInt32(txtbxShift3.Text),
                    h_s4 = Convert.ToInt32(txtbxShift4.Text),
                    h_reqNursesInTotal = Convert.ToInt32(txtbxShift1.Text) + Convert.ToInt32(txtbxShift2.Text)+ Convert.ToInt32(txtbxShift3.Text)+ Convert.ToInt32(txtbxShift4.Text),
                    h_AllocatedinTotal = Convert.ToInt32(allocated),
                    h_location = Convert.ToString(ddllocation.SelectedItem.Text)
                });

                string jsonoutput = JsonConvert.SerializeObject(lstCollhospitalPreferences);
                int h_Id =Convert.ToInt32(Request.Cookies["UserID"].Value);

                //  CallStoredProcedure(jsonoutput);
                InsertintoHospitalReqTable(h_Id);
                InsertintoUnAllocatedHospitalReqTable(h_Id);

                DisplayMessage();
            }
            catch (Exception ex)
            {

            }
        }

        /// <summary>
        /// Handles the SelectionChanged event of the Calendar1 control.
        /// </summary>
        /// <param name="sender">The source of the event.</param>
        /// <param name="e">The <see cref="EventArgs"/> instance containing the event data.</param>
        protected void Calendar1_SelectionChanged(object sender, EventArgs e)
        {
            TextBox1.Text = Calendar1.SelectedDate.ToString("d");
            Calendar1.Visible = false;
        }

        /// <summary>
        /// Handles the DayRender event of the Calendar1 control.
        /// </summary>
        /// <param name="sender">The source of the event.</param>
        /// <param name="e">The <see cref="DayRenderEventArgs"/> instance containing the event data.</param>
        protected void Calendar1_DayRender(object sender, DayRenderEventArgs e)
        {
            if (e.Day.IsOtherMonth)
            {
                // e.Day.IsSelectable = false;
                e.Cell.BackColor = System.Drawing.Color.Black;
            }
        }

        /// <summary>
        /// Calls the stored procedure. Pass the Json schema to the stored procedure.
        /// </summary>
        /// <param name="ajsonpref">The ajsonpref.</param>
        protected void CallStoredProcedure(string ajsonpref)
        {
            string paramName = "@hospitalreqs";
            // ds.ReadXml(Server.MapPath(@"/NursePrefences.xml"));
            string constr = ConfigurationManager.ConnectionStrings["conString"].ConnectionString;
            int returnId;
            //using (SqlConnection con = new SqlConnection(constr))
            //{
            //    using (SqlCommand cmd = new SqlCommand())
            //    {
            //        cmd.Connection = con;
            //        cmd.CommandType = CommandType.StoredProcedure;
            //        cmd.CommandText = storedprocedures.spAddHospitalRequests;
            //        cmd.Parameters.Add(new SqlParameter(paramName, ajsonpref));
            //        con.Open();

            //        returnId = cmd.ExecuteNonQuery();
            //        if (returnId != 0) 
            //        {
            //            //Item created successfully in Hospital Requests.
            //        }
            //        con.Close();

            //   InsertUnAllocated(returnId);
            
        
            }


        /// <summary>
        /// Insert user into the hospital requests table.
        /// </summary>
        /// <param name="ahospitalID">The ahospital identifier.</param>
        protected void InsertintoHospitalReqTable(int ahospitalID)
        {
            string constr = ConfigurationManager.ConnectionStrings["conString"].ConnectionString;
        
            using (SqlConnection con = new SqlConnection(constr))
            {
                using (SqlCommand cmd = new SqlCommand())
                {

                    cmd.Connection = con;
                    cmd.CommandType = CommandType.Text;

                    //   cmd.CommandText = "INSERT into (RegionID, RegionDescription) VALUES (5, 'NorthWestern')";
                    cmd.CommandText = @"INSERT INTO hospital_Requests([h_id]
                                                   ,[h_shiftDate]
                                                   ,[h_s1]
                                                   ,[h_s2]
                                                   ,[h_s3]
                                                   ,[h_s4]
                                                   ,[h_reqNursesInTotal]
                                                   ,[h_AllocatedinTotal]
                                                   ,[h_location])
                                             VALUES(@h_id,@h_shiftDate,@h_s1,@h_s2,@h_s3,@h_s4,@h_reqNursesInTotal,@h_AllocatedinTotal,@h_location)";

                    cmd.Parameters.Add("@h_Id", SqlDbType.Int).Value =ahospitalID;
                    cmd.Parameters.Add("@h_shiftDate", SqlDbType.Date).Value = Calendar1.SelectedDate;
                    cmd.Parameters.Add("@h_s1", SqlDbType.Int).Value =Convert.ToInt32(txtbxShift1.Text);
                    cmd.Parameters.Add("@h_s2", SqlDbType.Int).Value = Convert.ToInt32(txtbxShift2.Text);
                    cmd.Parameters.Add("@h_s3", SqlDbType.Int).Value = Convert.ToInt32(txtbxShift3.Text);
                    cmd.Parameters.Add("@h_s4", SqlDbType.Int).Value = Convert.ToInt32(txtbxShift4.Text);
                    cmd.Parameters.Add("@h_reqNursesInTotal", SqlDbType.Int).Value = Convert.ToInt32(txtbxShift1.Text) + Convert.ToInt32(txtbxShift2.Text) + Convert.ToInt32(txtbxShift3.Text) + Convert.ToInt32(txtbxShift4.Text);
                    cmd.Parameters.Add("@h_AllocatedinTotal", SqlDbType.Int).Value = 0;
                    cmd.Parameters.Add("@h_location", SqlDbType.VarChar).Value = ddllocation.SelectedItem.Text;
                    con.Open();
                    int id= cmd.ExecuteNonQuery();
                    con.Close();

                }
            }
        }

        /// <summary>
        /// Insert users into the un allocated hospital requests table.
        /// </summary>
        /// <param name="ahospitalid">The ahospitalid.</param>
        protected void InsertintoUnAllocatedHospitalReqTable(int ahospitalid)
        {
            string constr = ConfigurationManager.ConnectionStrings["conString"].ConnectionString;

            using (SqlConnection con = new SqlConnection(constr))
            {
                using (SqlCommand cmd = new SqlCommand())
                {
                    cmd.Connection = con;
                    cmd.CommandType = CommandType.Text;
                      
                    cmd.CommandText = @"INSERT INTO h_UnAllocatedRequests
                                                           ([h_Id]
                                                           ,[h_S1A]
                                                           ,[h_S2A]
                                                           ,[h_S3A]
                                                           ,[h_S4A]
                                                           ,[h_TotalAllocatedNurses]
                                                           ,[h_shiftDate])
                                             VALUES(@h_Id,@h_S1A,@h_S2A,@h_S3A,@h_S4A,@h_TotalAllocatedNurses,@h_shiftDate)";

                    cmd.Parameters.Add("@h_Id", SqlDbType.Int).Value = ahospitalid;
                    cmd.Parameters.Add("@h_S1A", SqlDbType.Int).Value = 0;
                    cmd.Parameters.Add("@h_S2A", SqlDbType.Int).Value =0;
                    cmd.Parameters.Add("@h_S3A", SqlDbType.Int).Value =0;
                    cmd.Parameters.Add("@h_S4A", SqlDbType.Int).Value =0;
                    cmd.Parameters.Add("@h_TotalAllocatedNurses", SqlDbType.Int).Value = 0;
                    cmd.Parameters.Add("@h_shiftDate", SqlDbType.Date).Value = Calendar1.SelectedDate;
                    
                    con.Open();
                    int id = cmd.ExecuteNonQuery();
                    con.Close();

                }
            }
        }

        /// <summary>
        /// Inserts the un allocated to the list collection.
        /// </summary>
        /// <param name="aHopsitalReqId">a hopsital req identifier.</param>
        protected void InsertUnAllocated(int aHopsitalReqId)
        {

            //  UnAllocatedRequests unAllocatedRequests = new UnAllocatedRequests();
            List<UnAllocatedRequests> lstcollunAllocateds = new List<UnAllocatedRequests>();
            int returnId;
            lstcollunAllocateds.Add(new UnAllocatedRequests()
            {
                h_Id = aHopsitalReqId,
                h_S1A = Convert.ToInt32(0),
                h_S2A = Convert.ToInt32(0),
                h_S3A = Convert.ToInt32(0),
                h_S4A = Convert.ToInt32(0),
                h_shiftDate = Convert.ToDateTime(Calendar1.SelectedDate)
            });
            string jsonoutput = JsonConvert.SerializeObject(lstcollunAllocateds);

            string paramName = "@UnAllochospitalreqs";
            string constr = ConfigurationManager.ConnectionStrings["conString"].ConnectionString;
            using (SqlConnection con = new SqlConnection(constr))
            {
                using (SqlCommand cmd = new SqlCommand())
                {
                    cmd.Connection = con;
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.CommandText = storedprocedures.spInsertintoUnAllocated;
                    cmd.Parameters.Add(new SqlParameter(paramName, jsonoutput));
                    con.Open();

                    returnId = cmd.ExecuteNonQuery();
                    if (returnId != 0)
                    {
                        //Item created successfully in Hospital Requests.
                    }
                    con.Close();
                   
                }
            }

        }

        /// <summary>
        /// Handles the Click event of the ImageButton1 control.
        /// </summary>
        /// <param name="sender">The source of the event.</param>
        /// <param name="e">The <see cref="ImageClickEventArgs"/> instance containing the event data.</param>
        protected void ImageButton1_Click(object sender, ImageClickEventArgs e)
        {
            if (Calendar1.Visible)
            {
                Calendar1.Visible = false;
            }
            Calendar1.Visible = true;
        }

        /// <summary>
        /// Displays the message.
        /// </summary>
        protected void DisplayMessage()
        {
            string message = "Request submitted Succesfully.";
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
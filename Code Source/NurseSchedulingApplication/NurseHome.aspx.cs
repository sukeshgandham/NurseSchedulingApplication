using Newtonsoft.Json;
using NurseSchedulingApplication.Helper;
using System;
using System.Collections;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Drawing;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Xml;

namespace NurseSchedulingApplication
{
    public partial class Home : System.Web.UI.Page
    {
        int glblnurseid = 0;
     
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                Calendar1.Visible = false;
                Calendar1.TodaysDate = DateTime.Today;

                Calendar2.Visible = false;

                lblloggedinusername.Text ="Welcome"+ Convert.ToString(Request.Cookies["Username"].Value);
                
            }
            glblnurseid = Convert.ToInt32(Request.Cookies["UserID"].Value);
        }

      

        protected void Calendar1_SelectionChanged(object sender, EventArgs e)
        {
            TextBox1.Text = Calendar1.SelectedDate.ToString("d");
            Calendar1.Visible = false;
            //this.Calendar2.SelectedDate = this.Calendar1.SelectedDate.AddDays(30);
        }

        protected void Calendar1_PreRender(object sender, EventArgs e)
        {
           
        }

        protected void Calendar1_DayRender(object sender, DayRenderEventArgs e)
        {
            if (e.Day.IsOtherMonth)
            {
               // e.Day.IsSelectable = false;
                e.Cell.BackColor = System.Drawing.Color.Black;
            }
        }

        protected void ImageButton1_Click1(object sender, ImageClickEventArgs e)
        {
            if (Calendar1.Visible)
            {
                Calendar1.Visible = false;
            }
            Calendar1.Visible = true;
        }

        protected void ImageButton2_Click(object sender, ImageClickEventArgs e)
        {
            if (Calendar2.Visible)
            {
                Calendar2.Visible = false;
            }
            Calendar2.Visible = true;
        }

        protected void Calendar2_DayRender(object sender, DayRenderEventArgs e)
        {
            if (e.Day.IsOtherMonth)
            {
             //   e.Day.IsSelectable = false;
                e.Cell.BackColor = System.Drawing.Color.Black;
            }
        }

        protected void Calendar2_SelectionChanged(object sender, EventArgs e)
        {
           // this.Calendar1.SelectedDate = this.Calendar2.SelectedDate - TimeSpan.FromDays(30);
            TextBox2.Text = Calendar2.SelectedDate.ToString("d");
            Calendar2.Visible = false;
        }
        SortedList<string, string> srtdCollshiftpref = new SortedList<string, string>();
        SortedList<DateTime, string> srtdColldayshift = new SortedList<DateTime, string>();
        SortedList srtcollfromateddaynshift = new SortedList();
        int countnofdays;
        //Save preferences to the table
        protected void btnsave_Click(object sender, EventArgs e)
        {
            try
            {

                DateTime calFrom; DateTime calTo;
                calFrom = Calendar1.SelectedDate;
                calTo = Calendar2.SelectedDate;
                
                SortedList<DateTime, string> srtdColldayshift = new SortedList<DateTime, string>();
                srtdCollshiftpref.Add("Monday",RadioButtonList1.SelectedItem != null ? RadioButtonList1.SelectedItem.Text : "NA");
                srtdCollshiftpref.Add("Tuesday", RadioButtonList2.SelectedItem != null ? RadioButtonList2.SelectedItem.Text : "NA");
                srtdCollshiftpref.Add("Wednesday", RadioButtonList3.SelectedItem != null ? RadioButtonList3.SelectedItem.Text : "NA");
                srtdCollshiftpref.Add("Thursday", RadioButtonList4.SelectedItem != null ? RadioButtonList4.SelectedItem.Text : "NA");
                srtdCollshiftpref.Add("Friday", RadioButtonList5.SelectedItem != null ? RadioButtonList5.SelectedItem.Text : "NA");
                srtdCollshiftpref.Add("Saturday",RadioButtonList6.SelectedItem != null ? RadioButtonList6.SelectedItem.Text : "NA");
                srtdCollshiftpref.Add("Sunday", RadioButtonList7.SelectedItem != null ? RadioButtonList7.SelectedItem.Text : "NA");

                countnofdays = (calTo.Date - calFrom.Date).Days;
               
                srtcollfromateddaynshift = IterateDays();
                //Add all the data into xml, send as arg to SP
                FormJSON(srtcollfromateddaynshift);

                Response.Redirect("NurseHome.aspx");

                DisplayMessage();


            }
            catch (Exception)
            {

                throw;
            }

        }

        protected SortedList IterateDays()
        {
            SortedList srtdcolldaysnshift = new SortedList();
            DateTime StartDate = Calendar1.SelectedDate;
            DateTime EndDate = Calendar2.SelectedDate;
            foreach (DateTime day in EachCalendarDay(StartDate, EndDate))
            {
                switch (Convert.ToString(day.DayOfWeek))
                {
                    case "Monday":
                        srtdcolldaysnshift.Add(Convert.ToString(day.Date), Convert.ToString(srtdCollshiftpref["Monday"]));
                        break;
                    case "Tuesday":
                        srtdcolldaysnshift.Add(Convert.ToString(day.Date), Convert.ToString(srtdCollshiftpref["Tuesday"]));
                        break;
                    case "Wednesday":
                        srtdcolldaysnshift.Add(Convert.ToString(day.Date), Convert.ToString(srtdCollshiftpref["Wednesday"]));
                        break;
                    case "Thursday":
                        srtdcolldaysnshift.Add(Convert.ToString(day.Date), Convert.ToString(srtdCollshiftpref["Thursday"]));
                        break;
                    case "Friday":
                        srtdcolldaysnshift.Add(Convert.ToString(day.Date), Convert.ToString(srtdCollshiftpref["Friday"]));
                        break;
                    case "Saturday":
                        srtdcolldaysnshift.Add(Convert.ToString(day.Date), Convert.ToString(srtdCollshiftpref["Saturday"]));
                        break;
                    case "Sunday":
                        srtdcolldaysnshift.Add(Convert.ToString(day.Date), Convert.ToString(srtdCollshiftpref["Sunday"]));
                        break;
                    default:
                        break;
                }
            }

            return srtdcolldaysnshift;
        }

        public IEnumerable<DateTime> EachCalendarDay(DateTime startDate, DateTime endDate)
        {
            for (var date = startDate.Date; date.Date <= endDate.Date; date = date.AddDays(1)) yield
            return date;
        }


        public void FormJSON(SortedList arsrtd)
        {
            NursePreferences nursePreferences = new NursePreferences();
            List<NursePreferences> lstnursePreferences = new List<NursePreferences>();
            foreach (DictionaryEntry item in arsrtd)
            {
                if (Convert.ToString(item.Value) == "Shift 1")
                {
                    lstnursePreferences.Add(new NursePreferences()
                    {
                        nu_id = Convert.ToInt32(Request.Cookies["UserID"].Value),
                        nu_location = Convert.ToString(ddlilocation.Value),
                        nu_shiftDate = Convert.ToDateTime(item.Key),
                        nu_s1 = "Y",
                        nu_s2 = "N",
                        nu_s3 = "N",
                        nu_s4 = "N",
                        nu_isAllocated = "N"

                    });
                }

                else if (Convert.ToString(item.Value) == "Shift 2")
                {
                    lstnursePreferences.Add(new NursePreferences()
                    {
                        nu_id = Convert.ToInt32(Request.Cookies["UserID"].Value),
                        nu_location = Convert.ToString(ddlilocation.Value),
                        nu_shiftDate = Convert.ToDateTime(item.Key),
                        nu_s1 = "N",
                        nu_s2 = "Y",
                        nu_s3 = "N",
                        nu_s4 = "N",
                        nu_isAllocated = "N"

                    });
                }

                else if (Convert.ToString(item.Value) == "Shift 3")
                {
                    lstnursePreferences.Add(new NursePreferences()
                    {
                        nu_id = Convert.ToInt32(Request.Cookies["UserID"].Value),
                        nu_location = Convert.ToString(ddlilocation.Value),
                        nu_shiftDate = Convert.ToDateTime(item.Key),
                        nu_s1 = "N",
                        nu_s2 = "N",
                        nu_s3 = "Y",
                        nu_s4 = "N",
                        nu_isAllocated = "N"

                    });
                }

                else if (Convert.ToString(item.Value) == "Shift 4")
                {
                    lstnursePreferences.Add(new NursePreferences()
                    {
                        nu_id = Convert.ToInt32(Request.Cookies["UserID"].Value),
                        nu_location = Convert.ToString(ddlilocation.Value),
                        nu_shiftDate = Convert.ToDateTime(item.Key),
                        nu_s1 = "N",
                        nu_s2 = "N",
                        nu_s3 = "N",
                        nu_s4 = "Y",
                        nu_isAllocated = "N"

                    });
                }


            }
            string jsonoutput = JsonConvert.SerializeObject(lstnursePreferences);
            CallStoredProcedure(jsonoutput);
        }
        
        //not in use
        public void InsertintoXML(SortedList arsrtd)
        {

            DataSet ds = new DataSet();
            //read xml path
            ds.ReadXml(Server.MapPath(@"/NursePrefences.xml"));
            int count = 0;
            foreach (DictionaryEntry item in arsrtd)
            {
                if (count != countnofdays)
                {
                    DataRow drow = ds.Tables[0].NewRow();
                  //  drow[0] = txtbxNurseID.Text;
                    drow[1] = ddlilocation.Value;
                    if (Convert.ToString(item.Value) == "Shift 1")
                    {
                        drow[2] = item.Key;
                        drow[3] = "Y";
                        drow[4] = "N";
                        drow[5] = "N";
                        drow[7] = "N";
                        drow[8] = "";
                    }
                    else if (Convert.ToString(item.Value) == "Shift 2")
                    {
                        drow[2] = item.Key;
                        drow[3] = "N";
                        drow[4] = "Y";
                        drow[5] = "N";
                        drow[7] = "N";
                        drow[8] = "";
                    }
                    else if (Convert.ToString(item.Value) == "Shift 3")
                    {
                        drow[2] = item.Key;
                        drow[3] = "N";
                        drow[4] = "N";
                        drow[5] = "Y";
                        drow[7] = "N";
                        drow[8] = "";
                    }
                    else if (Convert.ToString(item.Value) == "Shift 4")
                    {
                        drow[2] = item.Key;
                        drow[3] = "N";
                        drow[4] = "N";
                        drow[5] = "N";
                        drow[7] = "Y";
                        drow[8] = "";
                    }

                    ds.Tables[0].Rows.Add(drow);
                    //write the data in XMLFile.xml(file name)
                    ds.WriteXml(Server.MapPath("~/NursePrefences.xml"));
                    count++;
                }
               
            }
         //   }         
        }

        public void CallStoredProcedure(string ajsonpref)
        {
            string paramName = "@nursepref";
            // ds.ReadXml(Server.MapPath(@"/NursePrefences.xml"));
            string constr = ConfigurationManager.ConnectionStrings["conString"].ConnectionString;
            using (SqlConnection con = new SqlConnection(constr))
            {
                using (SqlCommand cmd = new SqlCommand())
                {
                    cmd.Connection = con;
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.CommandText = storedprocedures.spAddNursePreferences;
                    cmd.Parameters.Add(new SqlParameter(paramName, ajsonpref));
                    con.Open();
                    cmd.ExecuteNonQuery();
                    con.Close();
                }
            }

        }


        /// <summary>
        /// Displays the message.
        /// </summary>
        protected void DisplayMessage()
        {
            string message = "Preferences saved Succesfully.";
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
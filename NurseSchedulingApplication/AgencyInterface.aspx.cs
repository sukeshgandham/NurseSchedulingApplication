using Newtonsoft.Json;
using NurseSchedulingApplication.Helper;
using System;
using System.Collections;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Globalization;
using System.Linq;
using System.Net;
using System.Net.Mail;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace NurseSchedulingApplication
{
    public partial class AgencyInterface : System.Web.UI.Page
    {
        DateTime dateselected;
        string strloggedinuser;
        /// <summary>
        /// Handles the Load event of the Page control.
        /// </summary>
        /// <param name="sender">The source of the event.</param>
        /// <param name="e">The <see cref="EventArgs"/> instance containing the event data.</param>
        protected void Page_Load(object sender, EventArgs e)
        {
            Calendar1.Visible = false;
            Calendar1.TodaysDate = DateTime.Today;
            dateselected = Calendar1.SelectedDate;

            if (!this.IsPostBack)
            {
                this.BindGrid();
            }
            lblloggedinusername.Text ="Welcome" + Convert.ToString(Request.Cookies["Username"].Value);
            strloggedinuser = lblloggedinusername.Text;
        }
      

        List<HospitalPreferences> lstcollhospitalPreferences = new List<HospitalPreferences>();

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
        /// Handles the SelectionChanged event of the Calendar1 control.
        /// </summary>
        /// <param name="sender">The source of the event.</param>
        /// <param name="e">The <see cref="EventArgs"/> instance containing the event data.</param>
        protected void Calendar1_SelectionChanged(object sender, EventArgs e)
        {
            TextBox12.Value = Calendar1.SelectedDate.ToString("d");
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
        /// Binds the grid.
        /// </summary>
        private void BindGrid()
        {
            string constr = ConfigurationManager.ConnectionStrings["conString"].ConnectionString;
            //using (SqlConnection con = new SqlConnection(constr))
            //{
            //    using (SqlCommand cmd = new SqlCommand("select Id,h_id,h_reqNursesInTotal,h_AllocatedinTotal from hospital_Requests where h_reqNursesInTotal != h_AllocatedinTotal"))
            //    {
            //        using (SqlDataAdapter sda = new SqlDataAdapter())
            //        {
            //            cmd.Connection = con;
            //            sda.SelectCommand = cmd;
            //            using (DataTable dt = new DataTable())
            //            {
            //                sda.Fill(dt);
            //                GrdHospitalRequests.DataSource = dt;
            //                GrdHospitalRequests.DataBind();
            //            }
            //        }
            //    }
            //}
        }

        /// <summary>
        /// Handles the Click event of the btnAllocate control.
        /// </summary>
        /// <param name="sender">The source of the event.</param>
        /// <param name="e">The <see cref="EventArgs"/> instance containing the event data.</param>
        protected void btnAllocate_Click(object sender, EventArgs e)
        {
            try
            {

                AllocateNurses();
            }
            catch (Exception)
            {

                throw;
            }

        }

        /// <summary>
        /// Allocates the nurses.
        /// </summary>
        protected void AllocateNurses()
        {
            string constr = ConfigurationManager.ConnectionStrings["conString"].ConnectionString;

            using (SqlConnection con = new SqlConnection(constr))
            {
                if (dateselected != null)
                {
                    using (SqlCommand cmd = new SqlCommand("select  * from hospital_Requests where h_reqNursesInTotal != h_AllocatedinTotal and h_shiftDate ='" + Calendar1.SelectedDate + "'"))
                    {
                        cmd.Connection = con;
                        cmd.CommandType = CommandType.Text;
                        con.Open();
                        using (SqlDataReader sdr = cmd.ExecuteReader())
                        {
                            DataTable dataTable = new DataTable();
                            while (sdr.Read())
                            {
                                DataRow row = dataTable.NewRow();

                                //  List<HospitalPreferences> lstcollhospitalPreferences = new List<HospitalPreferences>();
                                lstcollhospitalPreferences.Add(new HospitalPreferences()
                                {
                                    h_id = Convert.ToInt32(sdr["h_id"]),
                                    h_shiftDate = Convert.ToDateTime(sdr["h_shiftDate"]),
                                    h_location = Convert.ToString(sdr["h_location"]),
                                    h_s1 = Convert.ToInt32(sdr["h_s1"]),
                                    h_s2 = Convert.ToInt32(sdr["h_s2"]),
                                    h_s3 = Convert.ToInt32(sdr["h_s3"]),
                                    h_s4 = Convert.ToInt32(sdr["h_s4"]),
                                    h_reqNursesInTotal = Convert.ToInt32(sdr["h_reqNursesInTotal"]),
                                    h_AllocatedinTotal = Convert.ToInt32(sdr["h_AllocatedinTotal"]),
                                });
                            }


                        }
                        con.Close();

                        CheckRequestsWithAvailableNurses();
                    }
                }
            }

        }

        /// <summary>
        /// Checks the requests with available nurses.
        /// </summary>
        protected void CheckRequestsWithAvailableNurses()
        {
            string constr = ConfigurationManager.ConnectionStrings["conString"].ConnectionString;
            using (SqlConnection con = new SqlConnection(constr))
            {
                using (SqlCommand cmd = new SqlCommand())
                {
                    cmd.Connection = con;
                    cmd.CommandType = CommandType.Text;
                    List<NursePreferences> lstcollavailablenurses = new List<NursePreferences>();
                    List<ShiftAllocations> lstcollshiftAllocations = new List<ShiftAllocations>();
                    List<UnAllocatedCount> AllocatedCounts = new List<UnAllocatedCount>();
                    List<UnAllocatedRequests> lstunAllocatedRequests = new List<UnAllocatedRequests>();
                    SortedList sortedListtuple = new SortedList();

                    int s1Count = 0; int s2Count = 0; int s3Count = 0; int s4Count = 0;
                    bool bhospitalhasID = false;
                    //hospital records loop
                    foreach (var item in lstcollhospitalPreferences)
                    {
                        bhospitalhasID = true;
                        lstcollavailablenurses = getNursesbylocationDate(con);
                        lstunAllocatedRequests = getUnallocatednurses(con);

                        if (item.h_s1 != 0 && item.h_s1 > 0)
                        {

                            //get all Nurses whose Shift1,location,and date matches with hospital data
                            var getNursesbylocationndatelinq = from nurse in lstcollavailablenurses
                                                               where (nurse.nu_s1 == "Y" && nurse.nu_shiftDate == Calendar1.SelectedDate && nurse.nu_location == item.h_location)
                                                               select nurse;

                            var getNursesbyunallocdatelinq = from unalloc in lstunAllocatedRequests
                                                      where (unalloc.h_S1A < item.h_s1)
                                                      select unalloc;

                            foreach (var retrievednurses in getNursesbylocationndatelinq)
                            {
                                if (getNursesbyunallocdatelinq != null)
                                {
                                    if (s1Count <= item.h_s1)
                                    {
                                        lstcollshiftAllocations.Add(new ShiftAllocations()
                                        {
                                            nur_id = Convert.ToInt32(retrievednurses.nu_id),
                                            hos_id = Convert.ToInt32(item.h_id),
                                            shift_date = Convert.ToDateTime(Calendar1.SelectedDate),
                                            alloc_s1 = Convert.ToString("Y"),
                                            alloc_s2 = "N",
                                            alloc_s3 = "N",
                                            alloc_s4 = "N",
                                            createdby = strloggedinuser

                                        });
                                        s1Count++;
                                    }
                                }

                            }
                            if (s1Count != 0)
                            {
                                AllocatedCounts.Add(new UnAllocatedCount()
                                {
                                    h_Id = Convert.ToInt32(item.h_id),
                                    shift_date = Calendar1.SelectedDate,
                                    IntShift = "S1A",
                                    IntShiftCount = s1Count,
                                });
                            }

                        }
                        if (item.h_s2 != 0 && item.h_s2 > 0)
                        {

                            //get all Nurses whose Shift2,location,and date matches with hospital data
                            var getNursesbylocationndatelinq = from nurse in lstcollavailablenurses
                                                               where (nurse.nu_s2 == "Y" && nurse.nu_shiftDate == Calendar1.SelectedDate && nurse.nu_location == item.h_location)
                                                               select nurse;
                            var getNursesbyunallocdatelinq = from unalloc in lstunAllocatedRequests
                                                      where (unalloc.h_S2A < item.h_s2)
                                                      select unalloc;


                            foreach (var retrievednurses in getNursesbylocationndatelinq)
                            {
                                if (getNursesbyunallocdatelinq!=null)
                                {


                                    if (s2Count <= item.h_s2)
                                    {
                                        lstcollshiftAllocations.Add(new ShiftAllocations()
                                        {
                                            nur_id = Convert.ToInt32(retrievednurses.nu_id),
                                            hos_id = Convert.ToInt32(item.h_id),
                                            shift_date = Convert.ToDateTime(Calendar1.SelectedDate),
                                            alloc_s1 = "N",
                                            alloc_s2 = "Y",
                                            alloc_s3 = "N",
                                            alloc_s4 = "N",
                                            createdby = strloggedinuser

                                        });
                                        s2Count++;
                                    }
                                }
                            }
                            if (s2Count != 0)
                            {
                                AllocatedCounts.Add(new UnAllocatedCount()
                                {
                                    h_Id = Convert.ToInt32(item.h_id),
                                    shift_date = Calendar1.SelectedDate,
                                    IntShift = "S2A",
                                    IntShiftCount = s2Count,
                                });
                            }

                        }
                        if (item.h_s3 != 0 && item.h_s3 > 0)
                        {
                            //get all Nurses whose Shift3,location,and date matches with hospital data
                            var getNursesbylocationndatelinq = from nurse in lstcollavailablenurses
                                                               where (nurse.nu_s3 == "Y" && nurse.nu_shiftDate == Calendar1.SelectedDate && nurse.nu_location == item.h_location)
                                                               select nurse;
                            var getNursesbyunallocdatelinq = from unalloc in lstunAllocatedRequests
                                                      where (unalloc.h_S3A < item.h_s3)
                                                      select unalloc;


                            foreach (var retrievednurses in getNursesbylocationndatelinq)
                            {
                                if (getNursesbyunallocdatelinq != null)
                                {

                                    if (s3Count <= item.h_s3)
                                    {
                                        lstcollshiftAllocations.Add(new ShiftAllocations()
                                        {
                                            nur_id = Convert.ToInt32(retrievednurses.nu_id),
                                            hos_id = Convert.ToInt32(item.h_id),
                                            shift_date = Convert.ToDateTime(Calendar1.SelectedDate),
                                            alloc_s1 = "N",
                                            alloc_s2 = "N",
                                            alloc_s3 = "Y",
                                            alloc_s4 = "N",
                                            createdby = strloggedinuser

                                        });
                                        s3Count++;
                                    }
                                }
                            }

                            if (s3Count != 0)
                            {
                                AllocatedCounts.Add(new UnAllocatedCount()
                                {
                                    h_Id = Convert.ToInt32(item.h_id),
                                    shift_date = Calendar1.SelectedDate,
                                    IntShift = "S3A",
                                    IntShiftCount = s3Count,
                                });

                            }
                        }
                        if (item.h_s4 != 0 && item.h_s4 > 0)
                        {
                            //get all Nurses whose Shift4,location,and date matches with hospital data
                            var getNursesbylocationndatelinq = from nurse in lstcollavailablenurses
                                                               where (nurse.nu_s4 == "Y" && nurse.nu_shiftDate == item.h_shiftDate && nurse.nu_location == item.h_location)
                                                               select nurse;
                            var getNursesbyunallocdatelinq = from unalloc in lstunAllocatedRequests
                                                      where (unalloc.h_S4A < item.h_s4)
                                                      select unalloc;

                            foreach (var retrievednurses in getNursesbylocationndatelinq)
                            {
                                if (getNursesbyunallocdatelinq != null)
                                {
                                   if (s4Count <= item.h_s4)
                                    {
                                        lstcollshiftAllocations.Add(new ShiftAllocations()
                                        {
                                            nur_id = Convert.ToInt32(retrievednurses.nu_id),
                                            hos_id = Convert.ToInt32(item.h_id),
                                            shift_date = Calendar1.SelectedDate,
                                            alloc_s1 = "N",
                                            alloc_s2 = "N",
                                            alloc_s3 = "N",
                                            alloc_s4 = "Y",
                                            createdby = strloggedinuser

                                        });
                                        s4Count++;
                                    }
                                }
                            }
                            if (s4Count != 0)
                            {
                                AllocatedCounts.Add(new UnAllocatedCount()
                                {
                                    h_Id = Convert.ToInt32(item.h_id),
                                    shift_date = Calendar1.SelectedDate,
                                    IntShift = "S4A",
                                    IntShiftCount = s4Count,
                                });
                            }
                        }

                        var tuplesumallocated = new Tuple<int, DateTime, string, int>(item.h_id, Calendar1.SelectedDate, item.h_location, (s1Count + s2Count + s3Count + s4Count));
                        sortedListtuple.Add(item, tuplesumallocated);
                    }


                    if (bhospitalhasID == true)
                    {


                        string jsonunallocatedtable = JsonConvert.SerializeObject(lstcollshiftAllocations);
                        //Update allocated slots in shift allocations table
                        UpdateShiftAllocationTable(jsonunallocatedtable);
                        //Update Nurse preferences table as Y to the allocated
                        UpdateNursePreferencesTable(lstcollshiftAllocations);

                        //Update the count in UnAllocated table
                        Updateh_UnAllocatedRequeststable(AllocatedCounts);

                   
                        NotifyNurseUsers(lstcollshiftAllocations);
                    }

                   

                }
            }

        }

        /// <summary>
        /// Gets the nursesbylocation date.
        /// </summary>
        /// <param name="asqlConnection">The asql connection.</param>
        /// <returns></returns>
        protected List<NursePreferences> getNursesbylocationDate(SqlConnection asqlConnection)
        {
            List<NursePreferences> lstnurses = new List<NursePreferences>();

            using (SqlCommand cmd = new SqlCommand("select * from nur_preferences where nu_shiftDate ='" + dateselected + "' and nu_isAllocated='N'"))
            {
                cmd.Connection = asqlConnection;
                cmd.CommandType = CommandType.Text;
                asqlConnection.Open();
                using (SqlDataReader sdr = cmd.ExecuteReader())
                {
                    while (sdr.Read())
                    {
                        lstnurses.Add(new NursePreferences()
                        {

                            nu_id = Convert.ToInt32(sdr["nu_id"]),
                            nu_location = Convert.ToString(sdr["nu_location"]),
                            nu_shiftDate = Convert.ToDateTime(sdr["nu_shiftDate"]),
                            nu_s1 = Convert.ToString(sdr["nu_s1"]),
                            nu_s2 = Convert.ToString(sdr["nu_s2"]),
                            nu_s3 = Convert.ToString(sdr["nu_s3"]),
                            nu_s4 = Convert.ToString(sdr["nu_s4"]),
                            nu_isAllocated = Convert.ToString(sdr["nu_isAllocated"])
                        });
                    }

                }
                asqlConnection.Close();
            }
            return lstnurses;
        }
        /// <summary>
        /// Gets the unallocatednurses.
        /// </summary>
        /// <param name="asqlConnection">The asql connection.</param>
        /// <returns></returns>
        protected List<UnAllocatedRequests> getUnallocatednurses(SqlConnection asqlConnection)
        {
            List<UnAllocatedRequests> unalloc = new List<UnAllocatedRequests>();
            using (SqlCommand cmd = new SqlCommand("select * from h_UnAllocatedRequests where h_shiftDate='"+ Calendar1.SelectedDate+"'"))

            {
                cmd.Connection = asqlConnection;
                cmd.CommandType = CommandType.Text;
                asqlConnection.Open();
                using (SqlDataReader sdr = cmd.ExecuteReader())
                {
                    while (sdr.Read())
                    {
                        unalloc.Add(new UnAllocatedRequests()
                        {
                            h_S1A = Convert.ToInt32(sdr["h_S1A"]),
                            h_S2A = Convert.ToInt32(sdr["h_S2A"]),
                            h_S3A = Convert.ToInt32(sdr["h_S3A"]),
                            h_S4A=Convert.ToInt32(sdr["h_S4A"]),
                        });
                    }
                }
                asqlConnection.Close();
            }
            return unalloc;
        }

        /// <summary>
        /// Updates the allocated nurses table.
        /// </summary>
        /// <param name="ahospitalId">The ahospital identifier.</param>
        /// <param name="s1">The s1.</param>
        /// <param name="s2">The s2.</param>
        /// <param name="s3">The s3.</param>
        /// <param name="s4">The s4.</param>
        protected void UpdateAllocatedNursesTable(int ahospitalId, string s1, string s2, string s3, string s4)
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



                }
            }
        }


        /// <summary>
        /// Updates the shift allocation table.
        /// </summary>
        /// <param name="ajsonunallocatedtable">The ajsonunallocatedtable.</param>
        protected void UpdateShiftAllocationTable(string ajsonunallocatedtable) {

            string paramName = "@shiftallocations";
            string constr = ConfigurationManager.ConnectionStrings["conString"].ConnectionString;
            using (SqlConnection con = new SqlConnection(constr))
            {
                using (SqlCommand cmd = new SqlCommand())
                {
                    cmd.Connection = con;
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.CommandText = storedprocedures.spAddShiftAllocations;
                    cmd.Parameters.Add(new SqlParameter(paramName, ajsonunallocatedtable));
                    con.Open();
                    cmd.ExecuteNonQuery();
                    con.Close();
                }
            }
        }

        /// <summary>
        /// Updatehoses the un allo column.
        /// </summary>
        /// <param name="acount">The acount.</param>
        /// <param name="ahospitalId">The ahospital identifier.</param>
        /// <param name="ashiftDate">The ashift date.</param>
        protected void UpdatehosUnAlloColumn(int acount, int ahospitalId, DateTime ashiftDate)
        {
            string constr = ConfigurationManager.ConnectionStrings["conString"].ConnectionString;

            using (SqlConnection con = new SqlConnection(constr))
            {
                using (SqlCommand cmd = new SqlCommand())
                {
                    cmd.Connection = con;
                    cmd.CommandType = CommandType.Text;
                    cmd.CommandText = @"UPDATE hospital_Requests SET h_AllocatedinTotal = '" + acount + "' WHERE h_id='" + ahospitalId + "' and h_shiftDate='" + ashiftDate + "'";

                    con.Open();
                    int id = cmd.ExecuteNonQuery();
                    con.Close();
                }
            }

        }

        /// <summary>
        /// Updates the nurse preferences table.
        /// </summary>
        /// <param name="anursePref">The anurse preference.</param>
        protected void UpdateNursePreferencesTable(List<ShiftAllocations> anursePref)
        {
            string constr = ConfigurationManager.ConnectionStrings["conString"].ConnectionString;

            using (SqlConnection con = new SqlConnection(constr))
            {
                using (SqlCommand cmd = new SqlCommand())
                {
                    cmd.Connection = con;
                    cmd.CommandType = CommandType.Text;
                    foreach (var item in anursePref)
                    {
                        int Id = item.hos_id;
                        cmd.CommandText = @"Update nur_preferences set nu_isAllocated ='Y' where nu_Id='" + item.nur_id + "' and nu_shiftDate='" + item.shift_date + "'";
                        //cmd.Parameters.Add("@NurseId", SqlDbType.Int).Value = item.nur_id;
                        con.Open();
                        int id = cmd.ExecuteNonQuery();
                        con.Close();
                    }

                }
            }
        }

        /// <summary>
        /// Update the un allocated requests table.
        /// </summary>
        /// <param name="aupdateallocated">The aupdateallocated.</param>
        protected void Updateh_UnAllocatedRequeststable(List<UnAllocatedCount> aupdateallocated)
        {
            int sum = 0;
            string constr = ConfigurationManager.ConnectionStrings["conString"].ConnectionString;
            using (SqlConnection con = new SqlConnection(constr))
            {
                using (SqlCommand cmd = new SqlCommand())
                {
                    cmd.Connection = con;
                    cmd.CommandType = CommandType.Text;
                    int s1Count = 0; int s2Count = 0; int s3Count = 0; int s4Count = 0; int hospitalId = 0; DateTime shiftDate = DateTime.Now;
                    foreach (var item in aupdateallocated)
                    {

                        switch (item.IntShift)
                        {
                            case "S1A":
                                s1Count = item.IntShiftCount;

                                break;
                            case "S2A":
                                s2Count = item.IntShiftCount;
                                break;
                            case "S3A":
                                s3Count = item.IntShiftCount;
                                break;
                            case "S4A":
                                s4Count = item.IntShiftCount;
                                break;

                            default:
                                break;
                        }
                        hospitalId = item.h_Id; shiftDate = item.shift_date;
                        sum = s1Count + s2Count + s3Count + s4Count;
                        cmd.CommandText = @"Update h_UnAllocatedRequests set h_S1A='" + s1Count + "',h_S2A='" + s2Count + "',h_S3A='" + s3Count + "',h_S4A='" + s4Count + "', h_TotalAllocatedNurses='" + sum + "' where h_Id='" + hospitalId + "' and h_shiftDate='" + shiftDate + "'";
                        //cmd.Parameters.Add("@NurseId", SqlDbType.Int).Value = item.nur_id;
                        con.Open();
                        int id = cmd.ExecuteNonQuery();
                        con.Close();

                    }
                   

                    UpdatehosUnAlloColumn(sum, hospitalId, shiftDate);
                    NotifyHospital(s1Count,s2Count,s3Count,s4Count,sum,shiftDate, hospitalId);
                    DisplayMessage();
                }
            }

        }

        /// <summary>
        /// Notifies the nurse users.
        /// </summary>
        /// <param name="allocations">The allocations.</param>
        protected void NotifyNurseUsers(List<ShiftAllocations> allocations)
        {
            List<Emails> lstemails = new List<Emails>();
            string constr = ConfigurationManager.ConnectionStrings["conString"].ConnectionString;

            foreach (var item in allocations)
            {
               
                using (SqlConnection con = new SqlConnection(constr))
                {
                    using (SqlCommand cmd = new SqlCommand("select nur_firstName,nur_email from nur_registration where Id = '" + item.nur_id + "'"))
                    {

                        cmd.Connection = con;
                        cmd.CommandType = CommandType.Text;
                        con.Open();
                        using (SqlDataReader sdr = cmd.ExecuteReader())
                        {
 
                            while (sdr.Read())
                            {
                                if (item.alloc_s1 == "Y")
                                {

                                    lstemails.Add(new Emails()
                                    {
                                        NurseID = item.nur_id,
                                        HospitalID = item.hos_id,
                                        Shift = "Shift 1( 8 AM - 8 PM)",
                                        ShiftDate = item.shift_date,
                                        EmailAddress= Convert.ToString(sdr["nur_email"]),
                                        FirstName=Convert.ToString(sdr["nur_firstName"])

                                    });
                                }
                                if (item.alloc_s2 == "Y")
                                {

                                    lstemails.Add(new Emails()
                                    {
                                        NurseID = item.nur_id,
                                        HospitalID = item.hos_id,
                                        Shift = "Shift 2 ( 8PM - 12 AM)",
                                        ShiftDate = item.shift_date,
                                        EmailAddress = Convert.ToString(sdr["nur_email"]),
                                         FirstName = Convert.ToString(sdr["nur_firstName"])

                                    });
                                }
                                if (item.alloc_s3 == "Y")
                                {

                                    lstemails.Add(new Emails()
                                    {
                                        NurseID = item.nur_id,
                                        HospitalID = item.hos_id,
                                        Shift = "Shift 3 (12am - 8am)",
                                        ShiftDate = item.shift_date,
                                        EmailAddress = Convert.ToString(sdr["nur_email"]),
                                         FirstName = Convert.ToString(sdr["nur_firstName"])

                                    });
                                }
                                if (item.alloc_s4 == "Y")
                                {

                                    lstemails.Add(new Emails()
                                    {
                                        NurseID = item.nur_id,
                                        HospitalID = item.hos_id,
                                        Shift = "Shift 4 (8pm-7am)",
                                        ShiftDate = item.shift_date,
                                        EmailAddress = Convert.ToString(sdr["nur_email"]),
                                         FirstName = Convert.ToString(sdr["nur_firstName"])
                                    });
                                }
                            }
                        }
                    }
                }

            }

            foreach (var item in lstemails)
            {
                if (item.EmailAddress != "" && item.EmailAddress != "")
                {
                    string body = @"Hi '" + item.FirstName + "' <br/>" +
                        "<br/>" +
                        "<br/>" +
                        "According to your preferences a shift has been allocated to you, below are the details:" +
                        "<br/>" +
                        "<br/>" +
                        "Shift Date: '" + item.ShiftDate + "'" +
                        "<br/>" +
                        "<br/>" +
                        "Shift & Timings: '" + item.Shift + "'" +
                        "<br/>" +
                        "<br/>" +
                        "For more information, Please login to the system" +
                        "<br/>" +
                        "<br/>" +
                        "Thanks," +
                        "Nurse SafeGuard";
                    SendEmail(item.EmailAddress, "A Shift has been allocated you", body);
                }
            }
        }

        /// <summary>
        /// Notify the hospital.
        /// </summary>
        /// <param name="as1count">The as1count.</param>
        /// <param name="as2count">The as2count.</param>
        /// <param name="as3count">The as3count.</param>
        /// <param name="as4count">The as4count.</param>
        /// <param name="asum">The asum.</param>
        /// <param name="ashiftdate">The ashiftdate.</param>
        /// <param name="ahospitalID">The ahospital identifier.</param>
        protected void NotifyHospital(int as1count, int as2count, int as3count, int as4count, int asum, DateTime ashiftdate, int ahospitalID) {
            string constr = ConfigurationManager.ConnectionStrings["conString"].ConnectionString;
            string strhosemailaddress = ""; string strUsername = "";
            using (SqlConnection con = new SqlConnection(constr))
            {
                using (SqlCommand cmd = new SqlCommand("select Email,Username from Users where ID = '" + ahospitalID + "'"))
                {

                    cmd.Connection = con;
                    cmd.CommandType = CommandType.Text;
                    con.Open();
                    using (SqlDataReader sdr = cmd.ExecuteReader())
                    {
                        while (sdr.Read())
                        {
                            strhosemailaddress = sdr["Email"].ToString();
                            strUsername = sdr["Username"].ToString();
                        }
                    }
                }
            }
            string body = @"Hi' '"+ strUsername + "' + <br/>" +
                       "<br/>" +
                       "<br/>" +
                       "According to your request for the date'"+ashiftdate.ToString("dddd, dd MMMM yyyy")+"'  nurses have been allocated, below are the details:" +
                       "<br/>" +
                       "<br/>" +
                       "Shift 1: '" + as1count + "'" +
                       "<br/>" +
                       "<br/>" +
                        "Shift 2: '" + as2count + "'" +
                       "<br/>" +
                       "<br/>" +
                        "Shift 3: '" + as3count + "'" +
                       "<br/>" +
                       "<br/>" +
                        "Shift 4: '" + as4count + "'" +
                       "<br/>" +
                       "<br/>" +
                       "Total allocated Nurses: '" + asum + "'" +
                       "<br/>" +
                       "<br/>" +
                        "Shift Date: '" + ashiftdate + "'" +
                       "<br/>" +
                       "<br/>" +
                       "For more information, Please login to the system" +
                       "<br/>" +
                       "<br/>" +
                       "Thanks," +
                       "Nurse SafeGuard";
                   
            SendEmail(strhosemailaddress, "[Hospital] Nurses have been allocated", body);

        }


        /// <summary>
        /// Sends the email.
        /// </summary>
        /// <param name="astrtoaddress">The astrtoaddress.</param>
        /// <param name="astrsubject">The astrsubject.</param>
        /// <param name="astrbody">The astrbody.</param>
        protected void SendEmail(string astrtoaddress, string astrsubject, string astrbody)
        {
            if (astrtoaddress.Contains("@"))
            {
               string smtpAddress = "smtp.gmail.com";
                int portNumber = 587;
                bool enableSSL = true;
                string emailFromAddress = "nurseschedule12@gmail.com";
                string password = "Nurse@321";
                string emailToAddress = astrtoaddress;
                string subject = astrsubject;
                string body = astrbody;

                using (MailMessage mail = new MailMessage())
                {
                    mail.From = new MailAddress(emailFromAddress);
                    mail.To.Add(emailToAddress);
                    mail.Subject = subject;
                    mail.Body = body;
                    mail.IsBodyHtml = true;

                    using (SmtpClient smtp = new SmtpClient(smtpAddress, portNumber))
                    {
                        smtp.Credentials = new NetworkCredential(emailFromAddress, password);
                        smtp.EnableSsl = enableSSL;
                        smtp.Send(mail);
                    }
                }
            }
        }

        /// <summary>
        /// Handles the Click event of the btnretrieveRequests control.
        /// </summary>
        /// <param name="sender">The source of the event.</param>
        /// <param name="e">The <see cref="EventArgs"/> instance containing the event data.</param>
        protected void btnretrieveRequests_Click(object sender, EventArgs e)
        {
            dateselected = Calendar1.SelectedDate;
            Response.Redirect("/AgencyInterface.aspx?Date=" + Calendar1.SelectedDate);
        }

        /// <summary>
        /// Displays the message.
        /// </summary>
        protected void DisplayMessage()
        {
            string message = "Available nurses is matched and allocated on request";
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
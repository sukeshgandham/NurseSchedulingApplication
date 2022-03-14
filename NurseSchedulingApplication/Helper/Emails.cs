using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace NurseSchedulingApplication.Helper
{
    public class Emails
    {
        public int NurseID { get; set; }
        public int HospitalID { get; set; }
        public string location { get; set; }
        public string Shift { get; set; }
        public DateTime ShiftDate { get; set; }
        public string EmailAddress { get; set; }
        public string FirstName { get; set; }
    }
}
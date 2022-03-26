using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace NurseSchedulingApplication.Helper
{
    public class HospitalPreferences
    {
        public int h_id { get; set; }
        public DateTime h_shiftDate { get; set; }
        public int h_s1 { get; set; }
        public int h_s2 { get; set; }
        public int h_s3 { get; set; }
        public int h_s4 { get; set; }
        public int h_reqNursesInTotal { get; set; }
        public int h_AllocatedinTotal { get; set; }
        public string h_location { get; set; }
    }
}
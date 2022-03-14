using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace NurseSchedulingApplication.Helper
{
    public class NursePreferences
    {
        public int nu_id { get; set; }
        public string nu_location { get; set; }
        public DateTime nu_shiftDate { get; set; }
        public string nu_s1 { get; set; }
        public string nu_s2 { get; set; }
        public string nu_s3 { get; set; }
        public string nu_s4 { get; set; }
        public string nu_isAllocated { get; set; }
        
    }
}
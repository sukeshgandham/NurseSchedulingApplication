using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace NurseSchedulingApplication.Helper
{
    public class UnAllocatedCount
    {
        public int h_Id { get; set; }
        public DateTime shift_date { get; set; }
        public string IntShift { get; set; }
        public int IntShiftCount { get; set; }
        public int TotalRequiredNurses { get; set; }


    }
}
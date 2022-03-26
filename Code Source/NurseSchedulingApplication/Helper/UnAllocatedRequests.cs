using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace NurseSchedulingApplication.Helper
{
    public class UnAllocatedRequests
    {
        
        public int h_Id {get;set;}
        public int h_S1A { get; set; }
        public int h_S2A { get; set; }
        public int h_S3A { get; set; }
        public int h_S4A { get; set; }
        public int h_TotalAllocatedNurses { get; set; }
        public DateTime h_shiftDate { get; set; }
          
    }
}
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace NurseSchedulingApplication.Helper
{
    public class ShiftAllocations
    {
        //[nur_id]
        //   ,[hos_id]
        //   ,[date]
        //   ,[alloc_s1]
        //   ,[alloc_s2]
        //   ,[alloc_s3]
        //   ,[alloc_s4]
        //   ,[created]
        //   ,[createdby]

        public int nur_id { get; set; }
        public int hos_id { get; set; }
        public DateTime shift_date { get; set; }
        public string alloc_s1 { get; set; }
        public string alloc_s2 { get; set; }
        public string alloc_s3 { get; set; }
        public string alloc_s4 { get; set; }
      
        public string createdby { get; set; }

    }
}
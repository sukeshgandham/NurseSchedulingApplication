using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace NurseSchedulingApplication.Helper
{
    public static class storedprocedures
    {
        public static string spRegisterasNurse = "spAddintoNurseReg";
        public static string spRegisterashospital = "spAddHospital";
        public static string spInsertAgencyRegistration = "spAddAgencyReg";
        public static string spAddHospitalRequests = "InsertHospitalRequests";
        public static string spRegisterasAgency = "spAddintoAgencyReg";
        public static string spAddNursePreferences = "InsertNursePreferences";
        public static string spInsertintoUnAllocated = "InsertUnAllocatedHospitalRequests";
        public static string spAddShiftAllocations = "InsertShiftAllocations";
        public static string InsertUsers = "Insert_User";
    }
}
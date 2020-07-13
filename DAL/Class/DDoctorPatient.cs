using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace DAL.Class
{
    public class DDoctorPatient
    {
        private readonly dbVisitorEntities _dbVisitorEntities;
        #region Constructor

        public DDoctorPatient()
        {
            _dbVisitorEntities = new dbVisitorEntities();
        }

        #endregion

        #region Properties

        public int DId { get; set; }
        public int? DDoctorId { get; set; }
        public int? DPatientId { get; set; }
        public string DMedicalRecord { get; set; }
        public string DDate { get; set; }
        public string DTime { get; set; }
        public string DDescription { get; set; }


        #endregion

        #region Methods

        public void Add()
        {
            var addDoctorPatient = new tblDoctorPatient
            {
                Doctor_Id = DDoctorId,
                Patient_Id = DPatientId,
                MedicalRecord = DMedicalRecord,
                Date = DDate,
                Time = DTime,
                Description = DDescription
            };
            _dbVisitorEntities.tblDoctorPatient.Add(addDoctorPatient);
            _dbVisitorEntities.SaveChanges();
        }

        public void Edit()
        {
            var result = _dbVisitorEntities.tblDoctorPatient.SingleOrDefault(x => x.Id == DId);
            if (result == null) return;
            result.Doctor_Id = DDoctorId;
            result.Patient_Id = DPatientId;
            result.MedicalRecord = DMedicalRecord;
            result.Date = DDate;
            result.Time = DTime;
            result.Description = DDescription;
            _dbVisitorEntities.SaveChanges();
        }

        public void Delete()
        {
            var result = _dbVisitorEntities.tblDoctorPatient.SingleOrDefault(x => x.Id == DId);
            if (result == null) return;
            _dbVisitorEntities.tblDoctorPatient.Remove(result);
            _dbVisitorEntities.SaveChanges();
        }

        public static Task<List<spSelectViewDoctorPatient_Result>> GetViewData()
        {
            var dbVisitorEntities = new dbVisitorEntities();
            return Task.Run(() => dbVisitorEntities.spSelectViewDoctorPatient().ToList());
        }

        public static Task<List<tblSpecialty>> GetSpecialty()
        {
            var dbVisitorEntities = new dbVisitorEntities();
            return Task.Run(() => dbVisitorEntities.tblSpecialty.ToList());
        }

        public static Task<List<tblProvince>> GetProvince()
        {
            var dbVisitorEntities = new dbVisitorEntities();
            return Task.Run(() => dbVisitorEntities.tblProvince.ToList());
        }

        public static Task<List<tblCounty>> GetCounty()
        {
            var dbVisitorEntities = new dbVisitorEntities();
            return Task.Run(() => dbVisitorEntities.tblCounty.ToList());
        }

        //public static Task<List<tblDoctor>> GetData()
        //{
        //    var dbLoanEntities = new dbVisitorEntities();
        //    return Task.Run(() => dbLoanEntities.tblDoctor.ToList());
        //}

        public static Task<string> GetDoctorId()
        {
            var dbVisitorEntities = new dbVisitorEntities();
            return Task.Run(() => dbVisitorEntities.spAutoDoctorId().FirstOrDefault().ToString());
        }

        #endregion
    }
}

using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace DAL.Class
{
    public class DDoctor
    {
        private readonly dbVisitorEntities _dbVisitorEntities;
        #region Constructor

        public DDoctor()
        {
            _dbVisitorEntities = new dbVisitorEntities();
        }

        #endregion

        #region Properties

        public int DId { get; set; }
        public short? DSpecialtyId { get; set; }
        public short? DCountyId { get; set; }
        public string DDoctorId { get; set; }
        public string DDoctorName { get; set; }
        public string DDoctorFamily { get; set; }
        public bool? DSex { get; set; }
        public string DAddress { get; set; }
        public string DPhoneNumber { get; set; }
        public string DMobileNumber { get; set; }
        public string DDescription { get; set; }


        #endregion

        #region Methods

        public void Add()
        {
            var tblDoctor = new tblDoctor
            {
                Specialty_Id = DSpecialtyId,
                County_Id = DCountyId,
                Doctor_Id = DDoctorId,
                Name = DDoctorName,
                Family = DDoctorFamily,
                Sex = DSex,
                Address = DAddress,
                PhoneNumber = DPhoneNumber,
                MobileNumber = DMobileNumber,
                Description = DDescription
            };
            _dbVisitorEntities.tblDoctor.Add(tblDoctor);
            _dbVisitorEntities.SaveChanges();
        }

        public void Edit()
        {
            var result = _dbVisitorEntities.tblDoctor.SingleOrDefault(x => x.Id == DId);
            if (result == null) return;
            result.Specialty_Id = DSpecialtyId;
            result.County_Id = DCountyId;
            result.Doctor_Id = DDoctorId;
            result.Name = DDoctorName;
            result.Family = DDoctorFamily;
            result.Sex = DSex;
            result.Address = DAddress;
            result.PhoneNumber = DPhoneNumber;
            result.MobileNumber = DMobileNumber;
            result.Description = DDescription;
            _dbVisitorEntities.SaveChanges();
        }

        public void Delete()
        {
            var result = _dbVisitorEntities.tblDoctor.SingleOrDefault(x => x.Id == DId);
            if (result == null) return;
            _dbVisitorEntities.tblDoctor.Remove(result);
            _dbVisitorEntities.SaveChanges();
        }

        public static Task<bool> CheckPersonnelId(string doctorId)
        {
            var dbVisitorEntities = new dbVisitorEntities();
            var result = dbVisitorEntities.tblDoctor.SingleOrDefault(x => x.Doctor_Id == doctorId);
            return result == null ? Task.Run(() => true) : Task.Run(() => false);
        }

        public static Task<List<spSelectViewDoctor_Result>> GetViewData()
        {
            var dbVisitorEntities = new dbVisitorEntities();
            return Task.Run(() => dbVisitorEntities.spSelectViewDoctor().ToList());
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

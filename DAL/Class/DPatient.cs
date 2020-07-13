using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace DAL.Class
{
    public class DPatient
    {
        private readonly dbVisitorEntities _dbVisitorEntities;
        #region Constructor

        public DPatient()
        {
            _dbVisitorEntities = new dbVisitorEntities();
        }

        #endregion

        #region Properties

        public int DId { get; set; }
        public string DPatientId { get; set; }
        public string DName { get; set; }
        public string DFamily { get; set; }
        public bool? DSex { get; set; }
        public string DAddress { get; set; }
        public string DPhoneNumber { get; set; }
        public string DMobileNumber { get; set; }
        public string DDescription { get; set; }


        #endregion

        #region Methods

        public void Add()
        {
            var tblPatient = new tblPatient
            {
                Patient_Id = DPatientId,
                Name = DName,
                Family = DFamily,
                Sex = DSex,
                Address = DAddress,
                PhoneNumber = DPhoneNumber,
                MobileNumber = DMobileNumber,
                Description = DDescription
            };
            _dbVisitorEntities.tblPatient.Add(tblPatient);
            _dbVisitorEntities.SaveChanges();
        }

        public void Edit()
        {
            var result = _dbVisitorEntities.tblPatient.SingleOrDefault(x => x.Id == DId);
            if (result == null) return;
            result.Patient_Id = DPatientId;
            result.Name = DName;
            result.Family = DFamily;
            result.Sex = DSex;
            result.Address = DAddress;
            result.PhoneNumber = DPhoneNumber;
            result.MobileNumber = DMobileNumber;
            result.Description = DDescription;
            _dbVisitorEntities.SaveChanges();
        }

        public void Delete()
        {
            var result = _dbVisitorEntities.tblPatient.SingleOrDefault(x => x.Id == DId);
            if (result == null) return;
            _dbVisitorEntities.tblPatient.Remove(result);
            _dbVisitorEntities.SaveChanges();
        }

        public static Task<bool> CheckPatientId(string patientId)
        {
            var dbVisitorEntities = new dbVisitorEntities();
            var result = dbVisitorEntities.tblPatient.SingleOrDefault(x => x.Patient_Id == patientId);
            return result == null ? Task.Run(() => true) : Task.Run(() => false);
        }

        public static Task<List<tblPatient>> GetData()
        {
            var dbLoanEntities = new dbVisitorEntities();
            return Task.Run(() => dbLoanEntities.tblPatient.ToList());
        }

        public static Task<string> GetPatientId()
        {
            var dbVisitorEntities = new dbVisitorEntities();
            var s = dbVisitorEntities.spAutoPatientId().FirstOrDefault();
            return Task.Run(() => dbVisitorEntities.spAutoPatientId().FirstOrDefault().ToString());
        }

        #endregion
    }
}

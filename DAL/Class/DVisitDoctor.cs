using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace DAL.Class
{
    public class DVisitDoctor
    {
        private readonly dbVisitorEntities _dbVisitorEntities;
        #region Constructor

        public DVisitDoctor()
        {
            _dbVisitorEntities = new dbVisitorEntities();
        }

        #endregion

        #region Properties

        public int DId { get; set; }
        public int? DDoctorId { get; set; }
        public string DDate { get; set; }
        public string DTime { get; set; }
        public string DDescription { get; set; }


        #endregion

        #region Methods

        public void Add()
        {
            var tblVisitDoctorAdd = new tblVisitDoctor
            {
                Doctor_Id = DDoctorId,
                Date = DDate,
                Time = DTime,
                Description = DDescription
            };
            _dbVisitorEntities.tblVisitDoctor.Add(tblVisitDoctorAdd);
            _dbVisitorEntities.SaveChanges();
        }

        public void Edit()
        {
            var result = _dbVisitorEntities.tblVisitDoctor.SingleOrDefault(x => x.Id == DId);
            if (result == null) return;
            result.Doctor_Id = DDoctorId;
            result.Date = DDate;
            result.Time = DTime;
            result.Description = DDescription;
            _dbVisitorEntities.SaveChanges();
        }

        public void Delete()
        {
            var result = _dbVisitorEntities.tblVisitDoctor.SingleOrDefault(x => x.Id == DId);
            if (result == null) return;
            _dbVisitorEntities.tblVisitDoctor.Remove(result);
            _dbVisitorEntities.SaveChanges();
        }

        public static Task<List<tblVisitDoctor>> GetVisitDoctorData(int doctorId)
        {
            var dbVisitorEntities = new dbVisitorEntities();
            return Task.Run(() => dbVisitorEntities.tblVisitDoctor.Where(t=>t.Doctor_Id == doctorId).ToList());
        }
        #endregion
    }
}

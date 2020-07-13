using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace DAL.Class
{
    public class DLicense
    {
        private readonly dbVisitorEntities _dbVisitorEntities;

        #region Constructor

        public DLicense()
        {
            _dbVisitorEntities = new dbVisitorEntities();
        }

        #endregion

        #region Properties

        public string DAppLicense { get; set; }

        public string DAppVersion { get; set; }

        #endregion

        #region Methods

        public void Add()
        {
            var tblLicense = new tblLicense
            {
                Id = 1,
                AppLicense = DAppLicense,
                AppVersion = DAppVersion
            };
            _dbVisitorEntities.tblLicense.Add(tblLicense);
            _dbVisitorEntities.SaveChanges();
        }

        public void Edit()
        {
            var result = _dbVisitorEntities.tblLicense.SingleOrDefault(x => x.Id == 1);
            if (result == null) return;
            result.AppLicense = DAppLicense;
            result.AppVersion = DAppVersion;
            _dbVisitorEntities.SaveChanges();
        }

        public void Delete()
        {
            var result = _dbVisitorEntities.tblLicense.SingleOrDefault(x => x.Id == 1);
            if (result == null) return;
            _dbVisitorEntities.tblLicense.Remove(result);
            _dbVisitorEntities.SaveChanges();
        }

        public static Task<List<tblLicense>> GetData()
        {
            var dbVisitorEntities = new dbVisitorEntities();
            return Task.Run(() => dbVisitorEntities.tblLicense.Where(x => x.Id == 1).ToList());
        }
        #endregion
    }
}

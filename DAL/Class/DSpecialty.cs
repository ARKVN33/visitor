using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace DAL.Class
{
    public class DSpecialty
    {
        private readonly dbVisitorEntities _dbVisitorEntities;
        #region Constructor

        public DSpecialty()
        {
            _dbVisitorEntities = new dbVisitorEntities();
        }

        #endregion

        #region Properties

        public short DId { get; set; }
        public string DSpecialtyName { get; set; }

        #endregion

        #region Methods
        public void Add()
        {
            var addSpecialty = new tblSpecialty()
            {
                Name = DSpecialtyName
            };
            _dbVisitorEntities.tblSpecialty.Add(addSpecialty);
            _dbVisitorEntities.SaveChanges();
        }

        public void Edit()
        {
            var result = _dbVisitorEntities.tblSpecialty.SingleOrDefault(x => x.Id == DId);
            if (result == null) return;
            result.Name = DSpecialtyName;
            _dbVisitorEntities.SaveChanges();
        }

        public void Delete()
        {
            var result = _dbVisitorEntities.tblSpecialty.SingleOrDefault(x => x.Id == DId);
            if (result == null) return;
            _dbVisitorEntities.tblSpecialty.Remove(result);
            _dbVisitorEntities.SaveChanges();
        }

        public static Task<List<tblSpecialty>> GetData()
        {
            var dbHavalehEntities = new dbVisitorEntities();
            return Task.Run(() => dbHavalehEntities.tblSpecialty.ToList());
        }
        #endregion

    }
}

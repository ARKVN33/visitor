using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace DAL.Class
{
    public class DUser
    {
        private readonly dbVisitorEntities _dbVisitorEntities;

        #region Constructor

        public DUser()
        {
            _dbVisitorEntities = new dbVisitorEntities();
        }

        #endregion

        #region Properties

        public int DId { get; set; }

        public byte DPostTypeId { get; set; }

        public byte DSecurityQuestionId { get; set; }

        public string DFirstName { get; set; }

        public string DLastName { get; set; }

        public string DUserName { get; set; }

        public string DPassword { get; set; }

        public string DMobile { get; set; }

        public string DEmail { get; set; }

        public string DAnswer { get; set; }

        public string DRegistrationDate { get; set; }

        public string DImage { get; set; }

        public string DDescription { get; set; }


        #endregion

        #region Methods

        public void AddAdmin()
        {
            var tblUser = new tblUser
            {
                User_PostType_Id = DPostTypeId,
                User_SecurityQuestion_Id = DSecurityQuestionId,
                UserFirstName = DFirstName,
                UserLastName = DLastName,
                UserName = DUserName,
                UserPassword = BCrypt.Net.BCrypt.HashPassword(DPassword),
                UserMobileNumber = DMobile,
                UserEmail = DEmail,
                UserAnswer = BCrypt.Net.BCrypt.HashPassword(DAnswer),
                UserRegistrationDate = DRegistrationDate,
                UserImage = DImage,
                UserDescription = DDescription
            };
            _dbVisitorEntities.tblUser.Add(tblUser);
            _dbVisitorEntities.SaveChanges();
            var tblSundry = new tblSundry
            {
                Id = 1,
                RegisteredAdminPassword = true
            };
            _dbVisitorEntities.tblSundry.Add(tblSundry);
            _dbVisitorEntities.SaveChanges();
        }

        public static Task<List<string>> GetQuestion()
        {
            var dbVisitorEntities = new dbVisitorEntities();
            return Task.Run(() => dbVisitorEntities.tblSecurityQuestion.Select(x => x.SecurityQuestion).ToList());
        }

        public void ChangePassword()
        {
            var tblUser = new tblUser
            {
                Id = 1,
                UserName = DUserName,
                UserPassword = BCrypt.Net.BCrypt.HashPassword(DPassword)
            };

            using (var dbVisitorEntities = new dbVisitorEntities())
            {
                dbVisitorEntities.tblUser.Attach(tblUser);
                dbVisitorEntities.Entry(tblUser).Property(x => x.UserName).IsModified = true;
                dbVisitorEntities.Entry(tblUser).Property(x => x.UserPassword).IsModified = true;
                dbVisitorEntities.SaveChanges();
            }
        }

        private static List<tblPostType> GetPostdata()
        {
            var dbVisitorEntities = new dbVisitorEntities();
            return dbVisitorEntities.tblPostType.ToList();
        }

        #endregion
    }
}

using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data.SqlClient;
using System.Configuration;
using System.Web.Security;
using Blue_Jays_Manager.Models.DataModels;
using System.Data;

namespace Blue_Jays_Manager.Models.DataAccessLayer
{
    public class AdminUserDataLayer
    {
        public static int Register(string password, string firstName, string lastName, string email, string userName, string role)
        {
            using (SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["BlueJaysConnection"].ConnectionString))
            {
                SqlCommand cmd = new SqlCommand("spRegisterUser", conn);
                cmd.CommandType = System.Data.CommandType.StoredProcedure;

                string encryptedPassword = FormsAuthentication.HashPasswordForStoringInConfigFile(password, "SHA1");

                cmd.Parameters.Add(new SqlParameter("@FirstName", firstName));
                cmd.Parameters.Add(new SqlParameter("@LastName", lastName));
                cmd.Parameters.Add(new SqlParameter("@Email", email));
                cmd.Parameters.Add(new SqlParameter("@UserName", userName));
                cmd.Parameters.Add(new SqlParameter("@Password", encryptedPassword));
                cmd.Parameters.Add(new SqlParameter("@Role", role));

                conn.Open();

                return (int)cmd.ExecuteScalar();
            }

        }

        public static object LogIn(string userName, string password)
        {
            AdminUser admin = null;

            using (SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["BlueJaysConnection"].ConnectionString))
            {
                SqlCommand cmd = new SqlCommand("spAuthenticateUser", con);
                cmd.CommandType = System.Data.CommandType.StoredProcedure;

                string ecryptedPassword = FormsAuthentication.HashPasswordForStoringInConfigFile(password, "SHA1");

                cmd.Parameters.Add(new SqlParameter("@UserName", userName));
                cmd.Parameters.Add(new SqlParameter("@Password", ecryptedPassword));

                con.Open();

                SqlDataReader reader = cmd.ExecuteReader();


                if (reader.FieldCount > 3)
                {
                    admin = new AdminUser();
                    while (reader.Read())
                    {
                        admin.Id = Convert.ToInt32(reader["Id"]);
                        admin.FirstName = reader["FirstName"].ToString();
                        admin.LastName = reader["LastName"].ToString();
                        admin.Email = reader["Email"].ToString();
                        admin.UserName = reader["UserName"].ToString();
                        admin.Password = reader["Password"].ToString();
                        admin.Role = reader["Role"].ToString();

                    }

                    return admin;
                }
                else
                {
                    int col = reader.FieldCount;

                    string message = String.Empty;

                    while (reader.Read())
                    {
                        int attempts = Convert.ToInt32(reader["RetryAttempts"]);

                        if (Convert.ToBoolean(reader["AccountLocked"]))
                        {
                            message = "Account Locked. Please Contact Administrator";
                        }
                        else if (attempts > 0)
                        {
                            int attemptsLeft = (4 - attempts);

                            message = "Invalid username or password. " + attemptsLeft.ToString() + " attempts remaining";
                        }
                        else
                        {
                            message = "Invalid username or password";
                        }
                    }

                    return message;
                }


            }

        }

        public static int EnableUserAccount(string firstName, string lastName)
        {
            int rowAffected = 0;

            using (SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["BlueJaysConnection"].ConnectionString))
            {
                SqlCommand cmd = new SqlCommand("spEnableAdminUser", con);
                cmd.CommandType = CommandType.StoredProcedure;


                //This is new???...........message received after visual studio update 3 stating that mircosoft has deprecated "Add"
                cmd.Parameters.AddWithValue("@FirstName", firstName);
                cmd.Parameters.AddWithValue("@LastName", lastName);

                con.Open();

                rowAffected = cmd.ExecuteNonQuery();

            }
            return rowAffected;
        }

        public static List<LockedUser> GetLockedUsers()
        {
            List<LockedUser> lockedList = new List<LockedUser>();
            LockedUser lockedUser = null;

            using (SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["BlueJaysConnection"].ConnectionString))
            {
                SqlCommand cmd = new SqlCommand("spGetLockedUsers", con);
                cmd.CommandType = CommandType.StoredProcedure;
                con.Open();

                SqlDataReader reader = cmd.ExecuteReader();

                while (reader.Read())
                {
                    lockedUser = new LockedUser()
                    {
                        FirstName = reader["FirstName"].ToString(),
                        LastName = reader["LastName"].ToString(),
                        Role = reader["Role"].ToString(),
                        IsLocked = Convert.ToBoolean(reader["IsLocked"]),
                        UserName = reader["UserName"].ToString()
                    };

                    lockedList.Add(lockedUser);
                }
            }
            return lockedList;
        }

        public static int ChangeUserPassword(int id, string newPassword)
        {
            int rowChanges = 0;
            using (SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["BlueJaysConnection"].ConnectionString))
            {
                SqlCommand cmd = new SqlCommand("update tblUsers set Password = @Password where id = @Id", con);
                cmd.Parameters.AddWithValue("@Password", newPassword);
                cmd.Parameters.AddWithValue("@Id", id);

                con.Open();

                rowChanges = cmd.ExecuteNonQuery();
            }

            return rowChanges;
        }
    }
}
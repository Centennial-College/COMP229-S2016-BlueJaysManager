using Blue_Jays_Manager.Models.DataModels;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Caching;
using System.Data.SqlClient;
using System.Data;
using System.Configuration;

namespace Blue_Jays_Manager.Models.DataAccessLayer
{
    public class DataRetrieval
    {
        public List<PlayerRoster> SelectAllPlayers()
        {
            List<PlayerRoster> roster = new List<PlayerRoster>();
            PlayerRoster playerRoster = null;

            using (SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["BlueJaysConnection"].ConnectionString))
            {
                SqlCommand cmd = new SqlCommand("spSelectPlayerRoster", conn);
                cmd.CommandType = CommandType.StoredProcedure;

                conn.Open();
                SqlDataReader reader = cmd.ExecuteReader();

                while (reader.Read())
                {
                    playerRoster = new PlayerRoster()
                    {
                        PlayerNum = Convert.ToInt32(reader["PlayerNum"]),
                        Name = reader["Name"].ToString(),
                        Position = reader["Position"].ToString(),
                        Height = Convert.ToInt32(reader["Height"]),
                        Weight = Convert.ToInt32(reader["Weight"]),
                        SkillOrientation = reader["SkillOrientation"].ToString(),
                        DateOfBirth = reader["DateOfBirth"].ToString().Substring(0, reader["DateOfBirth"].ToString().IndexOf("12:00AM"))
                    };

                    roster.Add(playerRoster);
                }
            }

            return roster;
        }

        public List<CoachRoster> SelectAllCoaches()
        {
            List<CoachRoster> roster = new List<CoachRoster>();
            CoachRoster coachRoster = null;

            using (SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["BlueJaysConnection"].ConnectionString))
            {
                SqlCommand cmd = new SqlCommand("spSelectCoachRoster", conn);
                cmd.CommandType = CommandType.StoredProcedure;
                int islocked;

                conn.Open();
                SqlDataReader reader = cmd.ExecuteReader();

                while (reader.Read())
                {
                    coachRoster = new CoachRoster()
                    {
                        Name = reader["Name"].ToString(),
                        Position = reader["Position"].ToString(),
                        CoachNumber = Convert.ToInt32(reader["CoachNumber"]),
                        IsLocked = (reader["IsLocked"] != DBNull.Value) ? "Locked" : "Access"

                    };

                    roster.Add(coachRoster);
                }
            }
            return roster;
        }
    }
}
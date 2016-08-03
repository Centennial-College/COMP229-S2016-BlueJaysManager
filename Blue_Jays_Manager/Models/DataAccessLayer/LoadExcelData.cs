using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Excel;
using System.IO;
using System.Data;
using System.Configuration;
using System.Data.SqlClient;

namespace Blue_Jays_Manager.Models.DataAccessLayer
{
    public class LoadExcelData
    {
        private static string excelPath = @"C:\Users\Vinood\Desktop\Blue_Jays_Manager\Blue_Jays_Manager\App_Data\BlueJaysDataSheet.xlsx";
        private static string connectionString = ConfigurationManager.ConnectionStrings["BlueJaysConnection"].ConnectionString;
        public static void LoadToDatabase()
        {
            DataSet excelDataSet = null;
            IExcelDataReader reader = null;

            using (FileStream file = File.Open(excelPath, FileMode.Open, FileAccess.Read))
            {
                reader = ExcelReaderFactory.CreateOpenXmlReader(file);

                reader.IsFirstRowAsColumnNames = true;

                excelDataSet = reader.AsDataSet();
            }

            using (SqlConnection con = new SqlConnection(connectionString))
            {
                con.Open();
                foreach (DataTable table in excelDataSet.Tables)
                {
                    switch (table.TableName)
                    {
                        case "PlayerRoster":

                            foreach (DataRow row in table.Rows)
                            {
                                InsertPlayerRoster(con, row);
                            }
                            break;

                        case "CoachRoster":
                            foreach (DataRow row in table.Rows)
                            {
                                InsertCoachRoster(con, row);
                            }
                            break;

                        case "PlayerBio":
                            foreach (DataRow row in table.Rows)
                            {
                                InsertPlayerBio(con, row);
                            }
                            break;
                        //case "PitchingStats":
                        //    foreach (DataRow row in table.Rows)
                        //    {
                        //        InsertPitchingStats(con, row);
                        //    }
                        //    break;
                        case "FieldingStats":
                            foreach (DataRow row in table.Rows)
                            {
                                InsertFieldingStats(con, row);
                            }
                            break;
                        case "PlayerStatsSummary":
                            foreach (DataRow row in table.Rows)
                            {
                                InsertPlayerStatsSummary(con, row);
                            }
                            break;
                        case "BattingStats":
                            foreach (DataRow row in table.Rows)
                            {
                                InsertBattingStats(con, row);
                            }
                            break;

                        default:
                            break;
                    }
                }
            }
        }

        private static void InsertBattingStats(SqlConnection conn, DataRow row)
        {
            SqlCommand cmd = new SqlCommand("spInsertIntoBattingStats", conn);
            cmd.CommandType = CommandType.StoredProcedure;

            cmd.Parameters.Add(new SqlParameter("@battingStatsID", row["BattingStatsID"]));
            cmd.Parameters.Add(new SqlParameter("@playerNum", row["PlayerNum"]));
            cmd.Parameters.Add(new SqlParameter("@batStatYear", row["1B"]));
            cmd.Parameters.Add(new SqlParameter("@team", row["2B"]));
            cmd.Parameters.Add(new SqlParameter("@league", row["3B"]));
            cmd.Parameters.Add(new SqlParameter("@games", row["4B"]));
            cmd.Parameters.Add(new SqlParameter("@atBats", row["5B"]));
            cmd.Parameters.Add(new SqlParameter("@runs", row["6B"]));
            cmd.Parameters.Add(new SqlParameter("@hits", row["7B"]));
            cmd.Parameters.Add(new SqlParameter("@totalBases", row["8B"]));
            cmd.Parameters.Add(new SqlParameter("@doubles", row["9B"]));
            cmd.Parameters.Add(new SqlParameter("@triples", row["10B"]));
            cmd.Parameters.Add(new SqlParameter("@homeRuns", row["11B"]));
            cmd.Parameters.Add(new SqlParameter("@runsBattedIn", row["12B"]));
            cmd.Parameters.Add(new SqlParameter("@basesOnBalls", row["13B"]));
            cmd.Parameters.Add(new SqlParameter("@intentionalBasesOnBalls", row["14B"]));
            cmd.Parameters.Add(new SqlParameter("@strikeouts", row["15B"]));
            cmd.Parameters.Add(new SqlParameter("@stolenBases", row["16B"]));
            cmd.Parameters.Add(new SqlParameter("@caughtStealing", row["17B"]));
            cmd.Parameters.Add(new SqlParameter("@battingAverage", row["18B"]));
            cmd.Parameters.Add(new SqlParameter("@onBasePercentage", row["19B"]));
            cmd.Parameters.Add(new SqlParameter("@sluggingPercentage", row["20B"]));
            cmd.Parameters.Add(new SqlParameter("@onBasePlusSlugging", row["21B"]));
            cmd.Parameters.Add(new SqlParameter("@groundOrAirOuts", row["22B"]));

            cmd.ExecuteNonQuery(); 
        }

        private static void InsertPlayerStatsSummary(SqlConnection conn, DataRow row)
        {
            SqlCommand cmd = new SqlCommand("spInsertIntoPlayerStatsSummary", conn);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add(new SqlParameter("@playerStatsSummaryID", row["PlayerStatsSummaryID"]));
            cmd.Parameters.Add(new SqlParameter("@playerNum", row["PlayerNum"]));
            cmd.Parameters.Add(new SqlParameter("@summaryYear", row["1SS"]));
            cmd.Parameters.Add(new SqlParameter("@wins", row["2SS"]));
            cmd.Parameters.Add(new SqlParameter("@losses", row["3SS"]));
            cmd.Parameters.Add(new SqlParameter("@earnedRunsAverage", row["4SS"]));
            cmd.Parameters.Add(new SqlParameter("@games", row["5SS"]));
            cmd.Parameters.Add(new SqlParameter("@gamesStarted", row["6SS"]));
            cmd.Parameters.Add(new SqlParameter("@saves", row["7SS"]));
            cmd.Parameters.Add(new SqlParameter("@inningsPitched", row["8SS"]));
            cmd.Parameters.Add(new SqlParameter("@strikeOuts", row["9SS"]));
            cmd.Parameters.Add(new SqlParameter("@walkAndHitsPerInningsPitched", row["10SS"]));

            
            cmd.ExecuteNonQuery();
        }

        private static void InsertFieldingStats(SqlConnection conn, DataRow row)
        {
            SqlCommand cmd = new SqlCommand("spInsertIntoFieldingStats", conn);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add(new SqlParameter("@fieldingStatsID", row["FieldingStatsID"]));
            cmd.Parameters.Add(new SqlParameter("@playerNum", row["PlayerNum"]));
            cmd.Parameters.Add(new SqlParameter("@fieldStatYear", row["1F"]));
            cmd.Parameters.Add(new SqlParameter("@team", row["2F"]));
            cmd.Parameters.Add(new SqlParameter("@league", row["3F"]));
            cmd.Parameters.Add(new SqlParameter("@position", row["4F"]));
            cmd.Parameters.Add(new SqlParameter("@games", row["5F"]));
            cmd.Parameters.Add(new SqlParameter("@gamesStarted", row["6F"]));
            cmd.Parameters.Add(new SqlParameter("@inningsAtThisPosition", row["7F"]));
            cmd.Parameters.Add(new SqlParameter("@totalChances", row["8F"]));
            cmd.Parameters.Add(new SqlParameter("@putOuts", row["9F"]));
            cmd.Parameters.Add(new SqlParameter("@assists", row["10F"]));
            cmd.Parameters.Add(new SqlParameter("@errors", row["11F"]));
            cmd.Parameters.Add(new SqlParameter("@doublePlays", row["12F"]));
            cmd.Parameters.Add(new SqlParameter("@passedBall", row["13F"]));
            cmd.Parameters.Add(new SqlParameter("@stolenBases", row["14F"]));
            cmd.Parameters.Add(new SqlParameter("@caughtStealing", row["15F"]));
            cmd.Parameters.Add(new SqlParameter("@rangeFactor", row["16F"]));
            cmd.Parameters.Add(new SqlParameter("@fieldingPercentage", row["17F"]));

            cmd.ExecuteNonQuery();
        }

        private static void InsertPitchingStats(SqlConnection con, DataRow row)
        {
            
        }

        private static void InsertPlayerRoster(SqlConnection conn, DataRow row)
        {
            SqlCommand cmd = new SqlCommand("spInsertIntoPlayerRoster", conn);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add(new SqlParameter("@playerID", row["PlayerID"]));
            cmd.Parameters.Add(new SqlParameter("@playerNum", row["PlayerNum"]));
            cmd.Parameters.Add(new SqlParameter("@name", row["Name"]));
            cmd.Parameters.Add(new SqlParameter("@position", row["Position"]));
            cmd.Parameters.Add(new SqlParameter("@height", row["Height"]));
            cmd.Parameters.Add(new SqlParameter("@weight", row["Weight"]));
            cmd.Parameters.Add(new SqlParameter("@skillOrientation", row["SkillOrientation"]));
            cmd.Parameters.Add(new SqlParameter("@dateOfBirth", row["DateOfBirth"]));

            cmd.ExecuteNonQuery();
        }

        private static void InsertCoachRoster(SqlConnection conn, DataRow row)
        {
            SqlCommand cmd = new SqlCommand("spInsertIntoCoachRoster", conn);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add(new SqlParameter("@coachID", row["CoachID"]));
            cmd.Parameters.Add(new SqlParameter("@coachNumber", row["CoachNumber"]));
            cmd.Parameters.Add(new SqlParameter("@name", row["Name"]));
            cmd.Parameters.Add(new SqlParameter("@position", row["Position"]));

            cmd.ExecuteNonQuery();
        }

        private static int InsertPlayerBio(SqlConnection conn, DataRow row)
        {
            SqlCommand cmd = new SqlCommand("spInsertIntoPlayerBio", conn);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add(new SqlParameter("@playerBioID", row["PlayerBioID"]));
            cmd.Parameters.Add(new SqlParameter("@playerNum", row["PlayerNum"]));
            cmd.Parameters.Add(new SqlParameter("@name", row["Name"]));
            cmd.Parameters.Add(new SqlParameter("@age", row["Age"]));
            cmd.Parameters.Add(new SqlParameter("@born", row["Born"]));
            cmd.Parameters.Add(new SqlParameter("@draft", row["Draft"]));
            cmd.Parameters.Add(new SqlParameter("@highSchool", row["HighSchool"]));
            cmd.Parameters.Add(new SqlParameter("@college", row["College"]));
            cmd.Parameters.Add(new SqlParameter("@debut", row["Debut"]));


            return cmd.ExecuteNonQuery();
        }




    }
}
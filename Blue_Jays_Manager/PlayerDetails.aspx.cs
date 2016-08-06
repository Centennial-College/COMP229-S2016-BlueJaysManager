using Blue_Jays_Manager.Models.DataModels;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Blue_Jays_Manager.Models.DataAccessLayer;

namespace Blue_Jays_Manager
{
    /// <summary>
    /// Pulls their respective statistics from the general tables and populates the webpage
    /// upon page load.
    /// </summary>
    public partial class PlayerDetails : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            // PLAYER PROFILE ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

            int playerNum = int.Parse(Request.QueryString["playerNumber"]);

            playerNumber.Text = playerNum.ToString();

            List<PlayerRoster> roster = (List<PlayerRoster>)Cache["PlayerRoster"];
            PlayerRoster player = null;

            foreach (PlayerRoster p in roster)
            {
                if (p.PlayerNum == playerNum)
                {
                    player = p;
                    break;
                }
            }

            name.Text = player.Name;
            position.Text = player.Position;

            int totalInches = _centimetersToInches(Convert.ToInt32(player.Height));
            int remainingInches;
            int feet = _inchesToFeet(totalInches, out remainingInches);
            height.Text = feet + "'" + remainingInches + "\"";

            weight.Text = player.Weight.ToString();
            skillOrientation.Text = player.SkillOrientation;

            DateTime dateOfBirth = Convert.ToDateTime(player.DateOfBirth);

            age.Text = _calculateAge(dateOfBirth).ToString();

            // PLAYER BIO ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
            List<PlayerBio> pBio = DataRetrieval.SelectPlayerBioWherePlayerNumEquals(playerNum);

            foreach (PlayerBio pb in pBio)
            {
                bioName.Text = pb.Name;
                bioBorn.Text = pb.Born;
                if (!string.IsNullOrEmpty(pb.Draft))
                {
                    bioDraftHead.Text = "Draft: ";
                    bioDraft.Text = pb.Draft;
                }
                else
                {
                    bioDraftHead.Text = "Draft: ";
                    bioDraft.Text = "N/A";
                }
                if (!string.IsNullOrEmpty(pb.HighSchool))
                {
                    bioSchoolType.Text = "High School: ";
                    bioSchool.Text = pb.HighSchool.ToString();
                }
                else if (!string.IsNullOrEmpty(pb.College))
                {
                    bioSchoolType.Text = "College: ";
                    bioSchool.Text = pb.College.ToString();
                }
                else
                {
                    bioSchoolType.Text = "High School/College: ";
                    bioSchool.Text = "N/A";
                }
                bioDebut.Text = ": " + pb.Debut;
            }

            // PLAYER STATS SUMMARY ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
            List<PlayerStatsSummary> pStatsSummary = DataRetrieval.SelectPlayerStatsSummaryWherePlayerNumEquals(playerNum);

            PlayerRosterGridView.DataSource = pStatsSummary;
            PlayerRosterGridView.DataBind();

            // PLAYER PITCHING STATS ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
            pitchingName.Text = player.Name.ToString();

            List<PitchingStats> pitchingStats = DataRetrieval.SelectPitchingStatsyWherePlayerNumEquals(playerNum);

            if (pitchingStats.Count == 0)
            {
                nullPitchStatsLabel.Visible = true;
            }
            else
            {
                nullPitchStatsLabel.Visible = false;
                PitchingStatsGridView.DataSource = pitchingStats;
                PitchingStatsGridView.DataBind();
            }

            // PLAYER BATTING STATS ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
            battingName.Text = player.Name.ToString();

            List<BattingStats> battingStats = DataRetrieval.SelectBattingStatsyWherePlayerNumEquals(playerNum);

            if (battingStats.Count == 0)
            {
                nullBatStatsLabel.Visible = true;
            }
            else
            {
                nullBatStatsLabel.Visible = false;
                BattingStatsGridView.DataSource = battingStats;
                BattingStatsGridView.DataBind();
            }

            // PLAYER FIELDING STATS ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
            fieldingName.Text = player.Name.ToString();

            List<FieldingStats> fieldingStats = DataRetrieval.SelectFieldingStatsyWherePlayerNumEquals(playerNum);

            if (fieldingStats.Count == 0)
            {
                nullFieldStatsLabel.Visible = true;
            }
            else
            {
                nullFieldStatsLabel.Visible = false;
                FieldingStatsGridView.DataSource = fieldingStats;
                FieldingStatsGridView.DataBind();
            }

        }

        // PRIVATE METHODS ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
        private int _inchesToFeet(int length, out int remainingInches)
        {
            double remainder = length * 0.0833333;
            int result = (int)remainder;

            while (remainder > 1)
            {
                remainder -= 1;
            }

            remainingInches = (int)(remainder * 12);

            return result;
        }

        private int _centimetersToInches(int length)
        {
            // conversion factor might put into constant later
            return Convert.ToInt32(length * 0.393701);
        }

        /**
         * <summary>
         * Calculates and returns age. Takes in one parameter that is the date of birth.
         * Returns 0 if invalid birthdate (i.e. not born yet)
         * </summary>
         */
        private int _calculateAge(DateTime dob)
        {
            int currYear = DateTime.Today.Year;
            int currMonth = DateTime.Today.Month;
            int currDay = DateTime.Today.Day;
            int age = 0;

            if (currYear >= dob.Year)
            {
                // check days if months are equal
                if (currMonth == dob.Month)
                {
                    age = (currYear - dob.Year) + ((currDay >= dob.Day) ? 1 : 0);
                }
                // dont need to check days, birth month already passed
                else if (currMonth > dob.Month)
                {
                    age = currYear - dob.Year;
                }
                // did not reach birth month yet, technically didn't become 1 year older yet
                else
                {
                    age = currYear - dob.Year - 1;
                }
            }
            else
            {
                age = 0;
            }

            return age;
        }
    }
}
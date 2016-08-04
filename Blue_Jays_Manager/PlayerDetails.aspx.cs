using Blue_Jays_Manager.Models.DataModels;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Blue_Jays_Manager
{
    public partial class PlayerDetails : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
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

        }
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
using System;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SportsBooking
{
    public partial class Default : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e) { }

        protected void btnBadminton_Click(object sender, EventArgs e)
        {
            SelectSport("Badminton Court A", 20, 30, "Peramu Indoor Hall, Level 2, Pekan, Pahang");
        }

        protected void btnBasketball_Click(object sender, EventArgs e)
        {
            SelectSport("Indoor Basketball Court", 80, 100, "AMP Indoor Basketball court, Ground Floor, Kuantan, Pahang");
        }

        protected void btnPickleball_Click(object sender, EventArgs e)
        {
            SelectSport("Pickleball Court", 25, 35, "Outdoor Court C, Taman Intan, Pekan, Pahang");
        }

        protected void btnSnooker_Click(object sender, EventArgs e)
        {
            SelectSport("Champion Snooker", 18, 24, "Entertainment Zone, Kuantan City Mall");
        }

        protected void btnBowling_Click(object sender, EventArgs e)
        {
            SelectSport("Bowling Alley", 12, 20, "Level 5, East Coast Mall");
        }

        private void SelectSport(string name, int wdRate, int weRate, string loc)
        {
            Session["SportName"] =name;
            Session["RateWD"] =wdRate;
            Session["RateWE"] =weRate;
            Session["Location"] =loc;
            Response.Redirect("Booking.aspx");
        }
    }
}
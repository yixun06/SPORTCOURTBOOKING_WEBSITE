using System;
using System.Collections.Generic;
using System.Web.UI;

namespace SportsBooking
{
    public partial class Booking : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

            if(!IsPostBack)
            {
                if(Session["SportName"] !=null)
                {
                    lblDisplaySport.Text =Session["SportName"].ToString();
                    lblDisplayLoc.Text =Session["Location"].ToString();
                    lblWD.Text =Session["RateWD"].ToString();
                    lblWE.Text =Session["RateWE"].ToString();
                }
                else
                {
                    Response.Redirect("Default.aspx");
                }
            }
        }

        protected void btnNext_Click(object sender, EventArgs e)
        {
            if(Page.IsValid)
            {
                int wdRate =Convert.ToInt32(Session["RateWD"]);
                int weRate =Convert.ToInt32(Session["RateWE"]);
                int duration =Convert.ToInt32(txtDuration.Text);

                DateTime selectedDate =DateTime.Parse(txtDate.Text);
                bool isWeekend =(selectedDate.DayOfWeek == DayOfWeek.Saturday || selectedDate.DayOfWeek==DayOfWeek.Sunday);

                int finalRate =isWeekend ? weRate : wdRate;
                int totalPrice= finalRate*duration;

                popSport.Text =Session["SportName"].ToString();
                popDate.Text =selectedDate.ToString("dd MMM yyyy") + (isWeekend ? " (Weekend)" : " (Weekday)");
                popName.Text =txtName.Text;
                popPhone.Text =txtPhone.Text;
                popPrice.Text ="RM " + totalPrice.ToString();
                pnlModal.Visible = true;
            }
        }

        protected void btnCancel_Click(object sender, EventArgs e)
        {
            pnlModal.Visible =false;
        }

        protected void btnConfirm_Click(object sender, EventArgs e)
        {
            string date =popDate.Text;
            string sport =popSport.Text;
            string price =popPrice.Text;
            string loc =lblDisplayLoc.Text;
            string pax =txtPax.Text;
            string submitTime =DateTime.Now.ToString();
            string record =$"{submitTime}|{sport}|{loc}|{date}|{pax} Pax|{price}";

            List<string> history;
            if (Session["HistoryList"] ==null)
            {
                history =new List<string>();
            }
            else
            {
                history =(List<string>)Session["HistoryList"];
            }

            history.Add(record);
            Session["HistoryList"] =history;

            Response.Redirect("History.aspx");
        }
    }
}
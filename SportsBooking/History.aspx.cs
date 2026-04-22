using System;
using System.Collections.Generic;
using System.Text;
using System.Web.UI;

namespace SportsBooking
{
    public partial class History : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                ShowTable();
            }
        }

        private void ShowTable()
        {
            if(Session["HistoryList"] !=null)
            {
                List<string> list =(List<string>)Session["HistoryList"];
                if(list.Count >0 )
                {
                    StringBuilder sb =new StringBuilder();
                    sb.Append("<table class='historyTable'>");
                    sb.Append("<tr><th>Submited At</th><th>Facility</th><th>Location</th><th>Booking Date</th><th>Pax</th><th>Total Price</th></tr>");

                    foreach (string s in list)
                    {
                        string[] data =s.Split('|');
                        sb.Append("<tr>");
                        sb.Append("<td>" + data[0] +"</td>");
                        sb.Append("<td>" + data[1] +"</td>");
                        sb.Append("<td>" + data[2] +"</td>");
                        sb.Append("<td>" + data[3] +"</td>");
                        sb.Append("<td>" + data[4] +"</td>");
                        sb.Append("<td style='color:#008CBA; font-weight:bold;'>"+data[5] +"</td>");
                        sb.Append("</tr>");
                    }
                    sb.Append("</table>");
                    litData.Text =sb.ToString();
                }
                else lblMsg.Visible=true;
            }
            else lblMsg.Visible =true;
        }
    }
}
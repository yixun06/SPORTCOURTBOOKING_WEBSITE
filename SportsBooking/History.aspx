<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="History.aspx.cs" Inherits="SportsBooking.History" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>My History</title>
    <link href="Style.css" rel="stylesheet" />
    <script>/**hamburger's fucntion*/
        function toggleNav() {
            var x = document.getElementById("mobileMenu");
            if (x.style.display === "block") x.style.display = "none";
            else x.style.display = "block";
        }
    </script>
</head>
<body>
    <form id="form1" runat="server">
            <div class="navBar">
        <div class="navLogo">SPORTS WORLD</div>
        <div class="hamburgerIcon" onclick="toggleNav()">&#9776;</div>

        <div id="mobileMenu" class="navLinks">
            <a href="Default.aspx">Home Page</a>
            <a href="History.aspx">My History</a>
        </div>
    </div>

        <div style="width:70%; margin:40px auto; background:white; padding:30px; border-radius:8px;">
            <h2 style="color:#003366;">Booking History</h2>
            <asp:Literal ID="litData" runat="server"></asp:Literal>
            <asp:Label ID="lblMsg" runat="server" Text="No bookings yet." ForeColor="Red" Visible="false"></asp:Label>
            <br /><br />
            <a href="Default.aspx" class="bookBtn" style="text-align:center; display:inline-block; width:150px; text-decoration:none;">Make New Booking</a>
        </div>
    </form>
</body>
</html>
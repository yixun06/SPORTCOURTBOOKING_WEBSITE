<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Booking.aspx.cs" Inherits="SportsBooking.Booking" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Booking Form</title>
    <link href="Style.css" rel="stylesheet" />
    <script> /**hamburger's fucntion*/
        function toggleNav() {
            var x = document.getElementById("mobileMenu");
            if (x.style.display === "block") x.style.display = "none";
            else x.style.display = "block";
        }
    </script>
</head>
<body>
    <form id="formBooking" runat="server">

<div class="navBar">
    <div class="navLogo">SPORTS WORLD</div>
    <div class="hamburgerIcon" onclick="toggleNav()">&#9776;</div>

    <div id="mobileMenu" class="navLinks">
        <a href="Default.aspx">Home Page</a>
        <a href="History.aspx">My History</a>
    </div>
</div>

        <div class="formContainer">
            <h2 style="color:#003366;">Booking Form</h2>
            
            <div style="background:#eaf2f8; padding:15px; margin-bottom:20px;">
                <strong>Facility:</strong> <asp:Label ID="lblDisplaySport" runat="server"></asp:Label><br />
                <strong>Location:</strong> <asp:Label ID="lblDisplayLoc" runat="server"></asp:Label><br />
                <small>Rates: RM<asp:Label ID="lblWD" runat="server"/> (Mon-Fri) | RM<asp:Label ID="lblWE" runat="server"/> (Sat-Sun)</small>
            </div>

            <asp:ValidationSummary ID="valSum" runat="server" ForeColor="Red" BorderStyle="Solid" BorderColor="Red" BorderWidth="1px" Padding="5px" HeaderText="Please correct errors:" />

            <div class="formGroup">
                <span class="labelBold">Select Date:</span>
                <asp:TextBox ID="txtDate" runat="server" CssClass="textBox" TextMode="Date"></asp:TextBox>
                <asp:RequiredFieldValidator ID="rfvDate" runat="server" ControlToValidate="txtDate" ErrorMessage="* Date is required" CssClass="errorText" Display="Dynamic" />
            </div>

            <div class="formGroup">
                <span class="labelBold">Duration (Hours):</span>
                <asp:TextBox ID="txtDuration" runat="server" CssClass="textBox" TextMode="Number"></asp:TextBox>
                <asp:RequiredFieldValidator ID="rfvDur" runat="server" ControlToValidate="txtDuration" ErrorMessage="* Duration is required" CssClass="errorText" Display="Dynamic" />
                <asp:RangeValidator ID="rvDur" runat="server" ControlToValidate="txtDuration" ErrorMessage="* Duration must be 1-4 hours" Type="Integer" MinimumValue="1" MaximumValue="4" CssClass="errorText" Display="Dynamic" />
            </div>

            <div class="formGroup">
                <span class="labelBold">Contact Name:</span>
                <asp:TextBox ID="txtName" runat="server" CssClass="textBox"></asp:TextBox>
                <asp:RequiredFieldValidator ID="rfvName" runat="server" ControlToValidate="txtName" ErrorMessage="* Name is required" CssClass="errorText" Display="Dynamic" />
            </div>

            <div class="formGroup">
                <span class="labelBold">Email:</span>
                <asp:TextBox ID="txtEmail" runat="server" CssClass="textBox"></asp:TextBox>
                <asp:RequiredFieldValidator ID="rfvEmail" runat="server" ControlToValidate="txtEmail" ErrorMessage="* Email is required" CssClass="errorText" Display="Dynamic" />
                <asp:RegularExpressionValidator ID="revEmail" runat="server" ControlToValidate="txtEmail" ErrorMessage="* Invalid email format" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" CssClass="errorText" Display="Dynamic" />
            </div>

             <div class="formGroup">
                <span class="labelBold">Phone Number:</span>
                <asp:TextBox ID="txtPhone" runat="server" CssClass="textBox"></asp:TextBox>
                <asp:RequiredFieldValidator ID="rfvPhone" runat="server" ControlToValidate="txtPhone" ErrorMessage="* Phone is required" CssClass="errorText" Display="Dynamic" />
                <asp:RegularExpressionValidator ID="revPhone" runat="server" ControlToValidate="txtPhone" ErrorMessage="* Phone must be 10-11 digits" ValidationExpression="^\d{10,11}$" CssClass="errorText" Display="Dynamic" />
            </div>

             <div class="formGroup">
                <span class="labelBold">Number of Pax:</span>
                <asp:TextBox ID="txtPax" runat="server" CssClass="textBox" TextMode="Number"></asp:TextBox>
                <asp:RequiredFieldValidator ID="rfvPax" runat="server" ControlToValidate="txtPax" ErrorMessage="* Pax is required" CssClass="errorText" Display="Dynamic" />
                 <asp:RangeValidator ID="rvPax" runat="server" ControlToValidate="txtPax" ErrorMessage="* Pax must be 1-20" Type="Integer" MinimumValue="1" MaximumValue="20" CssClass="errorText" Display="Dynamic" />
            </div>

            <asp:Button ID="btnNext" runat="server" Text="Next: Review Booking" CssClass="bookBtn" OnClick="btnNext_Click" />
        </div>

        <asp:Panel ID="pnlModal" runat="server" Visible="false" CssClass="modalBackground">
            <div class="modalPopup">
                <h3 style="color:#003366; border-bottom:1px solid #008CBA; padding-bottom:10px; margin-top:0;">Confirm Details</h3>
                
                <div class="modalRow">
                    <span class="modalLabel">Facility:</span> <asp:Label ID="popSport" runat="server"></asp:Label>
                </div>
                 <div class="modalRow">
                    <span class="modalLabel">Date:</span> <asp:Label ID="popDate" runat="server"></asp:Label>
                </div>
                <div class="modalRow">
                    <span class="modalLabel">Name:</span> <asp:Label ID="popName" runat="server"></asp:Label>
                </div>
                <div class="modalRow">
                    <span class="modalLabel">Contact:</span> <asp:Label ID="popPhone" runat="server"></asp:Label>
                </div>
                <div class="modalRow">
                    <span class="modalLabel">Total Price:</span> 
                    <asp:Label ID="popPrice" runat="server" Font-Bold="true" ForeColor="Red" Font-Size="Large"></asp:Label>
                </div>
                <p style="font-size:12px; color:gray;">Note: Price calculated based on selected date (Weekday/Weekend rate).</p>

                <div style="margin-top:20px;">
                    <asp:Button ID="btnCancel" runat="server" Text="Back" CssClass="cancelBtn" OnClick="btnCancel_Click" CausesValidation="false" />
                    <asp:Button ID="btnConfirm" runat="server" Text="Confirm" CssClass="confirmBtn" OnClick="btnConfirm_Click" />
                </div>
            </div>
        </asp:Panel>

    </form>
</body>
</html>
<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="SportsBooking.Default" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Sports World</title>
    <link href="Style.css" rel="stylesheet" />
    <script>/**hamburger's fucntion*/
        function toggleNav() {
            var x = document.getElementById("mobileMenu");
            if (x.style.display === "block") x.style.display = "none";
            else x.style.display = "block";
        }
        var index =1;
        function slide(n) {
            show(index +=n);
        }
        function show(n) {
            var imgs =document.getElementsByClassName("bannerImage");
            if (n > imgs.length) index =1;
            if (n < 1)index =imgs.length;
            for (var i = 0;i < imgs.length;i++) imgs[i].style.display ="none";
            imgs[index - 1].style.display = "block";
        }

    </script>
</head>
<body onload="show(1)">
    <form id="form1" runat="server">
           <div class="navBar">
        <div class="navLogo">SPORTS WORLD</div>
        <div class="hamburgerIcon" onclick="toggleNav()">&#9776;</div>

        <div id="mobileMenu" class="navLinks">
            <a href="Default.aspx">Home Page</a>
            <a href="History.aspx">My History</a>
        </div>
    </div>

        <div class="bannerContainer">
            <img class="bannerImage" src="https://e0.365dm.com/18/11/2048x1152/lebron-james-los-angeles-lakers_4494714.jpg?20181121101236" />
            <img class="bannerImage" src="https://sc0.blr1.cdn.digitaloceanspaces.com/article/143882-jivcsmmyol-1593848928.jpg" />
            <img class="bannerImage" src="https://www.pickleballportal.com/wp-content/uploads/2025/03/Screen-Shot-2025-03-20-at-09.25.50-AM.jpg" />
            <img class="bannerImage" src="https://www.aljazeera.com/wp-content/uploads/2025/11/2025-11-23T192931Z_740634404_UP1ELBN1I551J_RTRMADP_3_SOCCER-SAUDI-NSR-KHA-1763967201.jpg?resize=770%2C513&quality=80" />
            <img class="bannerImage" src="https://i.epochtimes.com/assets/uploads/2019/03/20190325-Chi-Jin-Sullivan-1095439388.jpg" />

            <a class="prevBtn" onclick="slide(-1)">&#10094;</a>
            <a class="nextBtn" onclick="slide(1)">&#10095;</a>
        </div>

        <h1 style="text-align:center; color:#003366;">Our Facilities</h1>

        <div class="facilityGrid">
            <div class="facilityCard">
                <img class="facilityImage" src="https://5.imimg.com/data5/SELLER/Default/2025/8/534977928/QK/MW/SQ/63504944/badminton-court-roofing-shed-500x500.webp" />
                <div class="cardContent">
                    <h3>Badminton Court A</h3>
                    <div class="locationText">Location: Peramu Indoor Hall, Level 2, Pekan, Pahang</div>
                    <div class="rateBox">
                        <div>Weekday: RM 20 / hour</div>
                        <div>Weekend: RM 30 / hour</div>
                    </div>
                    <asp:Button ID="btnBadminton" runat="server" Text="Select Venue" CssClass="bookBtn" OnClick="btnBadminton_Click" />
                </div>
            </div>

            <div class="facilityCard">
                <img class="facilityImage" src="https://cdn1.npcdn.net/userfiles/21669/image/01(1).jpg" />
                <div class="cardContent">
                    <h3>Indoor Basketball Court</h3>
                    <div class="locationText">Location: AMP Indoor Basketball court, Ground Floor, Kuantan, Pahang</div>
                    <div class="rateBox">
                        <div>Weekday: RM 80 / hour</div>
                        <div>Weekend: RM 100 / hour</div>
                    </div>
                    <asp:Button ID="btnBasketball" runat="server" Text="Select Venue" CssClass="bookBtn" OnClick="btnBasketball_Click" />
                </div>
            </div>

             <div class="facilityCard">
                <img class="facilityImage" src="https://jcoconstructionph.com/wp-content/uploads/2024/12/Pickleball-Court-painting-Philippines.png" />
                <div class="cardContent">
                    <h3>Pickleball Court</h3>
                    <div class="locationText">Location: Outdoor Court C, Taman Intan, Pekan, Pahang</div>
                    <div class="rateBox">
                        <div>Weekday: RM 25 / hour</div>
                        <div>Weekend: RM 35 / hour</div>
                    </div>
                    <asp:Button ID="btnPickleball" runat="server" Text="Select Venue" CssClass="bookBtn" OnClick="btnPickleball_Click" />
                </div>
            </div>

            <div class="facilityCard">
                <img class="facilityImage" src="https://5.imimg.com/data5/SELLER/Default/2023/5/309940721/QG/NZ/ZZ/25720420/snooker-court-flooring.jpg" />
                <div class="cardContent">
                    <h3>Champion Snooker</h3>
                    <div class="locationText">Location: Entertainment Zone, Kuantan City Mall</div>
                    <div class="rateBox">
                        <div>Weekday: RM 18 / hour</div>
                        <div>Weekend: RM 24 / hour</div>
                    </div>
                    <asp:Button ID="btnSnooker" runat="server" Text="Select Venue" CssClass="bookBtn" OnClick="btnSnooker_Click" />
                </div>
            </div>

             <div class="facilityCard">
                <img class="facilityImage" src="https://torq03.com/wp-content/uploads/2024/11/PowerClip-Rectangle-2.webp" />
                <div class="cardContent">
                    <h3>Alley Bowling</h3>
                    <div class="locationText">Location: Level 5, East Coast Mall</div>
                    <div class="rateBox">
                        <div>Weekday: RM 12 / games</div>
                        <div>Weekend: RM 20 / games</div>
                    </div>
                    <asp:Button ID="btnBowling" runat="server" Text="Select Venue" CssClass="bookBtn" OnClick="btnBowling_Click" />
                </div>
            </div>
        </div>
    </form>
</body>
</html>
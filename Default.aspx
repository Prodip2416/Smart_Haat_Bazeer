<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Public.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="HaatBazeer._Default" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="jumbotron text-center">
        <h1>Smart Haat-Baazer</h1>
       <%-- <p class="lead">ASP.NET is a free web framework for building great Web sites and Web applications using HTML, CSS, and JavaScript.</p>
        <p><a href="http://www.asp.net" class="btn btn-primary btn-lg">Learn more &raquo;</a></p>--%>
    </div>

    <div class="row">
        <h2 class="text-center text-primary">Hy, please find your nearest place. To buy or sell <b>Bike</b>,<b>Car</b> or anything
        </h2>
        <div class="col-md-5">
            <h3 class="text-center text-danger">Location 01 : Mohammadpur</h3><br/>
            <iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d14606.067929548622!2d90.35101527119245!3d23.76459799167604!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x3755c09f9ba3d447%3A0x1babce9f1c6c95a3!2sMohammadpur%2C+Dhaka!5e0!3m2!1sen!2sbd!4v1520684787504" width="500" height="450" frameborder="0" style="border: 0" allowfullscreen></iframe>
        </div>
        <div class="col-md-2">
            
        </div>
        <div class="col-md-5">
            <h3 class="text-center text-danger">Location 02 : Dhanmondi</h3><br/>
    <iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d14608.03694484685!2d90.36710722118697!3d23.747050044461837!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x3755b8b33cffc3fb%3A0x4a826f475fd312af!2sDhanmondi%2C+Dhaka+1205!5e0!3m2!1sen!2sbd!4v1520706416940" width="500" height="450" frameborder="0" style="border:0" allowfullscreen></iframe>
        </div>

    </div>
    <div class="row">
        <div class="col-md-5">
            <h3 class="text-center text-danger">Location 03 : Framgate</h3><br/>
            <iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3651.739160957363!2d90.38506991440813!3d23.756679244454617!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x3755b8a426199b0d%3A0x6a2c655d06c88ec9!2sFarmgate%2C+Dhaka+1205!5e0!3m2!1sen!2sbd!4v1520706526715" width="500" height="450" frameborder="0" style="border: 0" allowfullscreen></iframe>
        </div>
        <div class="col-md-2">
            
        </div>
        <div class="col-md-5">
            <h3 class="text-center text-danger">Location 03 : New Market</h3><br/>
            <iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3652.405184073016!2d90.38468399696379!3d23.732926358748596!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x3755b84e57dd8b19%3A0xd66f294182e721e8!2sDhaka+New+Market!5e0!3m2!1sen!2sbd!4v1520706607938" width="500" height="450" frameborder="0" style="border:0" allowfullscreen></iframe>
        </div>
    </div>

</asp:Content>

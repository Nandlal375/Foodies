<%@ Page Title="" Language="C#" MasterPageFile="~/User/User.Master" AutoEventWireup="true" CodeBehind="Contact.aspx.cs" Inherits="Foodies.User.Contact" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script>
    window.onload = function () {
    setTimeout(function () {
        document.getElementById("<%=lblMsg.ClientID%>").style.display = "none";
    }, 5000);

    }
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <!-- book section -->
  <section class="book_section layout_padding">
    <div class="container">
      <div class="heading_container">
          <div class="align-self-end">
          <asp:Label runat="server" ID="lblMsg"></asp:Label>
         </div>
        <h2>Send Your Query</h2>
      </div>
      <div class="row">
        <div class="col-md-6">
          <div class="form_container">
            
              <div>
                <asp:TextBox runat="server" ID="txtName" CssClass="form-control" placeholder="Your Name"></asp:TextBox>
                  <asp:RequiredFieldValidator ErrorMessage="Name is required" ControlToValidate="txtName" runat="server" ID="rfvName" ForeColor="Red" Display="Dynamic" SetFocusOnError="true">
                 </asp:RequiredFieldValidator>
              </div>
              <div>
                <asp:TextBox runat="server" ID="txtEmail" CssClass="form-control" placeholder="Your Email" TextMode="Email"></asp:TextBox>
               <asp:RequiredFieldValidator ErrorMessage="Email is required" ControlToValidate="txtEmail" runat="server" ID="RequiredFieldValidator1" ForeColor="Red" Display="Dynamic" SetFocusOnError="true">
               </asp:RequiredFieldValidator>
              </div>
              <div>
                 <asp:TextBox runat="server" ID="txtSubject" CssClass="form-control" placeholder="Subject"></asp:TextBox>
                 <asp:RequiredFieldValidator ErrorMessage="Subject is required" ControlToValidate="txtSubject" runat="server" ID="rfvSubject" ForeColor="Red" Display="Dynamic" SetFocusOnError="true">
                 </asp:RequiredFieldValidator>
              </div>
              <div>
                <asp:TextBox runat="server" ID="txtMessage" CssClass="form-control" placeholder="Enter Your Query/Feedback"></asp:TextBox>
                <asp:RequiredFieldValidator ErrorMessage="Message is required" ControlToValidate="txtMessage" runat="server" ID="rfvMessage" ForeColor="Red" Display="Dynamic" SetFocusOnError="true">
                </asp:RequiredFieldValidator>
              </div>
              
              <div class="btn_box">
                  <asp:Button Text="Submit" runat="server" ID="btnSubmit" CssClass="btn btn-warning rounded-pill pl-4 pr-4 text-white" OnClick="btnSubmit_Click"/>
              </div>
            
          </div>
        </div>
        <div class="col-md-6">
          <div class="map_container ">
            <div id="googleMap"></div>
          </div>
        </div>
      </div>
    </div>
  </section>
  <!-- end book section -->

</asp:Content>

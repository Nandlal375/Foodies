<%@ Page Title="" Language="C#" MasterPageFile="~/User/User.Master" AutoEventWireup="true" CodeBehind="Registration.aspx.cs" Inherits="Foodies.User.Registration" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

     <script>
     window.onload = function () {
         setTimeout(function () {
             document.getElementById("<%=lblMsg.ClientID%>").style.display = "none";
         }, 5000);

     }
     function ImagePreview(input) {
         if (input.files && input.files[0]) {
             var render = new FileReader();
             render.onload = function (e) {

                 $("#<%=imgUser.ClientID%>").prop('src', e.target.result)
                     .width(200)
                     .height(200);
             };
             render.readAsDataURL(input.files[0]);
         }
     }
     </script>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <section class="book-section layout_padding">
        <div class="container">
            <div class="heading_container">
                <div class="align-self-end">
                    <asp:Label ID="lblMsg" runat="server" Visible="false"></asp:Label>
                </div>
                <asp:Label ID="lblHeaderMsg" runat="server" Text="<h2>User Registration</h2>"></asp:Label>
            </div>
            <br />
            <div class="row">
                <div class="col-md-6">
                    <div class="form_container">
                        <div>
                            <asp:TextBox runat="server" ID="txtName" CssClass="form-control"
                                placeholder="Enter Full Name" ToolTip="Full Name"/>
                            <asp:RequiredFieldValidator ID="rfvName" runat="server"
                                ErrorMessage="Name is Required!!" ForeColor="Red" ControlToValidate="txtName"
                                Display="Dynamic" SetFocusOnError="true">
                            </asp:RequiredFieldValidator>
                            <asp:RegularExpressionValidator ID="revName" runat="server" ErrorMessage="Name must be in Only character"
                                SetFocusOnError="true" ForeColor="Red" Display="Dynamic"
                                ValidationExpression="[a-zA-Z\s]+$" ControlToValidate="txtName">

                            </asp:RegularExpressionValidator>

                        </div>
                        <br />
                        <div>
                            <asp:TextBox runat="server" ID="txtUsername" CssClass="form-control"
                                placeholder="Enter User Name" ToolTip="UserName" />
                            <asp:RequiredFieldValidator ID="rfvUsername" runat="server"
                                ErrorMessage="UserName is Required!!" ForeColor="Red" ControlToValidate="txtUsername"
                                Display="Dynamic" SetFocusOnError="true">
                            </asp:RequiredFieldValidator>
                            <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ErrorMessage="User Name must be in Only character"
                                SetFocusOnError="true" ForeColor="Red" Display="Dynamic"
                                ValidationExpression="[a-zA-Z\s]+$" ControlToValidate="txtUsername">

                            </asp:RegularExpressionValidator>

                        </div>
                        <br />
                        <div>
                            <asp:TextBox runat="server" ID="txtEmail" CssClass="form-control"
                                placeholder="Enter Email" ToolTip="Email" TextMode="Email"/>
                            <asp:RequiredFieldValidator ID="rfvEmail" runat="server"
                                ErrorMessage="Email is Required!!" ForeColor="Red" ControlToValidate="txtEmail"
                                Display="Dynamic" SetFocusOnError="true">
                            </asp:RequiredFieldValidator>
                            
                        </div>
                        <br />
                        <div>
                            <asp:TextBox runat="server" ID="txtMobile" CssClass="form-control"
                                placeholder="Enter Mobile Number" ToolTip="Mobile Number" TextMode="Number" />
                            <asp:RequiredFieldValidator ID="rfvMobile" runat="server"
                                ErrorMessage="Mobile Number is Required!!" ForeColor="Red" ControlToValidate="txtMobile"
                                Display="Dynamic" SetFocusOnError="true">
                            </asp:RequiredFieldValidator>
                            <asp:RegularExpressionValidator ID="revMobile" runat="server" ErrorMessage="Mobile Number Must be 10 Digit Only"
                                SetFocusOnError="true" ForeColor="Red" Display="Dynamic"
                                ValidationExpression="^[0-9]{10}$" ControlToValidate="txtMobile">

                            </asp:RegularExpressionValidator>

                        </div>
                        <br />
                    </div>
                </div>

               
                        <div class="col-md-6">
                            <div class="form_container">
                                <div>
                                    <asp:TextBox runat="server" ID="txtAddress" CssClass="form-control"
                                        placeholder="Enter Address" ToolTip="Address" TextMode="MultiLine" />
                                    <asp:RequiredFieldValidator ID="rfvAddress" runat="server"
                                        ErrorMessage="Address is Required!!" ForeColor="Red" ControlToValidate="txtAddress"
                                        Display="Dynamic" SetFocusOnError="true">
                                    </asp:RequiredFieldValidator>


                                </div>
                                <br />
                                <div>
                                    <asp:TextBox runat="server" ID="txtPostCode" CssClass="form-control"
                                        placeholder="Enter Post/Zip Code" ToolTip="Post/Zip Code" TextMode="Number" MaxLength="6"/>
                                    <asp:RequiredFieldValidator ID="rfvPostCode" runat="server"
                                        ErrorMessage="Post/Zip Code is Required!!" ForeColor="Red" ControlToValidate="txtPostCode"
                                        Display="Dynamic" SetFocusOnError="true">
                                    </asp:RequiredFieldValidator>
                                    <asp:RegularExpressionValidator ID="revPostCode" runat="server" ErrorMessage="Post/Zip Code must be 6 digit"
                                        SetFocusOnError="true" ForeColor="Red" Display="Dynamic"
                                        ValidationExpression="^[0-9]{6}$" ControlToValidate="txtPostCode">

                                    </asp:RegularExpressionValidator>
                                </div>
                                <br />
                                <asp:FileUpload ID="fuUserImage" runat="server" CssClass="form-control" ToolTip="Image Upload" onchange="ImagePreview(this)"/>
                                <br />
                                <div>
                                    <asp:TextBox runat="server" ID="txtPassword" CssClass="form-control"
                                        placeholder="Enter Password" ToolTip="Password" TextMode="Password"/>
                                    <asp:RequiredFieldValidator ID="rfvPassword" runat="server"
                                        ErrorMessage="Password is Required!!" ForeColor="Red" ControlToValidate="txtPassword"
                                        Display="Dynamic" SetFocusOnError="true">
                                    </asp:RequiredFieldValidator>
                                    

                                </div>
                              <br />
                            </div>
                        </div>
                        <div class="row pl-4">
                            <div class="btn_box">
                                <asp:Button Text="Register" runat="server" ID="btnregister"
                                 CssClass="btn btn-success rounded-pill pl-4 pr-4 text-white" OnClick="btnregister_Click"/>
                                <asp:Label ID="lblAlreadyUser" runat="server" CssClass="pl-3 text-black-100"
                                 Text="Already Registered? <a href='Login.aspx' class='badge badge-info'>Login here....</a>"/>
                            </div>
                        </div>

                        <div class="row p-5">
                            <div style="align-items:center;">
                                <asp:Image ID="imgUser" runat="server" CssClass="img-thumbnail"/>
                            </div>
                        </div>

                    </div>
                </div>


           
    </section>

</asp:Content>

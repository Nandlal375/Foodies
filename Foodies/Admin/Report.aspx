<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.Master" AutoEventWireup="true" CodeBehind="Report.aspx.cs" Inherits="Foodies.Admin.Report" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceholder1" runat="server">

    <div class="pcoded-inner-content pt-0">

        <div class="main-body">
            <div class="page-wrapper">
                <div class="page-body">
                    <div class="row">
                        <div class="col-sm-12">
                            <div class="card">
                                <div class="card-header">
                                    <div class="container">
                                        <div class="form-row">
                                        <div class="form-group col-md-4">
                                            <label>From Date</label>
                                            <asp:RequiredFieldValidator ErrorMessage="*" ControlToValidate="txtFromDate" runat="server" ID="rfvFromDate" ForeColor="Red" Display="Dynamic" SetFocusOnError="true" />
                                            <asp:TextBox runat="server" ID="txtFromDate" TextMode="Date" CssClass="form-control"></asp:TextBox>
                                        </div>

                                        <div class="form-group col-md-4">
                                            <label>To Date</label>
                                            <asp:RequiredFieldValidator ErrorMessage="*" ControlToValidate="txtToDate" runat="server" ID="rfvToDate" ForeColor="Red" Display="Dynamic" SetFocusOnError="true" />
                                            <asp:TextBox runat="server" ID="txtToDate" TextMode="Date" CssClass="form-control"></asp:TextBox>
                                        </div>

                                        <div class="form-group col-md-4">
                                            <asp:Button Text="Search" runat="server" ID="btnSearch" CssClass="btn btn-primary mt-md-4"
                                                 OnClick="btnSearch_Click"/>
                                        </div>
                                     </div>
                                    </div>
                                </div>
                                <div class="card-block">
                                    <div class="row">

                                        <div class="col-12 mobile-inputs">
                                            <h4 class="sub-title">Selling Report</h4>

                                            <div class="card-block table-border-style">
                                                <div class="table-responsive">
                                                    <asp:Repeater runat="server" ID="rReport">
                                                        <HeaderTemplate>
                                                            <table class="table data-table-export table-hover nowrap">
                                                                <thead>
                                                                    <tr>
                                                                        <th class="table-plus">SrNo</th>
                                                                        <th>Full Name</th>
                                                                        <th>Email</th>
                                                                        <th>Item Orders</th>
                                                                        <th>Total Cost</th>
                                                                        
                                                                    </tr>
                                                                </thead>
                                                                <tbody>
                                                        </HeaderTemplate>
                                                        <ItemTemplate>

                                                            <tr>
                                                                <td class="table-plus"><%#Eval("SrNo")%></td>
                                                                <td><%#Eval("Name")%></td>
                                                                <td><%#Eval("Email")%></td>
                                                                <td><%#Eval("TotalOrders")%></td>
                                                                <td><%#Eval("TotalPrice")%></td>
                                                                
                                                            </tr>

                                                        </ItemTemplate>
                                                        <FooterTemplate>
                                                            </tbody>
                                               </table>
                                                        </FooterTemplate>


                                                    </asp:Repeater>

                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="pl-4">
                                        <asp:Label ID="lblTotal" runat="server" Font-Bold="true" Font-Size="Small"/>
                                    </div>

                                </div>
                            </div>

                        </div>

                    </div>
                </div>
            </div>
        </div>
    </div>


</asp:Content>

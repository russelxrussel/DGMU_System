<%@ Page Title="" Language="C#" MasterPageFile="~/DGMU.Master" AutoEventWireup="true" CodeBehind="Home.aspx.cs" Inherits="DGMU_System.Home" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentHead" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentBody" runat="server">

<div class="container container_content">
    
<div class="row">
<div class="col-md-3">
<div class="panel panel-success">
<div class="panel-heading">

        <strong>Hello! <span class="glyphicon glyphicon-user"></span> <asp:Label runat="server" ID="lblUserFullName" CssClass="text-uppercase"></asp:Label></strong>
</div>
<div class="panel-body">
 <asp:UpdatePanel runat="server" ID="upDateTime" UpdateMode="Conditional">
        <ContentTemplate>
        <asp:Timer ID="Timer1" runat="server" ontick="Timer1_Tick" Interval="1000"></asp:Timer>
        <span class="glyphicon glyphicon-time"></span> <asp:Label runat="server" ID="lblDT"></asp:Label>
        </ContentTemplate>
            <Triggers>
                <asp:AsyncPostBackTrigger ControlID="Timer1" EventName="Tick" />
            </Triggers>
        </asp:UpdatePanel>
<hr />
<img src="images/sp.png" class="img-responsive img-thumbnail" /> 

</div>
 

<div class="panel-footer bg-danger">
<div class="text-left small text-success">
<p>DGMU Enterprises Sales Delivery System ver 1.0</p>
       Developed by: Russel &COPY;
       </div>

</div>

</div>


</div>

<div class="col-md-5 small">
    <div class="panel panel-warning">
        <div class="panel-heading"><strong><asp:label runat="server" ID="lblDeliveryTextTitle"></asp:label></strong></div>
        <div class="panel-body">
         
            <asp:Panel runat="server" ID="panDeliveryToday" Height="500px" ScrollBars="Vertical">
            <asp:GridView runat="Server" ID="gvDeliverySchedule" AutoGenerateColumns="false" CssClass="table table-condensed">
                <Columns>
                    <asp:BoundField ReadOnly="true" DataField="DRNum" HeaderText="DR #" />
                    <asp:BoundField ReadOnly="true" DataField="BranchName" HeaderText="Branch" />
                    <asp:BoundField ReadOnly="true" DataField="LACode" HeaderText="Area" />

                </Columns>
            </asp:GridView>

            <asp:GridView runat="Server" ID="gvDeliveryTEMP" Visible="false" AutoGenerateColumns="false" CssClass="table table-condensed">
                <Columns>
                    <asp:BoundField ReadOnly="true" DataField="schedListID" />
                    <asp:BoundField ReadOnly="true" DataField="DRNum" HeaderText="DR #" />
                    <asp:BoundField ReadOnly="true" DataField="BranchCode" HeaderText="Branch" />
                  
                    <asp:TemplateField>
                        <ItemTemplate>

                       
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
            </asp:GridView>
            </asp:Panel>
              
        </div>
    </div>

</div>

    <div class="col-md-4 small">
        <div class="panel panel-warning">
            <div class="panel-heading">Storage Stock</div>
            <div class="panel-body">
                <asp:GridView runat="server" ID="gvStorageStockStatus" AutoGenerateColumns="false" CssClass="table table-bordered table-responsive">
                <Columns>
                    <asp:BoundField DataField="StorageName" HeaderText="Storage" />
                    <asp:BoundField DataField="ItemName" HeaderText="Item" />
                    <asp:BoundField DataField="CurrentStock" HeaderText="Stock" />
                </Columns>                    
                </asp:GridView>
            </div>
        </div>
    </div>



</div>


</div>
   







</asp:Content>

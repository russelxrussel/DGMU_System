<%@ Page Title="" Language="C#" MasterPageFile="~/DGMU.Master" AutoEventWireup="true" CodeBehind="test1.aspx.cs" Inherits="DGMU_System.test1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentHead" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentBody" runat="server">
    <asp:UpdatePanel runat="server" ID="upDateTime" UpdateMode="Conditional">
        <ContentTemplate>
                   <span class="glyphicon glyphicon-time"></span> <asp:Label runat="server" ID="lblDT">---</asp:Label>
                  <asp:Timer ID="Timer1" runat="server" OnTick="Timer1_Tick" Interval="1000" />
         </ContentTemplate>
        
          <Triggers>
                <asp:AsyncPostBackTrigger ControlID="Timer1" EventName="Tick" />
            </Triggers>
     
     
        </asp:UpdatePanel>
</asp:Content>

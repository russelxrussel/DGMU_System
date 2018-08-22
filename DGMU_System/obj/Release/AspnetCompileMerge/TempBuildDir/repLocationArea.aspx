
<%@ Page Title="" Language="C#" MasterPageFile="~/DGMU.Master" AutoEventWireup="true" CodeBehind="repLocationArea.aspx.cs" Inherits="DGMU_System.repLocationArea" %>

<%@ Register assembly="CrystalDecisions.Web, Version=13.0.2000.0, Culture=neutral, PublicKeyToken=692fbea5521e1304" namespace="CrystalDecisions.Web" tagprefix="CR" %>


<asp:Content ID="Content1" ContentPlaceHolderID="ContentHead" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentBody" runat="server">
      
     <div class="container container_content">
    <div class="row"><!--Main Row -->

        <div class="panel panel-warning">

        <div class="panel-heading">List of Area with Branch</div>
           <div class="panel-body">
      <CR:CrystalReportViewer ID="CrystalReportViewer1" runat="server" 
            AutoDataBind="true" ReportSourceID="CrystalReportSource1" 
            EnableParameterPrompt="False" 
             HasCrystalLogo="False"/>
               </div>
      </div>

     </div>
         </div>
    </asp:Content>
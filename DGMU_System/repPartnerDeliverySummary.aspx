<%@ Page Title="" Language="C#" MasterPageFile="~/DGMU.Master" AutoEventWireup="true" CodeBehind="repPartnerDeliverySummary.aspx.cs" Inherits="DGMU_System.repPartnerDeliverySummary" %>

<%@ Register assembly="CrystalDecisions.Web, Version=13.0.2000.0, Culture=neutral, PublicKeyToken=692fbea5521e1304" namespace="CrystalDecisions.Web" tagprefix="CR" %>



<asp:Content ID="Content1" ContentPlaceHolderID="ContentHead" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentBody" runat="server">
    <script type="text/javascript">
       $(function () {
           $('.calendarInput').datetimepicker(
               {
                format: 'L'
               });
       });
      </script>  

<%--    <asp:UpdatePanel runat="server" ID="upPanelReport" UpdateMode="Conditional">
        <ContentTemplate>--%>


     <div class="container container_content">
    
    <div class="row"><!--Main Row -->
        
        <div class="col-md-3">
         <div class="input-group input-group-sm">
                    <span class="input-group-addon alert-danger">Partner</span>
                    <asp:DropDownList runat="server" ID="ddPartnerList" CssClass="form-control"></asp:DropDownList>
                </div>
        </div>
        <div class="col-md-3">
                <!-- Start Date-->
                <div class="input-group input-group-sm">
                    <span class="input-group-addon alert-danger"><span class="glyphicon glyphicon-calendar">
                    </span>FROM</span>
                    <asp:TextBox runat="server" ID="txtStartDate" CssClass="calendarInput form-control"
                        placeholder="Start Date"></asp:TextBox>
                </div>
        </div>
        <div class="col-md-3">
                <!-- End Date-->
                <div class="input-group input-group-sm">
                    <span class="input-group-addon alert-danger"><span class="glyphicon glyphicon-calendar">
                    </span>TO</span>
                    <asp:TextBox runat="server" ID="txtEndDate" CssClass="calendarInput form-control"
                        placeholder="End Date"></asp:TextBox>
                </div>
       </div>
        
                
        <div class="col-md-3">
                <asp:LinkButton runat="server" ID="U_Print" CssClass="btn btn-success btn-sm" OnClick="U_Print_Click" 
                        ><span class="glyphicon glyphicon-print"></span> PREVIEW</asp:LinkButton>
        </div>        
                
        
   </div>
 <hr />
     <div class="row">
     
     <div class="col-md-12">
      <CR:CrystalReportViewer ID="CrystalReportViewer1" runat="server" 
            AutoDataBind="true" PageZoomFactor="80"
            HasCrystalLogo="False" ToolPanelView="None" 
            ToolPanelWidth="200px" Width="1024px" EnableDatabaseLogonPrompt="False" 
            EnableParameterPrompt="False" HasToggleGroupTreeButton="true" 
            HasToggleParameterPanelButton="False" />
      </div>

      <%--<div class="col-md-6">
      <CR:CrystalReportViewer ID="CrystalReportViewer2" runat="server" 
            AutoDataBind="true" PageZoomFactor="50"
            HasCrystalLogo="False" ToolPanelView="None" 
            ToolPanelWidth="200px" Width="1024px" EnableDatabaseLogonPrompt="False" 
            EnableParameterPrompt="False" HasToggleGroupTreeButton="False" 
            HasToggleParameterPanelButton="False" ReuseParameterValuesOnRefresh="True" GroupTreeStyle-ShowLines="False" />
      </div>--%>
    </div>
   
   <!--Message Error -->
                    <div class="modal fade" id="msgErrorModal">
                        <div class="modal-dialog">
                            <div class="modal-content">
                                <div class="modal-header bg-danger">
                                    <button class="close" data-dismiss="modal">
                                        &times;</button>
                                    <h4 class="modal-title">
                                        DGMU Enterprises</h4>
                                </div>
                                <div class="modal-body">
                                    <h4>
                                        <span class="glyphicon glyphicon-alert"></span>&nbsp;
                                        <asp:Label runat="server" ID="lblErrorPrompt"></asp:Label></h4>
                                </div>
                                <div class="modal-footer">
                                </div>
                            </div>
                        </div>
                    </div>

    </div><!--End of Container -->

            
    <%--    </ContentTemplate>
    </asp:UpdatePanel>--%>
</asp:Content>

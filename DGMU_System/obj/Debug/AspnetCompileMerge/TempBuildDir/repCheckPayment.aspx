<%@ Page Title="" Language="C#" MasterPageFile="~/DGMU.Master" AutoEventWireup="true" CodeBehind="repCheckPayment.aspx.cs" Inherits="DGMU_System.repCheckPayment" %>

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

     <div class="container container_content">
    
    <div class="row"><!--Main Row -->
        
        <div class="col-md-3">
         <div class="input-group input-group-sm">
                    <span class="input-group-addon alert-danger">Supplier</span>
                    <asp:DropDownList runat="server" AutoPostBack="true" ID="ddSupplier" CssClass="form-control" OnSelectedIndexChanged="ddPartnerList_SelectedIndexChanged"></asp:DropDownList>
                </div>
        </div>
         
        <div class="col-md-3">
         <div class="input-group input-group-sm">
                    <span class="input-group-addon alert-danger">Voucher Number</span>
                    <asp:DropDownList runat="server" ID="ddVoucher" CssClass="form-control"></asp:DropDownList>
                </div>
        </div>

        <div class="col-md-3">
                <!-- Start Date-->
                <div class="input-group input-group-sm">
                    <span class="input-group-addon alert-danger"><span class="glyphicon glyphicon-calendar">
                    </span></span>
                    <asp:TextBox runat="server" ID="txtDateCheck" CssClass="calendarInput form-control"
                        placeholder="Cheque Date"></asp:TextBox>
                </div>
        </div>
       
        
                
        <div class="col-md-3">
                <asp:LinkButton runat="server" ID="U_Print" CssClass="btn btn-success btn-sm" OnClick="U_Print_Click" 
                        ><span class="glyphicon glyphicon-print"></span> PREVIEW</asp:LinkButton>
        </div>        
                
        
   </div>
 <hr />
     <div class="row">

      <CR:CrystalReportViewer ID="CrystalReportViewer1" runat="server" 
            AutoDataBind="true" PageZoomFactor="100"
            HasCrystalLogo="False" ToolPanelView="None" 
            ToolPanelWidth="200px" Width="1024px" EnableDatabaseLogonPrompt="False" 
            EnableParameterPrompt="False" HasToggleGroupTreeButton="False" 
            HasToggleParameterPanelButton="False" ReuseParameterValuesOnRefresh="True" GroupTreeStyle-ShowLines="False" />
   
    </div><!-- End of Right Column -->
   
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
</asp:Content>

<%@ Page Title="" Language="C#" MasterPageFile="~/DGMU.Master" AutoEventWireup="true" CodeBehind="PickTransfer_Distribution.aspx.cs" Inherits="DGMU_System.PickTransfer_Distribution" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentHead" runat="server">
    <style type="text/css">
        .datepicker {
            width: 50px;
            font-size: smaller;
            
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentBody" runat="server">
   <script type="text/javascript">
       $(document).ready(function () {
           var prm = Sys.WebForms.PageRequestManager.getInstance();
           prm.add_initializeRequest(InitialRequest);
           prm.add_endRequest(EndRequest);

           //Auto Complete Initial
         //  SetAutoComplete();
           setCalendarInput();

       });

       function InitialRequest(sender, args) {
       }

       function EndRequest(sender, args) {
        //   SetAutoComplete();
           setCalendarInput();
       }

       //For Calendar Inputs
       function setCalendarInput() {
           //$('.calendarInput').datepicker();
           $('.calendarInput').datetimepicker(
              {
               format: 'L'
              });
       }

      </script>  

   <asp:UpdatePanel runat="server" ID="upMainPanel" UpdateMode="Conditional">
       <ContentTemplate>

  
            <div class="container container_content">
     
                <div class="panel panel-warning">
                    <div class="panel-heading">
                        <div class="row">
                    <div class="col-md-3">
                        <asp:Panel runat="server" ID="xPanelControls">
                            <asp:LinkButton runat="server" ID="U_Save_S" CssClass="btn btn-success btn-sm" OnClick="U_Save_S_Click"><span class="glyphicon glyphicon-saved"></span> PROCESS</asp:LinkButton>
                        </asp:Panel>
                    </div>
                    
                    <div class="col-md-3 col-md-offset-6">
                        <div class="input-group input-group-sm">
                            <asp:TextBox runat="server" ID="txtPrintTransaction" CssClass="form-control" placeholder="Re-Print SA#" MaxLength="9"></asp:TextBox>
                            <span class="input-group-btn">
                                <asp:LinkButton runat="server" ID="lnkPrintTransaction" CssClass="btn btn-primary btn-sm"
                                    OnClick="lnkPrintTransaction_Click">Print</asp:LinkButton>
                            </span>
                        </div>
                    </div>
                </div>
                    </div>
 
                    <div class="panel-body">
                        <div class="row">
                            <!--Main Row -->
                            <!--Left Column -->
                            <div class="col-md-5">
                            <%--    <asp:UpdatePanel runat="server" ID="upDistributionItem" UpdateMode="Conditional">
                                <ContentTemplate>--%>
                                <!-- Pickup Transfer Source -->
                                <asp:Panel runat="server" ID="panDistributeSource">
                                <div class="panel panel-success">
                                    <div class="panel-heading">
                                        Pickup / Transfer Source
                                    </div>
                                    <div class="panel-body">
                                        <ul class="list-group small">
                                           
                                            <li class="list-group-item">
                                                <!-- Branch -->
                                                <div class="input-group input-group-sm has-error">
                                                    <span class="input-group-addon alert-danger"><span class="glyphicon glyphicon-record">
                                                    </span></span>
                                                 <asp:DropDownList ID="ddBranchItemToDistribute" runat="server" AutoPostBack="true"  CssClass="dropdown form-control" OnSelectedIndexChanged="ddBranchItemToDistribute_SelectedIndexChanged">
                                                 </asp:DropDownList>
                                                </div>
                                            </li>

                                            <li class="list-group-item">
                                                <table class="table table-condensed">
                                                    <tr>
                                                        <td>Partner:</td><td><asp:Label runat="server" id="lblPartnerName"></asp:Label>
                                                                            <asp:Label runat="server" ID="lblPartnerCode" Visible="false"></asp:Label>
                                                                            <asp:Label runat="server" ID="lblPTBNum" Visible="false"></asp:Label>
                                                                         </td>
                                                    </tr>
                                                    <tr>
                                                        <td>Item:</td><td><asp:Label runat="server" ID="lblBranchItem"></asp:Label>
                                                            <asp:Label runat="server" ID="lblBranchItemCode" Visible="false"></asp:Label>
                                                                      </td>
                                                    </tr>
                                                     <tr>
                                                        <td>Quantity:</td><td><asp:Label runat="server" ID="lblQuantity"></asp:Label></td>
                                                    </tr>
                                                    <tr><td>Distributed: </td><td><asp:Label runat="server" ID="lblDistributed"></asp:Label></td></tr>
                                                    
                                                    <tr class="text-danger"><td>Remaining: </td><td><b><asp:Label runat="server" ID="lblRemaining"></asp:Label></b></td></tr>
                                                </table>
                                            </li>

                                           
                                            
                                            <li class="list-group-item">
                                                <!-- Remarks-->
                                                <asp:TextBox runat="server" ID="txtRemarks" CssClass="form-control" placeholder="Remarks"
                                                    Rows="3" TextMode="MultiLine"></asp:TextBox>
                                            </li>

                                              <li class="list-group-item text-right">
                                               <asp:LinkButton runat="server" ID="lnkSet" CssClass="btn btn-primary" OnClick="lnkSet_Click">SET</asp:LinkButton>
                                            </li>


                                            
                                        </ul>
                                       
                                    </div>
                               
                                </div>
                                </asp:Panel>
                            <%--    </ContentTemplate>
                                </asp:UpdatePanel>--%>
                                <!--End of Supplier Panel -->
                            </div>
                            <!--End of Left Column -->
                            <!--Middle Column -->
                            <div class="col-md-7">
                                  <div class="panel panel-success">
                                    <div class="panel-heading">
                                        <table width="100%">
                                            <tr><td>Distributed Item</td>
                                                <td class="text-right">
                                        <div class=""><asp:LinkButton runat="server" ID="lnkCancel" CssClass="btn btn-danger btn-sm" OnClick="lnkCancel_Click">Cancel</asp:LinkButton></div>
                                        </td>
                                                    </tr>
                                            </table>
                                            </div>
                                   
                                  <div class="panel-body">

                                    <asp:Panel runat="server" ID="panBranchList" ScrollBars="Vertical" Height="550px">
                                    <asp:GridView runat="server" ID="gvBranchList" CssClass="table table-responsive small" AutoGenerateColumns="false" AlternatingRowStyle-CssClass="bg-info" GridLines="none" OnRowDataBound="gvBranchList_RowDataBound">
                                        <Columns>
                                            <asp:BoundField  DataField="BranchCode" ControlStyle-CssClass="hidden" HeaderStyle-CssClass="hidden" ItemStyle-CssClass="hidden" />
                                            <asp:BoundField DataField="BranchName" HeaderText ="Branch" />
                                            <asp:TemplateField HeaderText="Distributed Qty">
                                                <ItemTemplate>
                                                    <asp:TextBox runat="server" id="txtDistrubutedQty" Text="0" Width="100px" MaxLength="4" CssClass="form-control text-center" onkeypress="return(event.charCode == 8 || event.charCode == 0) ? 0: event.charCode >= 46 && event.charCode <=57"></asp:TextBox>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Date Distributed">
                                                <ItemTemplate>
                                                    <!-- Date-->
                                                <div class="input-group input-group-sm has-error">
                                                    <span class="input-group-addon alert-danger"><span class="glyphicon glyphicon-calendar">
                                                    </span></span>
                                                    <asp:TextBox runat="server" ID="txtDate" CssClass="calendarInput form-control small"
                                                        placeholder="Date"></asp:TextBox>

                                                </div>

                                                    <script type="text/javascript">
                                                        $(function () {
                                                            $('.calendarInput').datetimepicker(
                                                                {
                                                                    format: 'L'
                                                                });
                                                        });
                                                    </script>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                        </Columns>
                                    </asp:GridView>
                                    </asp:Panel>

                                   <%-- <asp:GridView runat="server" ID="gvItemList" CssClass="table table-condensed" AutoGenerateColumns="false" GridLines="None">
                                        <Columns>
                                            <asp:BoundField DataField="ItemCode" HeaderText ="Code"/>
                                            <asp:BoundField DataField="ItemName" HeaderText ="Description" />
                                           
                                             <asp:TemplateField HeaderText="Quantity" HeaderStyle-CssClass="text-center">
                                              
                                                <ItemTemplate>
                                                    <asp:TextBox runat="server" ID="txtQuantity" CssClass="form-control text-center" Text="0" onkeypress="return(event.charCode == 8 || event.charCode == 0) ? null: event.charCode >= 46 && event.charCode <=57"></asp:TextBox>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                        </Columns>
                                    </asp:GridView>--%>
                                  </div>    
                                  </div>
                            </div>
                            <!--End of Right Column -->
                        
                        <!--End of Main Row -->
                    </div>
                    <!--End of Panel Body -->
                    </div>
                    </div>
                    <!--MESSAGE MODAL SECTION-->
                    <!--Message Save SUCCESS-->
                    <div class="modal fade" id="msgSuccessModal">
                        <div class="modal-dialog">
                            <div class="modal-content">
                                <div class="modal-header bg-success">
                                    <button class="close" data-dismiss="modal">
                                        &times;</button>
                                    <h4 class="modal-title">
                                         DGMU Enterprise System</h4>
                                </div>
                                <div class="modal-body">
                                    <h4>
                                        <span class="glyphicon glyphicon-success"></span>&nbsp;
                                        <asp:Label runat="server" ID="lblMessageSuccess"></asp:Label></h4>
                                </div>
                                <div class="modal-footer">
                                    <p>Developed by: Russel Vasquez &copy;</p>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!--Message Error -->
                    <div class="modal fade" id="msgErrorModal">
                        <div class="modal-dialog">
                            <div class="modal-content">
                                <div class="modal-header bg-danger">
                                    <button class="close" data-dismiss="modal">
                                        &times;</button>
                                    <h4 class="modal-title">
                                        DGMU Enterprise System</h4>
                                </div>
                                <div class="modal-body">
                                    <h4>
                                        <span class="glyphicon glyphicon-alert"></span>&nbsp;
                                        <asp:Label runat="server" ID="lblErrorMessage"></asp:Label></h4>
                                </div>
                                <div class="modal-footer">
                                     <p>Developed by: Russel Vasquez &copy;</p>
                                </div>
                            </div>
                        </div>
                    </div>
                   

                </div>
                <!--End of Main Panel Body -->
                <!-- End of uplSupplier -->
            </ContentTemplate>
   </asp:UpdatePanel>

        

            <!-- End of Main Panel -->
            <!-- End of Container -->

      
     

</asp:Content>

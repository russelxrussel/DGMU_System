<%@ Page Title="" Language="C#" MasterPageFile="~/DGMU.Master" AutoEventWireup="true" CodeBehind="PartnerPO.aspx.cs" Inherits="DGMU_System.PartnerPO" %>
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

    <asp:UpdatePanel runat="server" ID="uplSupplier" UpdateMode="Conditional">
        <ContentTemplate>
  
            <div class="container container_content">
               
            Partner Purchase Order
                <div class="panel panel-warning">
                    <div class="panel-heading">
                        <div class="row">
                    <div class="col-md-3">
                        <asp:Panel runat="server" ID="xPanelControls">
                            <asp:LinkButton runat="server" ID="U_Save_S" CssClass="btn btn-success btn-sm" OnClick="U_Save_S_Click"><span class="glyphicon glyphicon-saved"></span> SAVE</asp:LinkButton>
                        </asp:Panel>
                    </div>
                    
                    <div class="col-md-3 col-md-offset-6">
                        <div class="input-group input-group-sm">
                            <asp:TextBox runat="server" ID="txtPrintTransaction" CssClass="form-control" placeholder="Re-Print PO #"></asp:TextBox>
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
                            <div class="col-md-4">
                                <!--Supplier Panel -->
                                <div class="panel panel-warning">
                                    <div class="panel-heading">
                                        Partner Selection
                                    </div>
                                    <div class="panel-body">
                                        <ul class="list-group">
                                           
                                            <li class="list-group-item">
                                                <!-- Request Date-->
                                                <div id="calcal" class="input-group input-group-sm has-error">
                                                    <span class="input-group-addon alert-danger"><span class="glyphicon glyphicon-calendar">
                                                    </span></span>
                                                    <asp:TextBox runat="server" ID="txtRequestDate" CssClass="calendarInput form-control"
                                                        placeholder="Request Date"></asp:TextBox>
                                                </div>
                                                 
                                            </li>
                                            <li class="list-group-item">
                                                <!-- Supplier-->
                                                <div class="input-group input-group-sm has-error">
                                                    <span class="input-group-addon alert-danger"><span class="glyphicon glyphicon-record"></span>
                                                    </span>
                                                    <asp:DropDownList ID="ddPartnerList" runat="server" CssClass="dropdown form-control"
                                                        OnSelectedIndexChanged="ddPartnerList_SelectedIndexChanged" AutoPostBack="True">
                                                    </asp:DropDownList>
                                             <%--   </div>

                                                 <!--Search Supplier -->
                                        <div class="input-group input-group-sm">
                                            <span class="input-group-addon"><span class="glyphicon glyphicon-search"></span>
                                            </span>
                                            
                                            <div id="divSearch">
                                            </div>--%>
                                            <strong>
                                            <asp:Label runat="server" ID="lblContactPerson" CssClass="form-control"></asp:Label></strong>
                                            <asp:Label runat="server" ID="lblPartnerNumbers" CssClass="form-control text-nowrap"></asp:Label>
                                            <asp:Label runat="server" ID="lblAddress" CssClass="form-control text-nowrap"></asp:Label>
                                            <!--Hidden Field -->
                                            <asp:HiddenField ID="hfSupplierCode" runat="server" />

                                            <asp:TextBox runat="server" ID="txtSearchSupplier" Visible="False" CssClass="form-control" ClientIDMode="Static">
                                            </asp:TextBox>
                                        </div>
                                            </li>

                                            <li class="list-group-item">
                                                <!-- Remarks-->
                                                <asp:TextBox runat="server" ID="txtRemarks" CssClass="form-control" placeholder="Remarks"
                                                    Rows="2" TextMode="MultiLine"></asp:TextBox>
                                            </li>
                                        </ul>
                                       
                                    </div>
                                    <!--End of Supplier Panel Body -->
                                </div>
                                <!--End of Supplier Panel -->
                            </div>
                            <!--End of Left Column -->
                            <!--Right Column -->
                            <div class="col-md-8">
                                <!--Item Panel -->
                                <div class="panel panel-warning">
                                    <div class="panel-heading">
                                        Items Selection
                                    </div>
                                    <div class="panel-body">
                                        <ul class="list-group">
                                            <li class="list-group-item">
                                                <div class="row">
                                                    <div class="col-md-8">
                                                        <div class="input-group input-group-sm has-error">
                                                            <span class="input-group-addon alert-danger"><span class="glyphicon glyphicon-record">
                                                            </span></span>
                                                            <asp:DropDownList ID="ddBranchList" runat="server" CssClass="dropdown form-control">
                                                            </asp:DropDownList>
                                                       

                                                   
                                                             <asp:DropDownList ID="ddItemList" runat="server" AutoPostBack="True" CssClass="dropdown form-control"
                                                                OnSelectedIndexChanged="ddItemList_SelectedIndexChanged">
                                                            </asp:DropDownList>
                                                        </div>
                                                   
                                                    </div>

                                                    <div class="col-md-4">
                                                        <div class="input-group input-group-sm">
                                                        <span class="input-group-addon">PRICE</span><asp:Label runat="server"
                                                                ID="lblPrice" CssClass="form-control text-danger"></asp:Label>
                                                       </div>
                                                         <div class="input-group input-group-sm">
                                                          <span class="input-group-addon">
                                                              Conversion Qty</span><asp:Label runat="server"
                                                                ID="lblConversion" CssClass="form-control text-danger"></asp:Label>
                                                        </div>
                                                    </div>

                                                </div>    
                                                   
                                                    
                                            </li>
                                            <li class="list-group-item">
                                                <div class="row">
                                                  
                                                       <!--Quantity Input -->
                                                    <div class="col-md-5">
                                                        <div class="input-group input-group-sm  has-error">
                                                            <span class="input-group-addon alert-danger">Qty</span><asp:TextBox runat="server"
                                                                CssClass="form-control" ID="txtQuantity" MaxLength="8" placeholder="Quantity" onkeypress="return(event.charCode == 8 || event.charCode == 0) ? null: event.charCode >= 46 && event.charCode <=57"></asp:TextBox>
                                                           
                                                            <span class="input-group-addon alert-danger"><asp:Label runat="server" ID="lblPartnerUOM"></asp:Label></span>
                                                               

                                                          
                                                        </div>
                                                    </div>
                                                  
                                                  

                                             

                                                      <!--Add Button -->
                                                    <div class="col-md-3 text-right">
                                                        <asp:LinkButton runat="server" ID="lnkAdd" CssClass="btn btn-warning btn-sm" OnClick="lnkAdd_Click"><span class="glyphicon glyphicon-plus-sign"></span> ADD</asp:LinkButton>
                                                    </div>

                                                </div>
                                                
                                             
                                               


                                            </li>
                                            
                                        </ul>
                                        <!--Display added  Items -->
                                        <div class="panel panel-warning">
                                            <div class="panel-heading">
                                                List of Item(s) order of Partner
                                            </div>
                                            <div class="panel-body">
                                                <div class="row">
                                                    <asp:GridView runat="server" ID="gvPartnerItems" CssClass="table table-responsive table-condensed table-bordered">
                                                        <Columns>
                                                            <asp:TemplateField ItemStyle-HorizontalAlign="Center">
                                                                <ItemTemplate>
                                                                    <asp:LinkButton ID="lnkRemoveItem" runat="server" CssClass="btn btn-danger btn-sm"
                                                                        OnClick="lnkRemoveItem_Click">X</asp:LinkButton>
                                                                </ItemTemplate>
                                                            </asp:TemplateField>
                                                        </Columns>
                                                    </asp:GridView>
                                                </div>
                                            </div>
                                            <!--End of Display Panel Body -->
                                            <div class="panel-footer">
                                                <div class="text-right">
                                                    <strong>
                                                        <asp:Label runat="server" ID="lblRunningTotal" CssClass="text-danger"></asp:Label></strong>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <!--End of Item Panel Body -->
                                </div>
                            </div>
                            <!--End of Right Column -->
                        </div>
                        <!--End of Main Row -->
                    </div>
                    <!--End of Panel Body -->

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
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <!--End of Main Panel Body -->
                <!-- End of uplSupplier -->
            </div>

            <!-- End of Main Panel -->
            <!-- End of Container -->

        </ContentTemplate>
    </asp:UpdatePanel>  
     

</asp:Content>

<%@ Page Title="" Language="C#" MasterPageFile="~/DGMU.Master" AutoEventWireup="true" CodeBehind="SupplierGoodsReceive.aspx.cs" Inherits="DGMU_System.SupplierGoodsReceive" %>
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
                            <asp:TextBox runat="server" ID="txtPrintTransaction" CssClass="form-control" placeholder="Print Transaction #"></asp:TextBox>
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
                                        Supplier Selection
                                    </div>
                                    <div class="panel-body">
                                        <ul class="list-group">
                                            <li class="list-group-item">
                                                <!-- Document Date-->
                                                <div class="input-group input-group-sm">
                                                    <span class="input-group-addon alert-danger"><span class="glyphicon glyphicon-calendar">
                                                    </span></span>
                                                    <asp:TextBox runat="server" ID="txtDateTrans" CssClass="calendarInput form-control"
                                                        placeholder="Document Date"></asp:TextBox>
                                                </div>
                                            </li>
                                            <li class="list-group-item">
                                                <!-- Delivery Date-->
                                                <div class="input-group input-group-sm">
                                                    <span class="input-group-addon alert-danger"><span class="glyphicon glyphicon-calendar">
                                                    </span></span>
                                                    <asp:TextBox runat="server" ID="txtDeliveryDate" CssClass="calendarInput form-control"
                                                        placeholder="Receiving Date"></asp:TextBox>
                                                </div>
                                            </li>
                                            <li class="list-group-item">
                                                <!-- Supplier-->
                                                <div class="input-group input-group-sm">
                                                    <span class="input-group-addon alert-danger"><span class="glyphicon glyphicon-record"></span>
                                                    </span>
                                                    <asp:DropDownList ID="ddSupplierList" runat="server" CssClass="dropdown form-control"
                                                        OnSelectedIndexChanged="ddSupplierList_SelectedIndexChanged" AutoPostBack="True">
                                                    </asp:DropDownList>
                                             <%--   </div>

                                                 <!--Search Supplier -->
                                        <div class="input-group input-group-sm">
                                            <span class="input-group-addon"><span class="glyphicon glyphicon-search"></span>
                                            </span>
                                            
                                            <div id="divSearch">
                                            </div>--%>
                                            <strong>
                                                <asp:Label runat="server" ID="lblSupplierContact" CssClass="form-control"></asp:Label></strong>
                                            <asp:Label runat="server" ID="lblSupplierNumbers" CssClass="form-control text-nowrap"></asp:Label>
                                            <asp:Label runat="server" ID="lblSupplierAddress" CssClass="form-control text-nowrap"></asp:Label>
                                            <!--Hidden Field -->
                                            <asp:HiddenField ID="hfSupplierCode" runat="server" />

                                            <asp:TextBox runat="server" ID="txtSearchSupplier" Visible="False" CssClass="form-control" ClientIDMode="Static">
                                            </asp:TextBox>
                                        </div>
                                            </li>

                                            <li class="list-group-item">
                                                <!-- Remarks-->
                                                <asp:TextBox runat="server" ID="txtRemarks" CssClass="form-control" placeholder="General Remarks"
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
                            <asp:UpdatePanel runat="server" ID="upPO">
                            <ContentTemplate>
                            
                            <div class="col-md-8">
                                <!--Item Panel -->
                                <div class="panel panel-warning">
                                    <div class="panel-heading">
                                        <div class="row">
                                        <div class="col-md-5">
                                            <asp:LinkButton runat="server" ID="lnkBrowsePO" CssClass="btn btn-info" 
                                                onclick="lnkBrowsePO_Click"><span class="glyphicon glyphicon-th"></span> BROWSE P.O</asp:LinkButton>
                                        </div>
                                        </div>
                                    </div>
                                    <div class="panel-body">
                                      
                                        <!--Display added  Items -->
                                        <div class="panel panel-warning">
                                            <div class="panel-heading">
                                                List of Item(s) from Supplier P.O: <asp:Label runat="server" ID="lblPONum"></asp:Label>
                                            </div>
                                            <div class="panel-body">
                                                <div class="row">
                                                    <asp:GridView runat="server" ID="gvPOItems" 
                                                        CssClass="table table-responsive table-condensed table-bordered" 
                                                        AutoGenerateColumns="False" onrowdatabound="gvPOItems_RowDataBound" 
                                                        >
                                                        <Columns>
                                                        
                                                        <%--<asp:TemplateField>
                                                        <ItemTemplate>
                                                        <asp:Label runat="server" ID="lblID" Text='<%# Eval("id") %>' Visible="false"></asp:Label>
                                                        </ItemTemplate>
                                                        </asp:TemplateField>--%>
                                                        <asp:BoundField DataField="id">
                                                            <HeaderStyle CssClass="hide" />
                                                            <ItemStyle CssClass="hide" />
                                                            </asp:BoundField>
                                                  
                                                        
                                                        <asp:BoundField DataField="ItemCode" />
                                                        <asp:BoundField DataField="ItemName" />
                                                        <asp:BoundField DataField="RemainingQty" />
                                                      <%--  <asp:BoundField DataField="UomCode" />--%>
                                                        <asp:BoundField DataField="UnitPrice" />
                                                        <asp:TemplateField ItemStyle-HorizontalAlign="Center" HeaderText="Received Qty">
                                                        <ItemTemplate>
                                                        <asp:TextBox runat="server" ID="txtReceivedItem"  Text='<%# Eval("RemainingQty") %>' Width="80px" CssClass="form-control" onkeypress="return(event.charCode == 8 || event.charCode == 0) ? null: event.charCode >= 46 && event.charCode <=57"></asp:TextBox>
                                                        </ItemTemplate>
                                                            <ItemStyle HorizontalAlign="Center" />
                                                        </asp:TemplateField>
                                                        
                                                        <asp:BoundField DataField="InvQty">
                                                       <HeaderStyle CssClass="hide" />
                                                            <ItemStyle CssClass="hide" />
                                                            </asp:BoundField>

                                                        <asp:BoundField DataField="UOMCode">
                                                        <HeaderStyle CssClass="hide" />
                                                            <ItemStyle CssClass="hide" />
                                                            </asp:BoundField>

                                                        <asp:BoundField DataField="UnitPrice">
                                                        <HeaderStyle CssClass="hide" />
                                                            <ItemStyle CssClass="hide" />
                                                        </asp:BoundField>

                                                       
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


                            </ContentTemplate>
                            </asp:UpdatePanel>
                            <!--End of Right Column -->
                        </div>
                        <!--End of Main Row -->
                    </div>
                    <!--End of Panel Body -->
                    <!--MESSAGE MODAL SECTION-->

                    
                            <!--List of PO -->
                                <div class="modal fade" id="modalPO" data-backdrop="static">
                                    <div class="modal-dialog">
                                        <div class="modal-content">
                                            <div class="modal-header bg-warning">
                                                <button class="close" data-dismiss="modal">
                                                    &times;</button>
                                                <h4 class="modal-title">
                                                    List of Available PO</h4>
                                            </div>
                                            <div class="modal-body">
                                                <asp:UpdatePanel runat="server" ID="upPOList">
                                                    <ContentTemplate>
                                                        <asp:GridView runat="server" ID="gvPOList" CssClass="table table-responsive" AllowPaging="true"
                                                            GridLines="Horizontal" AutoGenerateColumns="false">
                                                            <Columns>
                                                                <asp:TemplateField>
                                                                    <ItemTemplate>
                                                                        <asp:LinkButton runat="server" ID="gvlnkSelect" OnClick="gvSELECT_Click" CssClass="btn btn-primary btn-sm"><span class="glyphicon glyphicon-pencil"></span> SELECT</asp:LinkButton>
                                                                    </ItemTemplate>
                                                                </asp:TemplateField>
                                                                <asp:BoundField DataField="PONum" />
                                                                <asp:BoundField DataField="StatusDescription" />
                                                                <asp:BoundField DataField="Remarks" />
                                                                <asp:BoundField DataField="RequestDate" />
                                                            </Columns>
                                                            <PagerStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                                        </asp:GridView>
                                                    </ContentTemplate>
                                                </asp:UpdatePanel>
                                            </div>
                                            <div class="modal-footer">
                                                <asp:LinkButton runat="server" ID="lnkClose" CssClass="btn btn-danger" data-dismiss="modal">Close</asp:LinkButton>
                                            </div>
                                        </div>
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

                   
            <!-- End of Main Panel -->
            <!-- End of Container -->

        </ContentTemplate>
    </asp:UpdatePanel>  
</asp:Content>

<%@ Page Title="" Language="C#" MasterPageFile="~/DGMU.Master" AutoEventWireup="true" CodeBehind="setupDriverPlate.aspx.cs" Inherits="DGMU_System.setupDriverPlate" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentHead" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentBody" runat="server">
 


<div class="container container_content">
     <%-- <script type="text/javascript">
          $(document).ready(function() {

              $.validator.setDefaults({
                 
                  errorClass:'help-block',

                  highlight: function (element)
                  {
                      $(element)
                      .closest('.form-group')
                      .addClass('has-error');
                  },
                  unhighlight: function (element) {
                      $(element)
                      .closest('.form-group')
                      .removeClass('has-error')
                      .addClass('has-success');
                  }
              });

              $("#MasterForm").validate({
                  rules: {
                      <%=txtDriverName.UniqueID %>: {
                          required: true

                        },

                        <%=txtHelperName.UniqueID %>: {
                         required: true
                        },

                       <%=txtPlateNumber.UniqueID %>: {
                           required: true
                       }

                
                    }, messages: {
                        <%=txtDriverName.UniqueID %>:{  
                         required: "Item Code is required."
                         
                     },

                     <%=txtHelperName.UniqueID %>: {
                         required: "Amount is required."
                     },
                        
                     <%=txtPlateNumber.UniqueID %>: {
                         required: "Amount is required."
                     }


                    
                 }
                 
                });
            });
    </script>--%>

<%--<asp:UpdatePanel runat="server" ID="uplMain">
    <ContentTemplate>--%>

 <div class="panel panel-warning">
     <div class="panel-heading"></div>
     <div class="panel-body">
         <ul class="nav nav-tabs" role="tablist">
                                        <li role="presentation" class="active"><a href="#Driver" aria-controls="Driver" role="tab" data-toggle="tab"><span class="glyphicon glyphicon-user text-success"></span> Driver</a> </li>
                                        <li role="presentation"><a href="#Helper" aria-controls="Helper" role="tab" data-toggle="tab"><span class="glyphicon glyphicon-log-in"></span> Helper</a></li>
                                        <li role="presentation"><a href="#Vehicle" aria-controls="Vehicle" role="tab" data-toggle="tab"><span class="glyphicon glyphicon-bullhorn"></span> Vehicle</a></li>
                                       
         </ul>

          <div class="tab-content">
              <div role="tabpanel" class="tab-pane fade in active" id="Driver">  
                  <asp:UpdatePanel runat="server" ID="uPanelDriver" UpdateMode="Conditional">
                      <ContentTemplate>
                    <asp:LinkButton runat="server" ID="lnkNewDriver" CssClass="btn btn-primary btn-sm" OnClick="lnkNewDriver_Click"><span class="glyphicon glyphicon-plus-sign"></span> New</asp:LinkButton>
                                
                  <div class="panel panel-warning">
                      <div class="panel-heading">
                          <div class="row">
                          <asp:Panel ID="panelDriverInput" runat="server" Enabled="false">
                              <div class="col-md-3">
                                  <asp:TextBox runat="server" ID="txtDriverName" placeholder="Driver Full Name" CssClass="form-control"></asp:TextBox></div>
                              <div class="col-md-2">
                                  <asp:TextBox runat="server" ID="txtLicenseNumber" placeholder="License Number" CssClass="form-control"></asp:TextBox></div>
                              <div class="col-md-2">
                                  <div class="checkbox">
                                      <label>
                                          <asp:CheckBox runat="server" ID="chkStatus" Checked="true" />
                                          <span class="cr"><i class="cr-icon glyphicon glyphicon-ok"></i></span>
                                          <span class="input-group-addon">Active</span>
                                      </label>


                                  </div>
                              </div>

                              <div class="col-md-5 text-right">
                                    <asp:LinkButton runat="server" ID="U_Save_Driver" CssClass="btn btn-success btn-sm" OnClick="U_Save_Driver_Click"><span class="glyphicon glyphicon-floppy-saved"></span> UPDATE</asp:LinkButton>
                                    <asp:Label runat="server" ID="lblDriverID" Visible="false"></asp:Label>
                              </div>
                              </asp:Panel>
                          </div></div>
                      <div class="panel-body">
                          <asp:GridView runat="server" ID="gvDriverList" AutoGenerateColumns="false" CssClass="table table-responsive table-condensed table-hover" GridLines="Horizontal">
                              <Columns>
                                  <asp:BoundField DataField="DriverID" HeaderStyle-CssClass="hidden" ControlStyle-CssClass="hidden" ItemStyle-CssClass="hidden"/>
                                  <asp:BoundField DataField="DriverName" HeaderText="Driver Name"/>
                                  <asp:BoundField DataField="LicenseNumber" HeaderText="License Number" />
                                  <asp:BoundField DataField="Status" />
                                  <asp:TemplateField>
                                      <ItemTemplate>
                                          <div class="text-right">

                                          <asp:LinkButton runat="server" ID="lnkEdit" CssClass="btn btn-primary btn-sm" OnClick="lnkEditDriver_Click">Edit</asp:LinkButton>
                                      
                                          </div>
                                        </ItemTemplate>
                                  </asp:TemplateField>
                              </Columns>
                          </asp:GridView>
                          
                      </div>
                  </div>
                
                     </ContentTemplate>
                  </asp:UpdatePanel>
              </div>


               <div role="tabpanel" class="tab-pane fade" id="Helper">  
                  <asp:UpdatePanel runat="server" ID="uPanelHelper" UpdateMode="Conditional">
                      <ContentTemplate>
                    <asp:LinkButton runat="server" ID="lnkNewHelper" CssClass="btn btn-primary btn-sm" OnClick="lnkNewHelper_Click"><span class="glyphicon glyphicon-plus-sign"></span> New</asp:LinkButton>
                                
                  <div class="panel panel-warning">
                      <div class="panel-heading">
                          <div class="row">
                          <asp:Panel ID="panelHelperInput" runat="server" Enabled="false">
                              <div class="col-md-3">
                                  <asp:TextBox runat="server" ID="txtHelperName" placeholder="Helper Name" CssClass="form-control"></asp:TextBox></div>
                             
                              <div class="col-md-2">
                                  <div class="checkbox">
                                      <label>
                                          <asp:CheckBox runat="server" ID="chkHelperStatus" Checked="true" />
                                          <span class="cr"><i class="cr-icon glyphicon glyphicon-ok"></i></span>
                                          <span class="input-group-addon">Active</span>
                                      </label>


                                  </div>
                              </div>

                              <div class="col-md-5 text-right">
                                    <asp:LinkButton runat="server" ID="lnkSaveHelper" CssClass="btn btn-success btn-sm" OnClick="lnkSaveHelper_Click"><span class="glyphicon glyphicon-floppy-saved"></span> UPDATE</asp:LinkButton>
                                    <asp:Label runat="server" ID="lblHelperID" Visible="false"></asp:Label>
                              </div>
                              </asp:Panel>
                          </div></div>
                      <div class="panel-body">
                          <asp:GridView runat="server" ID="gvHelperList" AutoGenerateColumns="false" CssClass="table table-responsive table-condensed table-hover" GridLines="Horizontal">
                              <Columns>
                                  <asp:BoundField DataField="HelperID" HeaderStyle-CssClass="hidden" ControlStyle-CssClass="hidden" ItemStyle-CssClass="hidden"/>
                                  <asp:BoundField DataField="HelperName" HeaderText="Helper Name"/>
                                  <asp:BoundField DataField="Status" />
                                  <asp:TemplateField>
                                      <ItemTemplate>
                                          <div class="text-right">

                                          <asp:LinkButton runat="server" ID="lnkEditHelper" CssClass="btn btn-primary btn-sm" OnClick="lnkEditHelper_Click">Edit</asp:LinkButton>
                                      
                                          </div>
                                        </ItemTemplate>
                                  </asp:TemplateField>
                              </Columns>
                          </asp:GridView>
                          
                      </div>
                  </div>
                
                     </ContentTemplate>
                  </asp:UpdatePanel>
              </div>

               <%--VEHICLE INPUT--%>
              <div role="tabpanel" class="tab-pane fade" id="Vehicle">
                  <asp:UpdatePanel runat="server" ID="uPanelVehicle" UpdateMode="Conditional">
                      <ContentTemplate>
                    <asp:LinkButton runat="server" ID="lnkNewVehicle" CssClass="btn btn-primary btn-sm" OnClick="lnkNewVehicle_Click"><span class="glyphicon glyphicon-plus-sign"></span> New</asp:LinkButton>
                                
                  <div class="panel panel-warning">
                      <div class="panel-heading">
                          <div class="row">
                          <asp:Panel ID="panelVehicleInput" runat="server" Enabled="false">
                              <div class="col-md-2">
                                  <asp:TextBox runat="server" ID="txtPlateNumber" placeholder="Plate Number" CssClass="form-control"></asp:TextBox></div>
                             <div class="col-md-3">
                                  <asp:TextBox runat="server" ID="txtVehicleDescription" placeholder="Vehicle Description" CssClass="form-control"></asp:TextBox></div>
                              <div class="col-md-2">
                                   <asp:TextBox runat="server" ID="txtLoadCapacity" placeholder="Load Capacity" CssClass="form-control"></asp:TextBox>
                              </div>

                              <div class="col-md-5 text-right">
                                    <asp:LinkButton runat="server" ID="lnkSaveVehicle" CssClass="btn btn-success btn-sm" OnClick="lnkSaveVehicle_Click"><span class="glyphicon glyphicon-floppy-saved"></span> UPDATE</asp:LinkButton>
                                    <asp:Label runat="server" ID="lblPlateID" Visible="false"></asp:Label>
                              </div>
                              </asp:Panel>
                          </div></div>
                      <div class="panel-body">
                          <asp:GridView runat="server" ID="gvVehicleList" AutoGenerateColumns="false" CssClass="table table-responsive table-condensed table-hover" GridLines="Horizontal">
                              <Columns>
                                  <asp:BoundField DataField="PlateID" HeaderStyle-CssClass="hidden" ControlStyle-CssClass="hidden" ItemStyle-CssClass="hidden"/>
                                  <asp:BoundField DataField="PlateNumber" HeaderText="Plate Number"/>
                                  <asp:BoundField DataField="VehicleDescription" HeaderText="Vehicle Description"/>
                                  <asp:BoundField DataField="LoadCapacity" HeaderText="Load Capacity"/>
                                  
                                  <asp:TemplateField>
                                      <ItemTemplate>
                                          <div class="text-right">

                                          <asp:LinkButton runat="server" ID="lnkEditVehicle" CssClass="btn btn-primary btn-sm" OnClick="lnkEditVehicle_Click">Edit</asp:LinkButton>
                                      
                                          </div>
                                        </ItemTemplate>
                                  </asp:TemplateField>
                              </Columns>
                          </asp:GridView>
                          
                      </div>
                  </div>
                
                     </ContentTemplate>
                  </asp:UpdatePanel>

              </div>
          </div>
     </div>
 </div>



                    <!--Message Save SUCCESS-->
                    <div class="modal fade" id="msgSuccessModal">
                        <div class="modal-dialog">
                            <div class="modal-content">
                                <div class="modal-header bg-success">
                                    <button class="close" data-dismiss="modal">
                                        &times;</button>
                                    <h4 class="modal-title">
                                        Sr Pedro Warehouse System</h4>
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
                                        Sr Pedro Warehouse System</h4>
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

<%--    </ContentTemplate>
</asp:UpdatePanel>--%>
</div><!-- END OF DIV CONTAINER-->


</asp:Content>

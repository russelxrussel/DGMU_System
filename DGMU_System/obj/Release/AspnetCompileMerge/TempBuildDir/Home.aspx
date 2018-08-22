<%@ Page Title="" Language="C#" MasterPageFile="~/DGMU.Master" AutoEventWireup="true" CodeBehind="Home.aspx.cs" Inherits="DGMU_System.Home" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentHead" runat="server">
    <style type="text/css">
        
        .bgStat_Chicken {
            background-image: url('/Images/dash/chicken1.png');
            background-repeat: no-repeat;
            background-position: center left;
            background-size: 55px 55px;
            background-color: darkcyan ;
            height: 70px;
            opacity: 0.7;
            

        }

        .bgStat_leeg {
            background-image: url('/Images/dash/neck1.png');
            background-repeat: no-repeat;
            background-position: center right;
            background-size: 50px 50px;
            background-color: darkcyan ;
            height: 75px;
            opacity: 0.7;

        }

        .bgStat_Pig {
            background-image: url('/Images/dash/pig1.png');
            background-repeat: no-repeat;
            background-position: center left;
            background-size: 55px 55px;
            background-color: crimson;
            height: 70px;
            opacity: 0.7;

        }

         .bgStat_Atsara {
            background-image: url('/Images/dash/papaya1.png');
            background-repeat: no-repeat;
            background-position: center right;
            background-size: 50px 50px;
            background-color: darkorange;
            height: 75px;
            opacity: 0.7;

        }

         .label_Result_left {
          font-size: 3em;
          font-weight: bolder;
          text-align:center;
          padding-left: 50px;
          color: black;
        }

        .label_Result_right {
            font-size: 3em;
            font-weight: bolder;
            text-align: center;
            padding-left: 10px;
            color: black;
        }

        
       
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentBody" runat="server">


    <div class="container container_content">
        <br />
            
        <div class="row">
            <div class="col-md-2">
                <div class="panel">
                    
                     <img src="images/DGMU_logo_700x385px.png" class="img-responsive img-thumbnail" />
                     
                    <div class="panel-heading small">
                        <%-- <span class="glyphicon glyphicon-user"></span><strong>Hello!
                            <asp:Label runat="server" ID="lblUserFullName" CssClass="text-uppercase"></asp:Label></strong>--%>
                       

                       
                    </div>

                
                     <div class="panel">
                    
                             <asp:UpdatePanel runat="server" ID="upDateTime" UpdateMode="Conditional">
                            <ContentTemplate>
                                <span class="glyphicon glyphicon-time text-primary small"></span>
                                <asp:Label runat="server" ID="lblDT" CssClass="text-primary small"></asp:Label>
                                <asp:Timer ID="Timer1" runat="server" OnTick="Timer1_Tick" Interval="1000" Enabled="true" />
                            </ContentTemplate>

                            <Triggers>
                                <asp:AsyncPostBackTrigger ControlID="Timer1" EventName="Tick" />
                            </Triggers>


                        </asp:UpdatePanel>  
                            
                               
                            
                   

                    </div>
                 
                    <div class="small">
                            <p class="small">DGMU Enterprises Sales Delivery System
                                Developed by: Russel &COPY;</p>
                             </div>

                </div>


            </div>
            
               <!-- Graphics Stat-->

            <div class="col-md-10">
                <div class="panel panel-success">
                    <div class="panel-heading">Stock Summary Monitoring: <asp:Label runat="server" ID="lblDeliveryTextTitle"></asp:Label></div>
                    <div class="panel-body">
                         <div class="row">
                             <div class="col-md-4">
                                 <div class="panel panel-primary">
                                     <div class="panel-heading">
                                        FRESH CHICKEN
                                         <img src="Images/Icons/open.png" /> 
                                              <asp:Label runat="server" ID="lblFreshOpening"></asp:Label>
                                       

                                     </div>
                                     <div class="panel-body bgStat_Chicken">
                               
                                       <asp:Label runat="server" ID="lblFreshTotalStock" CssClass="label_Result_left"></asp:Label>
                                     </div>
                                     <div class="panel-footer">
                                         <div class="row">
                                              <div class="col-md-5 text-success">
                                           <img src="Images/Icons/up.png" /> <asp:Label runat="server" ID="lblFreshIn"></asp:Label></div>
                                             <div class="col-md-5 text-danger">
                                           <img src="Images/Icons/down.png" /> <asp:Label runat="server" ID="lblFreshOut"></asp:Label></div>
                                           <div class="col-md-2">
                                               <asp:ImageButton runat="server" ID="btnFresh" ImageUrl="~/Images/dash/list.png"  OnClick="btnFresh_Click"/>
                                           </div>
                                         </div>
                                     </div>

                                 </div>
                             </div>
                            
                             
                             <div class="col-md-4">
                                 <div class="panel panel-primary">
                                     <div class="panel-heading">
                                         LIEMPO
                                         <img src="Images/Icons/open.png" /> 
                                              <asp:Label runat="server" ID="lblLiempoOpening"></asp:Label>
                                             <div class="row">

                                            <div class="col-md-4"></div> 
                                          <div class="col-md-8"></div>
                                           
                                         </div>
                                     </div>
                                     <div class="panel-body bgStat_Pig">
                                          <asp:Label runat="server" ID="lblLiempoTotalStock" CssClass="label_Result_left"></asp:Label>
                                     </div>
                                      <div class="panel-footer">
                                         <div class="row">
                                              <div class="col-md-5 text-success">
                                            <img src="Images/Icons/up.png" /> <asp:Label runat="server" ID="lblLiempoIn"></asp:Label></div>
                                             <div class="col-md-5 text-danger">
                                             <img src="Images/Icons/down.png" /> <asp:Label runat="server" ID="lblLiempoOut"></asp:Label></div>
                                             <div class="col-md-2">
                                               <asp:ImageButton runat="server" ID="btnLiempo" ImageUrl="~/Images/dash/list.png"  OnClick="btnLiempo_Click"/>
                                           </div>
                                         </div>
                                     </div>
                                 </div>
                             </div>


                      <div class="col-md-4">
                                 <div class="panel panel-primary">
                                     <div class="panel-heading">ATSARA 100
                                          <img src="Images/Icons/open.png" /> 
                                              <asp:Label runat="server" ID="lblAtsara100Opening"></asp:Label>
                                     </div>
                                     <div class="panel-body bgStat_Atsara">
                                        <asp:Label runat="server" ID="lblAtsara100" CssClass="label_Result_right"></asp:Label>
                                     </div>
                                      <div class="panel-footer">
                                         <div class="row">
                                              <div class="col-md-5 text-success">
                                            <img src="Images/Icons/up.png" /> <asp:Label runat="server" ID="lblAtsara100In"></asp:Label></div>
                                             <div class="col-md-5 text-danger">
                                             <img src="Images/Icons/down.png" /> <asp:Label runat="server" ID="lblAtsara100Out"></asp:Label></div>
                                              <div class="col-md-2">
                                               <asp:ImageButton runat="server" ID="btnAtsara100" ImageUrl="~/Images/dash/list.png"  OnClick="btnAtsara100_Click"/>
                                           </div>
                                         </div>
                                     </div>
                                 </div>
                             </div>
                            

                         <div class="col-md-4">
                                 <div class="panel panel-primary">
                                     <div class="panel-heading">FROZEN CHICKEN
                                         <img src="Images/Icons/open.png" /> 
                                              <asp:Label runat="server" ID="lblFrozenOpening"></asp:Label>
                                     </div>
                                     <div class="panel-body bgStat_Chicken">
                                        <asp:Label runat="server" ID="lblFrozenTotalStock" CssClass="label_Result_left"></asp:Label>
                                     </div>
                                      <div class="panel-footer">
                                         <div class="row">
                                              <div class="col-md-5 text-success">
                                            <img src="Images/Icons/up.png" /> <asp:Label runat="server" ID="lblFrozenIn"></asp:Label></div>
                                             <div class="col-md-5 text-danger">
                                             <img src="Images/Icons/down.png" /> <asp:Label runat="server" ID="lblFrozenOut"></asp:Label></div>
                                             <div class="col-md-2">
                                               <asp:ImageButton runat="server" ID="btnFrozen" ImageUrl="~/Images/dash/list.png"  OnClick="btnFrozen_Click"/>
                                           </div>
                                         </div>
                                     </div>
                                 </div>
                             </div>
                     
                             <div class="col-md-4">
                                 <div class="panel panel-primary">
                                     <div class="panel-heading">LEEG
                                          <img src="Images/Icons/open.png" /> 
                                              <asp:Label runat="server" ID="lblLeegOpening"></asp:Label>
                                     </div>
                                     <div class="panel-body bgStat_leeg">
                                         <asp:Label runat="server" ID="lblLeeg" CssClass="label_Result_right"></asp:Label>
                                     </div>
                                      <div class="panel-footer">
                                         <div class="row">
                                              <div class="col-md-5 text-success">
                                            <img src="Images/Icons/up.png" /> <asp:Label runat="server" ID="lblLeegIn"></asp:Label></div>
                                             <div class="col-md-5 text-danger">
                                             <img src="Images/Icons/down.png" /> <asp:Label runat="server" ID="lblLeegOut"></asp:Label></div>
                                             <div class="col-md-2">
                                               <asp:ImageButton runat="server" ID="btnLeeg" ImageUrl="~/Images/dash/list.png"  OnClick="btnLeeg_Click"/>
                                           </div>
                                         </div>
                                     </div>
                                 </div>
                             </div>

                            
                     
                             
                             <div class="col-md-4">
                                 <div class="panel panel-primary">
                                     <div class="panel-heading">ATSARA 160
                                           <img src="Images/Icons/open.png" /> 
                                              <asp:Label runat="server" ID="lblAtsara160Opening"></asp:Label>
                                     </div>
                                     <div class="panel-body bgStat_Atsara">
                                         <asp:Label runat="server" ID="lblAtsara160" CssClass="label_Result_right"></asp:Label>
                                     </div>
                                      <div class="panel-footer">
                                         <div class="row">
                                              <div class="col-md-5 text-success">
                                            <img src="Images/Icons/up.png" /> <asp:Label runat="server" ID="lblAtsara160In"></asp:Label></div>
                                             <div class="col-md-5 text-danger">
                                             <img src="Images/Icons/down.png" /> <asp:Label runat="server" ID="lblAtsara160Out"></asp:Label></div>
                                             <div class="col-md-2">
                                               <asp:ImageButton runat="server" ID="btnAtsara160" ImageUrl="~/Images/dash/list.png"  OnClick="btnAtsara160_Click"/>
                                           </div>
                                         </div>
                                         
                                     </div>
                                 </div>
                             </div>
                         </div>
                    </div>
                </div>

               
                
                        <!--MESSAGE MODAL SECTION-->

        <!--Create Update Container -->
        <div class="modal fade" id="ItemContainer" data-backdrop="static" tabindex="-1" role="dialog">
            <div class="modal-dialog" role="document">
              <div class="modal-content">
                <div class="modal-header bg-warning">
                    <button class="close" data-dismiss="modal">&times;</button>
                    <h4 class="modal-title"><asp:Label runat="server" ID="lblActionTitle"></asp:Label></h4>
                </div>

                <div class="modal-body">

                    <!-- Logs of Item Transaction -->
                <div class="row">
                 
                  <div class="panel panel-primary">
                    <div class="panel-heading">
                       <asp:Label runat="server" ID="lblItemName">Fresh Chicken</asp:Label>
                    </div>
                    <div class="panel-body">
                        <asp:Panel runat="server" ID="panelItemTransaction" ScrollBars="Vertical" Height="500px">
                            <asp:GridView runat="Server" ID="gvRunningItem" AutoGenerateColumns="false" CssClass="table table-condensed small" FooterStyle-CssClass="hidden" GridLines="None" AlternatingRowStyle-CssClass="bg-info">
                                            <Columns>
                                        
                                                <asp:BoundField  DataField="ReferenceText" HeaderText="Source"/>
                                                <asp:BoundField DataField="In_Stock" HeaderText="IN" DataFormatString="{0:##,###,###}" HeaderStyle-CssClass="text-center" ItemStyle-CssClass="text-center text-success" />
                                                <asp:BoundField DataField="Out_Stock" HeaderText="OUT" DataFormatString="{0:-##,###,###}" HeaderStyle-CssClass="text-center" ItemStyle-CssClass="text-center text-danger" />
                                           
                                            </Columns>
                                        </asp:GridView>



                        </asp:Panel>

                    </div>
                </div>
                       
                </div>
              
              </div>

                <div class="modal-footer">
                  
                <asp:LinkButton runat="server" ID="lnkClose" CssClass="btn btn-danger btn-sm" data-dismiss="modal">Close</asp:LinkButton>

                </div>

            </div>
            </div>

          
       </div>
     
                </div>


                
                 <div class="col-md-10 small hidden">
                 <div class="row">
                     <div class="col-md-6">
                           <div class="panel panel-warning">
                    <div class="panel-heading"></div>
                    <div class="panel-body">

                        <asp:Panel runat="server" ID="panelStockMonitoring" ScrollBars="Vertical">


                       <asp:GridView runat="server" ID="gvOpeningRunningStock" AutoGenerateColumns="false" CssClass="table table-responsive small" GridLines="None" >
                            <Columns>
                                <asp:BoundField DataField="ItemName" HeaderText="Item"/>
                                <asp:BoundField DataField="Opening" HeaderText="Opening" DataFormatString="{0:##,###,###}" HeaderStyle-CssClass="text-center" ItemStyle-CssClass="text-right" />
                              <%--  <asp:BoundField DataField="Running_Stock" HeaderText="Running" DataFormatString="{0:##,###,###}" HeaderStyle-CssClass="text-center" ItemStyle-CssClass="text-right" />--%>
                                <asp:BoundField DataField="Stock_In" HeaderText ="(+)IN" DataFormatString="{0:##,###,###}" HeaderStyle-CssClass="text-center" ItemStyle-CssClass="text-center text-success"  />
                                <asp:BoundField DataField="Stock_Out" HeaderText ="(-)OUT" DataFormatString="{0:-##,###,###}" HeaderStyle-CssClass="text-center" ItemStyle-CssClass="text-center text-danger" />
                                <asp:BoundField DataField="Ending" HeaderText="Remaining"  DataFormatString="{0:##,###,###}" HeaderStyle-CssClass="text-right" ItemStyle-CssClass="text-right"/>
                            </Columns>
                        </asp:GridView>
                    
                               <asp:GridView runat="server" ID="gvStorageStockStatus" AutoGenerateColumns="false" CssClass="table table-responsive small" GridLines="None">
                                    <Columns>
                                        <asp:BoundField DataField="StorageName" HeaderText="Storage"   />
                                        <asp:BoundField DataField="ItemName" HeaderText="Item" />
                                        <asp:BoundField DataField="CurrentStock" HeaderText="Stock" DataFormatString="{0:##,###,###}" HeaderStyle-CssClass="text-right" ItemStyle-CssClass="text-right" />
                                    </Columns>
                        </asp:GridView>
                        
                      <%--  <div class="panel panel-warning">
                            <div class="panel-heading">Storage Stock</div>
                            <div class="panel-body">--%>
                       
                              
              <%--              </div>
                        </div>--%>

                                                    </asp:Panel>

            </div>
                    </div>
                     </div>


                  
                  


                     <div class="col-md-6">
                         
                     </div>
                 </div>
               
                
            </div>
            
        
        </div>
           
           


            
              <div class="col-md-4 small">
              

            </div>


         <%--   <div class="col-md-4 small">
                <div class="panel panel-warning">
                    <div class="panel-heading">
                        Item Running Transaction
                    </div>
                    <div class="panel-body">

                        <asp:Panel runat="server" ID="panDeliveryToday" Height="500px" ScrollBars="Vertical">
                            <asp:GridView runat="Server" ID="gvDeliverySchedule" AutoGenerateColumns="false" CssClass="table table-condensed">
                                <Columns>
                                    <asp:BoundField ReadOnly="true" DataField="DRNum" HeaderText="DR #" />
                                    <asp:BoundField ReadOnly="true" DataField="BranchName" HeaderText="Branch" />
                                    <asp:BoundField ReadOnly="true" DataField="LACode" HeaderText="Area" />
                                    <asp:BoundField ReadOnly="true" DataField="TotalQty" HeaderText="Total Qty" />
                                </Columns>
                            </asp:GridView>


                        </asp:Panel>



                    </div>
                </div>

            </div>--%>


        </div>

        
          







</asp:Content>

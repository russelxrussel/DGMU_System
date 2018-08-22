<%@ Page Title="" Language="C#" MasterPageFile="~/DGMU.Master" AutoEventWireup="true" CodeBehind="DeliveryScheduleListing.aspx.cs" Inherits="DGMU_System.DeliveryScheduleListing" %>
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
    
<asp:UpdatePanel runat="server" ID="uplMain">
    <ContentTemplate>
<div class="row">
    
<div class="col-md-3">
    
    

 <asp:LinkButton runat="server" ID="lnkCreateItem" OnClick="lnkCreateItem_Click" 
        CssClass="btn btn-primary btn-sm"><span class="glyphicon glyphicon-plus-sign"></span> Add Schedule</asp:LinkButton>
</div>

 <div class="col-md-3 col-md-offset-6">
                     
                    </div>
</div>
 <hr />
  <div class="panel panel-warning">
    <div class="panel-heading">
     <div class="row">
         <div class="col-md-6">
             Delivery Schedule for: <asp:Label runat="server" ID="lblScheduleText"></asp:Label>
        </div>

         <div class="col-md-2">
                <asp:TextBox runat="server" ID="txtSchedule" CssClass="form-control calendarInput" placeholder="Select Date"></asp:TextBox>
         </div>
         <div class="col-md-2">
             <asp:LinkButton runat="server" ID="lnkUpcomingSched" CssClass="btn btn-primary btn-sm" OnClick="lnkUpcomingSched_Click">View Upcoming Schedule</asp:LinkButton>
         </div>
            <div class="col-md-2">
             <asp:LinkButton runat="server" ID="lnkCreateScheduleList" CssClass="btn btn-primary btn-sm" OnClick="lnkCreateScheduleList_Click">Print Schedule List</asp:LinkButton>
         </div>
         </div>
    </div>
    <div class="panel-body">
<asp:Panel runat="server" Height="500px" ScrollBars="Vertical">

    <!-- Display Gridview List of Items -->
    <asp:GridView runat="server" ID="gvScheduleList" 
            CssClass="table table-responsive table-hover table-condensed table-bordered" AutoGenerateColumns="False">
    
        <Columns>
            <asp:TemplateField ItemStyle-CssClass="text-left">
            <ItemTemplate>
                <asp:LinkButton runat="server" ID="lnkEditItem" CssClass="btn btn-danger btn-sm" OnClick="lnkCancelItem_Click"  OnClientClick="return confirm('Are you sure you want to Cancel this Delivery?');"><span class="glyphicon glyphicon-cancel"></span> Cancel</asp:LinkButton>
            </ItemTemplate>
                <ItemStyle HorizontalAlign="Center" />
            </asp:TemplateField>
            <asp:BoundField DataField="schedListID" HeaderText="ID" ItemStyle-CssClass="hidden" HeaderStyle-CssClass="hidden"/>
            <asp:BoundField DataField="DRNum" HeaderText="DRNum" />
            <asp:BoundField DataField="BranchName" HeaderText="Branch" />
           <asp:BoundField DataField="LocationArea" HeaderText="AREA" />
           
             <asp:TemplateField ItemStyle-CssClass="text-left">
            <ItemTemplate>
                <asp:LinkButton runat="server" ID="lnkPrint" CssClass="btn btn-primary btn-sm" OnClick="lnkPrintDR_Click"><span class="glyphicon glyphicon-print"></span> Print DR</asp:LinkButton>
            </ItemTemplate>
                <ItemStyle HorizontalAlign="Center" />
            </asp:TemplateField>
       
           
        </Columns>
    
    </asp:GridView>
    <hr />
     <asp:GridView runat="server" ID="gvSetSchedule" 
            CssClass="table table-responsive table-hover table-condensed table-bordered" AutoGenerateColumns="False">
    
        <Columns>
            <asp:TemplateField ItemStyle-CssClass="text-left">
            <ItemTemplate>
                <asp:LinkButton runat="server" ID="lnkEditItem" CssClass="btn btn-danger btn-sm" OnClick="lnkCancelItem_Click"  OnClientClick="return confirm('Are you sure you want to Cancel this Delivery?');"><span class="glyphicon glyphicon-cancel"></span> Cancel</asp:LinkButton>
            </ItemTemplate>
                <HeaderTemplate>
                    Schedule Set
                </HeaderTemplate>
                <ItemStyle HorizontalAlign="Center" />
            </asp:TemplateField>
            <asp:BoundField DataField="schedListID" HeaderText="ID" ItemStyle-CssClass="hidden" HeaderStyle-CssClass="hidden"/>
            <asp:BoundField DataField="DRNum" HeaderText="DRNum" />
            <asp:BoundField DataField="BranchName" HeaderText="Branch" />
           <asp:BoundField DataField="LocationArea" HeaderText="AREA" />
           
             <asp:TemplateField ItemStyle-CssClass="text-left">
            <ItemTemplate>
                <asp:LinkButton runat="server" ID="lnkPrint" CssClass="btn btn-primary btn-sm" OnClick="lnkPrintDR_Click"><span class="glyphicon glyphicon-print"></span> Print DR</asp:LinkButton>
            </ItemTemplate>
                <ItemStyle HorizontalAlign="Center" />
            </asp:TemplateField>
       
           
        </Columns>
    
    </asp:GridView>
        <hr />
    <asp:GridView runat="server" ID="gvAddedSchedule" 
            CssClass="table table-responsive table-hover table-condensed table-bordered" AutoGenerateColumns="False">
    
        <Columns>
            <asp:TemplateField ItemStyle-CssClass="text-left">
            <ItemTemplate>
                <asp:LinkButton runat="server" ID="lnkEditItem" CssClass="btn btn-danger btn-sm" OnClick="lnkCancelItem_Click"  OnClientClick="return confirm('Are you sure you want to Cancel this Delivery?');"><span class="glyphicon glyphicon-cancel"></span> Cancel</asp:LinkButton>
            </ItemTemplate>
                <HeaderTemplate>
                    Added Schedule
                </HeaderTemplate>
                <ItemStyle HorizontalAlign="Center" />
            </asp:TemplateField>
            <asp:BoundField DataField="schedListID" HeaderText="ID" ItemStyle-CssClass="hidden" HeaderStyle-CssClass="hidden"/>
            <asp:BoundField DataField="DRNum" HeaderText="DRNum" />
            <asp:BoundField DataField="BranchName" HeaderText="Branch" />
           <asp:BoundField DataField="LocationArea" HeaderText="AREA" />
           
             <asp:TemplateField ItemStyle-CssClass="text-left">
            <ItemTemplate>
                <asp:LinkButton runat="server" ID="lnkPrint" CssClass="btn btn-primary btn-sm" OnClick="lnkPrintDR_Click"><span class="glyphicon glyphicon-print"></span> Print DR</asp:LinkButton>
            </ItemTemplate>
                <ItemStyle HorizontalAlign="Center" />
            </asp:TemplateField>
       
           
        </Columns>
    
    </asp:GridView>
 </asp:Panel>

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
            
                    <ul class="list-group">
                    
                    <li class="list-group-item">
                    
                    <div class="row">
                     
                          <div class="col-md-8">
                             <div class="form-group small has-error">
                                        
                                 <asp:DropDownList runat="server" CssClass="form-control" ID="ddDRNum">

                                 </asp:DropDownList>
                                        

                             </div>   
                               
                         </div>

                        <div class="col-md-4">

                            <asp:TextBox runat="server" ID="txtAddSchedule" CssClass="form-control calendarInput" placeholder="Select Date"></asp:TextBox>
                        </div>

                        
                        
                     </div>
               
                    </li>

                    <li class="list-group-item">
                    <div class="row">
                      <div class="col-md-12">
              
                                <asp:TextBox runat="server" ID="txtRemarks" TextMode="MultiLine" Rows="2" placeholder="Description" CssClass="form-control"></asp:TextBox>
                     </div>
                        </div>
                    </li>

                    
               </ul>
    
              </div>

                <div class="modal-footer">
                    <asp:Button runat="server" ID="btnCreateUpdate"  CssClass="btn btn-success btn-sm" OnClick="btnCreateUpdate_Click" Text="Create" />
                
                <asp:LinkButton runat="server" ID="lnkClose" CssClass="btn btn-danger btn-sm" data-dismiss="modal">Cancel</asp:LinkButton>

                </div>

            </div>
            </div>

          
       </div>
     
        
         
                 

    </ContentTemplate>
</asp:UpdatePanel>
</div><!-- END OF DIV CONTAINER-->


</asp:Content>

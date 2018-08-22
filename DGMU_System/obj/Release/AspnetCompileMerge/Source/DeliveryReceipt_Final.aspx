<%@ Page Title="" Language="C#" MasterPageFile="~/DGMU.Master" AutoEventWireup="true" CodeBehind="DeliveryReceipt_Final.aspx.cs" Inherits="DGMU_System.DeliveryReceipt_Final" %>
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

        

         function CalculateConversionAndPriceCost() {

             var grid = document.getElementById("<%= gvScheduleList.ClientID%>");
            
            // var grid = $("table[id*=gvScheduleList]")
                for (var i = 0; i <= grid.rows.length; i++) {

                   
                    var txtFreshConversionSource = $("input[id*=txtFreshConversionSource]")
                    var txtFrozenConversionSource = $("input[id*=txtFrozenConversionSource]")
                    var txtLiempoConversionSource = $("input[id*=txtLiempoConversionSource]")
                    var txtLeegConversionSource = $("input[id*=txtLeegConversionSource]")
                    var txtAtsara100ConversionSource = $("input[id*=txtAtsara100ConversionSource]")
                    var txtAtsara160ConversionSource = $("input[id*=txtAtsara160ConversionSource]")

                    var txtPartnerPriceAmount = $("input[id*=txtPartnerPriceAmount]")
                    var txtPartnerLiempoPrice = $("input[id*=txtLiempoPrice]")
                    var txtPartnerLeegPrice = $("input[id*=txtLeegPrice]")
                    var txtPartnerAtsaraPrice = $("input[id*=txtAtsaraPrice]")

                    var txtFreshCost = $("input[id*=txtFreshCost]")
                    var txtConvertedFreshQty = $("input[id*=txtConvertedFreshQty]")

                    var txtFrozenCost = $("input[id*=txtFrozenCost]")
                    var txtConvertedFrozenQty = $("input[id*=txtConvertedFrozenQty]")

                    var txtLiempoCost = $("input[id*=txtLiempoCost]")
                    var txtConvertedLiempoQty = $("input[id*=txtConvertedLiempoQty]")

                    var txtLeegCost = $("input[id*=txtLeegCost]")
                    var txtConvertedLeegQty = $("input[id*=txtConvertedLeegQty]")

                    var txtAtsara100Cost = $("input[id*=txtAtsara100Cost]")
                    var txtConvertedAtsara100Qty = $("input[id*=txtConvertedAtsara100Qty]")

                    var txtAtsara160Cost = $("input[id*=txtAtsara160Cost]")
                    var txtConvertedAtsara160Qty = $("input[id*=txtConvertedAtsara160Qty]")




                    var txtFreshInput = $("input[id*=txtFreshInput]")
                    var txtFrozenInput = $("input[id*=txtFrozenInput]")
                    var txtLiempoInput = $("input[id*=txtLiempoInput]")
                    var txtLeegInput = $("input[id*=txtLeegInput]")
                    var txtAtsara100Input = $("input[id*=txtAtsara100Input]")
                    var txtAtsara160Input = $("input[id*=txtAtsara160Input]")

                    var txtTotalCost = $("input[id*=txtTotalCost]")


                    if (txtConvertedFreshQty[i].value != '') {

                        txtConvertedFreshQty[i].value = parseFloat(txtFreshConversionSource[i].value * txtFreshInput[i].value);
                        txtFreshCost[i].value = parseFloat(txtConvertedFreshQty[i].value * txtPartnerPriceAmount[i].value);

                        txtTotalCost[i].value = parseFloat(txtFreshCost[i].value) + parseFloat(txtFrozenCost[i].value) + parseFloat(txtLiempoCost) + parseFloat(txtLeegCost) + parseFloat(txtAtsara100Cost) + parseFloat(txtAtsara160Cost);
                    }
                    else {
                        txtConvertedFreshQty[i].value = '0'
                    }

                    if (txtConvertedFrozenQty[i].value != '') {

                        txtConvertedFrozenQty[i].value = parseFloat(txtFrozenConversionSource[i].value * txtFrozenInput[i].value);
                        txtFrozenCost[i].value = parseFloat(txtConvertedFrozenQty[i].value * txtPartnerPriceAmount[i].value);

                        txtTotalCost[i].value = parseFloat(txtFreshCost[i].value) + parseFloat(txtFrozenCost[i].value) + parseFloat(txtLiempoCost) + parseFloat(txtLeegCost) + parseFloat(txtAtsara100Cost) + parseFloat(txtAtsara160Cost);
                    }
                    else {
                        txtConvertedFrozenQty[i].value = '0'
                    }

                    if (txtConvertedLiempoQty[i].value != '') {

                        txtConvertedLiempoQty[i].value = parseFloat(txtLiempoConversionSource[i].value * txtLiempoInput[i].value);
                        txtLiempoCost[i].value = parseFloat(txtConvertedLiempoQty[i].value * txtPartnerLiempoPrice[i].value);
                        txtTotalCost[i].value = parseFloat(txtFreshCost[i].value) + parseFloat(txtFrozenCost[i].value) + parseFloat(txtLiempoCost) + parseFloat(txtLeegCost) + parseFloat(txtAtsara100Cost) + parseFloat(txtAtsara160Cost);
                    }
                    else {
                        txtConvertedLiempoQty[i].value = '0'
                    }

                    //LEEG
                    if (txtConvertedLeegQty[i].value != '') {

                        txtConvertedLeegQty[i].value = parseFloat(txtLeegConversionSource[i].value * txtLeegInput[i].value);
                        txtLeegCost[i].value = parseFloat(txtConvertedLeegQty[i].value * txtPartnerLeegPrice[i].value);
                        txtTotalCost[i].value = parseFloat(txtFreshCost[i].value) + parseFloat(txtFrozenCost[i].value) + parseFloat(txtLiempoCost) + parseFloat(txtLeegCost) + parseFloat(txtAtsara100Cost) + parseFloat(txtAtsara160Cost);
                    }
                    else {
                        txtConvertedLeegQty[i].value = '0'
                    }

                    //ATSARA 100
                    if (txtConvertedAtsara100Qty[i].value != '') {

                        txtConvertedAtsara100Qty[i].value = parseFloat(txtAtsara100ConversionSource[i].value * txtAtsara100Input[i].value);
                        txtAtsara100Cost[i].value = parseFloat(txtAtsara100LeegQty[i].value * txtPartnerAtsaraPrice[i].value);
                        txtTotalCost[i].value = parseFloat(txtFreshCost[i].value) + parseFloat(txtFrozenCost[i].value) + parseFloat(txtLiempoCost) + parseFloat(txtLeegCost) + parseFloat(txtAtsara100Cost) + parseFloat(txtAtsara160Cost);
                    }
                    else {
                        txtConvertedAtsara100Qty[i].value = '0'
                    }

                    //ATSARA 160
                    if (txtConvertedAtsara160Qty[i].value != '') {

                        txtConvertedAtsara160Qty[i].value = parseFloat(txtAtsara160ConversionSource[i].value * txtAtsara160Input[i].value);
                        txtAtsara160Cost[i].value = parseFloat(txtAtsara160LeegQty[i].value * txtPartnerAtsaraPrice[i].value);
                        txtTotalCost[i].value = parseFloat(txtFreshCost[i].value) + parseFloat(txtFrozenCost[i].value) + parseFloat(txtLiempoCost) + parseFloat(txtLeegCost) + parseFloat(txtAtsara100Cost) + parseFloat(txtAtsara160Cost);
                    }
                    else {
                        txtConvertedAtsara160Qty[i].value = '0'
                    }


                   
                }
            }


           <%-- function CalculateAdded_ConversionAndPriceCost() {

            var grid = document.getElementById("<%= gvAddedScheduled.ClientID%>");
            for (var i = 0; i <= grid.rows.length; i++) {

            // var txtFreshConversionSource = grid.rows[i].cells[4].children[0];
            var txtFreshConversionSource = $("input[id*=txtAddedFreshConversionSource]")
            var txtFrozenConversionSource = $("input[id*=txtAddedFrozenConversionSource]")

            var txtPartnerPriceAmount = $("input[id*=txtAddedPartnerPriceAmount]")


            var txtFreshCost = $("input[id*=txtAddedFreshCost]")
            var txtConvertedFreshQty = $("input[id*=txtAddedConvertedFreshQty]")

            var txtFrozenCost = $("input[id*=txtAddedFrozenCost]")
            var txtConvertedFrozenQty = $("input[id*=txtAddedConvertedFrozenQty]")

            var txtFreshInput = $("input[id*=txtAddedFreshInput]")
            var txtFrozenInput = $("input[id*=txtAddedFrozenInput]")


            var txtTotalCost = $("input[id*=txtAddedTotalCost]")



            if (txtConvertedFreshQty[i].value != '') {

                txtConvertedFreshQty[i].value = parseFloat(txtFreshConversionSource[i].value * txtFreshInput[i].value);
                txtFreshCost[i].value = parseFloat(txtPartnerLiempoPrice[i].value * txtPartnerPriceAmount[i].value);

                txtTotalCost[i].value = parseFloat(txtFreshCost[i].value) + parseFloat(txtFrozenCost[i].value);
            }
            else {
                txtConvertedFreshQty[i].value = '0'
            }

            if (txtConvertedFrozenQty[i].value != '') {

                txtConvertedFrozenQty[i].value = parseFloat(txtFrozenConversionSource[i].value * txtFrozenInput[i].value);
                txtFrozenCost[i].value = parseFloat(txtConvertedFrozenQty[i].value * txtPartnerPriceAmount[i].value);

                txtTotalCost[i].value = parseFloat(txtFreshCost[i].value) + parseFloat(txtFrozenCost[i].value);
            }
            else {
                txtConvertedFrozenQty[i].value = '0'
            }

        }
    }--%>



    function ComputeAddSchedule() {
        var APriceAmount = document.getElementById("<%= lblAPriceAmount.ClientID%>");
        var ALiempoPrice = document.getElementById("<%= lblALiempoPrice.ClientID%>");
        var ALeegPrice = document.getElementById("<%= lblALeegPrice.ClientID%>");
        var AAtsaraPrice = document.getElementById("<%= lblAAtsaraPrice.ClientID%>");

        var AFreshQty = document.getElementById("<%= txtAddFresh.ClientID%>").value;
        var AFrozenQty = document.getElementById("<%= txtAddFrozen.ClientID%>").value;
        var ALiempoQty = document.getElementById("<%= txtAddLiempo.ClientID%>").value;
        var ALeegQty = document.getElementById("<%= txtAddLeeg.ClientID%>").value;
        var AAtsara100Qty = document.getElementById("<%= txtAddAtsara100.ClientID%>").value;
        var AAtsara160Qty = document.getElementById("<%= txtAddAtsara160.ClientID%>").value;

        var AFreshConversion = document.getElementById("<%=lblFreshConversion.ClientID %>");
        var AFrozenConversion = document.getElementById("<%=lblFrozenConversion.ClientID %>");
        var ALiempoConversion = document.getElementById("<%=lblLiempoConversion.ClientID %>");
        var ALeegConversion = document.getElementById("<%=lblLeegConversion.ClientID %>");
        var AAtsara100Conversion = document.getElementById("<%=lblAtsara100Conversion.ClientID %>");
        var AAtsara160Conversion = document.getElementById("<%=lblAtsara160Conversion.ClientID %>");

        var ATotalAmount = document.getElementById("<%=lblATotalAmount.ClientID%>");

        
        //Compute Total Amount


        AFreshConversion.innerText = parseFloat(AFreshQty * 20);
        AFrozenConversion.innerText = parseFloat(AFrozenQty * 25);
        ALiempoConversion.innerText = parseFloat(ALiempoQty * 30);
        ALeegConversion.innerText = parseFloat(ALeegQty * 1);
        AAtsara100Conversion.innerText = parseFloat(AAtsara100Qty * 100);
        AAtsara160Conversion.innerText = parseFloat(AAtsara160Qty * 160);

        ATotalAmount.innerText = (parseFloat(AFreshQty * 20) + parseFloat(AFrozenQty * 25)) * parseFloat(APriceAmount.innerText);
    }
      </script>  

     

<div class="container container_content">

<div class="row">
  <div class="panel panel-warning">
    <div class="panel-heading">
     <div class="row">
     

         <div class="col-md-3">
             <div class="input-group input-group-sm">
         <span class="input-group-addon small">Schedule: </span>
         <asp:TextBox runat="server" ID="txtSchedule" CssClass="form-control calendarInput" placeholder="Select Date"></asp:TextBox>
     
                  <asp:LinkButton runat="server" ID="lnkUpcomingSched" CssClass="btn btn-success input-group-addon" OnClick="lnkUpcomingSched_Click"><span class="glyphicon glyphicon-open"></span></asp:LinkButton>
             </div>
               
          
             </div>
              

        
         <div class="col-md-3"></div>

         <div class="col-md-2">
          <asp:LinkButton runat="server" ID="lnkPrintDRSummary" CssClass="btn btn-primary btn-sm" OnClick="lnkPrintDRSummary_Click"><span class="glyphicon glyphicon-print"></span> Delivery Receipt Report</asp:LinkButton>
           </div>
         <div class="col-md-2">
                             <asp:LinkButton runat="server" ID="lnkPrintSchedulePerArea" CssClass="btn btn-primary btn-sm" OnClick="lnkPrintSchedulePerArea_Click"><span class="glyphicon glyphicon-print"></span> Driver Summary Report</asp:LinkButton>
              </div>
         <div class="col-md-2 text-right">
                <asp:LinkButton runat="server" ID="lnkPrintTrip2" CssClass="btn btn-warning btn-sm" OnClick="lnkPrintTrip2_Click"><span class="glyphicon glyphicon-print"></span> Print Trip 2</asp:LinkButton>
         </div>
             
         </div>
    </div>
  </div> 
</div>
   
    <asp:UpdatePanel runat="server" ID="uplMain" UpdateMode="Conditional">
    <ContentTemplate>   
   <!-- Nav tabs -->
  <ul class="nav nav-tabs" role="tablist">
    <li role="presentation" class="active"><a href="#regularSchedule" aria-controls="regular" role="tab" data-toggle="tab">Regular Schedule</a></li>
    <li role="presentation"><a href="#ondemandSchedule" aria-controls="ondemand" role="tab" data-toggle="tab">On Demand Schedule</a></li>
 
  </ul>

  <!-- Tab panes -->
  <div class="tab-content">
    <div role="tabpanel" class="tab-pane active" id="regularSchedule">
        <div class="panel panel-default small">
        <div class="panel-heading">
           <div class="row">
               <div class="col-md-6">
                 <asp:DropDownList runat="server" ID="ddAreaList" CssClass="form-control" OnSelectedIndexChanged="ddAreaList_SelectedIndexChanged" AutoPostBack="true"></asp:DropDownList>
               </div>

          
             <div class="col-md-6 text-right">
             <asp:LinkButton runat="server" ID="lnkCreateScheduleList" CssClass="btn btn-success btn-sm" OnClick="lnkCreateScheduleList_Click"><span class="glyphicon glyphicon-hdd"></span> Update Schedule</asp:LinkButton>
 
             </div>

           </div>
             

        </div>

      <div class="panel-body">
    <asp:Panel runat="server" ScrollBars="Vertical" ID="panelScheduleInput" Height="500px">
   
    <!-- Display Gridview List of Items -->
        <asp:UpdatePanel runat="server" ID="upDeliverySchedule" UpdateMode="Conditional">
            <ContentTemplate>

      
             <asp:GridView runat="server" ID="gvScheduleList"  ShowHeader="False" GridLines="None"
            CssClass="table table-condensed small"  AutoGenerateColumns="False" OnRowDataBound="gvScheduleList_RowDataBound" DataKeyNames="LACode">
        <Columns>
            <asp:BoundField DataField="LACode" ItemStyle-CssClass="hidden" HeaderStyle-CssClass="hidden" />
            <asp:TemplateField HeaderStyle-CssClass="hidden" >
               <ItemTemplate>
                   <div class="panel panel-default">
                       <div class="panel-heading">

                           <div class="row">
                              
                               <div class="col-md-6">
                                   <%--Trip 1--%>
                                   <div class="panel panel-warning">
                                       <div class="panel-heading">
                                               
                                                   <asp:Label runat="server" ID="lblAreaName" CssClass="h5" Text='<%# Eval("LAName") %>'></asp:Label>

                                                   <span class="glyphicon glyphicon glyphicon-triangle-right"></span>TRIP #1
                                         

                   </div>

                                           <div class="panel-body bg-success">
                                                     <div class="row">

                                                       <div class="col-md-4">
                                                           <div class="input-group input-group-sm">
                                                               <span class="input-group-addon"><span class="glyphicon glyphicon-user"></span></span>
                                                               <asp:DropDownList runat="server" ID="ddDriver1" CssClass="form-control"></asp:DropDownList>
                                                           </div>
                                                          
                                                            <div class="input-group input-group-sm">
                                                                 <span class="input-group-addon"><span class="glyphicon glyphicon-user"></span></span>
                                                                 <asp:DropDownList runat="server" ID="ddDriver2" CssClass="form-control"></asp:DropDownList>
                                                             </div>
                                                           </div>

                                                         <div class="col-md-4">
                                                            
                                                              <div class="input-group input-group-sm">
                                                               <span class="input-group-addon"><span class="glyphicon glyphicon-wrench"></span></span>
                                                           <asp:DropDownList runat="server" ID="ddHelper1" CssClass="form-control"></asp:DropDownList>
                                                            </div>
                                                              <div class="input-group input-group-sm">
                                                               <span class="input-group-addon"><span class="glyphicon glyphicon-wrench"></span></span>
                                                           <asp:DropDownList runat="server" ID="ddHelper2" CssClass="form-control"></asp:DropDownList>
                                                            </div>
                                                         </div>

                                                         <div class="col-md-4">
                                                             <div class="input-group input-group-sm">
                                                                 <span class="input-group-addon"><span class="glyphicon glyphicon-bed"></span></span>
                                                             <asp:DropDownList runat="server" ID="ddPlateNumber" CssClass="form-control"></asp:DropDownList>
                                                                 </div>
                                                            <asp:TextBox runat="server" ID="txtTrip1Remarks" CssClass="form-control input-sm" placeholder="Remarks"></asp:TextBox>
                                                         </div>
                                                             
                                                       
                                                 
                                               </div>
                                       </div>
                                   </div>
  
                               </div>

                               <div class="col-md-6">
                                   <%--Trip 1--%>
                                   <div class="panel panel-warning">
                                       <div class="panel-heading">
                                             <asp:Label runat="server" ID="Label1" CssClass="h5" Text='<%# Eval("LAName") %>'></asp:Label>

                                                   <span class="glyphicon glyphicon glyphicon-triangle-right"></span>TRIP #2

                                       </div>

                                           <div class="panel-body">
                                                     <div class="row">

                                                       <div class="col-md-4">
                                                           <div class="input-group input-group-sm">
                                                               <span class="input-group-addon"><span class="glyphicon glyphicon-user"></span></span>
                                                               <asp:DropDownList runat="server" ID="ddTrip2Driver1" CssClass="form-control"></asp:DropDownList>
                                                           </div>
                                                          
                                                            <div class="input-group input-group-sm">
                                                                 <span class="input-group-addon"><span class="glyphicon glyphicon-user"></span></span>
                                                                 <asp:DropDownList runat="server" ID="ddTrip2Driver2" CssClass="form-control"></asp:DropDownList>
                                                             </div>
                                                           </div>

                                                         <div class="col-md-4">
                                                            
                                                              <div class="input-group input-group-sm">
                                                               <span class="input-group-addon"><span class="glyphicon glyphicon-wrench"></span></span>
                                                           <asp:DropDownList runat="server" ID="ddTrip2Helper1" CssClass="form-control"></asp:DropDownList>
                                                            </div>
                                                              <div class="input-group input-group-sm">
                                                               <span class="input-group-addon"><span class="glyphicon glyphicon-wrench"></span></span>
                                                           <asp:DropDownList runat="server" ID="ddTrip2Helper2" CssClass="form-control"></asp:DropDownList>
                                                            </div>
                                                         </div>

                                                         <div class="col-md-4">
                                                             <div class="input-group input-group-sm">
                                                                 <span class="input-group-addon"><span class="glyphicon glyphicon-bed"></span></span>
                                                             <asp:DropDownList runat="server" ID="ddTrip2PlateNumber" CssClass="form-control"></asp:DropDownList>
                                                                 </div>
                                                            <asp:TextBox runat="server" ID="txtTrip2Remarks" CssClass="form-control input-sm" placeholder="Remarks"></asp:TextBox>
                                                         </div>
                                                             
                                                       
                                                 
                                               </div>
                                       </div>
                                   </div>
  
                               </div>

                                
                          </div>

                       <div class="panel-body">
                           <asp:GridView runat="server" ID="gvBranchPerArea" CssClass="table table-responsive table-condensed table-hover" AutoGenerateColumns="false">
                        <Columns>
                                <asp:BoundField DataField="BranchCode" ControlStyle-CssClass="hidden"  ItemStyle-CssClass="hidden" HeaderStyle-CssClass="hidden" />
                               
                                <asp:BoundField DataField="FreshCode" ControlStyle-CssClass="hidden"  ItemStyle-CssClass="hidden" HeaderStyle-CssClass="hidden" />
                                <asp:BoundField DataField="FrozenCode" ControlStyle-CssClass="hidden"  ItemStyle-CssClass="hidden" HeaderStyle-CssClass="hidden" />
                                <asp:BoundField DataField="LiempoCode" ControlStyle-CssClass="hidden"  ItemStyle-CssClass="hidden" HeaderStyle-CssClass="hidden" />
                                <asp:BoundField DataField="LeegCode" ControlStyle-CssClass="hidden"  ItemStyle-CssClass="hidden" HeaderStyle-CssClass="hidden" />
                                <asp:BoundField DataField="Atsara100Code" ControlStyle-CssClass="hidden"  ItemStyle-CssClass="hidden" HeaderStyle-CssClass="hidden" />
                                <asp:BoundField DataField="Atsara160Code" ControlStyle-CssClass="hidden"  ItemStyle-CssClass="hidden" HeaderStyle-CssClass="hidden" />            
                                 <asp:BoundField DataField="PartnerCode"  ControlStyle-CssClass="hidden"  ItemStyle-CssClass="hidden" HeaderStyle-CssClass="hidden"  />
                                <asp:BoundField DataField="BranchName" ItemStyle-Width="100px"   />
                            
                            <asp:TemplateField HeaderStyle-CssClass="hidden" ItemStyle-CssClass="hidden">
                                <ItemTemplate>
                                        <asp:TextBox runat="server" ID="txtFreshConversionSource" CssClass="form-control" Enabled="false" Text='<%# Eval("FreshConversion") %>' ></asp:TextBox>
                                </ItemTemplate>
                              
                            </asp:TemplateField>
                               
                            <asp:TemplateField  ItemStyle-CssClass="hidden" HeaderStyle-CssClass="hidden" >
                                <ItemTemplate>
                                        <asp:TextBox runat="server" ID="txtFrozenConversionSource" CssClass="form-control"  Enabled="false" Text='<%# Eval("FrozenConversion") %>'></asp:TextBox>
                                </ItemTemplate>
                            </asp:TemplateField>

                             <asp:TemplateField  ItemStyle-CssClass="hidden" HeaderStyle-CssClass="hidden" >
                                <ItemTemplate>
                                        <asp:TextBox runat="server" ID="txtLiempoConversionSource" CssClass="form-control"  Enabled="false" Text='<%# Eval("LiempoConversion") %>'></asp:TextBox>
                                </ItemTemplate>
                            </asp:TemplateField>

                              <asp:TemplateField  ItemStyle-CssClass="hidden" HeaderStyle-CssClass="hidden" >
                                <ItemTemplate>
                                        <asp:TextBox runat="server" ID="txtLeegConversionSource" CssClass="form-control"  Enabled="false" Text='<%# Eval("LeegConversion") %>'></asp:TextBox>
                                </ItemTemplate>
                            </asp:TemplateField>

                              <asp:TemplateField  ItemStyle-CssClass="hidden" HeaderStyle-CssClass="hidden" >
                                <ItemTemplate>
                                        <asp:TextBox runat="server" ID="txtAtsara100ConversionSource" CssClass="form-control"  Enabled="false" Text='<%# Eval("Atsara100Conversion") %>'></asp:TextBox>
                                </ItemTemplate>
                            </asp:TemplateField>

                              <asp:TemplateField  ItemStyle-CssClass="hidden" HeaderStyle-CssClass="hidden" >
                                <ItemTemplate>
                                        <asp:TextBox runat="server" ID="txtAtsara160ConversionSource" CssClass="form-control"  Enabled="false" Text='<%# Eval("Atsara160Conversion") %>'></asp:TextBox>
                                </ItemTemplate>
                            </asp:TemplateField>
                     
                          
                              
                             <asp:TemplateField HeaderText="Fresh (Bag)" ItemStyle-CssClass="bg-success" ItemStyle-Width="100px">
                              
                                 <ItemTemplate>
                                     <asp:TextBox runat="server" ID="txtFreshInput"  CssClass="form-control input-sm"  onkeyup="CalculateConversionAndPriceCost(this.value)" onkeypress="return(event.charCode == 8 || event.charCode == 0) ? 0: event.charCode >= 46 && event.charCode <=57">

                                     </asp:TextBox>

                                  
                                 </ItemTemplate>
                               </asp:TemplateField>

                            <asp:TemplateField  HeaderText="Frozen (Sack)" ItemStyle-CssClass="bg-success" ItemStyle-Width="100px">
                                 <ItemTemplate>
                                     <asp:TextBox runat="server" ID="txtFrozenInput" CssClass="form-control input-sm" onkeyup="CalculateConversionAndPriceCost(this.value)" onkeypress="return(event.charCode == 8 || event.charCode == 0) ? 0: event.charCode >= 46 && event.charCode <=57">

                                     </asp:TextBox>
                                 </ItemTemplate>
                               </asp:TemplateField>

                          
                            <asp:TemplateField HeaderText="Liempo Price" ItemStyle-CssClass="hidden" HeaderStyle-CssClass="hidden">
                                <ItemTemplate>
                                   <%--<asp:TextBox runat="server" ID="txtLiempoPrice" CssClass="form-control"  Enabled="false" Text='<%# Eval("LiempoPrice") %>'>

                                    </asp:TextBox> --%>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField  HeaderText="Liempo (Bag)" ItemStyle-CssClass="bg-success" ItemStyle-Width="100px">
                                 <ItemTemplate>
                                     <asp:TextBox runat="server" ID="txtLiempoInput" CssClass="form-control input-sm" onkeyup="CalculateConversionAndPriceCost(this.value)" onkeypress="return(event.charCode == 8 || event.charCode == 0) ? 0: event.charCode >= 46 && event.charCode <=57">

                                     </asp:TextBox>
                                 </ItemTemplate>
                               </asp:TemplateField>
                        
                            <asp:TemplateField HeaderText="Leeg Price" ItemStyle-CssClass="hidden" HeaderStyle-CssClass="hidden">
                                <ItemTemplate>
                                 <%--   <asp:TextBox runat="server" ID="txtLeegPrice" CssClass="form-control"  Enabled="false" Text='<%# Eval("LeegPrice") %>'>

                                    </asp:TextBox>--%>
                                </ItemTemplate>
                            </asp:TemplateField>
                             <asp:TemplateField  HeaderText="Leeg (Kilo)" ItemStyle-CssClass="bg-success" ItemStyle-Width="100px">
                                 <ItemTemplate>
                                     <asp:TextBox runat="server" ID="txtLeegInput" CssClass="form-control input-sm" onkeyup="CalculateConversionAndPriceCost(this.value)" onkeypress="return(event.charCode == 8 || event.charCode == 0) ? 0: event.charCode >= 46 && event.charCode <=57">

                                     </asp:TextBox>
                                 </ItemTemplate>
                               </asp:TemplateField>

                            
                            <asp:TemplateField HeaderText="Atsara Price" ItemStyle-CssClass="hidden" HeaderStyle-CssClass="hidden">
                                <ItemTemplate>
                                  <%--  <asp:TextBox runat="server" ID="txtAtsaraPrice" CssClass="form-control"  Enabled="false" Text='<%# Eval("AtsaraPrice") %>'>

                                    </asp:TextBox>--%>
                                </ItemTemplate>
                            </asp:TemplateField>
                             <asp:TemplateField  HeaderText="Atsara(Bx100)" ItemStyle-CssClass="bg-success" ItemStyle-Width="100px">
                                 <ItemTemplate>
                                     <asp:TextBox runat="server" ID="txtAtsara100Input" CssClass="form-control input-sm" onkeyup="CalculateConversionAndPriceCost(this.value)" onkeypress="return(event.charCode == 8 || event.charCode == 0) ? 0: event.charCode >= 46 && event.charCode <=57">

                                     </asp:TextBox>
                                 </ItemTemplate>
                               </asp:TemplateField>
                            <asp:TemplateField  HeaderText="Atsara(Bx160)" ItemStyle-CssClass="bg-success" ItemStyle-Width="100px">
                                 <ItemTemplate>
                                     <asp:TextBox runat="server" ID="txtAtsara160Input" CssClass="form-control input-sm" onkeyup="CalculateConversionAndPriceCost(this.value)" onkeypress="return(event.charCode == 8 || event.charCode == 0) ? 0: event.charCode >= 46 && event.charCode <=57">

                                     </asp:TextBox>
                                 </ItemTemplate>
                               </asp:TemplateField>

                            <asp:TemplateField HeaderText="Total Cost" ItemStyle-Width="100px" ControlStyle-CssClass="hidden"  ItemStyle-CssClass="hidden" HeaderStyle-CssClass="hidden">
                                <ItemTemplate>
                                    <asp:TextBox runat ="server" ID="txtTotalCost" CssClass="form-control text-center" Enabled="false"></asp:TextBox>
                                    <div class="row hidden">
                                    
                                        <div class="col-md-6">
                                             <asp:TextBox runat="server" id="txtConvertedFreshQty" CssClass="form-control"  Enabled="false"></asp:TextBox>
                        
                                        </div>
                                        
                                        <div class="col-md-6">
                                             <asp:TextBox runat="server" id="txtFreshCost" CssClass="form-control"  Enabled="false"></asp:TextBox>
                                        </div>


                                    </div>
                                    
                                   
                                </ItemTemplate>
                            </asp:TemplateField>

                             <asp:TemplateField HeaderStyle-CssClass="hidden" ItemStyle-CssClass="hidden">
                                <ItemTemplate>
                                    <div class="row small">
                                        <div class="col-md-6">
                                             <asp:TextBox runat="server" id="txtConvertedFrozenQty" CssClass="form-control"  Enabled="false"></asp:TextBox>
                                        </div>
                                          <div class="col-md-6">
                                        <asp:TextBox runat="server" id="txtFrozenCost" CssClass="form-control"  Enabled="false"></asp:TextBox>      
                                        </div>
                                    </div>
                                  
                                    
                                </ItemTemplate>
                            </asp:TemplateField>

                              <asp:TemplateField HeaderStyle-CssClass="hidden" ItemStyle-CssClass="hidden">
                                <ItemTemplate>
                                    <div class="row small">
                                        <div class="col-md-6">
                                             <asp:TextBox runat="server" id="txtConvertedLiempoQty" CssClass="form-control"  Enabled="false"></asp:TextBox>
                                        </div>
                                         <div class="col-md-6">
                                        <asp:TextBox runat="server" id="txtLiempoCost" CssClass="form-control"  Enabled="false"></asp:TextBox>      
                                        </div>
                                    </div>
                                  
                                    
                                </ItemTemplate>
                            </asp:TemplateField>

                             <asp:TemplateField HeaderStyle-CssClass="hidden" ItemStyle-CssClass="hidden">
                                <ItemTemplate>
                                    <div class="row small">
                                        <div class="col-md-6">
                                             <asp:TextBox runat="server" id="txtConvertedLeegQty" CssClass="form-control"  Enabled="false"></asp:TextBox>
                                        </div>
                                         <div class="col-md-6">
                                        <asp:TextBox runat="server" id="txtLeegCost" CssClass="form-control"  Enabled="false"></asp:TextBox>      
                                        </div>
                                    </div>
                                  
                                    
                                </ItemTemplate>
                            </asp:TemplateField>

                            <asp:TemplateField HeaderStyle-CssClass="hidden" ItemStyle-CssClass="hidden">
                                <ItemTemplate>
                                    <div class="row small">
                                        <div class="col-md-6">
                                             <asp:TextBox runat="server" id="txtConvertedAtsara100Qty" CssClass="form-control"  Enabled="false"></asp:TextBox>
                                        </div>
                                         <div class="col-md-6">
                                        <asp:TextBox runat="server" id="txtAtsara100Cost" CssClass="form-control"  Enabled="false"></asp:TextBox>      
                                        </div>
                                    </div>
                                  
                                    
                                </ItemTemplate>
                            </asp:TemplateField>

                              <asp:TemplateField HeaderStyle-CssClass="hidden" ItemStyle-CssClass="hidden">
                                <ItemTemplate>
                                    <div class="row small">
                                        <div class="col-md-6">
                                             <asp:TextBox runat="server" id="txtConvertedAtsara160Qty" CssClass="form-control"  Enabled="false"></asp:TextBox>
                                        </div>
                                         <div class="col-md-6">
                                        <asp:TextBox runat="server" id="txtAtsara160Cost" CssClass="form-control"  Enabled="false"></asp:TextBox>      
                                        </div>
                                    </div>
                                  
                                    
                                </ItemTemplate>
                            </asp:TemplateField>

                            <asp:TemplateField  HeaderText="Remarks">
                                <ItemTemplate>
                                   <asp:TextBox runat="server" id="txtRemarks" CssClass="form-control input-sm" Rows="2"></asp:TextBox>
                                
                                </ItemTemplate>
                            </asp:TemplateField>
                            
                            <asp:TemplateField HeaderText="Change Area" ItemStyle-Width="100px">
                                <ItemTemplate>
                                    <asp:DropDownList runat="server" ID="ddChangeArea" CssClass="form form-control"></asp:DropDownList>
                                </ItemTemplate>
                            </asp:TemplateField>

                            <asp:TemplateField HeaderText="Trip#2" ItemStyle-Width="50px">
                                <ItemTemplate>
                                    <div class="checkbox">
                                        <label>
                                            <%-- <asp:CheckBox runat="server" ID="chkT" Checked='<%# Eval("T") == DBNull.Value ? false :  Eval("T") %>' />--%>
                                            <asp:CheckBox runat="server" ID="chkTrip2" />
                                            <span class="cr"><i class="cr-icon glyphicon glyphicon-ok"></i></span>
                                        </label>

                                    </div>
                                </ItemTemplate>
                            </asp:TemplateField>

                             <asp:TemplateField HeaderText="Cancel">
                                  <ItemTemplate>
                                       <div class="text-center">
                                          <asp:LinkButton runat="server" ID="lnkCancel" CssClass="btn btn-danger btn-sm" OnClick="lnkCancelItem_Click" OnClientClick="return confirm('Are you sure you want to cancel this?');"><span class="glyphicon glyphicon-remove"></span></asp:LinkButton>
                                        </div>
                    
                                </ItemTemplate>
                               </asp:TemplateField>
                        </Columns>
                    </asp:GridView>
                       </div>
                   </div>
                
                   
                    
                </ItemTemplate>
        </asp:TemplateField>
      
        </Columns>
    
    </asp:GridView>
   
          </ContentTemplate>
        </asp:UpdatePanel>
  
   <%--  <asp:GridView runat="server" ID="gvSetSchedule" 
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
    
    </asp:GridView>--%>

    <%--<asp:GridView runat="server" ID="gvAddedSchedule" 
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
    
    </asp:GridView>--%>
 </asp:Panel>
          </div>
    </div>
    </div>

     <!-- Include class hidden temporarily -->
    <div role="tabpanel" class="tab-pane hidden" id="ondemandSchedule">
    <asp:UpdatePanel runat="server" ID="upNewSchedule">
      <ContentTemplate>

  
    <div class="row">
    <div class="panel-body">
        <asp:Panel runat="server" ID="panelInputs">
        <div class="panel panel-success small">
        <div class="panel-heading">
            <div class="row">
                  <asp:UpdatePanel runat="server" ID="upAddItem" UpdateMode="Conditional">
                    <ContentTemplate>
                  <div class="col-md-3">
                  
                        <asp:DropDownList runat="server" CssClass="form-control" ID="ddBranchList" OnSelectedIndexChanged="ddBranchList_SelectedIndexChanged" AutoPostBack="true"></asp:DropDownList>
                     
                  <!--Visible False-->
                       <asp:Label runat="server" ID="lblAPriceAmount" Visible="false"></asp:Label>
                       <asp:Label runat="server" ID="lblALiempoPrice" Visible="false"></asp:Label>
                      <asp:Label runat="server" ID="lblALeegPrice" Visible="false"></asp:Label>
                      <asp:Label runat="server" ID="lblAAtsaraPrice" Visible="false"></asp:Label>
                </div>
              </ContentTemplate>
                </asp:UpdatePanel>

                   <div class="col-md-2">
                           <asp:TextBox runat="SErver" ID="txtAdded_DriverName" CssClass="form-control" placeholder="DriverName"></asp:TextBox>
                       </div>
                        <div class="col-md-2">
                           <asp:TextBox runat="SErver" ID="txtAdded_HelperName" CssClass="form-control" placeholder="Helper"></asp:TextBox>
                       </div>
                        <div class="col-md-2">
                           <asp:TextBox runat="SErver" ID="txtAdded_VehiclePlate" CssClass="form-control" placeholder="Plate Number"></asp:TextBox>
                       </div>

                   <div class="col-md-2">
                       <asp:TextBox runat="server" id="txtAddedRemarks" CssClass="form-control" TextMode="MultiLine" Rows="1" placeholder="Remarks"></asp:TextBox>    
                </div>

                <div class="col-md-1 text-right">
                <asp:LinkButton runat="server" ID="lnkCreateItem" OnClick="lnkCreateItem_Click" 
                CssClass="btn btn-primary btn-sm"><span class="glyphicon glyphicon-plus-sign"></span> Add </asp:LinkButton></div>

      

            </div>
            <br />
            <div class="row">
              
                <div class="col-md-2  text-center">
                    <div class="input-group input-group-sm">
                        <span class="input-group-addon">Fresh:</span> <asp:TextBox  runat="server" ID="txtAddFresh"  CssClass="form-control"  onkeyup="ComputeAddSchedule(this.value)" onkeypress="return(event.charCode == 8 || event.charCode == 0) ? 0: event.charCode >= 46 && event.charCode <=57"></asp:TextBox>
                    <asp:Label runat="server" ID="lblFreshConversion" Visible="false"></asp:Label>
                    </div>
                </div>
                <div class="col-md-2  text-center">
                    <div class="input-group input-group-sm">
                        <span class="input-group-addon">Frozen:</span> <asp:TextBox  runat="server" ID="txtAddFrozen" CssClass="form-control" onkeyup="ComputeAddSchedule(this.value)" onkeypress="return(event.charCode == 8 || event.charCode == 0) ? 0: event.charCode >= 46 && event.charCode <=57"></asp:TextBox>
                    <asp:Label runat="server" ID="lblFrozenConversion" Visible="false"></asp:Label>
                    </div>
                </div>
                <!-- LIEMPO INPUT-->
                <div class="col-md-2 text-center">
                     <div class="input-group input-group-sm">
                     <span class="input-group-addon">Liempo:</span>
                    <asp:TextBox  runat="server" ID="txtAddLiempo"  CssClass="form-control"  onkeyup="ComputeAddSchedule(this.value)" onkeypress="return(event.charCode == 8 || event.charCode == 0) ? 0: event.charCode >= 46 && event.charCode <=57"></asp:TextBox>
                     <asp:Label runat="server" ID="lblLiempoConversion" Visible="false"></asp:Label>
                     </div>
                </div>

                 <!-- LEEG INPUT-->
                <div class="col-md-2 text-center">
                     <div class="input-group input-group-sm">
                     <span class="input-group-addon">Leeg:</span>
                    <asp:TextBox  runat="server" ID="txtAddLeeg"  CssClass="form-control"  onkeyup="ComputeAddSchedule(this.value)" onkeypress="return(event.charCode == 8 || event.charCode == 0) ? 0: event.charCode >= 46 && event.charCode <=57"></asp:TextBox>
                     <asp:Label runat="server" ID="lblLeegConversion" Visible="false"></asp:Label>
                     </div>
                </div>

                <!-- ATSARA 100 INPUT-->
                <div class="col-md-2 text-center">
                     <div class="input-group input-group-sm">
                     <span class="input-group-addon">Atsara100:</span>
                    <asp:TextBox  runat="server" ID="txtAddAtsara100"  CssClass="form-control"  onkeyup="ComputeAddSchedule(this.value)" onkeypress="return(event.charCode == 8 || event.charCode == 0) ? 0: event.charCode >= 46 && event.charCode <=57"></asp:TextBox>
                     <asp:Label runat="server" ID="lblAtsara100Conversion" Visible="false"></asp:Label>
                     </div>
                </div>

                 <!-- ATSARA 160 INPUT-->
                <div class="col-md-2 text-center">
                     <div class="input-group input-group-sm">
                     <span class="input-group-addon">Atsara160:</span>
                    <asp:TextBox  runat="server" ID="txtAddAtsara160"  CssClass="form-control"  onkeyup="ComputeAddSchedule(this.value)" onkeypress="return(event.charCode == 8 || event.charCode == 0) ? 0: event.charCode >= 46 && event.charCode <=57"></asp:TextBox>
                     <asp:Label runat="server" ID="lblAtsara160Conversion" Visible="false"></asp:Label>
                     </div>
                </div>
                

                <div class="col-md-2 text-center hidden">
                     <div class="input-group input-group-sm">
                     <span class="input-group-addon">Total Cost:</span>
                    <asp:Label runat="server" ID="lblATotalAmount" CssClass="form-control"></asp:Label>
                         </div>
                </div>

                
             
            
                <br />
               
            </div>
    
            </div>
            
            <div class="panel-body">
                 <asp:Panel runat="server" ID="panel_AddedSchedule" ScrollBars="Vertical">
                 <asp:GridView runat="server" ID="gvAddedScheduled" CssClass="table table-responsive table-condensed small" AutoGenerateColumns="false">
                        <Columns>
                                <asp:BoundField DataField="BranchCode" ControlStyle-CssClass="hidden"  ItemStyle-CssClass="hidden" HeaderStyle-CssClass="hidden" />
                                <asp:BoundField DataField="ItemCodeFresh" ControlStyle-CssClass="hidden"  ItemStyle-CssClass="hidden" HeaderStyle-CssClass="hidden" />
                                <asp:BoundField DataField="ItemCodeFrozen" ControlStyle-CssClass="hidden"  ItemStyle-CssClass="hidden" HeaderStyle-CssClass="hidden" />
            
                                
                                <asp:BoundField DataField="BranchName" ItemStyle-Width="200px"   />
                               
                          
               
                          
                            <asp:TemplateField HeaderStyle-CssClass="hidden" ItemStyle-CssClass="hidden">
                                <ItemTemplate>
                                        <asp:TextBox runat="server" ID="txtAddedFreshConversionSource" CssClass="form-control" Enabled="false" Text='<%# Eval("InvQtyFresh") %>' ></asp:TextBox>
                                </ItemTemplate>
                              
                            </asp:TemplateField>
                               
                                 <asp:TemplateField  ItemStyle-CssClass="hidden" HeaderStyle-CssClass="hidden" >
                                <ItemTemplate>
                                        <asp:TextBox runat="server" ID="txtAddedFrozenConversionSource" CssClass="form-control"  Enabled="false" Text='<%# Eval("InvQtyFrozen") %>'></asp:TextBox>
                                </ItemTemplate>
                            </asp:TemplateField>

                         
                     
                               
                             <asp:TemplateField HeaderText="Fresh (Bag)" ItemStyle-CssClass="bg-primary" ItemStyle-Width="120px">
                              
                                 <ItemTemplate>
                                     <asp:TextBox runat="server" ID="txtAddedFreshInput"  Enabled="false" CssClass="form-control" Text='<%# Eval("FreshQty") %>'  onkeypress="return(event.charCode == 8 || event.charCode == 0) ? 0: event.charCode >= 46 && event.charCode <=57">

                                     </asp:TextBox>

                                  
                                 </ItemTemplate>
                               </asp:TemplateField>

                            <asp:TemplateField  HeaderText="Frozen (Sack)" ItemStyle-CssClass="bg-primary" ItemStyle-Width="120px">
                                 <ItemTemplate>
                                     <asp:TextBox runat="server" ID="txtAddedFrozenInput" Enabled="false" CssClass="form-control" Text='<%# Eval("FrozenQty") %>'  onkeypress="return(event.charCode == 8 || event.charCode == 0) ? 0: event.charCode >= 46 && event.charCode <=57">

                                     </asp:TextBox>
                                 </ItemTemplate>
                               </asp:TemplateField>

                              
                            <asp:TemplateField  HeaderText="Liempo (Bag)" ItemStyle-CssClass="bg-success" ItemStyle-Width="100px">
                                 <ItemTemplate>
                                     <asp:TextBox runat="server" ID="txtLiempoInput" Enabled="false" CssClass="form-control" Text='<%# Eval("LiempoQty") %>' onkeyup="CalculateConversionAndPriceCost(this.value)" onkeypress="return(event.charCode == 8 || event.charCode == 0) ? 0: event.charCode >= 46 && event.charCode <=57">

                                     </asp:TextBox>
                                 </ItemTemplate>
                               </asp:TemplateField>

                             <asp:TemplateField  HeaderText="Leeg (KL)" ItemStyle-CssClass="bg-success" ItemStyle-Width="100px">
                                 <ItemTemplate>
                                     <asp:TextBox runat="server" ID="txtLeegInput" Enabled="false" CssClass="form-control" Text='<%# Eval("LeegQty") %>' onkeyup="CalculateConversionAndPriceCost(this.value)" onkeypress="return(event.charCode == 8 || event.charCode == 0) ? 0: event.charCode >= 46 && event.charCode <=57">

                                     </asp:TextBox>
                                 </ItemTemplate>
                               </asp:TemplateField>

                             <asp:TemplateField  HeaderText="Atsara100 (Box)" ItemStyle-CssClass="bg-success" ItemStyle-Width="100px">
                                 <ItemTemplate>
                                     <asp:TextBox runat="server" ID="txtAtsara100Input" Enabled="false" CssClass="form-control" Text='<%# Eval("Atsara100Qty") %>' onkeyup="CalculateConversionAndPriceCost(this.value)" onkeypress="return(event.charCode == 8 || event.charCode == 0) ? 0: event.charCode >= 46 && event.charCode <=57">

                                     </asp:TextBox>
                                 </ItemTemplate>
                               </asp:TemplateField>

                             <asp:TemplateField  HeaderText="Atsara160 (Box)" ItemStyle-CssClass="bg-success" ItemStyle-Width="100px">
                                 <ItemTemplate>
                                     <asp:TextBox runat="server" ID="txtAtsara160Input" Enabled="false" CssClass="form-control" Text='<%# Eval("Atsara160Qty") %>' onkeyup="CalculateConversionAndPriceCost(this.value)" onkeypress="return(event.charCode == 8 || event.charCode == 0) ? 0: event.charCode >= 46 && event.charCode <=57">

                                     </asp:TextBox>
                                 </ItemTemplate>
                               </asp:TemplateField>
                        
                            
                            <asp:TemplateField HeaderText="Total Cost" ItemStyle-Width="100px" ControlStyle-CssClass="hidden"  ItemStyle-CssClass="hidden" HeaderStyle-CssClass="hidden">
                                <ItemTemplate>

                                        <asp:TextBox runat ="server" ID="txtAddedTotalCost" CssClass="form-control text-center" Enabled="false"></asp:TextBox>
                                    <div class="row hidden">
                                    
                                        <div class="col-md-6">
                                             <asp:TextBox runat="server" id="txtAddedConvertedFreshQty" CssClass="form-control" Text='<%# Eval("ConvertedFreshQty") %>' ></asp:TextBox>
                        
                                        </div>
                                        
                                        <div class="col-md-6">
                                             <asp:TextBox runat="server" id="txtAddedFreshCost" CssClass="form-control"  Enabled="false" Text='<%# Eval("ConvertedFrozenQty") %>'></asp:TextBox>
                                        </div>


                                    </div>
                                    
                                   
                                </ItemTemplate>
                            </asp:TemplateField>

                             <asp:TemplateField ControlStyle-CssClass="hidden"  ItemStyle-CssClass="hidden" HeaderStyle-CssClass="hidden">
                                <ItemTemplate>
                                    <div class="row small">
                                        <div class="col-md-6">
                                             <asp:TextBox runat="server" id="txtAddedConvertedFrozenQty" CssClass="form-control"  Enabled="false"></asp:TextBox>
                                        </div>
                                          <div class="col-md-6">
                                        <asp:TextBox runat="server" id="txtAddedFrozenCost" CssClass="form-control"  Enabled="false"></asp:TextBox>      
                                        </div>
                                    </div>
                                  
                                    
                                </ItemTemplate>
                            </asp:TemplateField>

                            <asp:TemplateField  HeaderText="Remarks">
                                <ItemTemplate>
                                            <asp:TextBox runat="server" id="txtRemarks" CssClass="form-control" TextMode="MultiLine" rows="1" Text='<%# Eval("Remarks") %>'></asp:TextBox>
                                </ItemTemplate>
                            </asp:TemplateField>
                             
                            <asp:BoundField DataField="DelInfo" HeaderText="Add_Info" />
                          
                             <asp:TemplateField HeaderText="Control">
                                  <ItemTemplate>
                                        <div class="text-center">
                                        <asp:LinkButton runat="server" ID="lnkCancel" CssClass="btn btn-danger btn-sm" OnClick="lnkCancelItem_Click" OnClientClick="return confirm('Are you sure you want to cancel this?');"><span class="glyphicon glyphicon-remove"></span> Cancel</asp:LinkButton>
                                           </div>

                                  </ItemTemplate>
                               </asp:TemplateField>
                           
                        </Columns>
                    </asp:GridView>
                    </asp:Panel>
            </div>
              </div>
  
            </asp:Panel>

    </div>
   </div>

        </ContentTemplate>
  </asp:UpdatePanel>  
    </div>
  
  </div>    
   <!-- End of Tab panes -->         

     

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
                     
                          <div class="col-md-6">
                             <div class="form-group small has-error">
                                        
                               
                                 
                                        

                             </div>   
                               
                         </div>

                        <div class="col-md-6">

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

        <div class="modal fade" id="msgSuccessModal">
         <div class="modal-dialog">
             <div class="modal-content">
                 <div class="modal-header bg-success">
                     <button class="close" data-dismiss="modal">
                         &times;</button>
                     <h4 class="modal-title">
                         DGMU Enterprises System</h4>
                 </div>
                 <div class="modal-body">
                     <h4 class="text-success">
                         <span class="glyphicon glyphicon-saved"></span>&nbsp;
                         <asp:Label runat="server" ID="lblSuccessMessage"></asp:Label></h4>
                 </div>
                 <div class="modal-footer">
                 </div>
             </div>
         </div>
     </div>     

   
    <div class="modal fade" id="msgErrorModal">
         <div class="modal-dialog">
             <div class="modal-content">
                 <div class="modal-header bg-danger">
                     <button class="close" data-dismiss="modal">
                         &times;</button>
                     <h4 class="modal-title">
                         DGMU Enterprises System</h4>
                 </div>
                 <div class="modal-body">
                     <h4 class="text-danger">
                         <span class="glyphicon glyphicon-remove"></span>&nbsp;
                         <asp:Label runat="server" ID="lblErrorMessage"></asp:Label></h4>
                 </div>
                 <div class="modal-footer">
                 </div>
             </div>
         </div>
     </div>  
                 
       </ContentTemplate>
</asp:UpdatePanel>  
 
</div><!-- END OF DIV CONTAINER-->


</asp:Content>

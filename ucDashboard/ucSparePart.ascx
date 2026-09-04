<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ucSparePart.ascx.cs" Inherits="QlyMain.ucDashboard.ucSparePart" %>


   <div class="row">
       <div class="col-md-3">
           <div class="box box-solid">
               <div class="box-header with-border box-primary">
                   <h3 class="box-title">Spare part</h3>

                   <div class="box-tools">
                       <button type="button" class="btn btn-box-tool" data-widget="collapse">
                           <i class="fa fa-minus"></i>
                       </button>
                       <button type="button" class="btn btn-box-tool btn-sm" data-widget="remove">
                           <i class="fa fa-times"></i>
                       </button>
                   </div>
               </div>
               <div class="box-body no-padding">
                   <ul class="nav nav-pills nav-stacked">
                       <li><a href="#"><i class="fa fa-envelope-o"></i>Dưới an toàn kho</a></li>
                       <li><a href="#"><i class="fa fa-calendar fa-inbox"></i>Dưới an toàn kho 1 tuần</a></li> 
                       <li><a href="#"><i class="fa fa-calendar  text-light-blue"></i>Top spare part có tuần suất phải thay thế nhiều</a></li>
                   </ul>
               </div>
               <!-- /.box-body -->
           </div>
       </div>
       <div class="col-md-3">
           <div class="box box-solid">
               <div class="box-header with-border box-primary">
                   <h3 class="box-title">Spare part hỏng nhiều trong năm</h3>

                   <div class="box-tools">
                       <button type="button" class="btn btn-box-tool" data-widget="collapse">
                           <i class="fa fa-minus"></i>
                       </button>
                       <button type="button" class="btn btn-box-tool btn-sm" data-widget="remove">
                           <i class="fa fa-times"></i>
                       </button>
                   </div>
               </div>
               <div class="box-body no-padding">
                   <ul class="nav nav-pills nav-stacked">
                       <li><a href="#"><i class="fa fa-calendar fa-inbox"></i>Spare par 1 <span class="label label-warning pull-right">65 lần</span> </a></li>
                       <li><a href="#"><i class="fa fa-calendar fa-inbox"></i>Spare par 2 <span class="label label-warning pull-right">15 lần</span> </a></li>
                       <li><a href="#"><i class="fa fa-calendar fa-inbox"></i>Spare par 3 <span class="label label-warning pull-right">5 lần</span> </a></li>
                       <li><a href="#"><i class="fa fa-calendar fa-inbox"></i>Spare par 4 <span class="label label-warning pull-right">4 lần</span> </a></li>
                       <li><a href="#"><i class="fa fa-calendar fa-inbox"></i>Spare par 5 <span class="label label-warning pull-right">4 lần</span> </a></li>
                   </ul>
               </div>
               <!-- /.box-body -->
           </div>


       </div>

       <div class="col-md-3">
           <div class="box box-solid">
               <div class="box-header with-border box-primary">
                   <h3 class="box-title">Spare part hỏng nhiều trong 30 ngày</h3>

                   <div class="box-tools">
                       <button type="button" class="btn btn-box-tool" data-widget="collapse">
                           <i class="fa fa-minus"></i>
                       </button>
                       <button type="button" class="btn btn-box-tool btn-sm" data-widget="remove">
                           <i class="fa fa-times"></i>
                       </button>
                   </div>
               </div>
               <div class="box-body no-padding">
                   <ul class="nav nav-pills nav-stacked">
                       <li><a href="#"><i class="fa fa-calendar fa-inbox"></i>Spare par 1 <span class="label label-warning pull-right">6 lần</span> </a></li>
                       <li><a href="#"><i class="fa fa-calendar fa-inbox"></i>Spare par 2 <span class="label label-warning pull-right">3 lần</span> </a></li>
                       <li><a href="#"><i class="fa fa-calendar fa-inbox"></i>Spare par 3 <span class="label label-warning pull-right">3 lần</span> </a></li>
                       <li><a href="#"><i class="fa fa-calendar fa-inbox"></i>Spare par 4 <span class="label label-warning pull-right">3 lần</span> </a></li>
                       <li><a href="#"><i class="fa fa-calendar fa-inbox"></i>Spare par 5 <span class="label label-warning pull-right">2 lần</span> </a></li>
                   </ul>
               </div>
               <!-- /.box-body -->
           </div>


       </div>

       <div class="col-md-3">
           <div class="box box-solid">
               <div class="box-header with-border box-primary">
                   <h3 class="box-title">Bảo dưỡng</h3>

                   <div class="box-tools">
                       <button type="button" class="btn btn-box-tool" data-widget="collapse">
                           <i class="fa fa-minus"></i>
                       </button>
                       <button type="button" class="btn btn-box-tool btn-sm" data-widget="remove">
                           <i class="fa fa-times"></i>
                       </button>
                   </div>
               </div>
               <div class="box-body no-padding">
                   <ul class="nav nav-pills nav-stacked">
                       <li><a href="#"><i class="fa fa-envelope-o"></i>Máy cần bảo dưỡng trong tháng</a></li>
                       <li><a href="#"><i class="fa fa-calendar fa-inbox"></i>Máy đã bảo dưỡng trong tháng</a></li>
                       <li><a href="#"><i class="fa fa-calendar  text-light-blue"></i>Kế hoạch bảo dưỡng</a></li>

                   </ul>
               </div>
               <!-- /.box-body -->
           </div>
       </div>
   </div>
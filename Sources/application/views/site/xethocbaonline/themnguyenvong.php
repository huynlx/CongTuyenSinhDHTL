<div class="col-md-12">
   <div class="row">
      <div class="col-md-6">
         <div style="padding-top:10px;margin-bottom: 15px;color:#00a65a;font-weight: 600;font-size: 18px;" class="form-group has-success">
            <label><i class="fa fa-check" aria-hidden="true"></i> Kết quả đăng ký </label>
         </div>
      </div>
      <div class="col-md-6">
         <div style="padding-top:10px;margin-bottom: 15px;font-weight: 600;font-size: 18px;" class="float-right">
            <label ng-show="!ViewChangeAspire"><i class="fas fa-pencil-alt"></i> Thay đổi nguyện vọng</label>
         </div>
      </div>
   </div>
   <table class="table table-hover">
      <tbody>
         <tr style="background-color: bisque;">
            <th>Nguyện vọng</th>
            <th>Mã xét tuyển</th>
            <th>Tổ hợp xét tuyển</th>
            <th>Trạng thái</th>
            <th>#</th>
         </tr>
         <tr>
            <td>
               <span>Nguyện vọng 1</span>
            </td>
            <td>TLA101</td>
            <td>A00</td>
            <td>
               <span>Đã duyệt</span>
               <span>Không được duyệt</span>
               <span>Đã nhận</span>
            </td>
            <td>
               <a style="cursor:pointer" title="Sửa nguyện vọng" >
               <i class="fa fa-edit"></i>
               </a>
            </td>
         </tr>
      </tbody>
   </table>
</div>
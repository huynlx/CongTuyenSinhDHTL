
      <table class="table table-bordered table-hover" style="background-color:white" ng-show="item.candidateAttachments.length>0">
         <tbody>
            <tr style="background-color: bisque;">
               <th>TT</th>
               <th>Mô tả</th>
               <th>Tên file</th>
               <th>Dung lượng</th>
               <th>#</th>
            </tr>
            <tr>
               <td>1</td>
               <td>
                  <input type="text" max="100" class="form-control ng-pristine ng-valid ng-empty ng-touched" ng-model="file.FileDescription" placeholder="Mô tả">
               </td>
               <td ng-bind="file.FileName" class="ng-binding">20820_b3.PNG</td>
               <td ng-bind="file.FileSize/1024 + '(KB)'" class="ng-binding">6.87109375(KB)</td>
               <td>
                  <a href="javascript:void(0)" title="Xóa file">
                  <i class="far fa-trash-alt"></i>
                  </a>
               </td>
            </tr>
         </tbody>
      </table>
$(document).ready(function() {
    //check value email
    function validateEmail(email) {
        const re = /^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/;
        return re.test(email);
      }
      
    function validate() {
        const $result = $("#ShowError");
        const email = $("#email").val();
        $result.text("");
      
        if (validateEmail(email)) {
          $result.text(email + " hợp lệ");
          $result.css("color", "green");
        } else {
          $result.text(email + " không đúng định dạng");
          $result.css("color", "red");
        }
        return false;
      }
      $(".btn__save").on("submit", validate);

      // $(".btn__save").click(function(){     
      //   $(".content_tnv").show();
      // });
      $(".btn__save-nv").click(function(){     
        $(".col_nop_tl").show();
      });
      var changeMenu = document.getElementsByClassName('content_tnv fa-minus');
      var changeMenu = document.querySelector('.content_tnv .fa-minus');
          changeMenu.addEventListener("click",function(){
              this.classList.toggle('fa-plus');
              $(".them_nv").slideToggle("slow");
          });
          var changeMenu1 = document.getElementsByClassName('row_nop_hs fa-minus');
          var changeMenu1 = document.querySelector('.row_nop_hs .fa-minus');
          changeMenu1.addEventListener("click",function(){
              this.classList.toggle('fa-plus');
              $(".nop_ho_so").slideToggle("slow");
          });  
      $(".btn__save-nv").click(function(){
        $.ajax({
          url: "http://localhost/CongTuyenSinhDHTL/Sources/home/xhb2",
          type: 'GET',
          success: function(result){
            $(".row_kqdk").html(result);
        }});
      })
      $(".btn__save-tl").click(function(){
        $.ajax({
          url: "http://localhost/CongTuyenSinhDHTL/Sources/home/xhb3",
          type: 'GET',
          success: function(result){
            $(".row_upfile").html(result);
        }});
      })
      $("#form").on("submit", function(e) {
              e.preventDefault();
      });

      var i = 0;
    $(".btn__save").click(function(){
      if (i == 0) {
        i = 1;
        var elem = document.getElementsByClassName("num");
        var width = 1;
        var id = setInterval(frame, 10);
        function frame() {
          if (width >= 100) {
            clearInterval(id);
            i = 0;
          } else {
            width++;
            elem.style.width = width + "%";
          }
        }
      }
    })

});

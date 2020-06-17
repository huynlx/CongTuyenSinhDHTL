$(document).ready(function () {
    //Ấn Learn more form dtm
    $(".me-fix-dtm #learn-more").click(function () {
       $(".me-fix-dtm").hide();
    });

    //Ẩn form login khi load
    //Click nút đăng nhập trên nav
    $(".btnDangNhap").click(function () {
        $(".me-form-login").toggle();
    });
    
    //Click Chat
    $(".me-open-button").click(function () {
        $("#myForm").show();
        $(this).hide();
    });
    $("#myForm .cancel").click(function () {
        $("#myForm").hide();
        $(".me-open-button").show();
    });

    //Sửa đổi thông tin cá nhân
    $(".hide-update").hide();
    $("#me-setting-ttcn").click(function () {
        $(".hide-update").toggle();
    });

    // Home
    $('.D_carousel').owlCarousel({
        loop:true,
        nav:true,
        navText:[
            '<i class="fas fa-chevron-left"></i>',
            '<i class="fas fa-chevron-right"></i>'
        ],
        dots:true,
        autoplay:true,
        autoplayTimeout:3000,
        responsive:{
            0:{
                items:1,
                nav:false,
                dots:false
            },
            600:{
                items:1
            },
            1000:{
                items:1
            }
        }
    });

    //back-to-top
    var scrollTrigger = 400, // px
    backToTop = function () {
      var scrollTop = $(window).scrollTop();
      if (scrollTop > scrollTrigger) {
        $('#back-to-top').show();
      } else {
        $('#back-to-top').hide();
      }
    };
    backToTop();
    $(window).on('scroll', function () {
        backToTop();
    });
    $('#back-to-top').on('click', function (e) {
        e.preventDefault();
        $('html,body').animate({
        scrollTop: 0
        }, 700);
    });
    $('.btn-close').click(function(){
        $(".me-form-login").hide();
    })
    $('.fa-bars').click(function(){
        $(".inner-menu").css("width","90%");
        $(".inner-menu").toggle();
        $(".D_modal").show();
    })
    $('.D_modal').click(function(){
        $(this).css("display","none");
        $(".inner-menu").hide();
    })
    var changeMenu = document.getElementsByClassName('search__menu-mb fa-search');
    var changeMenu = document.querySelector('.search__menu-mb .fa-search');
        changeMenu.addEventListener("click",function(){
            this.classList.toggle('fa-times');
            $(".search-mb").slideToggle("slow");
        });
});
    // var changeMenu = document.getElementsByClassName('fa-bars');
    // var changeMenu = document.querySelector('.fa-bars');
    //     changeMenu.addEventListener("click",function(){
    //         this.classList.toggle('fa-times');
    //         $("#menu-mb").toggle();
    //         $(".D_modal").css("display","block");
    //     });
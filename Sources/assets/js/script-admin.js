$(document).ready(function () {    
    // Bài viết
    // Thêm
    var form_add_bv = $("#form_add_bv");
    var add_ctbv_form_add_bv = $("#add_ctbv_form_add_bv");
    var save_form_add_bv = $("#save_form_add_bv");

    var countAdd = $("#count_ctbv_form_add_bv").val();
    console.log(countAdd);
    $(add_ctbv_form_add_bv).click(function (e) {
        e.preventDefault();
        console.log("add_ctbv_form_add_bv");  
        countAdd++;
        $(form_add_bv).append('<tr><td><input type="button" value="-" class = "delete_ctbv_form_add_bv"><p>Nội dung chi tiết</p><textarea name="ndct'+ countAdd +'" class="form-control" id="" cols="30" rows="3"></textarea></td><td><P>Ảnh chi tiết</p><input type="file" name="linkct'+ countAdd +'" class="form-control"></td></tr>')
    });    

    $(form_add_bv).on("click", ".delete_ctbv_form_add_bv", function(e) {
        e.preventDefault();
        console.log("delete_ctbv_form_add_bv");
        $(this).parent().parent().remove();
        //countAdd--;
    });

    $(save_form_add_bv).click(function () {
        $("#count_ctbv_form_add_bv").val((countAdd + ""));
    });

    // Sửa
    var form_edit_bv = $("#form_edit_bv");
    var add_ctbv_form_edit_bv = $("#add_ctbv_form_edit_bv");
    var save_form_edit_bv = $("#save_form_edit_bv");

    var countEdit = $("#count_ctbv_form_edit_bv").val();
    console.log(countEdit);

    $(add_ctbv_form_edit_bv).click(function (e) {
        e.preventDefault();
        console.log("add_ctbv_form_edit_bv");  
        countEdit++;
        $(form_edit_bv).append('<tr><td><input type="button" value="-" class = "delete_ctbv_form_edit_bv"><p>Nội dung chi tiết</p><textarea name="ndct'+ countEdit +'" class="form-control" id="" cols="30" rows="3"></textarea></td><td><P>Ảnh chi tiết</p><input type="file" name="linkct'+ countEdit +'" class="form-control"></td></tr>')
    });    

    $(form_edit_bv).on("click", ".delete_ctbv_form_edit_bv", function(e) {
        e.preventDefault();
        console.log("delete_ctbv_form_edit_bv");
        $(this).parent().parent().remove();
        //count--;
    });

    $(save_form_edit_bv).click(function () {
        $("#count_ctbv_form_edit_bv").val((countEdit + ""));
    });

    // Danh mục
    var add_dmc_form_edit_dm = $("#add_dmc_form_edit_dm");
    var form_edit_dm = $("#form_edit_dm");
    var save_form_edit_dm = $("#save_form_edit_dm");

    var countDMC = $("#count_dmc_form_edit_dm").val();
    console.log(countDMC);

    $(add_dmc_form_edit_dm).click(function (e) {
        e.preventDefault();
        console.log("add_dmc_form_edit_dm");  
        countDMC++;
        $(form_edit_dm).append('<tr><td><a class="btn btn-default delete_dmc_form_edit_dm" href=""><em class="fa fa-trash"></em></a></td><td><P>Mã: </p></td><td><textarea name="maC'+ countDMC +'" class="form-control" id="" cols="30" rows="1"></textarea></td><td><P>Tên: </p></td><td><textarea name="tenC'+ countDMC +'" class="form-control" id="" cols="30" rows="1"></textarea></td></tr>');
    });

    $(form_edit_dm).on("click", ".delete_dmc_form_edit_dm", function(e) {
        e.preventDefault();
        console.log("delete_dmc_form_edit_dm");
        $(this).parent().parent().remove();
        //count--;
    });

    $(save_form_edit_dm).click(function () {
        $("#count_dmc_form_edit_dm").val((countDMC + ""));
    });

    // Chính

    var base_url = window.location.origin;
    var provinceBase_url=base_url+'/CongTuyenSinhDHTL/Sources/assets/json/Province.json';
    $.getJSON(provinceBase_url, function(data){
        $.each(data, function (index, value) {
            //console.log(index);
            $('#selTinhThanhPhoAddHsxt').append('<option value="'+value.CityName+'">' + value.CityName + '</option>');
            $('#seltinhthanhphocsdt').append('<option value="'+value.CityName+'">' + value.CityName + '</option>');
            $('#selNoiSinhAddHsxt').append('<option value="'+value.CityName+'">' + value.CityName + '</option>');
            $('#selTinhThanhPhoLop10AddHsxt').append('<option value="'+value.CityName+'">' + value.CityName + '</option>');
            $('#selTinhThanhPhoLop11AddHsxt').append('<option value="'+value.CityName+'">' + value.CityName + '</option>');
            $('#selTinhThanhPhoLop12AddHsxt').append('<option value="'+value.CityName+'">' + value.CityName + '</option>');
        }); 
    });  

    $('#seltinhthanhphocsdt').change(function () {
                //console.log("afdasdfa");
                //$("#selquanhuyencsdt").val([]);
                //$("#selquanhuyencsdt").val();
                var select = document.getElementById("selquanhuyencsdt");
                var length = select.options.length;
                for (i = length-1; i >= 0; i--) {
                select.options[i] = null;
                }
                //document.getElementById("selquanhuyencsdt").empty();
                var districtBase_url=base_url+'/CongTuyenSinhDHTL/Sources/assets/json/District.json';
                var seltinhthanhphocsdtValue=seltinhthanhphocsdt.value;
                //console.log(seltinhthanhphocsdtValue);
                $.getJSON(districtBase_url, function(data)
                {
                    var code=[];
                    $.each(data, function (index, value) {
                        if (value.CityName==seltinhthanhphocsdtValue) 
                        {
                            //console.log(value.DistrictName);
                            $('#selquanhuyencsdt').append('<option value="'+ value.DistrictName +'">' + value.DistrictName + '</option>');
                            
                        }  
                    });
                });     
    });

    $('#selTinhThanhPhoAddHsxt').change(function () {
        //console.log("afdasdfa");
        //$("#selquanhuyencsdt").val([]);
        //$("#selquanhuyencsdt").val();
        var select = document.getElementById("selQuanHuyenAddHsxt");
        var length = select.options.length;
        for (i = length-1; i >= 0; i--) {
        select.options[i] = null;
        }
        //document.getElementById("selquanhuyencsdt").empty();
        var districtBase_url=base_url+'/CongTuyenSinhDHTL/Sources/assets/json/District.json';
        var selTinhThanhPhoAddHsxtValue=selTinhThanhPhoAddHsxt.value;
        //console.log(seltinhthanhphocsdtValue);
        $.getJSON(districtBase_url, function(data)
        {
            var code=[];
            $.each(data, function (index, value) {
                if (value.CityName==selTinhThanhPhoAddHsxtValue) 
                {
                    //console.log(value.DistrictName);
                    $('#selQuanHuyenAddHsxt').append('<option value="'+ value.DistrictName +'">' + value.DistrictName + '</option>');
                    
                }  
            });
        });     
    });

    $('#selTinhThanhPhoLop10AddHsxt').change(function () {
        var select = document.getElementById("selQuanHuyenLop10AddHsxt");
        var length = select.options.length;
        for (i = length-1; i >= 0; i--) {
        select.options[i] = null;
        }
      
        var districtBase_url=base_url+'/CongTuyenSinhDHTL/Sources/assets/json/District.json';
        var selTinhThanhPhoLop10AddHsxtValue=selTinhThanhPhoLop10AddHsxt.value;
       
        $.getJSON(districtBase_url, function(data)
        {
            var code=[];
            $.each(data, function (index, value) {
                if (value.CityName==selTinhThanhPhoLop10AddHsxtValue) 
                {
                    
                    $('#selQuanHuyenLop10AddHsxt').append('<option value="'+ value.DistrictName +'">' + value.DistrictName + '</option>');
                    
                }  
            });
        });     
    });

    $('#selQuanHuyenLop10AddHsxt').change(function () {
        
        var select = document.getElementById("selTruongThptLop10AddHsxt");
        var length = select.options.length;
        for (i = length-1; i >= 0; i--) {
        select.options[i] = null;
        }
        //document.getElementById("selquanhuyencsdt").empty();
        var schoolBase_url=base_url+'/CongTuyenSinhDHTL/Sources/assets/json/School.json';
        var selQuanHuyenLop10AddHsxtValue=selQuanHuyenLop10AddHsxt.value;
        //console.log(seltinhthanhphocsdtValue);
        $.getJSON(schoolBase_url, function(data)
        {
            var code=[];
            $.each(data, function (index, value) {
                if (value.DistrictName==selQuanHuyenLop10AddHsxtValue) 
                {
                    //console.log(value.SchoolName);
                    $('#selTruongThptLop10AddHsxt').append('<option value="'+value.SchoolName+'">' + value.SchoolName + '</option>');
                    
                }  
            });
        });     
    });



    $('#selTinhThanhPhoLop11AddHsxt').change(function () {
        var select = document.getElementById("selQuanHuyenLop11AddHsxt");
        var length = select.options.length;
        for (i = length-1; i >= 0; i--) {
        select.options[i] = null;
        }
        var districtBase_url=base_url+'/CongTuyenSinhDHTL/Sources/assets/json/District.json';
        var selTinhThanhPhoLop11AddHsxtValue=selTinhThanhPhoLop11AddHsxt.value;
        
        $.getJSON(districtBase_url, function(data)
        {
            var code=[];
            $.each(data, function (index, value) {
                if (value.CityName==selTinhThanhPhoLop11AddHsxtValue) 
                {
                   
                    $('#selQuanHuyenLop11AddHsxt').append('<option value="'+ value.DistrictName +'">' + value.DistrictName + '</option>');
                    
                }  
            });
        });     
    });

    $('#selQuanHuyenLop11AddHsxt').change(function () {
    
        var select = document.getElementById("selTruongThptLop11AddHsxt");
        var length = select.options.length;
        for (i = length-1; i >= 0; i--) {
        select.options[i] = null;
        }
       
        var schoolBase_url=base_url+'/CongTuyenSinhDHTL/Sources/assets/json/School.json';
        var selQuanHuyenLop11AddHsxtValue =selQuanHuyenLop11AddHsxt.value;
        
        $.getJSON(schoolBase_url, function(data)
        {
            var code=[];
            $.each(data, function (index, value) {
                if (value.DistrictName==selQuanHuyenLop11AddHsxtValue) 
                {
                    
                    $('#selTruongThptLop11AddHsxt').append('<option value="'+value.SchoolName+'">' + value.SchoolName + '</option>');
                    
                }  
            });
        });     
    });



    $('#selTinhThanhPhoLop12AddHsxt').change(function () {
        var select = document.getElementById("selQuanHuyenLop12AddHsxt");
        var length = select.options.length;
        for (i = length-1; i >= 0; i--) {
        select.options[i] = null;
        }
        var districtBase_url=base_url+'/CongTuyenSinhDHTL/Sources/assets/json/District.json';
        var selTinhThanhPhoLop12AddHsxtValue=selTinhThanhPhoLop12AddHsxt.value;
        
        $.getJSON(districtBase_url, function(data)
        {
            var code=[];
            $.each(data, function (index, value) {
                if (value.CityName==selTinhThanhPhoLop12AddHsxtValue) 
                {
                   
                    $('#selQuanHuyenLop12AddHsxt').append('<option value="'+ value.DistrictName +'">' + value.DistrictName + '</option>');
                    
                }  
            });
        });     
    });

    $('#selQuanHuyenLop12AddHsxt').change(function () {
    
        var select = document.getElementById("selTruongThptLop12AddHsxt");
        var length = select.options.length;
        for (i = length-1; i >= 0; i--) {
        select.options[i] = null;
        }
       
        var schoolBase_url=base_url+'/CongTuyenSinhDHTL/Sources/assets/json/School.json';
        var selQuanHuyenLop12AddHsxtValue =selQuanHuyenLop12AddHsxt.value;
        
        $.getJSON(schoolBase_url, function(data)
        {
            var code=[];
            $.each(data, function (index, value) {
                if (value.DistrictName==selQuanHuyenLop12AddHsxtValue) 
                {
                    
                    $('#selTruongThptLop12AddHsxt').append('<option value="'+value.SchoolName+'">' + value.SchoolName + '</option>');
                    
                }  
            });
        });     
    });

    //add hsxt
    var enthicBase_url=base_url+'/CongTuyenSinhDHTL/Sources/assets/json/enthic.json';
    $.getJSON(enthicBase_url, function(data){
        $.each(data, function (index, value) {
            for(i in value){
                //console.log(value[i].TEN);    
                //$('#sel2').append('<option value="' + value[i].code + '">' + value[i].TEN + '</option>');
                $('#selDanTocAddHsxt').append('<option value="'+value[i].TEN+'">' + value[i].TEN + '</option>');
            }
        });      
    });  

    // js add hsxt

    $("#themnguyenvongdangky").click(function () {
        var text = $(this).text();
        if (text === "+Thêm nguyện vọng đăng ký") {
            $(this).text("-Hủy nguyện vọng đăng ký");
            $("#searchContent").show();
            $('#thongtindangkyxettuyen').show();
        } else {
            $(this).text("+Thêm nguyện vọng đăng ký");
            $("#searchContent").hide();
        }
    });

    $("#labelnopkemfileminhchung").click(function () {
        var text = $(this).text();
        if (text === "+Nộp kèm file minh chứng và hoàn thành hồ sơ") {
            $(this).text("-Nộp kèm file minh chứng và hoàn thành hồ sơ");
            //$("#searchContent").show();
            $('#nopkemfileminhchungDiv').show();
        } else {
            $(this).text("+Nộp kèm file minh chứng và hoàn thành hồ sơ");
            $("#nopkemfileminhchungDiv").hide();
        }
    });

    $('#nhomnganhxettuyen').change(function () {
        //console.log(nhomnganhxettuyen.value);
        
        document.getElementById("maxettuyen").value=nhomnganhxettuyen.value;

        // $date = "123";
        // $.ajax({
        //     url: './admin/add_hsxt/x', 
        //     type: "POST",
        //     dataType:'text', 
        //     data: ({'date': $date}),
        //     success: function(data){
        //         console.log($date);
        //     }
        // }); 
    });


    var CombinSubjectBase_url=base_url+'/CongTuyenSinhDHTL/Sources/assets/json/CombinSubject.json';
    
    $('#tohopxettuyen').change(function () {
        
        //var tohopxettuyenAddHsxtValue =tohopxettuyen.value;
        var indexMon=1;
        $.getJSON(CombinSubjectBase_url, function(data)
        {
            $.each(data, function (index, value) {
                //console.log(value.CombinCode);
                if (value.CombinCode==tohopxettuyen.value) 
                {
                    console.log(value.SubjectCode);
                    //$('#mon1').value=value.SubjectCode;
                    document.getElementById("mon"+indexMon).innerHTML = value.SubjectCode;
                    document.getElementById("monlop11"+indexMon).innerHTML = value.SubjectCode;
                    document.getElementById("monlop12"+indexMon).innerHTML = value.SubjectCode;
                    indexMon++;
                }  
            });
        });     
    });

    
});


// var newbase_url=base_url+'/CongTuyenSinhDHTL/Sources/assets/json/response.json';

    // //"<?php echo base_url();?>assets/bootstrap/js/bootstrap.min.js"
    // $.getJSON(newbase_url, function(data)
    //          {
    //              $.each(data, function (index, value) {
    //                 // APPEND OR INSERT DATA TO SELECT ELEMENT.
    //                 //$('#sel').append('<option value="' + value.ID + '">' + value.Name + '</option>');
    //                 //$('#sel').append('<option value="' + value.ID + '">' + value.ID.Name + '</option>');
    //                 //console.log(index);
    //                 //$('#sel').append('<option value="' + index + '">' + index + '</option>');
    //                 //console.log(index);
    //                 if (index=='provinces')
    //                 {
                        
    //                     //console.log(value);
    //                     // $.each(data, function (index, value) {
    //                     //$('#sel2').append('<option value="' + index + '">' + value[0] + '</option>');
    //                     // });
    //                     for(i in value){
    //                         //console.log(value[i].name);    
    //                         $('#sel').append('<option value="' + value[i].code + '">' + value[i].code + " "+ value[i].name + '</option>');
    //                         $('#seltinhthanhphocsdt').append('<option value="' + value[i].code + '">' + value[i].code + " "+ value[i].name + '</option>');
    //                     }
    //                 }
    //             });
                
    //         });

    //         $('#sel').change(function () {
    //             $("#sel2").val([])
                 
    //             var x=sel.value;
    //             $.getJSON(newbase_url, function(data)
    //             {
    //                 var code=[]
    //              $.each(data, function (index, value) {
    //                 if (index=='highSchools')
    //                 {
    //                     for(i in value){
    //                         if (value[i].provinceCode==x)
    //                         {
                                
    //                             code.push(value[i].districtName);
    //                             //$('#sel3').append('<option value="' + index + '">' + value[i].districtName + '</option>');
    //                         }
    //                     }
                        
    //                 }
    //                 });
                   
    //                 var uniqueNames = [];
    //                 $.each(code, function(i, el){
    //                 if($.inArray(el, uniqueNames) === -1) uniqueNames.push(el);
    //                 });
    //                 for (i in uniqueNames)
    //                     $('#sel2').append('<option value="' + "a" + '">' + uniqueNames[i] + '</option>');
    //                 });
                
          
    //         });

    //     $('#seltinhthanhphocsdt').change(function () {
    //         //console.log("sdfasd");
    //         $("#selquanhuyencsdt").val([])
    //         var x=seltinhthanhphocsdt.value;
    //         $.getJSON(newbase_url, function(data)
    //         {
    //             var code=[]
    //          $.each(data, function (index, value) {
    //             if (index=='highSchools')
    //             {
    //                 for(i in value){
    //                     if (value[i].provinceCode==x)
    //                     {
                            
    //                         code.push(value[i].districtName);
    //                         //$('#sel3').append('<option value="' + index + '">' + value[i].districtName + '</option>');
    //                     }
    //                 }
                    
    //             }
    //             });
               
    //             var uniqueNames = [];
    //             $.each(code, function(i, el){
    //             if($.inArray(el, uniqueNames) === -1) uniqueNames.push(el);
    //             });
    //             for (i in uniqueNames)
    //                 $('#selquanhuyencsdt').append('<option value="' + "a" + '">' + uniqueNames[i] + '</option>');
    //             });
            
      
    //     });

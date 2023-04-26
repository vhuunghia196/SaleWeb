$(document).ready(function () {

    $(".go-to-top").hide()
    $(window).scroll(function(){
        /*if($(this).scrollTop()){
            $('header').addClass('sticky');
            $('#nav-mobile').addClass('sticky-mobile');
            $('#nav-mobile').removeClass('nav-mobile');
        }else{
            $('header').removeClass('sticky');
            $('#nav-mobile').removeClass('sticky-mobile');
            $('#nav-mobile').addClass('nav-mobile');
        }*/
        if($(this).scrollTop() > 250){
            $(".go-to-top").show("slow")
        }
        else{
            $(".go-to-top").hide("slow")
        }
    });
    $(".go-to-top").click(function(){
        $("html, body").animate({
            scrollTop: 0
        }, 200)
    })
    $(".product-in-cart-mobile").addClass("product-in-cart-together")
    $(".product-in-cart").addClass("product-in-cart-together")
    $(".decor-all-left input[type=text]").addClass("content")
    $(".Search").click(function(){
        var k=$(".content").val()
        var li=$(".decor-all-left-inner h2")
        for(var i=0;i< li.length; i++)
        {
            if($(li[i]).text().indexOf(k) >=0)
            {
                $(li[i]).parent().parent().addClass("active")
            }
        }
        setTimeout(function(){
            $(".decor-all-left-inner").removeClass("active")
        }, 5000)
    })

    var quantity_of_products=0;
    var limit=$(".stock bdi").html()
    $(".increase-up").click(function(){
        if(quantity_of_products > parseInt(limit) -1)
        {
            return;
        }
        else
        {
            quantity_of_products+= 1;
            document.getElementById("quantity_of_products").innerHTML= quantity_of_products;
        }
    })


    $(".increase-down").click(function(){
        if(quantity_of_products <2)
        {
            return;
        }
        else
        {
            quantity_of_products-= 1;
            document.getElementById("quantity_of_products").innerHTML= quantity_of_products;
        }
    })


    $(".share-right").hide()
    $(".share").click(function(){
        
        $(".share-right").toggle(500)
    })



    $(".tab-content div:not(:first-child)").hide()
    $(".detail-of-products-middle-tab > li > a").click(function(){
        event.preventDefault()
        $(".detail-of-products-middle-tab > li > a").removeClass("active-product")
        $(this).addClass("active-product")
        var tab=$(this).attr("href")
        $(".tab-content div").hide()
        $(tab).show()
    })

    $(".detail-of-products-top-img-anothers img").click(function(){
        var change_img=$(this).attr("src")
        var _img=document.getElementById("change-img")
        var be_change=_img.src
        _img.src=change_img
        this.src=be_change
    })
    $(".nav-mobile-content-2").hide()
    $(".menu-bars").click(function(){
        $(".nav-mobile-content-2").show()
        $(".menu-bars").hide()
        $(".close-menu").show()
        $(".fa-times").css("color","#ff7012")
    })
    $(".close-menu").hide()
    $(".close-menu").click(function(){
        $(".nav-mobile-content-2").hide()
        $(".menu-bars").show()
        $(".close-menu").hide()
    })
    $(".product-in-cart-mobile").hide()
    $(".only-mobile").click(function(){
        $(".product-in-cart-mobile").toggle()
    })
    // thêm vào giỏ hàng

    $(".shop").off("click").on("click", function (e) {
        e.preventDefault();
        var productId = $(this).data("id");
        $.ajax({
            type: "POST",
            url: "/TrangChu/AddToCart",
            data: { id: productId },
            success: function (data) {
                if (data.success) {
                    var quantitySpan = document.getElementById("quantity");
                    quantitySpan.innerHTML = parseInt(quantitySpan.innerHTML) + 1;
                    alert("SẢN PHẨM ĐÃ ĐƯỢC THÊM VÀO GIỎ HÀNG THÀNH CÔNG");

                } else {
                    alert("Đã có lỗi xảy ra, vui lòng thử lại sau");
                    $(this).prop('disabled', false);
                }
            },
            error: function () {
                alert("Đã có lỗi xảy ra, vui lòng thử lại sau");
                $(element).prop('disabled', false);
            }
        });
    });
    $(".shop2").off("click").on("click", function (e) {
        e.preventDefault();
        var productId = $(this).data("id");
        $.ajax({
            type: "POST",
            url: "/TrangChu/AddToCart",
            data: { id: productId },
            success: function (data) {
                if (data.success) {
                    var quantitySpan = document.getElementById("quantity");

                    quantitySpan.innerHTML = parseInt(quantitySpan.innerHTML) + 1;
                    alert("SẢN PHẨM ĐÃ ĐƯỢC THÊM VÀO GIỎ HÀNG THÀNH CÔNG");

                } else {
                    alert("Đã có lỗi xảy ra, vui lòng thử lại sau");
                }
            },
            error: function () {
                alert("Đã có lỗi xảy ra, vui lòng thử lại sau");
            }
        });
    });
    // xóa sản phảm khỏi giỏ hàng
    $('.delete-item').click(function (e) {
        e.preventDefault();
        var productId = $(this).data('product-id');
        var quantity = $(this).closest('tr').find('[data-quantity]').data('quantity');
        // Gửi yêu cầu xóa sản phẩm đến server.
        $.ajax({
            url: "/TrangChu/RemoveFromCart",
            type: 'POST',
            data: { id: productId },
            success: function (result) {
                if (result.success) {
                    // Nếu xóa sản phẩm thành công, cập nhật lại thông tin giỏ hàng trên giao diện.
                    // ...

                    var quantitySpan = document.getElementById("quantity");
                    quantitySpan.innerHTML = parseInt(quantitySpan.innerHTML) - quantity;
                    /*if (isNaN(quantitySpan.innerHTML)) {
                        quantity = 0;
                    }*/
                    var rowToDelete = $('.delete-item[data-product-id="' + productId + '"]').closest('tr');
                    rowToDelete.remove();
                }
            },
            error: function () {
                alert('Xóa sản phẩm không thành công.');
            }
        });
    });
    $('#password, #confirmPassword').on('keyup', function () {
        if ($('#password').val() == $('#confirmPassword').val()) {
            $('#passwordMatch').html('Matching').css('color', 'green');
            $('#registerBtn').prop('disabled', false);
        } else {
            $('#passwordMatch').html('Not Matching').css('color', 'red');
            $('#registerBtn').prop('disabled', true);
        }
    });
    $('#phoneNumber').on('input', function () {
        var input = $(this);
        var phoneNumber = input.val();
        if (/^0[0-9]{9}$/.test(phoneNumber)) {
            input.removeClass("is-invalid").addClass("is-valid");
            $('#phoneNumberError').text("");
            $('#registerBtn').prop('disabled', false);
        } else {
            input.removeClass("is-valid").addClass("is-invalid");
            $('#phoneNumberError').text("Please enter a 10-digit phone number starting with 0");
            $('#registerBtn').prop('disabled', true);
        }
    });
    $('form').submit(function (event) {
        var verified = grecaptcha.getResponse();
        if (verified.length === 0) {
            event.preventDefault();
            alert('Please verify that you are not a robot.');
        } else {
            $('button[type="submit"]').prop('disabled', true);
        }
    });
    $('#g-recaptcha-response').change(function () {
        $('button[type="submit"]').prop('disabled', false);
    });
    new WOW().init();
});
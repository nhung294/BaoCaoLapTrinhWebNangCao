<main class="main-wrapper">
    <!-- Start Slider Area (banner) -->
    <div class="axil-main-slider-area main-slider-style-3">
        <div class="container">
            <div class="row align-items-center">
                <div class="col-xl-6 col-lg-6">
                    <div class="main-slider-content">
                        <span class="subtitle"><i class="fas fa-fire"></i>Buy now before run off 🌟</span>
                        <h1 class="title">"Yenni – Each page is a mark, each chapter a self."</h1>
                    </div>
                </div>
                <div class="col-xl-6 col-lg-6">
                    <div class="main-slider-large-thumb">
                        <div class="slider-thumb-activation-two axil-slick-dots">
                            <!-- start -->
                            <?php
                  $i =0;
                  foreach($product_view as $pd){
                    if($i<5)
                    {
                      if($pd['special'] == 1){
                        echo'
                        <div class="single-slide slick-slide">
                            <div class="axil-product product-style-five">
                                    <div class="thumbnail">
                                        <a href="bookApp.php?act=detail_product&id='.$pd['id_product'].'">
                                            <img
                                            src="../uploads/'.$pd['product_img'].'"
                                            alt="Product Images"
                                            />
                                        </a>
                                    </div>
                                    <div class="product-content">
                                        <div class="inner">
                                            <h5 class="title">
                                              <a href="bookApp.php?act=detail_product&id='.$pd['id_product'].'">'.$pd['product_name'].'</a>
                                            </h5>
                                            <div class="product-price-variant">
                                                <span class="price current-price">'.number_format($pd['product_prices']).'đ</span>
                                            </div>
                                            <ul class="cart-action">
                                                <li class="select-option">
                                                    <a " href="bookApp.php?act=detail_product&id='.$pd['id_product'].'">Buy Product</a>
                                                </li>
                                            </ul>
                                        </div>
                                    </div>
                            </div>
                        </div>
                        ';
                        $i++;
                      }
                    }
                  }?>
                            <!-- end -->
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
 <!-- Flash Sale Section -->
 <div class="flash-sale-section">
    <div class="flash-sale-title">
        <h2>🔥 FLASH SALE 🔥</h2>
        <p>Thời gian còn lại: <span id="countdown"></span></p>
    </div>
    <div class="flash-sale-container">
    <?php
$count = 0;
foreach ($product as $pd) {
    if (!isset($pd['flash_sale']) || $pd['flash_sale'] != 1) {
        continue;
    }

    if ($count >= 4) break;

    $gia_cu = $pd['old_prices'];
    $gia_moi = $pd['product_prices'];
    $giam_gia = ($gia_cu > 0) ? round((($gia_cu - $gia_moi) / $gia_cu) * 100) : 0;

    echo '
    <div class="flash-sale-item">
        <div class="product-image">
            <a href="bookApp.php?act=detail_product&id=' . htmlspecialchars($pd['id_product']) . '">
                <img src="../uploads/' . htmlspecialchars($pd['product_img']) . '" 
                     alt="' . htmlspecialchars($pd['product_name']) . '" />
            </a>
        </div>
        <div class="product-info">
            <h5>
                <a href="bookApp.php?act=detail_product&id=' . htmlspecialchars($pd['id_product']) . '">
                    ' . htmlspecialchars($pd['product_name']) . '
                </a>
            </h5>
            <div class="product-pricing">';

    // Chỉ hiển thị giá cũ nếu hợp lệ (bị gạch ngang)
    if ($gia_cu > 0 && $gia_cu > $gia_moi) {
        echo '<span class="original-price"><del>' . number_format($gia_cu) . 'đ</del></span>';
    }

    // Hiển thị giá mới
    echo '<span class="sale-price">' . number_format($gia_moi) . 'đ</span>';

    // Chỉ hiển thị giảm giá nếu hợp lệ
    if ($giam_gia > 0) {
        echo '<span class="discount">-' . $giam_gia . '%</span>';
    }

    echo '
            </div>
            <a class="buy-now-btn" href="bookApp.php?act=detail_product&id=' . htmlspecialchars($pd['id_product']) . '">
                Mua ngay
            </a>
        </div>
    </div>';
    
    $count++;
}
?>


    <script>
        function startCountdown(duration) {
            let timer = duration, minutes, seconds;
            setInterval(function () {
                minutes = Math.floor(timer / 60);
                seconds = timer % 60;
                document.getElementById("countdown").textContent = minutes + " phút " + seconds + " giây";
                if (--timer < 0) {
                    timer = duration;
                }
            }, 1000);
        }
        startCountdown(3600); // Đếm ngược 1 giờ
    </script>
        <!-- Nút Xem Thêm -->
        <div class="see-more">
            <a href="bookApp.php?act=flash_sale" class="view-more-btn">Xem thêm</a>
        </div>
    </div>
</div>

<style>
.flash-sale-section {
    padding: 20px;
    background: #fff5f5;
    border-radius: 10px;
    text-align: center;
}

.flash-sale-title h2 {
    color: #ff3d00;
    font-size: 28px;
    font-weight: bold;
}

.flash-sale-container {
    display: flex;
    flex-wrap: wrap;
    justify-content: center;
    align-items: flex-start;
    gap: 15px;
}

.flash-sale-item {
    width: 22%;
    background: white;
    padding: 10px;
    border-radius: 10px;
    box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
}

.product-image img {
    width: 100%;
    border-radius: 10px;
}

.product-info h5 {
    font-size: 16px;
    margin: 5px 0;
}

.product-pricing {
    display: flex;
    justify-content: center;
    align-items: center;
    gap: 10px;
}

.original-price {
    text-decoration: line-through;
    color: #999;
}

.sale-price {
    font-size: 18px;
    font-weight: bold;
    color: #ff3d00;
}

.discount {
    background: #ff3d00;
    color: white;
    padding: 2px 6px;
    border-radius: 5px;
    font-size: 14px;
}

.buy-now-btn {
    display: inline-block;
    margin-top: 10px;
    padding: 5px 10px;
    background: #ff3d00;
    color: white;
    text-decoration: none;
    border-radius: 5px;
}

.see-more {
    width: 100%;
    text-align: right;
    margin-top: 10px;
}

.see-more-btn {
    display: inline-block;
    padding: 8px 15px;
    background: #ff3d00;
    color: white;
    font-weight: bold;
    text-decoration: none;
    border-radius: 5px;
}
.original-price {
    display: inline-block !important;
    color: #888;
    text-decoration: line-through;
    margin-right: 5px;
}
.flash-sale-item {
    position: relative; /* Để có thể đặt phần tử con tuyệt đối */
    width: 22%;
    background: white;
    padding: 10px;
    border-radius: 10px;
    box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
}

.discount {
    position: absolute;
    top: 10px;
    left: 10px;
    background: #ff3d00;
    color: white;
    padding: 5px 10px;
    border-radius: 5px;
    font-size: 14px;
    font-weight: bold;
    z-index: 10;
}

</style>


    <!-- Hot Product -->
    <div class="axil-best-seller-product-area bg-color-white axil-section-gap pb--0">
        <div class="container">
            <div class="product-area pb--50">
                <div class="section-title-wrapper">
                    <span class="title-highlighter highlighter-primary">
                        <i class="far fa-shopping-basket"></i>This Month</span>
                    <h2 class="title">Hot products</h2>
                </div>
                <div
                    class="new-arrivals-product-activation-2 slick-layout-wrapper--15 axil-slick-arrow arrow-top-slide product-slide-mobile">
                    <?php
            // var_dump($product);
            $i=0;
            foreach($product as $pd)
            {
              if($pd['view']==1 && $pd['special']==1){
                echo'
                    <div class="slick-single-layout">
                        <div class="axil-product product-style-six">
                            <div class="thumbnail">
                                <a href="bookApp.php?act=detail_product&id='.$pd['id_product'].'">
                                    <img
                                    class="conform-img"
                                    data-sal="fade"
                                    data-sal-delay="100"
                                    data-sal-duration="1500"
                                    src="../uploads/'.$pd['product_img'].'"
                                    alt="Product Images"
                                    />
                                </a>
                            </div>
                            <div class="product-content">
                                <div class="inner">
                                    <div class="product-price-variant">
                                    <span class="price current-price">'.number_format($pd['product_prices']).'đ</span>
                                    </div>
                                        <h5 style="text-align:center" class="title">
                                            <a href="bookApp.php?act=detail_product&id='.$pd['id_product'].'"
                                                >'.$pd['product_name'].'
                                                <span class="verified-icon"
                                                ><i class="fas fa-badge-check"></i></span
                                            ></a>
                                        </h5>
                                        <ul class="cart-action">
                                            <li class="select-option">
                                                <a href="bookApp.php?act=detail_product&id='.$pd['id_product'].'">Buy product</a>
                                            </li>
                                        </ul>
                                </div>
                            </div>
                        </div>
                    </div>
                ';
                $i++;
              }
            }                ?>
                    <!-- End .slick-single-layout -->
                </div>
            </div>
        </div>
    </div>
    <!-- News Product  -->
    <div class="axil-product-area bg-color-white axil-section-gap pb--0">
        <div class="container">
            <div class="product-area pb--20">
                <div class="axil-isotope-wrapper">
                    <div class="product-isotope-heading">
                        <div class="section-title-wrapper">
                            <span class="title-highlighter highlighter-primary"><i class="far fa-shopping-basket"></i>
                                Our New Products</span>
                            <h2 class="title">New Products</h2>
                        </div>
                        <div class="isotope-button">
                            <?php
                    echo'
                    <button data-filter="*" class="is-checked">
                    <span class="filter-text">All</span>
                    </button>';
                    foreach($catalog_use as $catalog){
                      echo'
                      <button data-filter=".'.$catalog['id_catalog_k'].'" class="">
                      <span class="filter-text">'.$catalog['catalog_name'].'</span>
                      </button>
                      ';
                    }
                  ?>
                        </div>
                    </div>
                </div>
                <div class="row row--15 isotope-list">
                    <!-- Start -->
                    <!--  -->
                    <?php
                        $count = 0;
                        foreach($product_use as $result){
                            if($count <8)
                            {
                              if($result['view'] == 1)
                              {
                                echo '                
                                <div class="col-xl-3 col-lg-4 col-sm-6 col-12 mb--30 product '.$result['catalog_id'].'">
                                    <div class="axil-product product-style-one">
                                        <div class="thumbnail">
                                            <a href="bookApp.php?act=detail_product&id='.$pd['id_product'].'">
                                                <img
                                                class="conform-img"
                                                data-sal="fade"
                                                data-sal-delay="100"
                                                data-sal-duration="1500"
                                                src="../uploads/'.$result['product_img'].'"
                                                alt="Product Images"
                                                />
                                            </a>
                                            <div class="product-hover-action">
                                                <ul class="cart-action">
                                                    <li class="select-option">
                                                        <a href="bookApp.php?act=detail_product&id='.$result['id_product'].'">Buy Product</a>
                                                    </li>
                                                </ul>
                                            </div>
                                        </div>
                                        <div class="product-content">
                                            <div class="inner">
                                                <h5 class="title">
                                                    <a href="bookApp.php?act=detail_product&id='.$result['id_product'].'"
                                                        >'.$result['product_name'].'
                                                        <span class="verified-icon"
                                                        ><i class="fas fa-badge-check"></i></span
                                                    ></a>
                                                </h5>
                                                <div class="product-price-variant">
                                                    <span class="price current-price">'.number_format($result['product_prices']).'đ</span>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>';
                                $count++;
                              }
                            }
                        }
                    ?>
                </div>
            </div>
            <!-- <form id="product_'.$count.'" action="index.php?act=add_cart" method="POST">
                                        <input type="hidden" value="'.$result['product_img'].'" name="img">
                                        <input type="hidden" value="'.$result['product_name'].'" name="name">
                                        <input type="hidden" value="'.$result['product_prices'].'" name="price">
                                        <input type="hidden" value="'.$result['id_product'].'" name="id">
                                        <input type="hidden" value="'.$result['size'].'" name="size">
                                    </form> -->
            <!-- <script>
                    function submitNewForm(formIndex) 
                    {
                        var form = document.getElementById('product_' + formIndex);
                        form.submit();
                    }
                </script> -->
        </div>
    </div>
    </div>
    </div>
    </div>
    <!-- End Expolre Product Area  -->
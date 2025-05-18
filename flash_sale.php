<?php
session_start();

// Lấy danh sách sản phẩm
$product = getall_product();

// Lọc sản phẩm flash sale
$flashProducts = array_filter($product, function ($pd) {
    return $pd['flash_sale'] == 1;
});
?>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <title>Flash Sale - The Yenni</title>
    <link rel="stylesheet" href="assets/css/style.css">
    <style>
        .flash-sale-container {
            padding: 30px 0;
        }
        .flash-sale-container .section-title-wrapper {
            text-align: center;
            margin-bottom: 30px;
        }
        .flash-sale-products {
            display: flex;
            flex-wrap: wrap;
            justify-content: center;
            align-items: stretch; /* Giúp các sản phẩm có cùng chiều cao */
        }
        .col-lg-3, .col-md-4, .col-sm-6 {
            padding: 15px;
            display: flex;
        }
        .axil-product.product-style-six {
            position: relative;
            border: 1px solid #ddd;
            padding: 15px;
            background: #fff;
            border-radius: 8px;
            text-align: center;
            display: flex;
            flex-direction: column;
            justify-content: space-between;
            height: 100%;
            width: 100%;
        }
        .thumbnail {
            width: 100%;
            height: 320px;
            overflow: hidden;
            display: flex;
            align-items: center;
            justify-content: center;
        }
        .thumbnail img {
            width: 100%;
            height: 100%;
            object-fit: cover;
            border-radius: 5px;
        }
        .discount-badge {
            position: absolute;
            top: 10px;
            left: 10px;
            background: red;
            color: white;
            padding: 5px 10px;
            font-size: 14px;
            border-radius: 5px;
            font-weight: bold;
        }
        .product-price-variant {
            margin-top: 10px;
        }
        .old-price {
            text-decoration: line-through;
            color: #888;
            margin-right: 8px;
        }
        .sale-price {
            color: red;
            font-weight: bold;
        }
        .buy-now {
            margin-top: auto;
            padding-top: 10px;
        }
        .buy-now a {
            display: inline-block;
            padding: 8px 15px;
            background: red;
            color: #fff;
            border-radius: 5px;
            text-decoration: none;
        }
    </style>
</head>
<body>
    <div class="flash-sale-container">
        <div class="container">
            <div class="section-title-wrapper">
                <h2 class="title">🔥 Giảm Giá Sốc Trong Ngày 🔥</h2>
                <p>Thời gian còn lại: <span id="countdown"></span></p>
            </div>
            <div class="row flash-sale-products">
                <?php
                foreach ($flashProducts as $pd) {
                    $gia_cu = $pd['old_prices'];
                    $gia_moi = $pd['product_prices'];
                    $giam_gia = ($gia_cu > 0) ? round((($gia_cu - $gia_moi) / $gia_cu) * 100) : 0;
                    ?>
                    <div class="col-lg-3 col-md-4 col-sm-6">
                        <div class="axil-product product-style-six">
                            <div class="thumbnail">
                                <a href="bookApp.php?act=detail_product&id=<?= $pd['id_product']; ?>">
                                    <img src="../uploads/<?= $pd['product_img']; ?>" alt="<?= $pd['product_name']; ?>">
                                </a>
                                <span class="discount-badge">-<?= $giam_gia; ?>%</span>
                            </div>
                            <div class="product-content">
                                <h5 class="title">
                                    <a href="bookApp.php?act=detail_product&id=<?= $pd['id_product']; ?>"><?= $pd['product_name']; ?></a>
                                </h5>
                                <div class="product-price-variant">
                                    <span class="old-price"><?= number_format($gia_cu); ?>đ</span>
                                    <span class="sale-price"><?= number_format($gia_moi); ?>đ</span>
                                </div>
                                <div class="buy-now">
                                    <a href="bookApp.php?act=detail_product&id=<?= $pd['id_product']; ?>">Mua ngay</a>
                                </div>
                            </div>
                        </div>
                    </div>
                <?php } ?>
            </div>
        </div>
    </div>

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
        startCountdown(3600);
    </script>
</body>
</html>

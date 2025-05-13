<?php
// Bắt đầu HTML Checkout
ini_set('display_errors', 1);
ini_set('display_startup_errors', 1);
error_reporting(E_ALL);

?>
<div class="axil-checkout-area axil-section-gap">
    <div class="container">
        <div class="row">
            <div class="col-lg-6">
                <div class="axil-checkout-billing">
                    <form action="bookApp.php?act=check_out_update" method="POST">
                        <h4 class="title mb--40">Order details</h4>
                        <div class="row">
                            <div class="col-lg-6">
                                <div class="form-group">
                                    <label>First Name <span>*</span></label>
                                    <input type="text" value="<?= $more_order[0]['fname']; ?>" placeholder="First Name" name="fname">
                                </div>
                            </div>
                            <div class="col-lg-6">
                                <div class="form-group">
                                    <label>Last Name <span>*</span></label>
                                    <input type="text" value="<?= $more_order[0]['lname']; ?>" placeholder="Last Name" name="lname">
                                </div>
                            </div>
                        </div>
                        <div class="form-group">
                            <label>Address <span>*</span></label>
                            <input type="text" value="<?= $more_order[0]['address']; ?>" name="address">
                        </div>
                        <div class="form-group">
                            <label>Phone <span>*</span></label>
                            <input type="tel" value="<?= $more_order[0]['phone']; ?>" name="phone">
                        </div>
                        <div class="form-group">
                            <label>Email Address <span>*</span></label>
                            <input type="email" value="<?= $more_order[0]['email']; ?>" name="email">
                        </div>
                        <div class="form-group">
                            <label>Other Notes (optional)</label>
                            <textarea name="notes" rows="2" placeholder="Notes about your order..."></textarea>
                        </div>
                        <input type="hidden" value="<?= $iddh; ?>" name="iddh">
                    </form>
                </div>
            </div>
            <div class="col-lg-6">
                <div class="axil-order-summery order-checkout-summery">
                    <h5 class="title mb--20">Your Order</h5>
                    <div class="summery-table-wrap">
                        <table class="table summery-table">
                            <thead>
                                <tr>
                                    <th>Product</th>
                                    <th>Subtotal</th>
                                </tr>
                            </thead>
                            <tbody>
                                <?php
                                $total = 0;
                                foreach ($more_cart as $cart) {
                                    if ($iddh == $cart['id_order']) {
                                        echo "<tr>
                                                <td>{$cart['name_pro']} x{$cart['quantity']}</td>
                                                <td>" . number_format($cart['prices']) . "đ</td>
                                            </tr>";
                                    }
                                }
                                foreach ($more_order as $order) {
                                    if ($iddh == $order['id']) {
                                        $total = $order['total_prices'];
                                    }
                                }
                                ?>
                                <tr>
                                    <td>Subtotal</td>
                                    <td><?= number_format($total); ?>đ</td>
                                </tr>
                                <tr>
                                    <td>Shipping</td>
                                    <td>0.00đ</td>
                                </tr>
                                <tr class="order-total">
                                    <td>Total</td>
                                    <td class="order-total-amount"><?= number_format($total); ?>đ</td>
                                </tr>
                            </tbody>
                        </table>
                    </div>

                    <div class="payment-options">
                        <h5 class="title mb--20">Chọn hình thức thanh toán</h5>

                        <!-- Thanh toán MOMO -->
                        <form method="POST" action="xulythanhtoanmomo.php" enctype="application/x-www-form-urlencoded">
                            <input type="hidden" name="total_amount" value="<?= $total; ?>">
                            <button type="submit" name="momo" class="btn btn-danger">Thanh toán MOMO QRcode</button>
                        </form>

                        <!-- Thanh toán VNPay -->
                        <form method="POST" action="xulythanhtoanvnpay.php" enctype="application/x-www-form-urlencoded">
                            <input type="hidden" name="order_id" value="<?= $iddh; ?>">
                            <input type="hidden" name="total_amount" value="<?= $total; ?>">
                            <button type="submit" name="redirect" class="btn btn-success">Thanh toán VNPay</button>
                        </form>

                        <!-- Hoàn tất đơn hàng -->
                        <form action="bookApp.php?act=check_out_update" method="POST">
                            <input type="hidden" name="iddh" value="<?= $iddh; ?>">
                            <input type="hidden" name="total_amount" value="<?= $total; ?>">
                            <button type="submit" name="submit" class="axil-btn btn-bg-primary checkout-btn">Finished</button>
                        </form>

                        <?php
                        if (isset($_POST['submit'])) {
                            $id_order = $_POST['iddh'];
                            $query = "UPDATE orders SET status='completed' WHERE id='$id_order'";
                            mysqli_query($conn, $query);
                            unset($_SESSION['cart']);
                            $query_delete_cart = "DELETE FROM cart WHERE id_order='$id_order'";
                            mysqli_query($conn, $query_delete_cart);
                        }
                        ?>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>


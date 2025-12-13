<?php
// 1. KONEKSI KE DATABASE
$servername = "localhost";
$username = "root";
$password = "";
$dbname = "nike db";

$conn = new mysqli($servername, $username, $password, $dbname);

if ($conn->connect_error) {
    die("Koneksi gagal: " . $conn->connect_error);
}

// 2. QUERY SPESIFIK (Hanya 1 Varian per Produk)
// Penjelasan Query:
// Kita memilih data dari tabel product (p) dan product_detail (pd).
// WHERE pd.ID_PRODUCT_DETAIL = (...) berfungsi untuk memfilter agar kita 
// HANYA mengambil detail dengan ID paling kecil (paling atas) untuk setiap produk.
$sql = "
SELECT
    p.ID_PRODUCT,
    p.PRODUCT_NAME,
    pd.PRODUCT_CATEGORY,
    pd.PRODUCT_LABEL,
    pd.PRODUCT_PRICE,
    pd.PRODUCT_DISCOUNT,
    pd.PRICE_AFTER_DISCOUNT,
    pd.IMAGE_THUMBNAIL_1_PATH_FILE
FROM 
    product p
JOIN 
    product_detail pd ON p.ID_PRODUCT = pd.ID_PRODUCT
WHERE 
    pd.ID_PRODUCT_DETAIL = (
        SELECT MIN(sub_pd.ID_PRODUCT_DETAIL) 
        FROM product_detail sub_pd 
        WHERE sub_pd.ID_PRODUCT = p.ID_PRODUCT
    )
ORDER BY 
    p.ID_PRODUCT ASC;
";

$result = $conn->query($sql);
?>

<!DOCTYPE html>
<html lang="id">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Nike Store</title>
    <style>
        /* CSS SAMA SEPERTI SEBELUMNYA */
        body {
            font-family: "Helvetica Neue", Helvetica, Arial, sans-serif;
            background-color: #ffffff;
            margin: 0;
            padding: 20px;
        }

        h1 {
            margin-bottom: 20px;
            font-weight: bold;
        }

        .product-grid {
            display: grid;
            grid-template-columns: repeat(auto-fill, minmax(300px, 1fr));
            gap: 15px;
        }

        .product-card {
            background: white;
            padding: 0px 0px 20px 0px;
            cursor: pointer;
        }

        .product-image-container {
            width: 100%;
            height: 300px;
            background-color: #f5f5f5;
            display: flex;
            align-items: center;
            justify-content: center;
            margin-bottom: 12px;
        }

        .product-image {
            max-width: 100%;
            max-height: 100%;
            object-fit: contain;
            mix-blend-mode: multiply;
        }

        .product-info {
            text-align: left;
            padding: 0 10px;
            /* Tambahan padding agar teks tidak mepet pinggir */
        }

        .label-recycled {
            color: #9e3500;
            font-weight: 500;
            font-size: 14px;
            margin-bottom: 4px;
            display: block;
        }

        .product-name {
            font-weight: 500;
            font-size: 16px;
            color: #111;
            margin-bottom: 2px;
        }

        .product-category {
            color: #757575;
            font-size: 16px;
            margin-bottom: 12px;
        }

        .price-container {
            font-size: 16px;
            font-weight: 500;
            display: flex;
            align-items: center;
            gap: 8px;
        }

        a {
            text-decoration: none;
            color: inherit;
        }

        .current-price {
            color: #111;
        }

        .original-price {
            color: #757575;
            text-decoration: line-through;
        }

        .discount-text {
            color: #007d48;
        }
    </style>
</head>

<body>

    <h1>All Products</h1>

    <div class="product-grid">
        <?php
        if ($result && $result->num_rows > 0) {
            while ($row = $result->fetch_assoc()) {

                // Ambil Data
                $nama_produk = $row['PRODUCT_NAME'];
                $kategori = $row['PRODUCT_CATEGORY'];
                $label = $row['PRODUCT_LABEL'];
                $gambar_path = $row['IMAGE_THUMBNAIL_1_PATH_FILE'];

                // Formatting Harga
                $harga_asli_fmt = number_format($row['PRODUCT_PRICE'], 0, ',', '.');
                $harga_diskon_fmt = number_format($row['PRICE_AFTER_DISCOUNT'], 0, ',', '.');

                // Hitung Persen Diskon
                $persen_diskon = 0;
                if ($row['PRODUCT_DISCOUNT'] > 0) {
                    $persen_diskon = round($row['PRODUCT_DISCOUNT'] * 100);
                }

                // TAMPILKAN HTML
                echo '<a href="product_detail.php?id=' . htmlspecialchars($row['ID_PRODUCT']) . '">';
                echo '<div class="product-card">';

                // Gambar
                echo '<div class="product-image-container">';
                echo '<img src="' . htmlspecialchars($gambar_path) . '" alt="' . htmlspecialchars($nama_produk) . '" class="product-image">';
                echo '</div>';

                echo '<div class="product-info">';

                // Label
                if (!empty($label)) {
                    echo '<span class="label-recycled">' . htmlspecialchars($label) . '</span>';
                } else {
                    echo '<div style="height: 20px;"></div>';
                }

                // Nama & Kategori
                echo '<div class="product-name">' . htmlspecialchars($nama_produk) . '</div>';
                echo '<div class="product-category">' . htmlspecialchars($kategori) . '</div>';

                // Harga
                echo '<div class="price-container">';
                if ($persen_diskon > 0) {
                    // Ada Diskon
                    echo '<span class="current-price">Rp ' . $harga_diskon_fmt . '</span>';
                    echo '<span class="original-price">Rp ' . $harga_asli_fmt . '</span>';
                    echo '<span class="discount-text">' . $persen_diskon . '% off</span>';
                } else {
                    // Tidak Ada Diskon
                    echo '<span class="current-price">Rp ' . $harga_asli_fmt . '</span>';
                }
                echo '</div>'; // end price-container

                echo '</div>'; // end product-info
                echo '</div>'; // end product-card
                echo '</a>';
            }
        } else {
            echo "<p>Tidak ada produk yang ditemukan.</p>";
        }

        ?>
    </div>

    <?php $conn->close(); ?>

</body>

</html>
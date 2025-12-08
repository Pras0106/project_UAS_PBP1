<?php
// 1. KONEKSI KE DATABASE
// ... (Bagian koneksi tetap sama) ...
$servername = "localhost";
$username = "root";
$password = "";
$dbname = "nike db";

$conn = new mysqli($servername, $username, $password, $dbname);

if ($conn->connect_error) {
    die("Koneksi gagal: " . $conn->connect_error);
}

// 2. AMBIL ID PRODUK DARI URL
$product_id = isset($_GET['id']) ? (int)$_GET['id'] : die("Product ID tidak ditemukan.");

// 3. QUERY DATA PRODUK UTAMA (product)
// ... (Query utama tetap sama) ...
$sql_main = "SELECT PRODUCT_NAME, PRODUCT_DESCRIPTION, PRODUCT_BENEFITS
             FROM product WHERE ID_PRODUCT = ?";
$stmt_main = $conn->prepare($sql_main);
$stmt_main->bind_param("i", $product_id);
$stmt_main->execute();
$result_main = $stmt_main->get_result();
$main_product = $result_main->fetch_assoc();
$stmt_main->close();

if (!$main_product) {
    die("Produk tidak ditemukan.");
}

// 4. QUERY SEMUA VARIAN PRODUK (product_detail)
// ... (Query varian tetap sama) ...
$sql_variants = "SELECT ID_PRODUCT_DETAIL, PRODUCT_LABEL, PRODUCT_PRICE, PRODUCT_DISCOUNT, PRICE_AFTER_DISCOUNT, COLOR_SHOWN, PRODUCT_STYLE, PRODUCT_COUNTRY_ORIGIN, IMAGE_THUMBNAIL_1_PATH_FILE, IMAGE_THUMBNAIL_2_PATHFILE, IMAGE_THUMBNAIL_3_PATH_FILE, IMAGE_THUMBNAIL_4_PATH_FILE, PRODUCT_CATEGORY FROM product_detail WHERE ID_PRODUCT = ? ORDER BY ID_PRODUCT_DETAIL ASC";
$stmt_variants = $conn->prepare($sql_variants);
$stmt_variants->bind_param("i", $product_id);
$stmt_variants->execute();
$result_variants = $stmt_variants->get_result();
$variants_data = [];
while ($row = $result_variants->fetch_assoc()) {
    // 4b. Ambil ID_PRODUCT_DETAIL untuk digunakan dalam query ukuran selanjutnya
    $detail_id = $row['ID_PRODUCT_DETAIL'];
    
    // 5. QUERY DATA UKURAN (product_size___stock) untuk SETIAP VARIAN
    $sql_sizes_for_variant = "SELECT * FROM product_size___stock WHERE ID_PRODUCT_DETAIL = ?";
    $stmt_sizes_for_variant = $conn->prepare($sql_sizes_for_variant);
    $stmt_sizes_for_variant->bind_param("i", $detail_id);
    $stmt_sizes_for_variant->execute();
    $result_sizes_for_variant = $stmt_sizes_for_variant->get_result();
    $sizes_data_for_variant = $result_sizes_for_variant->fetch_assoc();
    $stmt_sizes_for_variant->close();
    
    // Tambahkan data ukuran ke dalam array varian
    $row['size_stock'] = $sizes_data_for_variant ?: [];
    
    $variants_data[] = $row;
}
$stmt_variants->close(); // Tutup statement varian utama

if (empty($variants_data)) {
    die("Varian produk tidak ditemukan.");
}

// Gantikan bagian ini dengan varian pertama dari array baru yang berisi data ukuran
$default_variant = $variants_data[0]; 

// 5. QUERY DATA UKURAN (product_size___stock)
// ... (Kode query ukuran tetap sama) ...
$default_detail_id = $default_variant['ID_PRODUCT_DETAIL'];
$sql_sizes = "SELECT * FROM product_size___stock WHERE ID_PRODUCT_DETAIL = ?";
$stmt_sizes = $conn->prepare($sql_sizes);
$stmt_sizes->bind_param("i", $default_detail_id);
$stmt_sizes->execute();
$result_sizes = $stmt_sizes->get_result();
$sizes_data = $result_sizes->fetch_assoc();
$stmt_sizes->close();

// Tutup koneksi
$conn->close();


// 6. PERSIAPAN DATA UNTUK HTML & JAVASCRIPT

// a. Data Ukuran (Buttons)
// ... (Kode data ukuran tetap sama) ...
$db_size_columns = [
    'SIZE_9_1_CM' => '9.1 cm', 'SIZE_9_5_CM' => '9.5 cm', 'SIZE_10_CM' => '10 cm', 'SIZE_10_4_CM' => '10.4 cm',
    'SIZE_10_8_CM' => '10.8 cm', 'SIZE_11_2_CM' => '11.2 cm', 'SIZE_11_6_CM' => '11.6 cm', 'SIZE_12_CM' => '12 cm',
    'SIZE_12_5_CM' => '12.5 cm', 'SIZE_13_CM' => '13 cm', 'SIZE_13_3_CM' => '13.3 cm', 'SIZE_14_2_CM' => '14.2 cm',
    'SIZE_14_6_CM' => '14.6 cm', 'SIZE_15_CM' => '15 cm', 'SIZE_15_5_CM' => '15.5 cm', 'SIZE_15_9_CM' => '15.9 cm',
    'SIZE_16_3_CM' => '16.3 cm', 'SIZE_16_7_CM' => '16.7 cm', 'SIZE_17_2_CM' => '17.2 cm', 'SIZE_17_6_CM' => '17.6 cm',
    'SIZE_18_CM' => '18 cm', 'SIZE_18_4_CM' => '18.4 cm', 'SIZE_18_8_CM' => '18.8 cm', 'SIZE_19_3_CM' => '19.3 cm',
    'SIZE_19_7_CM' => '19.7 cm', 'SIZE_20_1_CM' => '20.1 cm', 'SIZE_20_5_CM' => '20.5 cm', 'SIZE_20_9_CM' => '20.9 cm',
    'SIZE_21_4_CM' => '21.4 cm', 'SIZE_21_8_CM' => '21.8 cm', 'SIZE_22_2_CM' => '22.2 cm', 'SIZE_22_4_CM' => '22.4 cm',
    'SIZE_22_7_CM' => '22.7 cm', 'SIZE_23_2_CM' => '23.2 cm', 'SIZE_23_5_CM' => '23.5 cm', 'SIZE_23_8_CM' => '23.8 cm',
    'SIZE_24_6_CM' => '24.6 cm', 'SIZE_25_CM' => '25 cm', 'SIZE_25_4_CM' => '25.4 cm', 'SIZE_25_8_CM' => '25.8 cm',
    'SIZE_26_2_CM' => '26.2 cm', 'SIZE_26_7_CM' => '26.7 cm', 
    'SIZE_27_1_CM' => '27.1 cm', // Perbaikan dari IZE_27_1_CM
    'SIZE_27_5_CM' => '27.5 cm', 'SIZE_27_9_CM' => '27.9 cm', 'SIZE_28_3_CM' => '28.3 cm', 'SIZE_28_8_CM' => '28.8 cm', 
    'SIZE_29_2_CM' => '29.2 cm', 'SIZE_29_6_CM' => '29.6 cm', 'SIZE_30_CM' => '30 cm', 'SIZE_30_5_CM' => '30.5 cm', 
    'SIZE_30_9_CM' => '30.9 cm', 'SIZE_31_3_CM' => '31.3 cm', 'SIZE_31_7_CM' => '31.7 cm', 'SIZE_32_2_CM' => '32.2 cm', 
    'SIZE_32_6_CM' => '32.6 cm', 'SIZE_33_CM' => '33 cm', 'SIZE_33_4_CM' => '33.4 cm', 'SIZE_33_9_CM' => '33.9 cm', 
    'SIZE_34_3_CM' => '34.3 cm', 
    'SIZE_34_7_CM' => '34.7 cm', // Perbaikan dari SIZE_34_7
    'SIZE_35_1_CM' => '35.1 cm', 'SIZE_35_5_CM' => '35.5 cm', 
    'SIZE_36_0_CM' => '36 cm', // Perubahan nama kolom di input
    'SIZE_36_4_CM' => '36.4 cm', 'SIZE_36_8_CM' => '36.8 cm', 'SIZE_37_2_CM' => '37.2 cm'
];

// Ganti logika pembuatan tombol ukuran Awal (default_variant) dengan yang baru:
$size_buttons_html = renderSizeButtons($default_variant['size_stock'], $db_size_columns);
$first_size = true;
if ($sizes_data) {
    foreach ($db_size_columns as $db_col => $size_display) {
        // Cek apakah kolom ada dan nilainya tidak kosong (misal: ada stok atau ukurannya tersedia)
        if (isset($sizes_data[$db_col]) && !empty($sizes_data[$db_col])) {
            $selected_class = $first_size ? ' bg-black text-white' : '';
            $size_buttons_html .= '<button class="border py-2 rounded hover:bg-gray-100' . $selected_class . '">' . htmlspecialchars($size_display) . '</button>';
            $first_size = false;
        }
    }
}

// b. Product Benefits (List)
// ... (Kode benefit tetap sama) ...
$benefits_list = [];
if (isset($main_product['PRODUCT_BENEFITS']) && $main_product['PRODUCT_BENEFITS']) {
    // Pisahkan berdasarkan titik (.), filter string kosong, dan hilangkan spasi di awal/akhir
    $benefits_list = array_filter(array_map('trim', explode('.', $main_product['PRODUCT_BENEFITS'])), 'strlen');
}

$benefits_html = '';
foreach ($benefits_list as $benefit) {
    // Tambahkan titik kembali di akhir setiap item
    $benefits_html .= '<li>' . htmlspecialchars($benefit) . '.</li>';
}

// c. Varian Produk untuk JavaScript (JSON)
$js_variants = [];
foreach ($variants_data as $v) {
    // Kumpulkan semua path thumbnail...
    $thumbnails = [];
    if (!empty($v['IMAGE_THUMBNAIL_2_PATHFILE'])) $thumbnails[] = $v['IMAGE_THUMBNAIL_2_PATHFILE'];
    if (!empty($v['IMAGE_THUMBNAIL_3_PATH_FILE'])) $thumbnails[] = $v['IMAGE_THUMBNAIL_3_PATH_FILE'];
    if (!empty($v['IMAGE_THUMBNAIL_4_PATH_FILE'])) $thumbnails[] = $v['IMAGE_THUMBNAIL_4_PATH_FILE'];

    // Data Harga & Diskon...

    $p_after = $v['PRICE_AFTER_DISCOUNT'];
    $p_orig = $v['PRODUCT_PRICE'];
    $p_disc = $v['PRODUCT_DISCOUNT'];

    $has_discount = ($p_disc > 0) || ($p_orig > $p_after);
    $display_discount_percent = round($p_disc * 100); 

    // MODIFIKASI BAGIAN INI UNTUK DATA JS
    $js_variants[] = [
        'id' => (int)$v['ID_PRODUCT_DETAIL'],
        // ... (Data visual & harga lainnya)
        'image' => htmlspecialchars($v['IMAGE_THUMBNAIL_1_PATH_FILE']),
        'thumbnails' => $thumbnails,
        'has_discount' => $has_discount,
        'price_formatted' => 'Rp ' . number_format($p_after, 0, ',', '.'),
        'original_formatted' => 'Rp ' . number_format($p_orig, 0, ',', '.'),
        'discount_formatted' => $display_discount_percent . '% off',
        'label' => html_entity_decode($v['PRODUCT_LABEL']),
        'category' => html_entity_decode($v['PRODUCT_CATEGORY']),
        'colorShown' => htmlspecialchars($v['COLOR_SHOWN']),
        'style' => htmlspecialchars($v['PRODUCT_STYLE']),
        'origin' => htmlspecialchars($v['PRODUCT_COUNTRY_ORIGIN']),
        'colorPreview' => htmlspecialchars($v['IMAGE_THUMBNAIL_1_PATH_FILE']),
        
        // <<< TAMBAHAN PENTING: Kirim data ukuran ke JS >>>
        'sizes_data' => $v['size_stock']
        // <<< END TAMBAHAN PENTING >>>
    ];
}

$js_variants_json = json_encode($js_variants, JSON_UNESCAPED_SLASHES);

// Tutup koneksi di akhir
$conn->close();

function renderSizeButtons($sizes_data, $db_size_columns, $first_size_selected = true) {
    $html = '';
    $first_size = $first_size_selected;
    
    // Jika data ukuran kosong atau tidak valid, tampilkan tombol default 'EU-40' yang dicoret sebagai contoh
    if (!$sizes_data || empty($sizes_data)) {
        // Contoh tombol yang dicoret (sesuai permintaan gambar)
        // Kita gunakan class `unavailable` untuk penanda di JS
        $html .= '<button class="border py-2 rounded text-gray-400 line-through unavailable" disabled>EU-40</button>';
        return $html;
    }
    
    foreach ($db_size_columns as $db_col => $size_display) {
        $stock_value = isset($sizes_data[$db_col]) ? $sizes_data[$db_col] : null;

        if ($stock_value !== null && $stock_value !== '' && $stock_value > 0) {
            // Ukuran tersedia
            $selected_class = $first_size ? ' bg-black text-white selected-size' : '';
            $html .= '<button data-size="' . htmlspecialchars($size_display) . '" class="border py-2 rounded hover:bg-gray-100' . $selected_class . '">' . htmlspecialchars($size_display) . '</button>';
            $first_size = false;
        } else {
            // Ukuran tidak tersedia (Value kosong atau 0)
            // Tampilan: dicoret, text-gray-400, dan disabled
            $html .= '<button data-size="' . htmlspecialchars($size_display) . '" class="border py-2 rounded text-gray-400 line-through unavailable" disabled>' . htmlspecialchars($size_display) . '</button>';
        }
    }
    return $html;
}

// Tambahkan definisi fungsi renderSizeButtons_js ke dalam data JS untuk digunakan dalam JS
$js_size_map_json = json_encode($db_size_columns, JSON_UNESCAPED_SLASHES);

// d. Inisialisasi Thumbnail Awal (Selain main image)
// ... (Kode inisialisasi thumbnail tetap sama) ...
$initial_thumbnails_html = '';
// Varian pertama (default_variant) sudah diambil di awal
if (!empty($default_variant['IMAGE_THUMBNAIL_2_PATHFILE'])) {
    $initial_thumbnails_html .= '<img src="' . htmlspecialchars($default_variant['IMAGE_THUMBNAIL_2_PATHFILE']) . '" class="bg-gray-200 w-20 rounded cursor-pointer border hover:opacity-70" onclick="document.getElementById(\'mainImage\').src=\'' . htmlspecialchars($default_variant['IMAGE_THUMBNAIL_2_PATHFILE']) . '\'">';
}
if (!empty($default_variant['IMAGE_THUMBNAIL_3_PATH_FILE'])) {
    $initial_thumbnails_html .= '<img src="' . htmlspecialchars($default_variant['IMAGE_THUMBNAIL_3_PATH_FILE']) . '" class="bg-gray-200 w-20 rounded cursor-pointer border hover:opacity-70" onclick="document.getElementById(\'mainImage\').src=\'' . htmlspecialchars($default_variant['IMAGE_THUMBNAIL_3_PATH_FILE']) . '\'">';
}
if (!empty($default_variant['IMAGE_THUMBNAIL_4_PATH_FILE'])) {
    $initial_thumbnails_html .= '<img src="' . htmlspecialchars($default_variant['IMAGE_THUMBNAIL_4_PATH_FILE']) . '" class="bg-gray-200 w-20 rounded cursor-pointer border hover:opacity-70" onclick="document.getElementById(\'mainImage\').src=\'' . htmlspecialchars($default_variant['IMAGE_THUMBNAIL_4_PATH_FILE']) . '\'">';
}

// e. Formatting Harga & Logic Tampilan Awal (PERBAIKAN LOGIC)
$price_after = $default_variant['PRICE_AFTER_DISCOUNT'];
$price_original = $default_variant['PRODUCT_PRICE'];
$val_discount = $default_variant['PRODUCT_DISCOUNT'];

$fmt_price = 'Rp ' . number_format($price_after, 0, ',', '.');
$fmt_original = 'Rp ' . number_format($price_original, 0, ',', '.');

// LOGIC BARU: Tampilkan coretan jika ada Diskon (Persen > 0) ATAU (Harga Asli > Harga Akhir)
// Ini memastikan jika admin lupa isi persen tapi harga diturunkan, coretan tetap muncul.
$show_discount = ($val_discount > 0) || ($price_original > $price_after);

$display_discount_percent = round($val_discount * 100);

$display_price_html = '';

if ($show_discount) {
    // TAMPILAN DISKON (Harga Akhir + Harga Coret + Persen)
    $display_price_html = '
    <span class="text-xl font-medium" id="displayPrice">' . $fmt_price . '</span>
    <span class="text-gray-500 line-through text-base ml-2" id="displayOriginal">' . $fmt_original . '</span>
    <span class="text-green-700 font-medium ml-2" id="displayDiscount">' . $display_discount_percent . '% off</span>
    ';
} else {
    // TAMPILAN NORMAL (Hanya Harga Akhir) - Elemen lain disembunyikan (hidden)
    $display_price_html = '
        <span class="text-xl font-medium" id="displayPrice">' . $fmt_price . '</span>
        <span class="text-gray-500 line-through text-base ml-2 hidden" id="displayOriginal">Rp 0</span>
        <span class="text-green-700 font-medium ml-2 hidden" id="displayDiscount">0% off</span>
    ';
}

?>

<!DOCTYPE html>
<html lang="id">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <script src="https://cdn.tailwindcss.com"></script>
    <title><?php echo htmlspecialchars($main_product['PRODUCT_NAME']); ?></title>
</head>

<body class="bg-white text-gray-900">

    <div class="max-w-7xl mx-auto p-6 grid grid-cols-1 md:grid-cols-2 gap-10">

        <div>
            <img id="mainImage" src="<?php echo htmlspecialchars($default_variant['IMAGE_THUMBNAIL_1_PATH_FILE']); ?>"
                class="bg-gray-100 w-full rounded-xl shadow">
            <div class="flex gap-3 mt-3" id="thumbnailContainer">
                <?php echo $initial_thumbnails_html; ?>
            </div>
        </div>

        <div>
            <p class="text-red-600 text-base font-semibold <?php echo empty($default_variant['PRODUCT_LABEL']) ? 'hidden' : ''; ?>" id="productLabel">
                <?php echo html_entity_decode($default_variant['PRODUCT_LABEL']); ?>
            </p>

            <h1 class="text-3xl font-bold"><?php echo htmlspecialchars($main_product['PRODUCT_NAME']); ?></h1>
            <p class="text-gray-600" id="productCategory"><?php echo html_entity_decode($default_variant['PRODUCT_CATEGORY']); ?></p>

            <div class="flex items-center gap-3 mt-2" id="priceContainer">
                <?php echo $display_price_html; ?>
            </div>
            <p class="mt-4 font-semibold">Select Colour</p>
            <div class="flex gap-4 mt-2" id="colorOptions"></div>

            <p class="mt-4 font-semibold">Select Size</p>
            <div class="grid grid-cols-6 gap-2 mt-2" id="sizeOptions">
                <?php
                if (!empty($size_buttons_html)) {
                    echo $size_buttons_html;
                } else {
                    // Fallback jika data ukuran tidak ditemukan atau kosong (menggunakan struktur default)
                    echo '<button class="border py-2 rounded hover:bg-gray-100 bg-black text-white"></button>';
                    echo '<button class="border py-2 rounded hover:bg-gray-100">S</button>';
                    echo '<button class="border py-2 rounded hover:bg-gray-100">M</button>';
                    // ... tambahkan button fallback lainnya jika diperlukan
                }
                ?>
            </div>

            <div class="flex gap-4 mt-6">
                <button class="w-full bg-black text-white py-3 rounded-full font-semibold">Add to Bag</button>
                <button id="favBtn" class="bg-gray-200 border py-3 px-6 rounded-full">Favourite ♡</button>
            </div>

            <div class="mt-10">
                <h2 class="font-bold text-lg">Product Description</h2>
                <p><?php echo nl2br(htmlspecialchars($main_product['PRODUCT_DESCRIPTION'])); ?></p>

                <br>

                <h2 class="font-bold text-lg">Product Details</h2>
                <ul class="list-disc ml-5 mt-2 text-sm">
                    <li id="colorShown">Colour Shown: <?php echo htmlspecialchars($default_variant['COLOR_SHOWN']); ?></li>
                    <li id="styleCode">Style: <?php echo htmlspecialchars($default_variant['PRODUCT_STYLE']); ?></li>
                    <li id="country">Country/Region of Origin: <?php echo htmlspecialchars($default_variant['PRODUCT_COUNTRY_ORIGIN']); ?></li>
                </ul>
                <br>
                <h2 class="font-bold text-lg">Benefits</h2>
                <ul class="list-disc ml-5 mt-2 text-sm">
                    <?php echo $benefits_html; ?>
                </ul>
            </div>

        </div>

    </div>

    <div class="max-w-7xl mx-auto px-6 mt-20">
        <h2 class="text-2xl font-bold mb-4">You Might Also Like</h2>

        <div class="relative">
            <button id="scrollLeft"
                class="absolute left-0 top-1/2 transform -translate-y-1/2 bg-white p-3 rounded-full shadow z-10">
                &lt;
            </button>

            <div id="recommendScroll" class="flex gap-6 overflow-x-auto scroll-smooth pb-4">
            </div>

            <button id="scrollRight"
                class="absolute right-0 top-1/2 transform -translate-y-1/2 bg-white p-3 rounded-full shadow z-10">
                &gt;
            </button>
        </div>
    </div>

    <script>
        // Data Varian Produk (dibuat oleh PHP)
        const variants = <?php echo $js_variants_json; ?>;

        // RENDER COLOR OPTIONS
        const colorContainer = document.getElementById("colorOptions");
        variants.forEach(v => {
            const div = document.createElement("div");
            // Menambahkan border-black untuk varian default
            const isDefault = v.id === variants[0].id; 
            div.className = `bg-gray-200 border p-1 rounded cursor-pointer hover:opacity-70 ${isDefault ? 'border-2 border-black' : ''}`;
            div.innerHTML = `<img src="${v.colorPreview}" class="w-20 h-16 object-cover rounded">`;
            div.onclick = () => updateProduct(v);
            colorContainer.appendChild(div);
        });

        // UPDATE PRODUCT WHEN COLOR SELECTED
        function updateProduct(v) {
            document.getElementById("mainImage").src = v.image;

            // 1. UPDATE LABEL (Kategori)
            const productLabelEl = document.getElementById("productLabel");

            productLabelEl.innerText = v.label;

            if (v.label && v.label.trim() !== '') {
                productLabelEl.classList.remove('hidden');
            } else {
                productLabelEl.classList.add('hidden');
            }

            document.getElementById("productCategory").innerText = v.category;

            // 2. UPDATE HARGA & DISKON
            const elPrice = document.getElementById("displayPrice");
            const elOriginal = document.getElementById("displayOriginal");
            const elDiscount = document.getElementById("displayDiscount");

            // Selalu update harga utama
            elPrice.innerText = v.price_formatted;

            // Cek status diskon dari data PHP
            if (v.has_discount) {
                // Tampilkan coretan dan persen
                elOriginal.innerText = v.original_formatted;
                elDiscount.innerText = v.discount_formatted;
                
                elOriginal.classList.remove("hidden");
                elDiscount.classList.remove("hidden");
                // Ubah warna harga utama jadi merah (opsional, seperti ecommerce umumnya)
                // elPrice.classList.add("text-red-600"); 
            } else {
                // Sembunyikan coretan dan persen
                elOriginal.classList.add("hidden");
                elDiscount.classList.add("hidden");
            }

            // 3. Update Detail Text
            document.getElementById("colorShown").innerHTML = "Colour Shown: " + v.colorShown;
            document.getElementById("styleCode").innerHTML = "Style: " + v.style;
            document.getElementById("country").innerHTML = "Country/Region of Origin: " + v.origin;

            // 4. Rebuild Thumbnails (Kode Thumbnail tetap sama seperti sebelumnya...)
            const thumb = document.getElementById("thumbnailContainer");
            thumb.innerHTML = "";
            
            const mainImageThumb = document.createElement("img");
            mainImageThumb.src = v.image;
            mainImageThumb.className = "bg-gray-200 w-20 rounded cursor-pointer border-2 border-black"; 
            mainImageThumb.onclick = () => document.getElementById("mainImage").src = v.image;
            thumb.appendChild(mainImageThumb);

            v.thumbnails.forEach(t => {
                const img = document.createElement("img");
                img.src = t;
                img.className = "bg-gray-200 w-20 rounded cursor-pointer border hover:opacity-70";
                img.onclick = () => document.getElementById("mainImage").src = t;
                thumb.appendChild(img);
            });
            
            // 5. Highlight Pilihan Warna
            document.querySelectorAll('#colorOptions > div').forEach((div, index) => {
                if (variants[index].id === v.id) {
                    div.classList.add('border-2', 'border-black');
                } else {
                    div.classList.remove('border-2', 'border-black');
                }
            });

            // 6. RENDER ULANG UKURAN (Tambahkan ini)
            updateSizeOptions(v.sizes_data);
        }

        // INIT FIRST COLOR: Panggil updateProduct dengan varian pertama saat load untuk merender ulang thumbnail dan memastikan border di color option serta harga awal yang lengkap.
        // Dengan Perbaikan 2, ini juga memastikan harga dan label diskon yang disembunyikan jika tidak ada diskon.
        updateProduct(variants[0]);
        
        // ... (Kode untuk RECOMMENDATION PRODUCTS, scroll buttons, dan favourite button tetap sama) ...
        const recommendations = [
            { img: "../image/NIKE+SB+PS8 (1).png", name: "Nike SB PS8", type: "Men's Shoes", price: "Rp 1.909.000", page: "../product/Nike_SB_PS8.html" },
            { img: "../image/sb-blazer-low-pro-gt-shoes-ZpVNV6.jpeg", name: "Nike SB Blazer Low Pro GT", type: "Men's Shoes", price: "Rp 959.000", page: "../product/Nike_SB_Blazer_Low_Pro_GT.html" },
            { img: "../image/sb-malor-te-shoes-dFgpng.jpeg", name: "Nike SB Malor TE", type: "Men's Shoes", price: "Rp 1.149.000", page: "../product/Nike_SB_Malor_TE.html" },
            { img: "../image/kobe-9-low-basketball-shoes-Up4tSTpB.jpeg", name: "Kobe 9 Low", type: "Basketball Shoes", price: "Rp 2.849.000", page: "../product/Kobe_9_Low.html" },
            { img: "../image/sb-dunk-low-pro-skate-shoes-hTqg2m.jpeg", name: "Nike SB Dunk Low Pro", type: "Skate Shoes", price: "Rp 1.378.000", page: "../product/Nike_SB_Dunk_Low_Pro.html" },
            { img: "../image/sb-janoski-slip-skate-shoes-BxN7w6.jpeg", name: "Nike SB Janoski+ Slip", type: "Skate Shoes", price: "Rp 1.299.000", page: "../product/Nike_SB_Janoski+_Slip.html" },
            { img: "../image/sb-malor-shoes-BZKPwR.jpeg", name: "Nike SB Malor", type: "Men's Shoes", price: "Rp 1.149.000", page: "../product/Nike_SB_Malor.html" },
            { img: "../image/juniper-trail-2-gore-tex-waterproof-trail-running-shoes-61f57n.jpeg", name: "Nike Juniper Trail 2 GORE-TEX", type: "Men's Waterproof Trail-Running Shoes", price: "Rp 1.859.000", page: "../product/Nike_Juniper_Trail_2_GORE-TEX.html" }
        ];

        const recScroll = document.getElementById("recommendScroll");

        recommendations.forEach(r => {
            const card = document.createElement("div");
            card.className = "min-w-[250px] border rounded-xl p-3 shadow-sm bg-white";
            card.innerHTML = `
                <a href="${r.page}">
                <img src="${r.img}" class="w-full rounded-lg bg-gray-200">
                <p class="font-bold mt-2">${r.name}</p>
                <p class="mt-2">${r.type}</p>
                <p class="text-gray-600">${r.price}</p>
                </a>
            `;
            recScroll.appendChild(card);
        });

        // SCROLL BUTTONS
        document.getElementById("scrollRight").onclick = () => {
            recScroll.scrollBy({ left: 300, behavior: "smooth" });
        };
        document.getElementById("scrollLeft").onclick = () => {
            recScroll.scrollBy({ left: -300, behavior: "smooth" });
        };

        // FAVOURITE BUTTON TOGGLE
        const favBtn = document.getElementById("favBtn");
        let isFav = false;

        favBtn.onclick = () => {
            isFav = !isFav;

            if (isFav) {
                favBtn.innerHTML = "Favourite <span style='color:red'>♥</span>";
            } else {
                favBtn.innerHTML = "Favourite ♡";
            }
        };

        // SIZE BUTTON SELECTOR (Sama seperti sebelumnya)
        const sizeButtons = document.querySelectorAll("#sizeOptions button");

        sizeButtons.forEach(btn => {
            btn.addEventListener("click", () => {
                // Reset semua tombol
                sizeButtons.forEach(b => {
                    b.classList.remove("bg-black", "text-white");
                });

                // Aktifkan tombol yang dipilih
                btn.classList.add("bg-black", "text-white");
            });
        });

    </script>

</body>

</html>
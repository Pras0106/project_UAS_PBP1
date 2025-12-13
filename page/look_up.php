<?php
session_start();
$servername = "localhost";
$username = "root";
$password = "";
$dbname = "nike db";

$conn = new mysqli($servername, $username, $password, $dbname);

if ($conn->connect_error) {
    die("Koneksi gagal: " . $conn->connect_error);
}

// Proses form ketika submit
$message = "";
$messageType = "";

if ($_SERVER["REQUEST_METHOD"] == "POST" && isset($_POST['register'])) {

    // Generate kode unik
    do {
        $confirmationCode = str_pad(random_int(0, 99999999), 8, '0', STR_PAD_LEFT);

        $check = $conn->prepare("SELECT COUNT(*) FROM user WHERE CODE_CONFIRMATION = ?");
        $check->bind_param("s", $confirmationCode);
        $check->execute();
        $check->bind_result($count);
        $check->fetch();
        $check->close();
    } while ($count > 0);

    // Insert hanya CODE_CONFIRMATION saja
    $stmt = $conn->prepare("INSERT INTO user (CODE_CONFIRMATION) VALUES (?)");
    $stmt->bind_param("s", $confirmationCode);

    if ($stmt->execute()) {

        $_SESSION['user_id'] = $conn->insert_id;
        $_SESSION['code'] = $confirmationCode;

        header("Location: ../page/create_account.php");
        exit;
    } else {
        $message = "Error inserting code: " . $stmt->error;
        $messageType = "error";
    }

    $stmt->close();
}


$conn->close();
?>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Welcome to Nike Sign-In</title>
    <script src="https://cdn.tailwindcss.com"></script>

    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: Arial, sans-serif;
        }

        body,
        html {
            width: 100%;
            min-height: 100%;
            overflow-y: auto;
            /* <-- allow scroll */
            background: #000;
        }

        /* Spline background */
        .bg-spline {
            position: fixed;
            inset: 0;
            width: 100%;
            height: 100%;
            z-index: 0;
        }

        .bg-spline iframe {
            width: 100%;
            height: 100%;
            border: none;
            pointer-events: none;
        }

        /* SECTION WRAPPER */
        .section {
            position: relative;
            width: 100%;
            min-height: 100vh;
            /* Fullscreen height */
            display: flex;
            justify-content: flex-start;
            align-items: center;
            padding-left: 40px;
            padding-top: 120px;
            z-index: 10;
            pointer-events: none;
        }

        /* Form Box */
        .register-box {
            width: 380px;
            background: #fff;
            padding: 35px;
            border-radius: 12px;
            box-shadow: 0 8px 20px rgba(0, 0, 0, 0.15);
            position: absolute;
            z-index: 20;
            cursor: move;
            pointer-events: auto;
        }

        .input-line {
            width: 100%;
            padding: 14px 10px;
            border: 1px solid #ddd;
            border-radius: 8px;
            font-size: 15px;
            margin-bottom: 15px;
        }

        .input-underline {
            width: 100%;
            padding: 10px 0;
            font-size: 15px;
            border: none;
            border-bottom: 1px solid #ccc;
            outline: none;
        }

        .input-underline:focus {
            border-bottom: 1px solid black;
        }


        .btn-create {
            width: 100%;
            background: #e53935;
            color: white;
            padding: 14px;
            border-radius: 8px;
            font-weight: bold;
            border: none;
            cursor: pointer;
            margin-bottom: 18px;
        }

        .btn-create:hover {
            background: #c62828;
        }

        .btn-google {
            width: 100%;
            border: 1px solid #ccc;
            padding: 14px;
            border-radius: 8px;
            display: flex;
            align-items: center;
            justify-content: center;
            gap: 10px;
            cursor: pointer;
            background: white;
        }

        .btn-google:hover {
            background: #f5f5f5;
        }

        .google-icon {
            width: 20px;
        }

        .alert {
            padding: 12px;
            border-radius: 8px;
            margin-bottom: 15px;
            text-align: center;
            font-size: 14px;
        }

        .alert-success {
            background: #d4edda;
            color: #155724;
            border: 1px solid #c3e6cb;
        }

        .alert-error {
            background: #f8d7da;
            color: #721c24;
            border: 1px solid #f5c6cb;
        }

        /* FOOTER (NOT FIXED) */
        footer {
            width: 100%;
            background: #000;
            color: #fff;
            padding: 60px 80px 30px;
            z-index: 20;
            position: relative;
        }

        .footer-container {
            display: flex;
            justify-content: space-between;
            flex-wrap: wrap;
        }

        .footer-box h3 {
            font-size: 18px;
            margin-bottom: 14px;
        }

        .footer-box p,
        .footer-box a {
            font-size: 14px;
            line-height: 1.8;
            color: #ccc;
            text-decoration: none;
        }

        .footer-box a:hover {
            color: white;
        }

        .footer-input {
            margin-top: 10px;
            display: flex;
            align-items: center;
            border: 1px solid #777;
            border-radius: 6px;
            overflow: hidden;
            width: 220px;
        }

        .footer-input input {
            flex: 1;
            padding: 10px;
            border: none;
            background: transparent;
            outline: none;
            color: white;
        }

        .footer-input button {
            padding: 10px 14px;
            background: transparent;
            border: none;
            cursor: pointer;
            color: white;
        }

        .copyright {
            text-align: center;
            margin-top: 30px;
            color: #777;
            font-size: 13px;
            border-top: 1px solid #222;
            padding-top: 12px;
        }
    </style>
</head>

<body>

    <!-- ===== MAIN NAVBAR ===== -->
    <header class="w-full border-b bg-white z-10 relative">
        <div class="max-w-7xl mx-auto flex items-center justify-between py-4 px-4">

            <!-- LEFT (menu) -->
            <nav class="flex items-center gap-10 font-medium text-lg">

                <!-- NEW & FEATURED (with dropdown) -->
                <div class="relative group">
                    <button class="font-bold hover:underline">New &amp; Featured</button>

                    <!-- DROPDOWN -->
                    <div class="absolute left-0 top-full hidden group-hover:grid bg-white p-6 dropdown-shadow z-50
                grid-flow-col auto-cols-max gap-12 w-max">

                        <!-- SHOP BY SPORT -->
                        <div>
                            <h3 class="font-bold text-lg mb-2">Shop By Sport</h3>
                            <div class="flex flex-col gap-1 text-gray-700">
                                <a href="running.html" class="hover:underline">Running</a>
                                <a href="basketball.html" class="hover:underline">Basketball</a>
                                <a href="football.html" class="hover:underline">Football</a>
                                <a href="all_products.html?category=Golf" class="hover:underline">Golf</a>
                                <a href="tennis.html" class="hover:underline">Tennis</a>
                                <a href="training.html" class="hover:underline">Gym and Training</a>
                                <a href="skateboarding.html" class="hover:underline">Skateboarding</a>
                            </div>
                        </div>

                    </div>
                </div>

                <!-- MENU: MEN -->
                <div class="relative group">
                    <!-- BUTTON MEN -->
                    <a href="men.html" class="font-bold group-hover:underline">
                        Men
                    </a>

                    <!-- DROPDOWN -->
                    <div class="absolute left-0 top-full hidden group-hover:grid bg-white p-6 dropdown-shadow z-50
                grid-flow-col auto-cols-max gap-12 w-max">

                        <!-- SHOP BY SPORT -->
                        <div>
                            <h3 class="font-bold text-lg mb-2">Shop By Sport</h3>
                            <div class="flex flex-col gap-1 text-gray-700">
                                <a href="all_products.html?filter=Men's%20Running" class="hover:underline">Running</a>
                                <a href="all_products.html?filter=Men's%20Basketball"
                                    class="hover:underline">Basketball</a>
                                <a href="all_products.html?filter=Men's%20Football" class="hover:underline">Football</a>
                                <a href="all_products.html?filter=Men's%20Golf" class="hover:underline">Golf</a>
                                <a href="all_products.html?filter=Men's%20Tennis%20&amp;%20Pickleball"
                                    class="hover:underline">Tennis &amp; Pickleball</a>
                                <a href="all_products.html?filter=Men's%20Training%20&amp;%20Gym"
                                    class="hover:underline">Gym and Training</a>
                                <a href="all_products.html?filter=Men's%20Yoga" class="hover:underline">Yoga</a>
                                <a href="all_products.html?filter=Men's%20Skateboarding"
                                    class="hover:underline">Skateboarding</a>
                            </div>
                        </div>
                    </div>
                </div>

                <!-- WOMEN MENU -->
                <div class="relative group">

                    <!-- Main Button -->
                    <a href="women.html" class="font-bold hover:underline">
                        Women
                    </a>

                    <!-- DROPDOWN -->
                    <div class="absolute left-0 top-full hidden group-hover:grid bg-white p-6 dropdown-shadow z-50
                grid-flow-col auto-cols-max gap-12 w-max">

                        <!-- 4. SHOP BY SPORT -->
                        <div>
                            <h3 class="font-bold text-lg mb-2">Shop By Sport</h3>

                            <div class="flex flex-col gap-1 text-gray-700">
                                <a href="all_products.html?filter=Women's%20Running" class="hover:underline">Running</a>
                                <a href="all_products.html?filter=Women's%20Basketball"
                                    class="hover:underline">Basketball</a>
                                <a href="all_products.html?filter=Women's%20Football"
                                    class="hover:underline">Football</a>
                                <a href="all_products.html?filter=Women's%20Golf" class="hover:underline">Golf</a>
                                <a href="all_products.html?filter=Women's%20Tennis%20&amp;%20Pickleball"
                                    class="hover:underline">Tennis &amp; Pickleball</a>
                                <a href="all_products.html?filter=Women's%20Gym%20&amp;%20Training"
                                    class="hover:underline">Gym and Training</a>
                                <a href="all_products.html?filter=Women's%20Yoga" class="hover:underline">Yoga</a>
                                <a href="all_products.html?filter=Women's%20Skate"
                                    class="hover:underline">Skateboarding</a>
                            </div>
                        </div>

                    </div>
                </div>

                <!-- OTHER MENU ITEMS -->
                <a href="#" class="hover:underline">Home</a>
                <a href="#" class="hover:underline">Shop</a>
                <a href="#" class="hover:underline">About</a>
            </nav>

            <!-- RIGHT: Search + Icons -->
            <div class="flex items-center gap-4">

                <div class="relative">
                    <input type="text" placeholder="What are you looking for?"
                        class="border rounded-full px-4 py-2 pl-10 w-64">
                    <span class="absolute left-3 top-2.5 text-gray-600">🔍</span>
                </div>

                <button class="text-2xl">🤍</button>
                <button class="text-2xl">🛒</button>
                <!-- Container Icon / Sign In -->
                <div class="relative" id="accountArea">
                    <!-- SIGN IN Button (default hidden if logged in) -->
                    <button id="signInBtn" class="font-bold">Sign In</button>

                    <!-- USER ICON (default hidden unless logged in) -->
                    <button id="userIcon"
                        class="hidden w-10 h-10 rounded-full bg-red-500 flex items-center justify-center relative">
                        <img src="../image/account.png" class="w-6 h-6">
                    </button>

                    <!-- DROPDOWN MENU -->
                    <div id="accountDropdown"
                        class="hidden fixed top-[72px] right-4 w-56 rounded-xl shadow-xl py-4 text-white"
                        style="background: linear-gradient(135deg, #8B3A3A, #C85C5C); z-index: 9999;">

                        <a href="manage-account.html" class="flex items-center gap-3 px-4 py-2 hover:bg-white/10">
                            <img src="../image/account.png" class="w-5">
                            <span>Manage My Account</span>
                        </a>

                        <a href="my-orders.html" class="flex items-center gap-3 px-4 py-2 hover:bg-white/10">
                            <img src="../image/online-shopping.png" class="w-5">
                            <span>My Order</span>
                        </a>

                        <a href="my-reviews.html" class="flex items-center gap-3 px-4 py-2 hover:bg-white/10">
                            <img src="../image/star.png" class="w-5">
                            <span>My Reviews</span>
                        </a>

                        <button id="logoutBtn" class="w-full flex items-center gap-3 px-4 py-2 hover:bg-white/10">
                            <img src="../image/logout.png" class="w-5">
                            <span>Logout</span>
                        </button>
                    </div>
                </div>

                <script>
                    // =============================
                    // SIMULASI LOGIN
                    // =============================
                    // Ubah ke true jika user sudah login (nanti diganti dengan sistem kamu)
                    let isLoggedIn = true;

                    const signInBtn = document.getElementById("signInBtn");
                    const userIcon = document.getElementById("userIcon");
                    const dropdown = document.getElementById("accountDropdown");

                    // Tampilkan Sign In atau User Icon
                    function updateUI() {
                        if (isLoggedIn) {
                            signInBtn.classList.add("hidden");
                            userIcon.classList.remove("hidden");
                        } else {
                            signInBtn.classList.remove("hidden");
                            userIcon.classList.add("hidden");
                        }
                    }
                    updateUI();

                    // Toggle dropdown ketika icon user diklik
                    userIcon.addEventListener("click", () => {
                        dropdown.classList.toggle("hidden");
                    });

                    // Klik di luar dropdown → close
                    document.addEventListener("click", (e) => {
                        if (!document.getElementById("accountArea").contains(e.target)) {
                            dropdown.classList.add("hidden");
                        }
                    });

                    // Tombol logout
                    document.getElementById("logoutBtn").addEventListener("click", () => {
                        isLoggedIn = false;
                        dropdown.classList.add("hidden");
                        updateUI();
                    });

                    // Tombol Sign In
                    signInBtn.addEventListener("click", () => {
                        window.location.href = "signin.html";
                    });
                </script>

            </div>
        </div>
    </header>

    <!-- Spline Background -->
    <div class="bg-spline">
        <iframe src="https://my.spline.design/reactiveorb-E1QQSInSzvTUmAZo7dCLOVQ1/" frameborder="0" width="100%"
            height="100%" style="border:0;"></iframe>
    </div>

    <!-- SECTION 1: FORM -->
    <section class="section">
        <div class="register-box">

            <!-- Logo Nike & Jordan -->
            <div style="display: flex; gap: 15px; margin-bottom: 25px;">
                <img src="../image/nike.png" alt="Nike" style="height: 35px;">
                <img src="../image/basketball-player.png" alt="Jordan" style="height: 35px;">
            </div>

            <h1 style="font-size: 28px; margin-bottom: 15px; font-weight: bold;">Enter your email to join us or sign in.</h1>

            <div style="margin-bottom: 20px; font-size: 14px; color:#666;">
                <span id="selectedCountry">Indonesia</span>
                <a href="#" id="changeCountryBtn" style="color:#666; text-decoration: underline; margin-left: 8px;">Change</a>
            </div>

            <!-- Country Modal -->
            <div id="countryModal" style="display: none; position: fixed; top: 0; left: 0; width: 100%; height: 100%; background: rgba(0,0,0,0.5); z-index: 1000; justify-content: center; align-items: center;">
                <div style="background: white; padding: 30px; border-radius: 12px; width: 400px; max-height: 500px; overflow-y: auto;">
                    <div style="display: flex; justify-content: space-between; align-items: center; margin-bottom: 20px;">
                        <h2 style="font-size: 20px; font-weight: bold;">Select Your Country</h2>
                        <button id="closeModal" style="font-size: 24px; background: none; border: none; cursor: pointer;">&times;</button>
                    </div>
                    <input type="text" id="searchCountry" placeholder="Search country..." style="width: 100%; padding: 10px; border: 1px solid #ddd; border-radius: 8px; margin-bottom: 15px;">
                    <div id="countryList" style="max-height: 300px; overflow-y: auto;"></div>
                </div>
            </div>

            <?php if (!empty($message)): ?>
                <div class="alert alert-<?php echo $messageType; ?>">
                    <?php echo htmlspecialchars($message); ?>
                </div>
            <?php endif; ?>

            <form method="POST" action="">
                <input type="hidden" name="country" id="countryInput" value="Indonesia">
                <div style="margin-bottom: 20px;">
                    <input type="email" name="email" placeholder="Email*" class="input-line" required style="margin-bottom: 5px;">
                    <p style="color: #8d8d8d; font-size: 12px; margin: 0;">Required</p>
                </div>

                <button type="submit" name="register" class="btn-create" style="border-radius: 25px;">Continue</button>
            </form>

        </div>
    </section>

    <!-- SECTION 2: FOOTER -->
    <footer>
        <div class="footer-container">

            <div class="footer-box">
                <h3>NikeSignature</h3>
                <p>Subscribe</p>
                <p>Get 10% off your first order</p>
                <div class="footer-input">
                    <input type="text" placeholder="Enter your email">
                    <button>➤</button>
                </div>
            </div>

            <div class="footer-box">
                <h3>Support</h3>
                <p>111 Bijoy sarani, Dhaka,</p>
                <p>DH 1515, Bangladesh.</p>
                <p>exclusive@gmail.com</p>
                <p>+88015-88888-9999</p>
            </div>

            <div class="footer-box">
                <h3>Account</h3>
                <p><a href="#">My Account</a></p>
                <p><a href="#">Login / Register</a></p>
                <p><a href="#">Cart</a></p>
                <p><a href="#">Wishlist</a></p>
                <p><a href="#">Shop</a></p>
            </div>

            <div class="footer-box">
                <h3>Quick Link</h3>
                <p><a href="#">Privacy Policy</a></p>
                <p><a href="#">Terms Of Use</a></p>
                <p><a href="#">FAQ</a></p>
                <p><a href="#">Contact</a></p>
            </div>

        </div>

        <div class="copyright">
            © Copyright Rimel 2022. All rights reserved
        </div>
    </footer>

    <script>
        // Country List
        const countries = ["Afghanistan", "Albania", "Algeria", "American Samoa", "Andorra", "Angola", "Anguilla", "Antarctica", "Antigua and Barbuda", "Argentina", "Armenia", "Aruba", "Australia", "Austria", "Azerbaijan", "Bahamas", "Bahrain", "Bangladesh", "Barbados", "Belarus", "Belgium", "Belize", "Benin", "Bermuda", "Bhutan", "Bolivia", "Bosnia and Herzegovina", "Botswana", "Brazil", "Brunei", "Bulgaria", "Burkina Faso", "Burundi", "Cambodia", "Cameroon", "Canada", "Cape Verde", "Cayman Islands", "Central African Republic", "Chad", "Chile", "China", "Colombia", "Comoros", "Congo", "Costa Rica", "Croatia", "Cuba", "Cyprus", "Czech Republic", "Denmark", "Djibouti", "Dominica", "Dominican Republic", "Ecuador", "Egypt", "El Salvador", "Equatorial Guinea", "Eritrea", "Estonia", "Ethiopia", "Fiji", "Finland", "France", "Gabon", "Gambia", "Georgia", "Germany", "Ghana", "Greece", "Grenada", "Guatemala", "Guinea", "Guinea-Bissau", "Guyana", "Haiti", "Honduras", "Hong Kong", "Hungary", "Iceland", "India", "Indonesia", "Iran", "Iraq", "Ireland", "Israel", "Italy", "Jamaica", "Japan", "Jordan", "Kazakhstan", "Kenya", "Kiribati", "Kuwait", "Kyrgyzstan", "Laos", "Latvia", "Lebanon", "Lesotho", "Liberia", "Libya", "Liechtenstein", "Lithuania", "Luxembourg", "Macau", "Macedonia", "Madagascar", "Malawi", "Malaysia", "Maldives", "Mali", "Malta", "Marshall Islands", "Mauritania", "Mauritius", "Mexico", "Micronesia", "Moldova", "Monaco", "Mongolia", "Montenegro", "Morocco", "Mozambique", "Myanmar", "Namibia", "Nauru", "Nepal", "Netherlands", "New Zealand", "Nicaragua", "Niger", "Nigeria", "North Korea", "Norway", "Oman", "Pakistan", "Palau", "Palestine", "Panama", "Papua New Guinea", "Paraguay", "Peru", "Philippines", "Poland", "Portugal", "Puerto Rico", "Qatar", "Romania", "Russia", "Rwanda", "Saint Kitts and Nevis", "Saint Lucia", "Saint Vincent", "Samoa", "San Marino", "Sao Tome and Principe", "Saudi Arabia", "Senegal", "Serbia", "Seychelles", "Sierra Leone", "Singapore", "Slovakia", "Slovenia", "Solomon Islands", "Somalia", "South Africa", "South Korea", "South Sudan", "Spain", "Sri Lanka", "Sudan", "Suriname", "Swaziland", "Sweden", "Switzerland", "Syria", "Taiwan", "Tajikistan", "Tanzania", "Thailand", "Timor-Leste", "Togo", "Tonga", "Trinidad and Tobago", "Tunisia", "Turkey", "Turkmenistan", "Tuvalu", "UAE", "Uganda", "Ukraine", "United Kingdom", "United States", "Uruguay", "Uzbekistan", "Vanuatu", "Vatican City", "Venezuela", "Vietnam", "Yemen", "Zambia", "Zimbabwe"];

        const modal = document.getElementById('countryModal');
        const changeBtn = document.getElementById('changeCountryBtn');
        const closeBtn = document.getElementById('closeModal');
        const searchInput = document.getElementById('searchCountry');
        const countryList = document.getElementById('countryList');
        const selectedCountry = document.getElementById('selectedCountry');
        const countryInput = document.getElementById('countryInput');

        function populateCountries(filter = '') {
            const filtered = countries.filter(c => c.toLowerCase().includes(filter.toLowerCase()));
            countryList.innerHTML = filtered.map(c => `<div class="country-item" data-country="${c}" style="padding: 12px; cursor: pointer; border-bottom: 1px solid #eee; transition: background 0.2s;">${c}</div>`).join('');

            document.querySelectorAll('.country-item').forEach(item => {
                item.addEventListener('mouseenter', e => e.target.style.background = '#2196F3');
                item.addEventListener('mouseleave', e => e.target.style.background = 'white');
                item.addEventListener('click', e => {
                    selectedCountry.textContent = e.target.dataset.country;
                    countryInput.value = e.target.dataset.country;
                    modal.style.display = 'none';
                });
            });
        }

        changeBtn.addEventListener('click', e => {
            e.preventDefault();
            modal.style.display = 'flex';
            populateCountries();
            searchInput.value = '';
            searchInput.focus();
        });

        closeBtn.addEventListener('click', () => modal.style.display = 'none');
        modal.addEventListener('click', e => {
            if (e.target === modal) modal.style.display = 'none';
        });
        searchInput.addEventListener('input', e => populateCountries(e.target.value));

        // Draggable box
        const box = document.querySelector('.register-box');
        let drag = false,
            offsetX = 0,
            offsetY = 0;

        box.addEventListener("mousedown", e => {
            if (e.target.tagName !== 'INPUT' && e.target.tagName !== 'BUTTON' && !e.target.closest('a') && !e.target.closest('#countryModal')) {
                drag = true;
                offsetX = e.clientX - box.getBoundingClientRect().left;
                offsetY = e.clientY - box.getBoundingClientRect().top;
                box.style.cursor = "grabbing";
            }
        });

        document.addEventListener("mousemove", e => {
            if (drag) {
                box.style.left = `${e.clientX - offsetX}px`;
                box.style.top = `${e.clientY - offsetY}px`;
            }
        });

        document.addEventListener("mouseup", () => {
            drag = false;
            box.style.cursor = "move";
        });

        // Spline iframe
        const iframe = document.querySelector(".bg-spline iframe");
        document.addEventListener("mousemove", e => {
            const boxRect = box.getBoundingClientRect();
            const isHover = e.clientX >= boxRect.left && e.clientX <= boxRect.right && e.clientY >= boxRect.top && e.clientY <= boxRect.bottom;
            iframe.style.pointerEvents = (isHover || modal.style.display === 'flex') ? "none" : "auto";
        });
    </script>

</body>

</html>
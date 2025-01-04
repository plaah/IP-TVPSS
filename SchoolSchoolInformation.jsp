<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>School Information</title>
    <style>
        /* General Reset and Styles */
        body {
            font-family: 'Arial', sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f9fbff;
        }
        /* Sidebar */
        .sidebar {
		    background-color: #ffffff;
		    box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
		    width: 240px;
		    position: fixed;
		    height: 100%;
		    top: 0;
		    left: 0;
		    padding: 20px 10px;
		}
		
		.sidebar h3 {
		    text-align: center;
		    margin-bottom: 30px;
		    font-size: 18px;
		}
		
		.sidebar ul {
		    list-style: none;
		    padding: 0;
		}
		
		.sidebar ul li {
		    margin: 10px 0;
		}
		
		.sidebar ul li a {
		    text-decoration: none; /* Menghilangkan garis bawah */
		    color: #000; /* Warna teks hitam */
		    display: block; /* Memperbaiki area klik */
		    padding: 10px 20px;
		    border-radius: 6px;
		}
		
		.sidebar ul li a:hover, .sidebar ul li a.active {
		    background-color: #eef4ff;
		    color: #347ae2; /* Warna biru hanya saat hover atau aktif */
		}
        /* Main Content */
        .main {
            margin-left: 260px;
            padding: 20px;
        }
        /* Header Section */
        .header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 20px;
        }
        .header h1 {
            font-size: 24px;
            color: #2a2a2a;
        }
        .header .search {
            display: flex;
            gap: 10px;
        }
        .header input, .header button {
            padding: 10px;
            border: 1px solid #dcdcdc;
            border-radius: 5px;
        }
        /* Content Section */
        .content {
            background-color: #ffffff;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 2px 8px rgba(0, 0, 0, 0.1);
        }
        .content h2 {
            margin-bottom: 20px;
        }
        .table-container {
            overflow-x: auto;
        }
        table {
            width: 100%;
            border-collapse: collapse;
        }
        table th, table td {
            text-align: left;
            padding: 12px 15px;
        }
        table th {
            background-color: #f1f5ff;
        }
        table tr:nth-child(even) {
            background-color: #f9f9f9;
        }
        table tr:hover {
            background-color: #f1f1f1;
        }
        .btn {
            text-decoration: none;
            color: #ffffff;
            background-color: #347ae2;
            padding: 8px 15px;
            border-radius: 4px;
            font-size: 14px;
        }
        .btn:hover {
            background-color: #2a5db7;
        }
        /* Modal Styles */
        .modal {
            display: none;
            position: fixed;
            z-index: 9999;
            left: 0;
            top: 0;
            width: 100%;
            height: 100%;
            background-color: rgba(0, 0, 0, 0.5);
        }
        .modal-content {
            background-color: #fff;
            margin: 10% auto;
            padding: 20px;
            border-radius: 8px;
            width: 50%;
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.2);
        }
        .modal-content h2 {
            margin-top: 0;
        }
        .close-btn {
            float: right;
            font-size: 18px;
            color: #999;
            cursor: pointer;
        }
        .close-btn:hover {
            color: #333;
        }
    </style>
</head>
<body>
    <!-- Sidebar -->
    <div class="sidebar">
        <h3>Johor TVPSS Management</h3>
        <ul>
            <li><a href="SchoolController?action=Dashboard">Dashboard</a></li>
            <li><a href="SchoolController?action=SchoolInformation" class="active">School Information</a></li>
            <li><a href="SchoolController?action=Equipment">Equipment</a></li>
            <li><a href="SchoolController?action=Program">Program</a></li>
            <li><a href="SchoolController?action=YoutubeLink">YouTube Link</a></li>
            <li><a href="SchoolController?action=ApplyUpgrade">Apply Upgrade</a></li>
            <li><a href="SchoolController?action=Application">Status Application</a></li>
            <li><a href="SchoolController?action=Logout">Log out</a></li>
        </ul>
    </div>
    <!-- Main Content -->
    <div class="main">
        <div class="header">
            <h1>School / School Information</h1>
            <div class="search">
                <input type="text" placeholder="Search School">
                <button>Filter</button>
            </div>
        </div>
        <div class="content">
            <h2>School Information</h2>
            <div class="table-container">
                <table>
                    <thead>
                        <tr>
                            <th>School Name</th>
                            <th>Address</th>
                            <th>Principal Name</th>
                            <th>Contact</th>
                            <th></th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td>SMK Taman Universiti</td>
                            <td>Jalan Universiti, Skudai</td>
                            <td>Puan Aminah</td>
                            <td>07-1234567</td>
                            <td><button class="btn details-btn" data-school="SMK Taman Universiti">Details</button></td>
                        </tr>
                        <tr>
                            <td>SMK Bandar Baru UDA</td>
                            <td>Jalan Tun Abdul Razak, Johor Bahru</td>
                            <td>Encik Rahim</td>
                            <td>07-7654321</td>
                            <td><button class="btn details-btn" data-school="SMK Bandar Baru UDA">Details</button></td>
                        </tr>
                        <tr>
                            <td>SMK Taman Pelangi</td>
                            <td>Jalan Pelangi, Johor Bahru</td>
                            <td>Puan Kartini</td>
                            <td>07-9876543</td>
                            <td><button class="btn details-btn" data-school="SMK Taman Pelangi">Details</button></td>
                        </tr>
                        <tr>
                            <td>SMK Sentosa</td>
                            <td>Jalan Sentosa, Pasir Gudang</td>
                            <td>Encik Hamid</td>
                            <td>07-8765432</td>
                            <td><button class="btn details-btn" data-school="SMK Sentosa">Details</button></td>
                        </tr>
                    </tbody>
                </table>
            </div>
        </div>
    </div>

    <!-- Modal -->
    <div id="modal" class="modal">
        <div class="modal-content">
            <span class="close-btn">&times;</span>
            <h2 id="modal-title">School Details</h2>
            <p id="modal-content">Details will be shown here.</p>
        </div>
    </div>

    <script>
        // Modal functionality
        const modal = document.getElementById("modal");
        const modalTitle = document.getElementById("modal-title");
        const modalContent = document.getElementById("modal-content");
        const closeBtn = document.querySelector(".close-btn");

        // School data (mocked for demonstration)
        const schoolDetails = {
            "SMK Taman Universiti": "Located in Jalan Universiti, this school specializes in Science and Technology.",
            "SMK Bandar Baru UDA": "Renowned for its arts program and excellent facilities.",
            "SMK Taman Pelangi": "A highly reputed school focusing on community development.",
            "SMK Sentosa": "Offers vocational programs and a strong STEM focus."
        };

        // Show modal when details button is clicked
        document.querySelectorAll(".details-btn").forEach(btn => {
            btn.addEventListener("click", () => {
                const schoolName = btn.getAttribute("data-school");
                modalTitle.textContent = schoolName;
                modalContent.textContent = schoolDetails[schoolName] || "Details not available.";
                modal.style.display = "block";
            });
        });

        // Close modal
        closeBtn.addEventListener("click", () => {
            modal.style.display = "none";
        });

        // Close modal when clicking outside the modal content
        window.addEventListener("click", event => {
            if (event.target === modal) {
                modal.style.display = "none";
            }
        });
    </script>
</body>
</html>
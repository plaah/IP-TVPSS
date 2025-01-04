<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>School Equipment List</title>
    <style>
        body {
            font-family: 'Arial', sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f9fbff;
        }
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
        .main {
            margin-left: 260px;
            padding: 20px;
        }
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
        .content {
            background-color: #ffffff;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 2px 8px rgba(0, 0, 0, 0.1);
        }
        .header-row {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 20px;
        }
        .header-row h2 {
            margin: 0;
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
            cursor: pointer;
        }
        .btn:hover {
            background-color: #2a5db7;
        }
        .generate-btn {
            background-color: #4CAF50;
            color: white;
            padding: 10px 20px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
        }
        .generate-btn:hover {
            background-color: #45a049;
        }
        /* Modal Styles */
        .modal {
            display: none;
            position: fixed;
            z-index: 1000;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background-color: rgba(0, 0, 0, 0.5);
            justify-content: center;
            align-items: center;
        }
        .modal-content {
            background-color: white;
            padding: 20px;
            border-radius: 8px;
            width: 400px;
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.2);
        }
        .modal-content h3 {
            margin-bottom: 20px;
        }
        .modal-content label {
            display: block;
            margin-bottom: 8px;
            font-weight: bold;
        }
        .modal-content input {
            width: 100%;
            padding: 8px;
            margin-bottom: 15px;
            border: 1px solid #ccc;
            border-radius: 5px;
        }
        .modal-content button {
            float: right;
            padding: 8px 12px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
        }
        .modal-content .save-btn {
            background-color: #4CAF50;
            color: white;
        }
        .modal-content .save-btn:hover {
            background-color: #45a049;
        }
        .modal-content .cancel-btn {
            background-color: #e74c3c;
            color: white;
        }
        .modal-content .cancel-btn:hover {
            background-color: #c0392b;
        }
    </style>
</head>
<body>
    <div class="sidebar">
        <h3>Johor TVPSS Management</h3>
        <ul>
            <li><a href="SchoolController?action=Dashboard">Dashboard</a></li>
            <li><a href="SchoolController?action=SchoolInformation">School Information</a></li>
            <li><a href="SchoolController?action=Equipment" class="active">Equipment</a></li>
            <li><a href="SchoolController?action=Program">Program</a></li>
            <li><a href="SchoolController?action=YoutubeLink">YouTube Link</a></li>
            <li><a href="SchoolController?action=ApplyUpgrade">Apply Upgrade</a></li>
            <li><a href="SchoolController?action=Application">Status Application</a></li>
            <li><a href="SchoolController?action=Logout">Log out</a></li>
        </ul>
    </div>
    <div class="main">
        <div class="header">
            <h1>School Equipment / Equipment List</h1>
        </div>
        <div class="content">
            <div class="header-row">
                <h2>Equipment List</h2>
                <button class="generate-btn" onclick="openModal()">Add New Equipment</button>
            </div>
            <div class="table-container">
                <table id="equipmentTable">
                    <thead>
                        <tr>
                            <th>Equipment ID</th>
                            <th>Equipment Name</th>
                            <th>Amount</th>
                            <th>Brand</th>
                            <th>School Name</th>
                            <th>Actions</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td>#5001</td>
                            <td>Camera</td>
                            <td>3</td>
                            <td>Canon</td>
                            <td>SMK Johor</td>
                            <td><button class="btn" onclick="openModal(this)">Edit</button></td>
                        </tr>
                    </tbody>
                </table>
            </div>
        </div>
    </div>

    <!-- Modal -->
    <div id="modal" class="modal">
        <div class="modal-content">
            <h3>Edit/Add Equipment</h3>
            <label for="equipmentId">Equipment ID</label>
            <input type="text" id="equipmentId" placeholder="Enter Equipment ID" />
            <label for="equipmentName">Equipment Name</label>
            <input type="text" id="equipmentName" placeholder="Enter Equipment Name" />
            <label for="amount">Amount</label>
            <input type="number" id="amount" placeholder="Enter Amount" />
            <label for="brand">Brand</label>
            <input type="text" id="brand" placeholder="Enter Brand" />
            <label for="schoolName">School Name</label>
            <input type="text" id="schoolName" placeholder="Enter School Name" />
            <button class="save-btn" onclick="saveData()">Save</button>
            <button class="cancel-btn" onclick="closeModal()">Cancel</button>
        </div>
    </div>

    <script>
        const modal = document.getElementById('modal');
        let editingRow = null;

        function openModal(button = null) {
            modal.style.display = 'flex';
            if (button) {
                editingRow = button.parentElement.parentElement;
                document.getElementById('equipmentId').value = editingRow.cells[0].innerText;
                document.getElementById('equipmentName').value = editingRow.cells[1].innerText;
                document.getElementById('amount').value = editingRow.cells[2].innerText;
                document.getElementById('brand').value = editingRow.cells[3].innerText;
                document.getElementById('schoolName').value = editingRow.cells[4].innerText;
            } else {
                editingRow = null;
                document.getElementById('equipmentId').value = '';
                document.getElementById('equipmentName').value = '';
                document.getElementById('amount').value = '';
                document.getElementById('brand').value = '';
                document.getElementById('schoolName').value = '';
            }
        }

        function closeModal() {
            modal.style.display = 'none';
        }

        function saveData() {
            const id = document.getElementById('equipmentId').value;
            const name = document.getElementById('equipmentName').value;
            const amount = document.getElementById('amount').value;
            const brand = document.getElementById('brand').value;
            const school = document.getElementById('schoolName').value;

            if (editingRow) {
                editingRow.cells[0].innerText = id;
                editingRow.cells[1].innerText = name;
                editingRow.cells[2].innerText = amount;
                editingRow.cells[3].innerText = brand;
                editingRow.cells[4].innerText = school;
            } else {
                const table = document.getElementById('equipmentTable').getElementsByTagName('tbody')[0];
                const newRow = table.insertRow();
                newRow.innerHTML = `
                    <td>${id}</td>
                    <td>${name}</td>
                    <td>${amount}</td>
                    <td>${brand}</td>
                    <td>${school}</td>
                    <td><button class="btn" onclick="openModal(this)">Edit</button></td>
                `;
            }
            closeModal();
        }
    </script>
</body>
</html>
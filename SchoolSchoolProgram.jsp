<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>School Program List</title>
    <style>
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
            padding: 10px 20px;
            margin: 10px 0;
            border-radius: 6px;
            cursor: pointer;
        }

        .sidebar ul li:hover, .sidebar ul li.active {
            background-color: #eef4ff;
            color: #347ae2;
        }

        .sidebar ul li a {
            text-decoration: none; /* Hilangkan garis bawah */
            color: inherit; /* Warna link mengikuti elemen induk */
            display: block; /* Perlu agar klik mencakup seluruh area elemen li */
        }
        /* Main content */
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

        .header input {
            width: 200px;
        }

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
            cursor: pointer;
        }

        .btn:hover {
            background-color: #2a5db7;
        }

        .generate-btn {
            float: right;
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

        .pagination {
            display: flex;
            justify-content: space-between;
            margin-top: 10px;
            font-size: 14px;
        }

        .pagination button {
            border: 1px solid #ddd;
            background-color: #fff;
            padding: 8px 12px;
            cursor: pointer;
            border-radius: 4px;
        }

        .pagination button:hover {
            background-color: #eef4ff;
            color: #347ae2;
        }

        /* Modal */
        .modal {
            display: none;
            position: fixed;
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
        }

        .modal-content h3 {
            margin-top: 0;
        }

        .modal-content label {
            display: block;
            margin-bottom: 5px;
            font-weight: bold;
        }

        .modal-content input {
            width: 100%;
            padding: 10px;
            margin-bottom: 15px;
            border: 1px solid #ddd;
            border-radius: 5px;
        }

        .modal-content button {
            padding: 10px 20px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
        }

        .modal-content .save-btn {
            background-color: #4CAF50;
            color: white;
        }

        .modal-content .close-btn {
            background-color: #f44336;
            color: white;
        }
    </style>
</head>
<body>
    <div class="sidebar">
        <h3>Johor TVPSS Management</h3>
        <ul>
            <li><a href="SchoolController?action=Dashboard">Dashboard</a></li>
            <li><a href="SchoolController?action=SchoolInformation">School Information</a></li>
            <li><a href="SchoolController?action=Equipment">Equipment</a></li>
            <li><a href="SchoolController?action=Program" class="active">Program</a></li>
            <li><a href="SchoolController?action=YoutubeLink">YouTube Link</a></li>
            <li><a href="SchoolController?action=ApplyUpgrade">Apply Upgrade</a></li>
            <li><a href="SchoolController?action=Application">Status Application</a></li>
            <li><a href="SchoolController?action=Logout">Log out</a></li>
        </ul>
    </div>

    <div class="main">
        <div class="header">
            <h1>Program / School Program List</h1>
            <div class="search">
                <input type="text" placeholder="Search">
                <button>Filter</button>
                <input type="text" placeholder="DD/MM/YYYY">
            </div>
        </div>
        <div class="content">
            <h2>School Program List</h2>
            <button class="generate-btn add-btn">Add Program</button>
            <button class="generate-btn">Generate Report</button>
            <div class="table-container">
                <table>
                    <thead>
                        <tr>
                            <th>School ID</th>
                            <th>School Name</th>
                            <th>Program Name</th>
                            <th>Program Description</th>
                            <th>Actions</th>
                        </tr>
                    </thead>
                    <tbody id="program-list">
                        <tr>
                            <td>JEA1049</td>
                            <td>SMK Taman Universiti</td>
                            <td>Kem Jati Diri</td>
                            <td>All members involved</td>
                            <td>
                                <button class="btn edit-btn">Edit</button>
                                <button class="btn delete-btn">Delete</button>
                            </td>
                        </tr>
                        <tr>
                            <td>JEA1050</td>
                            <td>SMK Taman Universiti</td>
                            <td>Gotong-royong</td>
                            <td>At Pantai Air Papan</td>
                            <td>
                                <button class="btn edit-btn">Edit</button>
                                <button class="btn delete-btn">Delete</button>
                            </td>
                        </tr>
                    </tbody>
                </table>
            </div>
            <div class="pagination">
                <span>Showing 1 to 6 of 3000 entries</span>
                <div>
                    <button>Previous</button>
                    <button>Next</button>
                </div>
            </div>
        </div>
    </div>

    <!-- Modal -->
    <div class="modal" id="editModal">
        <div class="modal-content">
            <h3>Edit Program</h3>
            <label for="schoolID">School ID</label>
            <input type="text" id="schoolID" readonly>
            <label for="schoolName">School Name</label>
            <input type="text" id="schoolName">
            <label for="programName">Program Name</label>
            <input type="text" id="programName">
            <label for="programDesc">Program Description</label>
            <input type="text" id="programDesc">
            <button class="save-btn" onclick="saveProgram()">Save</button>
            <button class="close-btn" onclick="closeModal()">Close</button>
        </div>
    </div>

    <script>
    // Open modal when "Add Program" button is clicked
    document.querySelector('.add-btn').addEventListener('click', () => {
        openModal();
        document.getElementById('programName').value = '';
        document.getElementById('programDesc').value = '';
        document.getElementById('schoolName').value = '';
        document.getElementById('schoolID').value = 'Auto generated ID';  // School ID auto-generated
    });

    // Open modal function
    function openModal() {
        document.getElementById('editModal').style.display = 'flex';
    }

    // Close modal function
    function closeModal() {
        document.getElementById('editModal').style.display = 'none';
    }

    // Save the new or edited program
    function saveProgram() {
        var schoolID = document.getElementById('schoolID').value;
        var schoolName = document.getElementById('schoolName').value;
        var programName = document.getElementById('programName').value;
        var programDesc = document.getElementById('programDesc').value;

        // Validate fields
        if (!schoolName || !programName || !programDesc) {
            alert("All fields are required!");
            return;
        }

        // If it's a new program, add it to the table
        var table = document.getElementById('program-list');
        var newRow = table.insertRow();
        newRow.innerHTML = `
            <td>${schoolID}</td>
            <td>${schoolName}</td>
            <td>${programName}</td>
            <td>${programDesc}</td>
            <td>
                <button class="btn edit-btn" onclick="editProgram(this)">Edit</button>
                <button class="btn delete-btn" onclick="deleteProgram(this)">Delete</button>
            </td>
        `;

        // Close modal after saving
        closeModal();
        // Optionally, you can generate a new auto-generated ID here
    }

    // Delete button functionality
    function deleteProgram(button) {
        if (confirm("Are you sure you want to delete this program?")) {
            const row = button.closest('tr');
            row.remove();  // Remove the row from the table
        }
    }

    // Edit button functionality
    function editProgram(button) {
        openModal();
        const row = button.closest('tr');
        document.getElementById('schoolID').value = row.cells[0].innerText;
        document.getElementById('schoolName').value = row.cells[1].innerText;
        document.getElementById('programName').value = row.cells[2].innerText;
        document.getElementById('programDesc').value = row.cells[3].innerText;
    }

    // Event delegation to ensure delete buttons work after adding new rows dynamically
    document.addEventListener('click', (e) => {
        if (e.target && e.target.classList.contains('delete-btn')) {
            deleteProgram(e.target);
        }
        if (e.target && e.target.classList.contains('edit-btn')) {
            editProgram(e.target);
        }
    });
    </script>
</body>
</html>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Youtube Link List</title>
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
            padding: 8px 15px;
            border-radius: 4px;
            font-size: 14px;
            border: none;
            cursor: pointer;
        }

        .btn.edit-btn {
            background-color: #347ae2;
        }

        .btn.edit-btn:hover {
            background-color: #2a5db7;
        }

        .btn.delete-btn {
            background-color: #e74c3c;
        }

        .btn.delete-btn:hover {
            background-color: #c0392b;
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
         .popup {
            display: none;
            position: fixed;
            top: 50%;
            left: 50%;
            transform: translate(-50%, -50%);
            background-color: #fff;
            border-radius: 8px;
            padding: 20px;
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
            z-index: 1000;
        }
        .popup h2 {
            margin-bottom: 15px;
        }
        .popup input {
            width: 100%;
            margin-bottom: 10px;
            padding: 10px;
            border: 1px solid #ddd;
            border-radius: 5px;
        }
        .popup .btn {
            width: 100%;
        }
        .overlay {
            display: none;
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background: rgba(0, 0, 0, 0.5);
            z-index: 999;
        }
    </style>
     <script>
        function deleteRow(button) {
            const row = button.parentNode.parentNode;
            row.parentNode.removeChild(row);
        }

        function editRow(button) {
            const row = button.parentNode.parentNode;
            const link = row.children[0].textContent;
            const title = row.children[1].textContent;

            document.getElementById("editLink").value = link;
            document.getElementById("editTitle").value = title;

            document.querySelector(".edit-popup").style.display = "block";
            document.querySelector(".overlay").style.display = "block";

            document.getElementById("saveEdit").onclick = function () {
                row.children[0].textContent = document.getElementById("editLink").value;
                row.children[1].textContent = document.getElementById("editTitle").value;

                closePopup();
            };
        }

        function openAddPopup() {
            document.querySelector(".add-popup").style.display = "block";
            document.querySelector(".overlay").style.display = "block";
        }

        function addNewLink() {
            const link = document.getElementById("newLink").value;
            const title = document.getElementById("newTitle").value;

            if (link && title) {
                const table = document.querySelector("table tbody");
                const newRow = table.insertRow();

                newRow.innerHTML = `
                    <td>${link}</td>
                    <td>${title}</td>
                    <td>
                        <button class="btn edit-btn" onclick="editRow(this)">Edit</button>
                        <button class="btn delete-btn" onclick="deleteRow(this)">Delete</button>
                    </td>
                `;

                closePopup();
            }
        }

        function closePopup() {
            document.querySelectorAll(".popup").forEach(popup => popup.style.display = "none");
            document.querySelector(".overlay").style.display = "none";
        }
    </script>
</head>
<body>
 <div class="sidebar">
    <h3>Johor TVPSS Management</h3>
    <ul>
        <li><a href="SchoolController?action=Dashboard">Dashboard</a></li>
        <li><a href="SchoolController?action=SchoolInformation">School Information</a></li>
        <li><a href="SchoolController?action=Equipment">Equipment</a></li>
        <li><a href="SchoolController?action=Program">Program</a></li>
        <li><a href="SchoolController?action=YoutubeLink" class="active">YouTube Link</a></li>
        <li><a href="SchoolController?action=ApplyUpgrade">Apply Upgrade</a></li>
        <li><a href="SchoolController?action=Application">Status Application</a></li>
        <li><a href="SchoolController?action=Logout">Log out</a></li>
    </ul>
</div>

    <div class="main">
        <div class="header">
            <h1>Youtube Link / Youtube Link List</h1>
            <div class="search">
                <input type="text" placeholder="Search">
                <button>Filter</button>
                <input type="text" placeholder="DD/MM/YYYY">
            </div>
        </div>
        <div class="content">
            <div class="add-delete-btns">
                <button class="btn edit-btn" onclick="openAddPopup()">Add New Link</button>
            </div>
            <div class="table-container">
                <table>
                    <thead>
                        <tr>
                            <th>Links</th>
                            <th>Title Name</th>
                            <th>Actions</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td>http://localhost</td>
                            <td>Vlog Hari Kantin SMK Taman Universiti</td>
                            <td>
                               <button class="btn edit-btn" onclick="editRow(this)">Edit</button>
							   <button class="btn delete-btn" onclick="deleteRow(this)">Delete</button>

                            </td>
                        </tr>
                        <tr>
                            <td>http://localhost</td>
                            <td>Video Pertandingan Debat SMK Taman Universiti</td>
                            <td>
                               <button class="btn edit-btn" onclick="editRow(this)">Edit</button>
							   <button class="btn delete-btn" onclick="deleteRow(this)">Delete</button>

                            </td>
                        </tr>
                        <tr>
                            <td>http://localhost</td>
                            <td>Video Temuramah Pengetua SMK Taman Universiti</td>
                            <td>
                                <button class="btn edit-btn" onclick="editRow(this)">Edit</button>
								<button class="btn delete-btn" onclick="deleteRow(this)">Delete</button>

                            </td>
                        </tr>
                        <tr>
                            <td>http://localhost</td>
                            <td>Rakaman Hari Sukan SMK Taman Universiti</td>
                            <td>
                                <button class="btn edit-btn" onclick="editRow(this)">Edit</button>
								<button class="btn delete-btn" onclick="deleteRow(this)">Delete</button>

                            </td>
                        </tr>
                        <tr>
                            <td>http://localhost</td>
                            <td>Rakaman Ujibakat Wartawan SMK Taman Universiti</td>
                            <td>
                               <button class="btn edit-btn" onclick="editRow(this)">Edit</button>
								<button class="btn delete-btn" onclick="deleteRow(this)">Delete</button>

                            </td>
                        </tr>
                        <tr>
                            <td>http://localhost</td>
                            <td>Video Ucapan Hari Guru SMK Taman Universiti</td>
                            <td>
                                <button class="btn edit-btn" onclick="editRow(this)">Edit</button>
								<button class="btn delete-btn" onclick="deleteRow(this)">Delete</button>

                            </td>
                        </tr>
                    </tbody>
                </table>
            </div>
</div>           
            <div class="pagination">
                <span>Showing 1 to 6 of 3000 entries</span>
                <div>
                    <button>Previous</button>
                    <button>Next</button>
                </div>
            </div>
        </div> 
    <div class="overlay" onclick="closePopup()"></div>
    <div class="popup edit-popup">
        <h2>Edit Link</h2>
        <input type="text" id="editLink" placeholder="Link">
        <input type="text" id="editTitle" placeholder="Title">
        <button class="btn edit-btn" id="saveEdit">Save</button>
    </div>
    <div class="popup add-popup">
        <h2>Add New Link</h2>
        <input type="text" id="newLink" placeholder="Link">
        <input type="text" id="newTitle" placeholder="Title">
        <button class="btn edit-btn" onclick="addNewLink()">Add</button>
    </div>
</body>
</html>
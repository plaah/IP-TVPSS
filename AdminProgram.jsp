<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Insert Title</title>
    <style>
        /* Styling similar to dashboard */
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: Arial, sans-serif;
        }

        body {
            display: flex;
            background-color: #f7f9fc;
            color: #333;
        }

        .container {
            display: flex;
            width: 100%;
        }

        /* Sidebar Styling */
        .sidebar {
            width: 250px;
            background-color: #ffffff;
            box-shadow: 2px 0 5px rgba(0, 0, 0, 0.1);
            display: flex;
            flex-direction: column;
            justify-content: space-between;
            padding: 20px;
            height: 100vh;
        }

        .sidebar .logo h2 {
            font-size: 18px;
            color: #0d6efd;
        }

        .sidebar .menu {
            margin-top: 30px;
        }

        .sidebar .menu ul {
            list-style-type: none;
        }

        .sidebar .menu-item {
            padding: 10px 15px;
            margin: 10px 0;
            color: #333;
            cursor: pointer;
            border-radius: 8px;
            text-align: left;
            transition: all 0.3s;
        }

        .sidebar .menu-item:hover,
        .sidebar .menu-item.active {
            background-color: #eaf1ff;
            color: #0d6efd;
        }

        .sidebar .logout {
            margin-top: 20px;
        }

        .sidebar .logout a {
            text-decoration: none;
            color: #ff4d4f;
            font-weight: bold;
            padding: 10px;
            display: inline-block;
            border: 1px solid #ff4d4f;
            border-radius: 5px;
            text-align: center;
            transition: all 0.3s;
        }

        .sidebar .logout a:hover {
            background-color: #ff4d4f;
            color: #ffffff;
        }

        .main-content {
            flex: 1;
            padding: 20px;
            overflow-y: auto;
        }

        .header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            padding: 20px;
            background-color: #ffffff;
            border-bottom: 1px solid #ddd;
        }

        .dashboard-title {
            font-size: 24px;
            margin-bottom: 20px;
        }

        .card {
            background-color: #ffffff;
            padding: 20px;
            border-radius: 10px;
            margin-bottom: 20px;
            box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
        }

        .search-filter {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 20px;
        }
        
        .content {
            flex-grow: 1;
            padding: 20px;
        }
        .header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            background-color: #ffffff;
            padding: 10px 20px;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
            margin-bottom: 20px;
        }
        .header input {
            padding: 10px;
            border: 1px solid #ddd;
            border-radius: 5px;
            width: 300px;
        }
        .header .user-info {
            display: flex;
            align-items: center;
        }
        .header .user-info img {
            border-radius: 50%;
            width: 40px;
            height: 40px;
            margin-right: 10px;
        }
        .header .user-info span {
            font-size: 14px;
            color: #333;
        }
        .header .user-info span.name {
            font-weight: 500;
        }
        .header .user-info span.location {
            color: #999;
        }
        .main-content {
            background-color: #ffffff;
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
        }
        .main-content h3 {
            font-size: 20px;
            margin-bottom: 20px;
        }
        .search-filter {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 20px;
        }
        .search-filter input {
            padding: 10px;
            border: 1px solid #ddd;
            border-radius: 5px;
            width: 200px;
        }
        .search-filter select, .search-filter input[type="date"] {
            padding: 10px;
            border: 1px solid #ddd;
            border-radius: 5px;
        }
        .table {
            width: 100%;
            border-collapse: collapse;
        }
        .table th, .table td {
            padding: 15px;
            text-align: left;
            border-bottom: 1px solid #ddd;
        }
        .table th {
            background-color: #f5f7fa;
            font-weight: 500;
        }
        .table td {
            font-size: 14px;
            color: #333;
        }
        .table .details-btn {
            background-color: #e0f0ff;
            color: #007bff;
            padding: 10px 20px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
        }
        .table .generate-report-btn {
            background-color: #28a745;
            color: #ffffff;
            padding: 10px 20px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
        }
        .pagination {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-top: 20px;
        }
        .pagination span {
            color: #999;
            font-size: 14px;
        }
        .pagination button {
            background-color: #e0f0ff;
            color: #007bff;
            padding: 10px 20px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
        }
    </style>
</head>
<body>
   <div class="container">
        <!-- Sidebar -->
        <div class="sidebar">
            <div class="logo">
                <h2>Johor TVPSS Management System</h2>
            </div>
            <div class="menu">
                <ul>
                    <li class="menu-item"><a href="AdminDashboardServlet">Dashboard</a></li>
                    <li class="menu-item active"><a href="UserManagementServlet">User Management</a></li>
                    <li class="menu-item"><a href="AdminSchoolInfoServlet">School Information</a></li>
                    <li class="menu-item"><a href="AdminEquipmentServlet">Equipment</a></li>
                    <li class="menu-item"><a href="AdminProgramServlet">Program</a></li>
                    <li class="menu-item"><a href="AdminYoutubeLinkServlet">YouTube Link</a></li>
                    <li class="menu-item"><a href="AdminLogoutServlet">Log Out</a></li>
                </ul>
            </div>
            <div class="logout">
                <a href="#">Log out</a>
            </div>
        </div>
      <div class="main-content">
            <div class="header">
                <div class="search-bar">
                    <input type="text" placeholder="Search for anything...">
                </div>
                <div class="user-info">
                    <span>Thia Malaysia</span>
                    <div class="user-avatar"></div>
                </div>
            </div>
                <div class="main-content">
     <h3>
      Program / School Program list
     </h3>
     <div class="search-filter">
      <input placeholder="Search" type="text"/>
      <div>
       <select>
        <option>
         Filter
        </option>
       </select>
       <input placeholder="DD/MM/YYYY" type="date"/>
      </div>
     </div>
     <table class="table">
      <thead>
       <tr>
        <th>
         School ID
        </th>
        <th>
         School Name
        </th>
        <th>
         Program Name
        </th>
        <th>
         Program Description
        </th>
        <th>
        </th>
       </tr>
      </thead>
      <tbody>
       <tr>
        <td>
         JEA1049
        </td>
        <td>
         SMK TAMAN UNIVERSITI
        </td>
        <td>
         Kem Jati Diri
        </td>
        <td>
         All members involved
        </td>
        <td>
         <button class="details-btn">
          Details
         </button>
        </td>
       </tr>
       <tr>
        <td>
         JEA1052
        </td>
        <td>
         SMK TANJUNG PENGELIH
        </td>
        <td>
         Gotong-royong
        </td>
        <td>
         At Pantai Air Papan
        </td>
        <td>
         <button class="details-btn">
          Details
         </button>
        </td>
       </tr>
       <tr>
        <td>
         JEA1054
        </td>
        <td>
         SMK SRI TERBAU
        </td>
        <td>
         Lawatan ke sekolah
        </td>
        <td>
         At SMK Tanjung Pengelih
        </td>
        <td>
         <button class="details-btn">
          Details
         </button>
        </td>
       </tr>
       <tr>
        <td>
         JEA1049
        </td>
        <td>
         SMK TAMAN UNIVERSITI
        </td>
        <td>
         Latih tubi SPM
        </td>
        <td>
         At Dewan Taman Universiti
        </td>
        <td>
         <button class="details-btn">
          Details
         </button>
        </td>
       </tr>
       <tr>
        <td>
         JEA1051
        </td>
        <td>
         SMK TAMAN MUTIARA RINI 2
        </td>
        <td>
         Lawatan ke universiti
        </td>
        <td>
         At UTM, Johor
        </td>
        <td>
         <button class="details-btn">
          Details
         </button>
        </td>
       </tr>
       <tr>
        <td>
         JEA1053
        </td>
        <td>
         SMK SRI TERBAU
        </td>
        <td>
         Perniagaan Keusahawanan
        </td>
        <td>
         All members and other school students
        </td>
        <td>
         <button class="details-btn">
          Details
         </button>
        </td>
       </tr>
      </tbody>
     </table>
     <div class="pagination">
      <span>
       Showing 1 to 6 of 3000 entries
      </span>
      <div>
       <button>
        Previous
       </button>
       <button>
        Next
       </button>
      </div>
     </div>
    </div>
      </div>
   </div>
</body>
</html>
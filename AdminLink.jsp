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
        }
        .header input {
            width: 300px;
            padding: 8px;
            border: 1px solid #ddd;
            border-radius: 4px;
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
        .main-content {
            background-color: #ffffff;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
            margin-top: 20px;
        }
        .main-content h3 {
            font-size: 18px;
            margin-bottom: 20px;
        }
        .search-bar {
            display: flex;
            align-items: center;
            margin-bottom: 20px;
        }
        .search-bar input {
            width: 200px;
            padding: 8px;
            border: 1px solid #ddd;
            border-radius: 4px;
            margin-right: 10px;
        }
        .search-bar button {
            padding: 8px 12px;
            border: 1px solid #ddd;
            border-radius: 4px;
            background-color: #ffffff;
            cursor: pointer;
        }
        .search-bar button i {
            margin-right: 5px;
        }
        .table-container {
            overflow-x: auto;
        }
        table {
            width: 100%;
            border-collapse: collapse;
            margin-bottom: 20px;
        }
        table th, table td {
            padding: 12px;
            border: 1px solid #ddd;
            text-align: left;
        }
        table th {
            background-color: #f5f7fa;
        }
        .btn {
            padding: 8px 12px;
            border: none;
            border-radius: 4px;
            cursor: pointer;
        }
        .btn-green {
            background-color: #28a745;
            color: #ffffff;
        }
        .btn-blue {
            background-color: #007bff;
            color: #ffffff;
        }
        .pagination {
            display: flex;
            justify-content: space-between;
            align-items: center;
        }
        .pagination span {
            font-size: 14px;
            color: #666;
        }
        .pagination .btn {
            background-color: #ffffff;
            border: 1px solid #ddd;
            color: #333;
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
               <div class="content">
    <div class="main-content">
     <h3>
      YouTube link / YouTube link list
     </h3>
     <div class="search-bar">
      <input placeholder="Search" type="text"/>
      <button>
       <i class="fas fa-filter">
       </i>
       Filter
      </button>
      <input placeholder="DD/MM/YYYY" type="text"/>
     </div>
     <div class="table-container">
      <table>
       <thead>
        <tr>
         <th>
          Links
         </th>
         <th>
          Title Name
         </th>
         <th>
         </th>
        </tr>
       </thead>
       <tbody>
        <tr>
         <td>
          http://localhost
         </td>
         <td>
          Vlog Hari Kantin SMK Taman Universiti
         </td>
         <td>
          <button class="btn btn-blue">
           Details
          </button>
         </td>
        </tr>
        <tr>
         <td>
          http://localhost
         </td>
         <td>
          Video Pertandingan Debat SMK Taman Universiti
         </td>
         <td>
          <button class="btn btn-blue">
           Details
          </button>
         </td>
        </tr>
        <tr>
         <td>
          http://localhost
         </td>
         <td>
          Video Temuramah Pengetua SMK Taman Universiti
         </td>
         <td>
          <button class="btn btn-blue">
           Details
          </button>
         </td>
        </tr>
        <tr>
         <td>
          http://localhost
         </td>
         <td>
          Rakaman Hari Sukon SMK Taman Universiti
         </td>
         <td>
          <button class="btn btn-blue">
           Details
          </button>
         </td>
        </tr>
        <tr>
         <td>
          http://localhost
         </td>
         <td>
          Rakaman Ujibakat Wartawan SMK Taman Universiti
         </td>
         <td>
          <button class="btn btn-blue">
           Details
          </button>
         </td>
        </tr>
        <tr>
         <td>
          http://localhost
         </td>
         <td>
          Video Ucapan Hari Guru SMK Taman Universiti
         </td>
         <td>
          <button class="btn btn-blue">
           Details
          </button>
         </td>
        </tr>
       </tbody>
      </table>
     </div>
     <div class="pagination">
      <span>
       Showing 1 to 6 of 3000 entries
      </span>
      <div>
       <button class="btn">
        Previous
       </button>
       <button class="btn">
        Next
       </button>
      </div>
     </div>
    </div>
   </div>
      </div>
   </div>
</body>
</html>
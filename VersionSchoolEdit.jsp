<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>School Information</title>
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
            background-color: #FFFFFF;
            padding: 10px 20px;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
        }
        .header h1 {
            font-size: 18px;
            margin: 0;
        }
        .header .search-bar {
            display: flex;
            align-items: center;
        }
        .header .search-bar input {
            padding: 5px 10px;
            border: 1px solid #CCC;
            border-radius: 4px;
            margin-right: 10px;
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
        }
        .main-content {
            background-color: #FFFFFF;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
            position: relative;
        }
        .main-content h2 {
            font-size: 20px;
            margin-bottom: 20px;
        }
        .school-details, .status-info, .equipment-summary, .program-offer, .youtube-links, .upgrade-request {
            margin-bottom: 20px;
        }
        .school-details img {
            width: 100px;
            height: 100px;
            margin-bottom: 10px;
        }
        .school-details table, .status-info table, .equipment-summary table, .program-offer table, .youtube-links table {
            width: 100%;
            border-collapse: collapse;
        }
        .school-details table td, .status-info table td, .equipment-summary table td, .program-offer table td, .youtube-links table td {
            padding: 8px;
            border: 1px solid #CCC;
        }
        .status-info table td:nth-child(2), .equipment-summary table td:nth-child(2) {
            text-align: right;
        }
        .status-info table td:nth-child(2) {
            color: green;
        }
        .status-info table td:nth-child(2).none {
            color: red;
        }
        .button {
            display: inline-block;
            padding: 10px 20px;
            background-color: #28A745;
            color: #FFFFFF;
            text-align: center;
            border-radius: 4px;
            text-decoration: none;
        }
        .close-button {
            display: inline-block;
            padding: 10px 20px;
            background-color: #007BFF;
            color: #FFFFFF;
            text-align: center;
            border-radius: 4px;
            text-decoration: none;
        }
        .dropdown {
            position: absolute;
            top: 20px;
            right: 20px;
        }
        .update-button {
            display: inline-block;
            padding: 10px 20px;
            background-color: #28A745;
            color: #FFFFFF;
            text-align: center;
            border-radius: 4px;
            text-decoration: none;
            position: absolute;
            bottom: 20px;
            right: 20px;
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
                    <li class="menu-item"><a href="UserManagementServlet">User Management</a></li>
                    <li class="menu-item active"><a href="AdminSchoolInfoServlet">School Information</a></li>
                    <li class="menu-item"><a href="AdminEquipmentServlet">Equipment</a></li>
                    <li class="menu-item"><a href="AdminProgramServlet">Program</a></li>
                    <li class="menu-item"><a href="AdminYoutubeLinkServlet">YouTube Link</a></li>
                    <li class="menu-item"><a href="LogoutServlet">Log Out</a></li>
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
     <h2>
      School Information / School List / Details
     </h2>
     <div class="dropdown">
      <label for="school-version">
       Update School Version:
      </label>
      <select id="school-version" name="school-version">
       <option value="1">
        1
       </option>
       <option value="2">
        2
       </option>
       <option value="3">
        3
       </option>
      </select>
     </div>
     <div class="school-details">
      <h3>
       School Information Details
      </h3>
      <table>
       <tr>
        <td>
         School Code:
        </td>
        <td>
         JEA1049
        </td>
       </tr>
       <tr>
        <td>
         School Logo:
        </td>
        <td>
         <img alt="School logo" height="100" src="https://storage.googleapis.com/a1aa/image/I1pCKvXVBwaDG58hkezTfmf15a1hm5dBy8GX1EJvMxQp4WmnA.jpg" width="100"/>
        </td>
       </tr>
       <tr>
        <td>
         School Name:
        </td>
        <td>
         SMK TAMAN UNIVERSITI
        </td>
       </tr>
       <tr>
        <td>
         School Type:
        </td>
        <td>
         SMK
        </td>
       </tr>
       <tr>
        <td>
         School Version:
        </td>
        <td>
         1
        </td>
       </tr>
       <tr>
        <td>
         Headmaster:
        </td>
        <td>
         Mr.
        </td>
       </tr>
       <tr>
        <td>
         Total Student:
        </td>
        <td>
         2886
        </td>
       </tr>
       <tr>
        <td>
         Total Teacher:
        </td>
        <td>
         168
        </td>
       </tr>
       <tr>
        <td>
         No. Tel:
        </td>
        <td>
         6075202828
        </td>
       </tr>
       <tr>
        <td>
         Address:
        </td>
        <td>
         Jalan Pendidikan, Taman Universiti
        </td>
       </tr>
       <tr>
        <td>
         State:
        </td>
        <td>
         Johor
        </td>
       </tr>
       <tr>
        <td>
         District:
        </td>
        <td>
         Skudai
        </td>
       </tr>
      </table>
     </div>
     <div class="status-info">
      <h3>
       Status Information
      </h3>
      <table>
       <tr>
        <td>
         Have corner / mini studio to streaming
        </td>
        <td>
         YES
        </td>
       </tr>
       <tr>
        <td>
         Recording in school
        </td>
        <td>
         YES
        </td>
       </tr>
       <tr>
        <td>
         Recording outside of school
        </td>
        <td class="none">
         NONE
        </td>
       </tr>
       <tr>
        <td>
         Green screen technology
        </td>
        <td>
         YES
        </td>
       </tr>
       <tr>
        <td>
         Collaborate with external agencies
        </td>
        <td class="none">
         NONE
        </td>
       </tr>
       <tr>
        <td>
         Using YouTube to upload the link
        </td>
        <td>
         YES
        </td>
       </tr>
      </table>
     </div>
     <div class="equipment-summary">
      <h3>
       Equipment Summary
      </h3>
      <table>
       <tr>
        <td>
         Level: Beginner
        </td>
        <td>
         <ul>
          <li>
           Smartphone
          </li>
          <li>
           External Mic (Lavalier / Clip Mic)
          </li>
          <li>
           Mobile Lighting
          </li>
          <li>
           Monopod
          </li>
          <li>
           Ring Light
          </li>
         </ul>
        </td>
       </tr>
      </table>
     </div>
     <div class="program-offer">
      <h3>
       Newest Program Offer
      </h3>
      <table>
       <tr>
        <td>
         Program
        </td>
        <td>
         Program Start Date
        </td>
        <td>
         Program End Date
        </td>
       </tr>
       <tr>
        <td>
         Telegram Bot For Beginners Using Python And Replit
        </td>
        <td>
         3 JUNE 2024
        </td>
        <td>
         5 JUNE 2024
        </td>
       </tr>
       <tr>
        <td>
         Taming The TimeStream: Better Time-Series Analysis With Bqml
        </td>
        <td>
         6 JUNE 2024
        </td>
        <td>
         8 JUNE 2024
        </td>
       </tr>
       <tr>
        <td>
         Google Cloud Fundamentals
        </td>
        <td>
         7 JUNE 2024
        </td>
        <td>
         9 JUNE 2024
        </td>
       </tr>
       <tr>
        <td>
         Gamuda Sharing Bridging Construction And Tech
        </td>
        <td>
         7 JUNE 2024
        </td>
        <td>
         7 JUNE 2024
        </td>
       </tr>
      </table>
     </div>
     <div class="youtube-links">
      <h3>
       Most Popular YouTube Link
      </h3>
      <table>
       <tr>
        <td>
         Title
        </td>
        <td>
         Link
        </td>
       </tr>
       <tr>
        <td>
         13 Everyday Habits That Make You Smarter
        </td>
        <td>
         <a href="https://www.youtube.com/watch?v=N9uIF6gL0XE">
          https://www.youtube.com/watch?v=N9uIF6gL0XE
         </a>
        </td>
       </tr>
       <tr>
        <td>
         27 Facts That Will Make You Question Your Existence
        </td>
        <td>
         <a href="https://www.youtube.com/watch?v=RjQqWgQp2to">
          https://www.youtube.com/watch?v=RjQqWgQp2to
         </a>
        </td>
       </tr>
       <tr>
        <td>
         Learn common words in French with pictures
        </td>
        <td>
         <a href="https://www.youtube.com/watch?v=J6w0wFzFQ4">
          https://www.youtube.com/watch?v=J6w0wFzFQ4
         </a>
        </td>
       </tr>
       <tr>
        <td>
         15 Psychological Facts That Will Blow Your Mind
        </td>
        <td>
         <a href="https://www.youtube.com/watch?v=REz_BkxF0">
          https://www.youtube.com/watch?v=REz_BkxF0
         </a>
        </td>
       </tr>
      </table>
     </div>
     <div class="upgrade-request">
      <h3>
       School Version Upgrade Request
      </h3>
      <p>
       Proof: <a href="#">Download</a>
      </p>
     </div>
     <a class="update-button" href="#">
      Update Version
     </a>
     <a class="close-button" href="#">
      Close
     </a>
    </div>
   </div>
      </div>
   </div>
</body>
</html>
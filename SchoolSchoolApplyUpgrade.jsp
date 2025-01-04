<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Apply Update School Version</title>
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

        .form-container {
            background-color: #ffffff;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 2px 8px rgba(0, 0, 0, 0.1);
        }

        .form-group {
            margin-bottom: 20px;
        }

        .form-group label {
            font-size: 16px;
            font-weight: 500;
        }

        .form-group select, 
        .form-group input[type="text"], 
        .form-group textarea {
            width: 100%;
            padding: 10px;
            font-size: 14px;
            border: 1px solid #dcdcdc;
            border-radius: 6px;
        }

        .form-group textarea {
            resize: none;
            height: 100px;
        }

        .document-list {
            margin-top: 20px;
            border: 1px solid #dcdcdc;
            border-radius: 6px;
            padding: 10px;
            background-color: #f9f9f9;
        }

        .document-list table {
            width: 100%;
            border-collapse: collapse;
        }

        .document-list table th, 
        .document-list table td {
            text-align: left;
            padding: 10px;
        }

        .document-list table th {
            background-color: #f1f5ff;
        }

        .document-list table tr:nth-child(even) {
            background-color: #f9f9f9;
        }

        .document-list table tr:hover {
            background-color: #f1f1f1;
        }

        .actions {
            display: flex;
            justify-content: flex-end;
            gap: 10px;
            margin-top: 20px;
        }

        .btn {
            text-decoration: none;
            color: #ffffff;
            padding: 10px 20px;
            border-radius: 4px;
            font-size: 14px;
            border: none;
            cursor: pointer;
        }

        .btn.add-btn {
            background-color: #2ecc71;
        }

        .btn.add-btn:hover {
            background-color: #27ae60;
        }

        .btn.cancel-btn {
            background-color: #e74c3c;
        }

        .btn.cancel-btn:hover {
            background-color: #c0392b;
        }

        /* New Apply Button */
        .btn.apply-btn {
            background-color: #3498db;
        }

        .btn.apply-btn:hover {
            background-color: #2980b9;
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
            background-color: #fff;
            padding: 20px;
            border-radius: 8px;
            width: 400px;
            box-shadow: 0 2px 8px rgba(0, 0, 0, 0.2);
        }

        .modal-content h3 {
            margin-bottom: 20px;
        }

        .modal-content input[type="file"] {
            width: 100%;
            margin-bottom: 20px;
        }

        .modal-actions {
            display: flex;
            justify-content: flex-end;
            gap: 10px;
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
            <li><a href="SchoolController?action=Program">Program</a></li>
            <li><a href="SchoolController?action=YoutubeLink">YouTube Link</a></li>
            <li><a href="SchoolController?action=ApplyUpgrade" class="active">Apply Upgrade</a></li>
            <li><a href="SchoolController?action=Application">Status Application</a></li>
            <li><a href="SchoolController?action=Logout">Log out</a></li>
        </ul>

    </div>
    <div class="main">
        <div class="header">
            <h1>Apply Update School Version</h1>
        </div>
        <div class="form-container">
            <div class="form-group">
                <label for="recent-version">School Recent Version</label>
                <select id="recent-version">
                    <option>Level - 0</option>
                    <option>Level - 1</option>
                    <option>Level - 2</option>
                </select>
            </div>
            <div class="form-group">
                <label for="upgrade-version">Upgrade Level Version</label>
                <select id="upgrade-version">
                    <option>Level - I</option>
                    <option>Level - II</option>
                    <option>Level - III</option>
                </select>
            </div>
            <div class="form-group">
                <label for="message">Message</label>
                <textarea id="message" placeholder="Write here..."></textarea>
            </div>
            <div class="document-list">
                <label>List Document</label>
                <table id="attachment-table">
                    <thead>
                        <tr>
                            <th>Documents</th>
                            <th></th>
                        </tr>
                    </thead>
                    <tbody>
                        <!-- Dynamic rows will be added here -->
                    </tbody>
                </table>
            </div>
            <div class="actions">
                <button class="btn add-btn" id="add-attachment-btn">Add Attachment</button>
                <button class="btn cancel-btn">Cancel</button>
                <!-- Apply Button -->
                <button class="btn apply-btn" id="apply-btn">Apply</button>
            </div>
        </div>
    </div>

    <!-- Modal -->
    <div class="modal" id="attachment-modal">
        <div class="modal-content">
            <h3>Add Attachment</h3>
            <input type="file" id="file-input">
            <div class="modal-actions">
                <button class="btn add-btn" id="save-attachment-btn">Save</button>
                <button class="btn cancel-btn" id="cancel-modal-btn">Cancel</button>
            </div>
        </div>
    </div>

    <script>
        const addAttachmentBtn = document.getElementById('add-attachment-btn');
        const modal = document.getElementById('attachment-modal');
        const cancelModalBtn = document.getElementById('cancel-modal-btn');
        const saveAttachmentBtn = document.getElementById('save-attachment-btn');
        const fileInput = document.getElementById('file-input');
        const attachmentTable = document.getElementById('attachment-table').querySelector('tbody');

        // Show modal
        addAttachmentBtn.addEventListener('click', () => {
            modal.style.display = 'flex';
        });

        // Hide modal
        cancelModalBtn.addEventListener('click', () => {
            modal.style.display = 'none';
            fileInput.value = ''; // Clear file input
        });

        // Save attachment
        saveAttachmentBtn.addEventListener('click', () => {
            const file = fileInput.files[0];
            if (file) {
                const row = document.createElement('tr');
                const cell = document.createElement('td');
                cell.textContent = file.name;
                row.appendChild(cell);
                const removeCell = document.createElement('td');
                const removeBtn = document.createElement('button');
                removeBtn.textContent = 'Remove';
                removeBtn.onclick = () => row.remove();
                removeCell.appendChild(removeBtn);
                row.appendChild(removeCell);
                attachmentTable.appendChild(row);
                modal.style.display = 'none';
            } else {
                alert('Please select a file.');
            }
        });

        // Apply Button Confirmation
        const applyBtn = document.getElementById('apply-btn');
        applyBtn.addEventListener('click', () => {
            const confirmApply = confirm('Are you sure you want to apply?');
            if (confirmApply) {
                alert('Update Applied Successfully');
                // Here you can add any further actions like submitting the form
            }
        });
    </script>
</body>
</html>

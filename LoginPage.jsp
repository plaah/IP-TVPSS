<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login Page</title>
    <style>
        /* General Reset */
        body, html {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: 'Poppins', sans-serif;
        }

        body {
            display: flex;
            justify-content: center;
            align-items: center;
            min-height: 100vh;
            background: #f7f9fc;
        }

        .login-container {
            display: flex;
            max-width: 900px;
            width: 100%;
            background: #ffffff;
            border-radius: 15px;
            overflow: hidden;
            box-shadow: 0 8px 20px rgba(0, 0, 0, 0.1);
            animation: fadeIn 0.6s ease-in-out forwards;
        }

        .image-container {
            flex: 1;
            background: #eaf2f8;
            display: flex;
            justify-content: center;
            align-items: center;
            padding: 40px;
            text-align: center;
            border-right: 1px solid #dfe6ed;
        }

        .image-container h2 {
            font-size: 26px;
            color: #4a4a4a;
            margin-bottom: 10px;
        }

        .image-container p {
            font-size: 14px;
            color: #6c757d;
        }

        .form-container {
            flex: 1;
            padding: 40px;
            display: flex;
            flex-direction: column;
            justify-content: center;
        }

        h1 {
            margin: 0 0 10px;
            color: #4a4a4a;
            font-size: 28px;
        }

        p {
            margin: 0 0 20px;
            color: #6c757d;
        }

        form {
            display: flex;
            flex-direction: column;
            gap: 15px;
        }

        label {
            font-size: 14px;
            color: #6c757d;
        }

        input[type="email"],
        input[type="password"] {
            width: 100%;
            padding: 12px;
            border: 1px solid #ced4da;
            border-radius: 8px;
            font-size: 14px;
            background: #f8f9fa;
            transition: all 0.3s ease;
        }

        input[type="email"]:focus,
        input[type="password"]:focus {
            outline: none;
            border-color: #5c9dff;
            background: #ffffff;
            box-shadow: 0 4px 8px rgba(92, 157, 255, 0.2);
        }

        .checkbox-forgot {
            display: flex;
            justify-content: space-between;
            align-items: center;
            font-size: 14px;
        }

        .checkbox-forgot a {
            text-decoration: none;
            color: #5c9dff;
            transition: color 0.3s ease;
        }

        .checkbox-forgot a:hover {
            color: #3a73d9;
        }

        button {
            padding: 12px;
            background: #5c9dff;
            color: #ffffff;
            border: none;
            border-radius: 8px;
            cursor: pointer;
            font-size: 16px;
            transition: background 0.3s ease;
        }

        button:hover {
            background: #3a73d9;
        }

        .back-link {
            display: block;
            margin-top: 20px;
            text-align: center;
            color: #5c9dff;
            text-decoration: none;
            font-size: 14px;
            transition: color 0.3s ease;
        }

        .back-link:hover {
            color: #3a73d9;
        }

        .error-message {
            color: #e74c3c;
            text-align: center;
            margin-bottom: 15px;
        }

        @keyframes fadeIn {
            from {
                opacity: 0;
            }
            to {
                opacity: 1;
            }
        }
    </style>
</head>
<body>
    <div class="login-container">
        <div class="image-container">
            <div>
                <h2>Welcome Back</h2>
                <p>Access your account securely and effortlessly.</p>
            </div>
        </div>
        <div class="form-container">
            <h1>Log In</h1>
            <p>Please enter your credentials to proceed.</p>

            <% 
                String error = request.getParameter("error");
                if ("invalid".equals(error)) {
            %>
                <p class="error-message">Invalid email or password. Please try again.</p>
            <% 
                }
            %>

            <form action="SchoolController" method="POST">
                <label for="email">Email Address</label>
                <input type="email" id="email" name="email" required placeholder="Enter your email">

                <label for="password">Password</label>
                <input type="password" id="password" name="password" required placeholder="Enter your password">

                <div class="checkbox-forgot">
                    <label>
                        <input type="checkbox" id="terms" name="terms"> Remember me
                    </label>
                    <a href="#">Forgot Password?</a>
                </div>

                <button type="submit">Log in</button>
            </form>
            <a href="#" class="back-link">Back to Homepage</a>
        </div>
    </div>
</body>
</html>

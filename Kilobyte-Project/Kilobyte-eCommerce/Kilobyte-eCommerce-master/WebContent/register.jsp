<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>User Registration</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            background-color: #f8f9fa;
        }

        .card {
            border-radius: 10px;
        }

        .container {
            margin-top: 50px;
        }

        .form-control:focus {
            box-shadow: none;
            border-color: #007bff;
        }

        .btn-primary {
            background-color: #007bff;
            border-color: #007bff;
        }

        .btn-primary:hover {
            background-color: #0056b3;
            border-color: #0056b3;
        }

        .card-header {
            background-color: #007bff;
            color: white;
        }

        .footer-link {
            text-decoration: none;
            color: #007bff;
        }

        .footer-link:hover {
            color: #0056b3;
        }
    </style>
</head>

<body>
    <div class="container">
        <div class="card shadow-lg p-4 w-50 mx-auto my-5">
            <div class="card-header text-center">
                <h4>User Registration</h4>
            </div>
            <div class="card-body">
                <form action="user-register" method="post">
                    <div class="form-group mb-3">
                        <label for="name" class="form-label">Full Name</label>
                        <input type="text" id="name" name="name" class="form-control" placeholder="Enter your full name" required>
                    </div>
                    <div class="form-group mb-3">
                        <label for="email" class="form-label">Email Address</label>
                        <input type="email" id="email" name="email" class="form-control" placeholder="Enter your email" required>
                    </div>
                    <div class="form-group mb-3">
                        <label for="password" class="form-label">Password</label>
                        <input type="password" id="password" name="password" class="form-control" placeholder="Enter your password" required>
                    </div>
                    <div class="text-center mb-3">
                        <button type="submit" class="btn btn-primary w-100">Register</button>
                    </div>
                </form>
            </div>
            <div class="card-footer text-center">
                <small>Already have an account? <a href="login.jsp" class="footer-link">Login here</a></small>
            </div>
        </div>
    </div>

</body>

</html>

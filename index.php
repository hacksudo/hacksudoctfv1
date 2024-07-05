<?php
session_start();

if ($_SERVER["REQUEST_METHOD"] == "POST") {
    $username = $_POST['username'];
    $password = $_POST['password'];

    // Valid credentials
    $valid_username = "admin";
    $valid_password = "admin";

    if ($username == $valid_username && $password == $valid_password) {
        $_SESSION['username'] = $username;
        header("Location: welcome.php");
        exit();
    } else {
        $error = "Invalid username or password";
    }
}
?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login</title>
    <link rel="stylesheet" href="styles.css">
</head>
<body>
    <div class="login-container">
        <form action="index.php" method="post">
            <h2>Login</h2>
            <?php if (!empty($error)) { ?>
                <div class="error"><?php echo $error; ?></div>
            <?php } ?>
            <label for="username">Username:</label>
            <input type="text" id="username" name="username" required>
            <label for="password">Password:</label>
            <input type="password" id="password" name="password" required>
            <button type="submit">Login</button>
        </form>
    </div>
</body>
</html>

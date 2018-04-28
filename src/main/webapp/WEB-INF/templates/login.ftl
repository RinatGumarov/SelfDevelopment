<!DOCTYPE html>
<html>
<head>
    <title>Sign in</title>
    <style>
        body {
            margin: auto;
            background: url('https://s3.amazonaws.com/skinner-production/stories/featured_images/000/010/466/large/motivation1.jpg?1499679561') no-repeat;
            background-size: cover;
        }

        .wrapper {
            width: 320px;
            height: 400px;
            position: absolute;
            top: 50%;
            left: 50%;
            transform: translate(-50%, -50%);
            background-color: #d1d1d1;
            border-radius: 10px;
            opacity: 0.9;
        }

        .login {
            position: relative;
            height: 285px;
        }

        .register {
            position: relative;
            height: 85px;
        }

        .form-header {
            width: 100%;
            height: 15%;
            text-align: center;
            font-size: 1.5em;
            color: #cfd1d3;
            background-color: #3f3f3f;
            border-radius: 10px 10px 0px 0px;
            position: relative;
        }

        .input-row {
            width: 100%;
            height: 25%;
            position: relative;
        }

        .input-row input {
            border-radius: 3px;
            width: 84%;
            margin: auto;
            position: absolute;
            top: 50%;
            left: 50%;
            transform: translate(-50%);
            background-color: #ffffff;
            font-size: 0.95em;
            border: 0px;
            padding: 3px 6px;
            color: #3f3f3f;
        }

        .submit-row {
            width: 100%;
            height: 25%;
            position: relative;
        }

        .submit-row input {
            border-radius: 3px;
            width: 30%;
            margin: auto;
            position: absolute;
            top: 50%;
            left: 8%;
            transform: translate(0, -50%);
            background-color: #207e03;
            font-size: 0.95em;
            border: 0px;
            padding: 8px 5px;
            color: #cfd1d3;
        }

        .register .submit-row {
            margin: auto;
            position: absolute;

            top: 50%;
            color: #3f3f3f;
        }

        hr {
            width: 92%;
            margin: auto;
        }

        span {
            margin: auto;
            position: absolute;

            left: 8%;
            color: #3f3f3f;
        }

        h6 {
            margin: auto;
            position: absolute;
            top: 8%;
            left: 8%;
            color: #3f3f3f;
            font-size: 1.0em;
        }

        h5 {
            margin: auto;
            position: absolute;
            top: 50%;
            left: 50%;
            transform: translate(-50%, -50%);
        }

        .error-mes {
            width: 100%;
            height: 10%;
            position: relative;
        }

        .error-mes span {
            color: red;
        }

        .navigator {
            width: 100%;
            min-width: 440px;
            min-height: 70px;
            background-color: #31302B;
            opacity: 0.95;
        }

        .navigator .item {
            text-decoration: none;
            color: white;
            padding: 23px 18px;
            font-size: 1.2em;
        }

        .navigator .item:nth-child(1) {
            background-color: black;
        }
    </style>
</head>
<body>
<div class="wrapper">
    <form class="login" method="post" action="/login">
        <div class="form-header"><h5>Sign in</h5></div>

        <div class="input-row">
            <h6>Login</h6>
            <input type="text" name="login" placeholder="Username"/>
        </div>

        <div class="input-row">
            <h6>Password</h6>
            <input type="password" name="password" placeholder="Password"/>
        </div>

        <#if error??>
            <div class="form-group error" id="login-error">
                <div class="error-mes">
                    <span>${SPRING_SECURITY_LAST_EXCEPTION.message}</span>
                </div>
            </div>
        </#if>


        <div class="submit-row">
            <input type="submit" value="Sign in"/>
        </div>
    </form>
    <hr>
    <br>
    <form class="register" method="GET" action="/register">
        <span>Don't have an account? Register!</span>
        <div class="submit-row">
            <input type="submit" value="Register"/>
        </div>
    </form>
</div>
</body>
</html>
<!DOCTYPE html>
<html>
<head>
    <title>Registration</title>
    <style>
        body {
            margin: auto;
            background: url('https://s3.amazonaws.com/skinner-production/stories/featured_images/000/010/466/large/motivation1.jpg?1499679561') no-repeat;
            background-size: cover;
        }

        .navigator {
            width: 100%;
            min-width: 440px;
            min-height: 70px;
            background-color: #31302B;
            opacity: 0.95;
        }
        .navigator .item {
            text-decoration:none;
            color: white;
            padding: 23px 18px;
            font-size: 1.2em;
        }
        .left{float: left}
        .item:hover {color: #9fcdff}
        .navigator .item:nth-child(1) {background-color: black;}

        .wrapper {
            width: 320px;
            height: 400px;
            position: absolute;
            top: 50%;
            left: 50%;
            transform: translate(-50%, -50%);
            background-color: #0f1113;
            border-radius: 10px;
            opacity: 0.9;
        }
        .login {
            position: relative;
            height: 285px;
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
            background-color: #3f3f3f;
            font-size: 0.95em;
            border: 0px;
            padding: 3px 6px;
            color: #cfd1d3;
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
            color: #cfd1d3;
        }
        hr {
            width: 92%;
            margin: auto;
        }
        span {
            margin: auto;
            position: absolute;
            left: 8%;
            color: #cfd1d3;
        }
        h6 {
            margin: auto;
            position: absolute;
            top: 8%;
            left: 8%;
            color: #cfd1d3;
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
    </style>
</head>
<body>

<div class="navigator">
    <a class="item left" href="/home">Home</a>
    <a class="item left" href="/tasks">Tours</a>
</div>

<div class="wrapper">
    <form class="login" method="post" action="/register">
        <div class="form-header"><h5>Sign up</h5></div>

        <div class="input-row">
            <h6>Login</h6>
            <input type="text" name="login" placeholder="Username"/>
        </div>

        <div class="input-row">
            <h6>Password</h6>
            <input type="password" name="password" placeholder="Password"/>
        </div>

        <div class="input-row">
            <h6>Repeat password</h6>
            <input type="password" name="passwordRepeat" placeholder=""/>
        </div>

        <#if error??>
            <div class="error-mes">
                <span>${error}</span>
            </div>
        </#if>
        <div class="submit-row">
            <input type="submit" value="Register"/>
        </div>
    </form>
</div>
</body>
</html>
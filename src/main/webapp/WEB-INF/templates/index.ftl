<!doctype html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <title>Self Development</title>
    <style>
        html, body {
            height: 100%
        }

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
            text-decoration: none;
            color: white;
            padding: 23px 18px;
            font-size: 1.2em;
        }

        .left {
            float: left
        }

        .right {
            float: right
        }

        .item:hover {
            color: #9fcdff
        }

        .navigator .item:nth-child(1) {
            background-color: black;
        }

        .info {
            width: 470px;
            height: 250px;
            position: absolute;
            top: 50%;
            left: 50%;
            transform: translate(-50%, -50%);
            background-color: white;
            opacity: 0.9;
            border-radius: 10px;
            padding: 15px;
            font-size: 20px;
            text-align: center;
        }
    </style>
</head>
<body>
<div class="navigator">
    <a class="item left" href="/home">Home</a>

    <#if Session.SPRING_SECURITY_CONTEXT??>
        <a class="item left" href="/tasks">Upcoming Tasks</a>
        <a class="item left" href="/tasks/all">All Tasks</a>
    </#if>

    <#if !Session.SPRING_SECURITY_CONTEXT??>
        <a class="item right" href="/register">Register</a>
        <a class="item right" href="/login">Login</a>
    </#if>

    <#if Session.SPRING_SECURITY_CONTEXT??>
        <a class="item right" href="/logout">Log out</a>
    </#if>
</div>

<div class="info">
    Create tasks and mark them as done. This application will help you to plan your time, so you will develop more
    productive.
</div>

</body>
</html>
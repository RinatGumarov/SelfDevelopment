<html>
<head>
    <title>Task</title>

    <style>
        html, body {
            height: 100%
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

        .task-item {
            padding: 10px;
            border-bottom: 1px solid #ccc;
        }
    </style>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

    <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
    <link rel="stylesheet" href="/resources/demos/style.css">
    <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
    <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/css/bootstrap-theme.min.css">
</head>
<body>
<div class="navigator">
    <a class="item left" href="/">Home</a>
    <a class="item left" href="/tasks">Upcoming Tasks</a>
    <a class="item left" href="/tasks/all">All Tasks</a>
    <a class="item right" href="/logout">Log out</a>
</div>
<div class="<col>">
    <div class="container">
        <div class="row">
            <div class="col-md-4">
            </div>
            <div class="col-md-4">
                <form class="form" id="addHC" action="/tasks/${task.id}/edit" method="post">
                    <div class="col-md-12">
                        <div class="form-group" id="nameGroup">
                            <label for="nameInput">Title</label>
                            <input type="text" autocomplete="off" name="title" class="form-control" id="nameInput"
                                   value="${task.title}">
                        </div>
                        <div class="form-group" id="addressGroup">
                            <label for="addressInput">Text</label>
                            <textarea name="text" class="form-control " id="addressInput">${task.text}</textarea>
                        </div>
                        <div class="form-group" id="dateGroup">
                            <label for="dateInput">Expires At</label>
                            <input type="text" autocomplete="off" name="expiresAt"
                                   value="${format.format(task.expiresAt)}" class="form-control "
                                   id="dateInput">
                        </div>
                        <div class="form-group" id="radioGroup">
                            <label for="dateInput">Importance</label> <br>
                            <input type="radio" value="1" name="importance" checked> Low <br>
                            <input type="radio" value="2" name="importance"> Medium <br>
                            <input type="radio" value="3" name="importance"> High <br>

                        </div>
                        <input hidden name="id" value="${task.id}">
                    </div>

                    <br>
                    <button type="submit" class="btn btn-primary btn-block margin-bottom" id="save-btn">Save
                    </button>
                </form>
            </div>
            <div class="col-md-4">
            </div>
        </div>
        <div class="col-md-2"></div>
        <div class="col-md-8">
            <div class="row">
                <p>Comments</p>
                <#if comments?? && comments?has_content>
                    <div class="list-group">
                    <#list comments as comment>
                        <div class="list-group-item">
                            <div class="row">
                                <div class="col-md-12">
                                    <a href="#"
                                       style="color: #31302B; font-size: small">${format.format(comment.date)}</a>
                                    <p>${comment.text}</p>
                                </div>
                            </div>
                        </div>
                    </#list>
                    </div>
                <#else>
                    <p>There are no comments yet.</p>
                </#if>

            </div>
            <div class="row">
                <form class="form" action="/comment/${task.id}/add" method="post">
                    <div class="form-group" id="addressGroup">
                        <textarea name="text" placeholder="Add you comment here" class="form-control"></textarea>
                    </div>
                    <button type="submit">Submit</button>
                </form>
            </div>
        </div>
        <div class="col-md-2"></div>
    </div>
</div>
<script>
    $(function () {
        $("#dateInput").datepicker();
    });
</script>

</body>
</html>

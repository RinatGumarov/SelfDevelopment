<html>
<head>
    <title>Available tasks</title>

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
            <div class="col-md-2">
                <div class="list-group">
                    <div class="list-group-item">
                        <a href="#" data-toggle="modal" data-target="#modal" id="addBtn">
                            <h4><i class="glyphicon glyphicon-plus"></i>New Task</h4>
                        </a>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="container">
<#if tasks?? && tasks?has_content>
<div class="list-group">
    <#list tasks as task>
        <div class="list-group-item
        <#switch task.status>
                <#case 0>
                list-group-item-success
                <#break >
                <#case 1>
                list-group-item-info
                <#break >
                <#case 2>
                list-group-item-warning
                <#break >
                <#case 3>
                list-group-item-danger
                <#break >
                <#default>
                list-group-item-info
        </#switch>
        ">
            <div class="row">
                <div class="col-md-1">
                    <a href="#">
                        <input type="checkbox" class="task-checkbox-completed"
                            <#if task.status == 0>
                                checked
                            </#if>
                        data-id="${task.id}"/></a>
                </div>
                <div class="col-md-10">
                    <a href="/tasks/${task.id}">${task.title}</a>
                    <p style="color: #31302B; font-size: small">
                        <#if task.text?length gt 100>
                        ${task.text?substring(0, 97)}...
                            <#else >
                            ${task.text}
                        </#if>
                    </p>
                </div>
                <div class="col-md-1">
                    <button id="btnDelete" type="button" class="btn btn-default btn-sm task-button-delete right"
                            data-id="${task.id}">
                        <span class="glyphicon glyphicon-remove" aria-hidden="true"></span>
                    </button>
                </div>
            </div>
        </div>
        </#list>
    </div>
    <#else >
    <p>
        There is no tasks. Try to create one!
    </p>
    </#if>
</div>
</div>
<div class="modal fade" id="modal" role="dialog">
    <!--<div class="" id="modal" role="dialog">-->
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header no-border">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span
                        aria-hidden="true">×</span></button>
            </div>
            <div class="modal-body">
                <h3 class="text-center custom-margin">New Task</h3>

                <form class="form" id="addHC" action="/tasks" method="post">
                    <div class="col-md-12">
                        <div class="form-group" id="nameGroup">
                            <label for="nameInput">Title</label>
                            <input type="text" autocomplete="off" name="title" required class="form-control" id="nameInput"
                                   maxlength="40">
                        </div>
                        <div class="form-group" id="addressGroup">
                            <label for="addressInput">Text</label>
                            <textarea name="text" class="form-control " required id="addressInput"></textarea>
                        </div>
                        <div class="form-group" id="dateGroup">
                            <label for="dateInput">Expires At</label>
                            <input type="text" autocomplete="off" required name="expiresAt" class="form-control "
                                   id="dateInput">
                        </div>
                        <div class="form-group" id="radioGroup">
                            <label for="dateInput">Importance</label> <br>
                            <input type="radio" value="1" name="importance" required> Low <br>
                            <input type="radio" value="2" name="importance" required> Medium <br>
                            <input type="radio" value="3" name="importance" required> High <br>

                        </div>
                    </div>

                    <br>
                    <button type="submit" class="btn btn-primary btn-block margin-bottom" id="save-btn">Save
                    </button>
                </form>
            </div>
        </div>
    </div>
</div>

<script>
    $('input:checkbox').change(function (e) {
        e.preventDefault();
        var EsID = $(this).attr('data-id');
        var isChecked = $(this).is(":checked") ? 1 : 0;
        console.log(EsID);
        console.log(isChecked);
        $.ajax({
            type: "POST",
            url: "/tasks/" + EsID + "/check",
            data: {"checked": isChecked}, // serializes the form's elements.
            contentType: "application/x-www-form-urlencoded",
            dataType: "text",
            success: function (data, textStatus, jqXHR) {
                console.log("good");
                location.reload();
            },
            error: function (request, status, error) {
                var val = request.responseText;
                alert("error" + val);
            }

        });
    });
    $('#btnDelete').click(function (e) {
        e.preventDefault();
        var EsID = $(this).attr('data-id');
        console.log(EsID);
        $.ajax({
            type: "DELETE",
            url: "/tasks/" + EsID,
            data: {"id": EsID}, // serializes the form's elements.
            contentType: "application/x-www-form-urlencoded",
            dataType: "text",
            success: function (data, textStatus, jqXHR) {
                console.log("good");
                location.reload();
            },
            error: function (request, status, error) {
                var val = request.responseText;
                alert("error" + val);
            }

        });
    });
</script>
<script>
    $(function () {
        $("#dateInput").datepicker();
    });
</script>

</body>
</html>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Login/Registration</title>
    <script  src="https://code.jquery.com/jquery-3.1.1.min.js"  integrity="sha256-hVVnYaiADRTO2PzUGmuLJr8BLUSjGIZsDYGmIJLv2b8="  crossorigin="anonymous"></script>
    <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.min.js" ></script>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
    <link rel="stylesheet" href="./css/main.css">
<!--     Compiled and minified CSS -->
<!--    <link rel="stylesheet" href="httpszz://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/css/materialize.min.css">-->
<!--     Compiled and minified JavaScript -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/js/materialize.min.js"></script>

</head>

<div class="body">
    <div class="veen">
        <div class="login-btn splits">
            <p>Already an user?</p>
            <button class="active">Login</button>
        </div>
        <div class="rgstr-btn splits">
            <p>Don't have an account?</p>
            <button>Register</button>
        </div>
        <div class="wrapper">
            <form id="login" tabindex="500" action="login" method="post">
                <div class="mail" style="padding-top: 0;margin-bottom: 0">
                    <h1>Login</h1>
                </div>
                <div class="mail">
                    <input type="text" name="uname" required>
                    <label>Username</label>
                </div>
                <div class="passwd">
                    <input type="password" name="pass" required>
                    <label>Password</label>
                </div>
                <div class="submit">
                    <button class="dark">Login</button>
                </div>
            </form>
            <form id="register" method="post" action="register" tabindex="502">
                <div class="mail" style="padding-top: 0;margin-bottom: 0">
                    <h1 style="margin-top: 0;margin-bottom: 0">Register</h1>
                </div>
                <div class="name">
                    <input id="name" type="text" name="name" class="validate" required>
                    <label>Full Name</label>
                </div>
                <div class="uid">
                    <input id="Username" type="text" class="validate" name="username" required>
                    <label>User Name</label>
                </div>
                <h5 id="username_msg"></h5>
                <div class="passwd">
                    <input id="password" type="password" name="pass" class="validate" required>
                    <label>Password</label>
                </div>
                <div class="submit">
                    <button class="dark" type="submit">Register</button>
                </div>
                <h3 id="msg"></h3>
            </form>
        </div>
    </div>
</div>

<script src="https://code.jquery.com/jquery-3.5.1.min.js" integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0=" crossorigin="anonymous"></script>
<script>
    $(document).ready(function(){
        $(".veen .rgstr-btn button").click(function(){
            $('.veen .wrapper').addClass('move');
            $('.body').css('background','#e0b722');
            $(".veen .login-btn button").removeClass('active');
            $(this).addClass('active');

        });
        $(".veen .login-btn button").click(function(){
            $('.veen .wrapper').removeClass('move');
            $('.body').css('background','#ff4931');
            $(".veen .rgstr-btn button").removeClass('active');
            $(this).addClass('active');
        });
        $("#register").on('submit',function (event) {
            event.preventDefault();
            let f = $(this).serialize();
            console.log(f);
            $.ajax({
                url : "register",
                data : f,
                type : 'POST',
                success : function (data){
                    // console.log(data);
                    if(data.trim() === "success")
                    {
                        $('#msg').html("Successfully Registered");
                        window.alert("Login With Credentials");
                    }
                    else
                    {
                        $('#msg').html("Something Went Wrong");
                    }
                },
                error : function (data) {
                    $('#msg').html("Something Went Wrong");
                }
            })
        });
        $("#Username").keyup(function () {
            let name = $(this).val();
            console.log(name);
            if(name != '')
            {
                $.ajax({
                    type: 'POST',
                    url : 'checkUser',
                    data : {username : name},
                    success : function (data) {
                        if(data.trim() === "yes")
                        {
                            $('#username_msg').html("Username Available");
                            $('#username_msg').css({"color" : "green"});
                            // console.log(data);
                        }
                        else
                        {
                            // console.log(data);
                            $('#username_msg').html("Username Unavailable");
                            $('#username_msg').css({"color" : "red"});
                        }
                    },
                    error : function (data) {
                        $('#username_msg').html("Went Wrong");
                        // $(document).getElementById('username_msg').style.color = "red";
                    }
                })
            }
        });
    });
</script>
</html>
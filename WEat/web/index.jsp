<%@ page language="java" 
         contentType="text/html; charset=windows-1256"
         pageEncoding="windows-1256"
         %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>
        <title>Home</title>
        <meta http-equiv="content-type" content="text/html; charset=utf-8" />
        <meta name="description" content="" />
        <meta name="keywords" content="" />
        <link href="http://fonts.googleapis.com/css?family=Source+Sans+Pro:300,600" rel="stylesheet" type="text/css" />
        <!--[if lte IE 8]><script src="js/html5shiv.js"></script><![endif]-->
        <script src="js/jquery.min.js"></script>
        <script src="js/jquery.dropotron.min.js"></script>
        <script src="js/skel.min.js"></script>
        <script src="js/skel-panels.min.js"></script>
        <script src="js/init.js"></script>
    <noscript>
        <link rel="stylesheet" href="css/skel-noscript.css" />
        <link rel="stylesheet" href="css/style.css" />
        <link rel="stylesheet" href="css/style-n1.css" />
    </noscript>

    <script>
        function validate() {
            var email = document.form.email.value;
            var password = document.form.password.value;
            if (email == "") {
                alert("Please Enter your Email!");
                return false;
            }
            if (password == "") {
                alert("Please Enter your Password!");
                return false;
            }
            return true;
        }
    </script>
</head>
<body class="homepage">

    <div id="header-wrapper">

        <!-- Header -->
        <div id="header" class="container">

            <!-- Logo -->
            <h1 id="logo"><a href="#">HOME</a></h1>


        </div>

        <!-- Hero -->
        <section id="hero" class="container">	
            <header>
                <h2>WEat<br />
                    Collaborative Search</h2>
            </header>
            <p>Share and Decide All Together</p>
            <ul class="actions">
                <li><a href="#login" class="button">Get started</a></li>
            </ul>
        </section>

    </div>



    <!-- Footer Wrapper -->
<section id="login">
    <div id="footer-wrapper">

        <!-- Footer -->
        <div id="footer" class="container">
            <header class="major">
                <h2>WEat</h2>
                <span>Please Log in</span>
            </header>
            <div class="row">

                <section class="12u">

                    <form name="form" action="LoginServlet" method ="POST" onsubmit="javascript:return validate();">
                        <div class="row half">
                            <div class="6u"><input type="email" class="text" name="email" placeholder="Email" required /></div>
                            <div class="6u"><input type="password" class="text" name="password" placeholder="Password" required /></div>
                        </div>

                        <div class="row half">
                            <div class="3u">
                                &nbsp
                            </div>
                            <div class="3u">
                                <ul class="actions">
                                    <li><input type="submit" class="button" value="Login"></li>


                                </ul>
                            </div>

                            <div class="2u">
                                &nbsp
                            </div>
                            <div class="4u">
                                <ul class="actions">
                                    <li><a href="register.jsp"><input type="button" class="button" value="Register"></a></li>

                                </ul>
                            </div>
                        </div>
                    </form>		
                </section>



            </div>
        </div><!--

        <!-- Copyright -->
        <div id="copyright" class="container">
            <ul class="menu">
                <li>&copy; Group Member: Jun Liu, Qianwen Li, Huan Wang.  All rights reserved.</li>
                <li>Design: Everyone</li>
            </ul>
        </div>

    </div>
</section>

</body>
</html>


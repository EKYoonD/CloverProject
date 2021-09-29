<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Gugi&display=swap" rel="stylesheet">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>main</title>

    <link href="/CSS/style.css" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.13.0/css/all.min.css" rel="stylesheet">
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script>
        $(function(){
            $('.head3').click(function(){
                $('.head2').slideToggle();
            })
        })
    </script>
    
</head>

<body>
    <!--header-->
    <header>
        <div class="container">
            <div class="head1">
                <a  onclick="location.href='main'"><i class="fas fa-home"></i></a>
                <span class="head3"><i class="far fa-caret-square-down"></i></span>
            </div>
            <nav class="head2">
                <ul>
                    <li><a onclick="location.href='about'">CLVOER</a></li>
                    <li><a onclick="location.href='qr'">MY QR</a></li>
                    <li><a onclick="location.href='order'">ORDER</a></li>
                    <li><a onclick="location.href='clover/member/board/list'">FIND & FOUND</a></li>
                    <li><a onclick="location.href='login'">JOIN</a></li>
                </ul>
            </nav>
        </div>
    </header>

    <!--contents-->
    <!--content1-->
    <section class="container1">
        <div href class="container">
            <h1>CLOVER</h1>
            <h2>WITH MY FAMILY</h2>
            
        </div>
    </section>

    <!--footer-->
    <footer>
        <div class="container">
            <div class="foot1">
                <h2>CLVOER</h2>
                <p>
                    Web Address : <a href="https://katieyoon-the-developer.tistory.com/">https://katieyoon-the-developer.tistory.com/</a>
                </p>
            </div>
            <div class="foot2">

            </div>
            <nav class="foot3">
                <div>
                    <h3>HELP</h3>
                    <ul>
                        <li><a href="#">Administrator</a></li>
                        <li><a href="#">Frequently Asked Question(s)</a></li>
                        <li><a href="#">Direct Calls</a></li>
                    </ul>
                </div>

            </nav>
        </div>
    </footer>

</body>

</html>
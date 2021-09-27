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

    <link href="/CSS/styleAbout.css" rel="stylesheet" type='text/css'>
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
                    <li><a onclick="location.href='board/list'">FIND & FOUND</a></li>
                    <li><a onclick="location.href='login'">JOIN</a></li>
                </ul>
            </nav>
        </div>
    </header>

    <!-- 컨텐츠A -->
    <section class="conA">
        <div class="container">
            <!-- 히어로 이미지 -->
            <br><br><br><br><br><br>
            <h1>CLVOER</h1>
            <p>CLVOER를 방문하신 여러분을 환영합니다</p>
        </div>
    </section>

    <!-- 컨텐츠B -->
    <section class="conB">
        <div style="width: 100%; height: auto;" class="container">
            <!-- 개요 (이이콘 + 텍스트) -->
            <div class="text">
                <h2>부모님 찾기 QR</h2>
                <img style="width: 100%; height: auto;" src="/img/family_mom2.jpg">
                <p>일상의 이런저런 것들을 기록하다 보면 보이지 않던 소중한 것들이 보입니다.</p>
                <a href="#">MORE...
                    <span class="fa fa-chevron-right"></span>
                </a>
            </div>

            <div class="text">
                <h2>내 아이 찾기 QR</h2>
                <img style="width: 100%; height: auto;" src="/img/family_child2.jpg">
                <p>일상의 이런저런 것들을 기록하다 보면 보이지 않던 소중한 것들이 보입니다.</p>
                <a href="#">MORE...
                    <span class="fa fa-chevron-right"></span>
                </a>
            </div>

            <div class="text">
                <h2>반려동물 찾기 QR</h2>
                <img style="width: 100%; height: auto;" src="/img/family_dog2.jpg">
                <p>일상의 이런저런 것들을 기록하다 보면 보이지 않던 소중한 것들이 보입니다.</p>
                <a href="#">MORE...
                    <span class="fa fa-chevron-right"></span>
                </a>
            </div>
        </div>
    </section>


    <!-- 컨텐츠C -->
    <section class="conC">
        <div class="container">
            <!-- 텍스트 -->
            <div class="text">
                <!-- 제목 -->
                <h2>CLVOER는 사랑하는 가족들을 지키기 위해 QR을 사용합니다</h2>
                <!-- 문장 -->
                <p>사랑하는 가족을 잃어버렸을 때, QR을 통해 바로 찾아보세요. CLVOER QR이 가능하게 만들어드립니다.</p>
                <!-- 링크박스 -->
                <a href="#">자세한 설정 방법 살펴보기
                    <span class="fa fa-chevron-right"></span>
                </a>
            </div>
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
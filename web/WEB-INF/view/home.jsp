<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>CodePen - JSweeper</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/meyer-reset/2.0/reset.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/home.css">

</head>
<body>
<!-- partial:index.partial.html -->
<div class="wrapper">
    <h1 id="heading">Mine Sweeper</h1>
    <div id="minesweeper">
        <ul class="level-select">
            <li>
                <button data-level="easy">Easy</button>
            </li>
            <li>
                <button data-level="mid">Medium</button>
            </li>
            <li>
                <button data-level="hard">Hard</button>
            </li>
        </ul>
        <div class="menu">
            <ul>
                <li class="timer">000</li>
                <li class="reset">
                    <button>\uD83D\uDD04</button>
                </li>
                <li class="mine-count">010</li>
            </ul>
        </div>
        <div id="mine-grid"></div>
    </div>
</div>

<!-- partial -->
<script src='https://code.jquery.com/jquery-2.2.4.min.js'></script>
<script src="${pageContext.request.contextPath}/resources/js/home.js"></script>
</body>
</html>

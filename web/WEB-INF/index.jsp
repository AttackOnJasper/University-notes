<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>Auto-render test</title>
  <script src="/resources/js/katex.min.js" type="text/javascript"></script>
  <link href="/resources/css/katex.min.css" rel="stylesheet" type="text/css">
  <script src="https://cdnjs.cloudflare.com/ajax/libs/KaTeX/0.9.0-beta/contrib/auto-render.min.js" integrity="sha384-EkJr57fExjeMKAZnlVBuoBoX0EJ4BiDPiAd/JyTzIA65ORu4hna7V6aaq4zsUvJ2" crossorigin="anonymous"></script>
  <style type="text/css">
    body {
      margin: 0px;
      padding: 0px;
      font-size: 36px;
    }

    #test > .blue {
      color: blue;
    }
  </style>
</head>
<body>
<div id="test">
  This is some text $math \frac12$ other text $\unsupported$
  <span class="blue">
        Other node \[ displaymath \frac{1}{2} \] blah $$ \int_2^3 $$
      </span>
  and some <!-- comment --> more text \(and math\) blah. And $math with a
  \$ sign$.
  <pre>
        Stuff in a $pre tag$
      </pre>
</div>
<script>
  renderMathInElement(
          document.getElementById("test"),
          {
            delimiters: [
              {left: "$$", right: "$$", display: true},
              {left: "\\[", right: "\\]", display: true},
              {left: "$", right: "$", display: false},
              {left: "\\(", right: "\\)", display: false}
            ]
          }
  );
</script>
</body>
</html>
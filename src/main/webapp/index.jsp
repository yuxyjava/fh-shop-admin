<html>
<body>
<h2>Hello World!</h2>
<input type="text" id="age"><input type="button" value="显示" onclick="show();">
<script src="/js/jquery-3.3.1.js"></script>

<script>
    function show() {
        var v_age = $(document.getElementById("age")).val();
        alert(v_age);
    }
</script>
</body>
</html>

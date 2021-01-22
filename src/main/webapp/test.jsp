<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="/blog/editormd/css/editormd.css" />
    <script src="/blog/js/jquery/jquery-2.1.1.min.js"></script>
    <script src="/blog/editormd/editormd.js"></script>
</head>
<body>

<script type="text/javascript">
    $(function() {
        var editor = editormd("test-editor", {
            width  : "100%",
            height : "100%",
            path   : "/blog/editormd/lib/"
        });
    });
</script>
</body>
</html>

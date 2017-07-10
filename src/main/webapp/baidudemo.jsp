<%--
  Created by IntelliJ IDEA.
  User: yuanjie.fang
  Date: 2017/7/10
  Time: 17:47
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>模拟百度搜索</title>
</head>
<body>
<!-- 百度搜索框 -->
    <%--<form action="http://www.baidu.com/baidu" target="_blank">--%>
        <%--<input name=tn type=HIDDEN value=baidu>--%>
        <%--<a href="http://www.baidu.com/"><img src="http://img.baidu.com/img/logo-80px.gif" alt="Baidu" align="bottom" border="0"></a>--%>
        <%--<input id="kw" type=text name=word size=30 baiduSug=1>--%>
        <%--<input type="submit" value="模拟百度">--%>
    <%--</form>--%>

    <form action="baidu" method="post" target="_blank">
    <input name=tn type=HIDDEN value=baidu>
    <a href="http://www.baidu.com/"><img src="http://img.baidu.com/img/logo-80px.gif" alt="Baidu" align="bottom" border="0"></a>
    <input id="kw" type=text value="" name="word" size="30" baiduSug=1>
    <input type="submit" value="模拟百度">
    </form>
    <!-- 百度搜索框提示 -->
    <script charset="gbk" src="http://www.baidu.com/js/opensug.js"></script>
</body>
</html>

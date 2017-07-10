<%@page language="java" import="java.util.*" pageEncoding="UTF-8" %>
<html>
<head>
    <title>搜索小demo</title>
    <style>
        #mydiv {
            position: absolute;
            left: 50%;
            top: 50%;
            margin-left: -200px;
            margin-top: -300px;
        }

        .mouseOver {
            background: #708090;
            color: #FFFAFA;
        }

        .mousemOut {
            background: #FFFAFA;
            color: #000000;
        }

    </style>
    <script type="text/javascript">
        var xmlHttp;

        //获取用户输入内容关联信息的函数
        function getMoreContents() {
            //首先获取用户的输入
            var content = document.getElementById("keyword");
            if (content.value == "") {
                clearContent();
                return;
            }

            //然后给服务器发送用户输入的内容，因为采用ajax异步发送内容
            //所有我们使用XMLHttp对象
            xmlHttp = createXMLHttp();

            //向服务器发送ajax请求
            var url = "search?keyword=" + escape(content.value);
            //true表示javascript脚本会在send()方法之后继续执行，而不会等待来自服务器的响应
            xmlHttp.open("GET", url, true);
            //xmlHttp绑定回调方法，这个回调方法会在xmlHttp状态改变的时候被调用，共用0-4共5中状态，我们只关心4-完成状态
            xmlHttp.onreadystatechange = callback;
            xmlHttp.send(null);

        }

        //获取XMLHttp对象
        function createXMLHttp() {
            var xmlHttp;
            //大多数浏览器
            if (window.XMLHttpRequest) {
                xmlHttp = new XMLHttpRequest();
            }
            //要考虑浏览器的兼容性
            if (window.ActiveXObject) {
                xmlHttp = new ActiveXObject("Microsoft.XMLHTTP");
                if (!xmlHttp) {
                    xmlHttp = new ActiveXObject("Msxml2.XMLHTTP");
                }
            }
            return xmlHttp;
        }

        //回调函数
        function callback() {
            //4---请求完成
            if (xmlHttp.readyState == 4) {
                //200---服务器响应成功
                if (xmlHttp.status == 200) {
                    //交互成功获取响应的文本格式的数据
                    var result = xmlHttp.responseText;
                    //解析获取的数据(json格式)
                    var json = eval("(" + result + ")");
                    //把获取的数据展示到输入框下面
                    setContent(json);
                }
            }
        }

        //展示从服务器获取的关联数据
        function setContent(contents) {
            //输入参数之前先清空
            clearContent();

            //设置下拉表格显示的宽度
            setLocation();

            var size = contents.length;
            for (var i = 0; i < size; i++) {
                var nextNode = contents[i];
                var tr = document.createElement("tr");
                var td = document.createElement("td");
                td.setAttribute("border", "0");
                td.setAttribute("bgcolor", "#FFFAFA");
                td.onmouseover = function () {//鼠标悬在上面
                    this.className = 'mouseOver';
                };
                td.onmouseout = function () {//鼠标移开
                    this.className = 'mouseOut';
                };
                td.onclick = function () {
                    //这个方法实现的是当用鼠标点击一个关联数据时，自动显示为输入框数据

                };
                var text = document.createTextNode(nextNode);
                td.appendChild(text);
                tr.appendChild(td);
                document.getElementById("content_table_body").appendChild(tr);
            }
        }

        //清空表格中数据
        function clearContent() {
            var contentTableBody = document.getElementById("content_table_body");
            var size = contentTableBody.childNodes.length;
            for (var i = size - 1; i >= 0; i--) {
                contentTableBody.removeChild(contentTableBody.childNodes[i]);
            }
            document.getElementById("popdiv").style.border = "none";
        }

        //鼠标移出输入框
        function keywordBlur() {
            clearContent();
        }

        //设置显示关联信息的位置
        function setLocation() {
            //关联信息的显示位置要与输入框大小一致
            var content = document.getElementById("keyword");
            var width = content.offsetWidth;//输入框的宽度
            var left = content["offsetLeft"];//到左边框的距离
            var top = content["offsetTop"] + content.offsetHeight;//到顶部的距离
            var popdiv = document.getElementById("popdiv");
            popdiv.style.border = "black 1px solid";
            popdiv.style.left = left + "px";
            popdiv.style.top = top + "px";
            popdiv.style.width = width + "px";
            document.getElementById("content_table").style.width = width + "px";

        }
    </script>
</head>
<body>
<div id="mydiv">
    <%--输入框--%>
    <input type="text" size="50" id="keyword" onkeyup="getMoreContents()"
           onblur="keywordBlur()" onfocus="getMoreContents()">
    <input type="button" value="百度一下" width="50px">

    <%--下面是内容展示的区域--%>
    <div id="popdiv">
        <table id="content_table" bgcolor="#FFFAFA" border="0" cellspacing="0">
            <tbody id="content_table_body">
            <%--动态查询的结果显示--%>
            </tbody>
        </table>
    </div>
</div>
</body>
</html>

package com;

import net.sf.json.JSONArray;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

/**
 * Created by yuanjie.fang on 2017/7/10.
 */
public class SearchServlet extends HttpServlet {
    //模拟数据
    static List<String> datas = new ArrayList<String>();

    static {
        datas.add("ajax");
        datas.add("ajax post");
        datas.add("becky");
        datas.add("bill");
        datas.add("james");
        datas.add("jane");
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");
        //首先获取客户端获取的关键字
        String keyword = req.getParameter("keyword");
        //获取关键字后进行处理
        List<String> listData = getData(keyword);
        //返回json格式
        JSONArray jsonArray = JSONArray.fromObject(listData);
        resp.setCharacterEncoding("UTF-8");
        resp.getWriter().write(jsonArray.toString());
    }

    //获取关联数据的方法
    public List<String> getData(String keyword) {
        List<String> list = new ArrayList<String>();
        for (String data : datas) {
            if (data.contains(keyword)) {
                list.add(data);
            }
        }
        return list;
    }
}

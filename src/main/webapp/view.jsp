<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.example.jspboard.board.BoardDAO, com.example.jspboard.board.BoardVO"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>View Post</title>
    <style>
        #list {
            font-family: "Trebuchet MS", Arial, Helvetica, sans-serif;
            border-collapse: collapse;
            width: 100%;
        }
        #list td, #list th {
            border: 1px solid #ddd;
            padding: 8px;
            text-align: center;
        }
        #list tr:nth-child(even){background-color: #f2f2f2;}
        #list tr:hover {background-color: #ddd;}
        #list th {
            padding-top: 12px;
            padding-bottom: 12px;
            text-align: center;
            background-color: #006bb3;
            color: white;
        }
    </style>
</head>
<body>
<h1>게시물 정보</h1>

<%
    String idParam = request.getParameter("id");

    if (idParam != null && !idParam.isEmpty()) {
        int postId = Integer.parseInt(idParam);

        BoardDAO boardDAO = new BoardDAO();
        BoardVO board = boardDAO.getBoard(postId);

        if (board != null) {
%>
<table id="list" width="90%">
    <tr>
        <th>ID Number</th>
        <td><%= board.getSeq() %></td>
    </tr>
    <tr>
        <th>Category</th>
        <td><%= board.getCategory() %></td>
    </tr>
    <tr>
        <th>Title</th>
        <td><%= board.getTitle() %></td>
    </tr>
    <tr>
        <th>Writer</th>
        <td><%= board.getWriter() %></td>
    </tr>
    <tr>
        <th>Content</th>
        <td><%= board.getContent() %></td>
    </tr>
    <tr>
        <th>Regdate</th>
        <td><%= board.getRegdate() %></td>
    </tr>
</table>
<input type="button" value="Back" onclick="history.back()"/></td></tr>
<%
} else {
%>
<p>Error: Board not found</p>
<%
    }
} else {
%>
<p>Error: Missing ID parameter</p>
<%
    }
%>
</body>
</html>

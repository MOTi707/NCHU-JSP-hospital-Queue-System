<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%!
    // M的像素模板(8x8)
    private static final boolean[][] M_PATTERN = {
        {true,false,false,false,false,false,false,true},
        {true,true,false,false,false,false,true,true},
        {true,false,true,false,false,true,false,true},
        {true,false,false,true,true,false,false,true},
        {true,false,false,false,false,false,false,true},
        {true,false,false,false,false,false,false,true},
        {true,false,false,false,false,false,false,true},
        {true,false,false,false,false,false,false,true}
    };
%>
<html>
<head>
    <style>
        .grid-container {
            display: grid;
            grid-template-columns: repeat(8, 1fr);
            gap: 2px;
            width: 416px;
            margin: 20px;
        }
        .grid-item {
            width: 50px;
            height: 50px;
            background: #E3F2FD;
            transition: all 0.3s;
        }
        .grid-item.active {
            background: #2196F3;
            transform: scale(0.9);
            box-shadow: 0 2px 4px rgba(33,150,243,0.3);
        }

    </style>
</head>
<body>
    <form method="post">
        <div class="grid-container">
        <%
        int shift = 0;
        if ("POST".equals(request.getMethod())) {
            Integer sessionShift = (Integer)session.getAttribute("shift");
            shift = (sessionShift != null) ? (sessionShift + 1) % 8 : 0;
        }
        session.setAttribute("shift", shift);

        for (int row = 0; row < 8; row++) {
            for (int col = 0; col < 8; col++) {
                int shiftedCol = (col + shift) % 8;
                boolean isActive = M_PATTERN[row][shiftedCol];
        %>
            <div class="grid-item <%= isActive ? "active" : "" %>" 
                 data-original-col="<%= col %>"></div>
        <%    }
            } %>
        </div>
        <button type="submit" class="action-btn">向左移动</button>
    </form>
</body>
</html>
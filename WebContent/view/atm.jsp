<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
</!DOCTYPE html>
<html>
<head>
    <title>ATM</title>
    <link rel="icon" href="images/favicon.png">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.5.0/css/font-awesome.min.css">
    <link href='https://fonts.googleapis.com/css?family=Open+Sans' rel='stylesheet' type='text/css'>
    <style><%@ include file="css/atm.css"%></style>
</head>
<body>
    <div class="container-fluid">
    <div role="tabpanel" class="tab-pane" id="selectamount">
                    <div class="tab-content text-center">
                        <h2>Please select an option</h2>
                    </div>

                    <div class="row h1">
                        <form action="${pageContext.request.contextPath}/ATMController" method="post" class="form-inline" autocomplete="off">
                        <input type="hidden" name="userName" value="<%=request.getAttribute("userName") %>">
                        <div class="col-xs-6 text-left">
                            <input type="submit" class="btn btn-lg btn-success btn-rounded btn1" value="Withdrawel"></input>
                        </div>
                        </form>

                        <form action="${pageContext.request.contextPath}/ATMController" method="post" class="form-inline" autocomplete="off">
                        <input type="hidden" name="userName" value="<%=request.getAttribute("userName") %>">
                        <div class="col-xs-6 text-right">
                            <button type="submit" class="btn btn-lg btn-success btn-rounded btn1">Fast Cash</button>
                        </div>
                        </form><br><br>

                        <form action="${pageContext.request.contextPath}/BalanceCheckController" method="post" class="form-inline" autocomplete="off">
                        <input type="hidden" name="userName" value="<%=request.getAttribute("userName") %>">
                        <div class="col-xs-6 text-left">
                            <button type="submit" class="btn btn-lg btn-success btn-rounded btn1">Balance</button>
                        </div>
                        </form>

                        <form action="${pageContext.request.contextPath}/pinChangeRedirectController" method="post" class="form-inline" autocomplete="off">
                        <input type="hidden" name="userName" value="<%=request.getAttribute("userName") %>">
                        <div class="col-xs-6 text-right">
                            <button type="submit" class="btn btn-lg btn-success btn-rounded btn1">Pin Change</button>
                        </div>
                        </form><br><br>

                        <form action="${pageContext.request.contextPath}/BalanceTransferController" method="post" class="form-inline" autocomplete="off">
                        <input type="hidden" name="userName" value="<%=request.getAttribute("userName") %>">
                        <div class="col-xs-6 text-left">
                            <button type="submit" class="btn btn-lg btn-success btn-rounded btn1">Transfer</button>
                        </div>
                        </form>

                        <form action="${pageContext.request.contextPath}/BillController" method="post" class="form-inline" autocomplete="off">
                        <input type="hidden" name="userName" value="<%=request.getAttribute("userName") %>">
                        <div class="col-xs-6 text-right">
                           <button type="submit" class="btn btn-lg btn-success btn-rounded btn1">Bill/Fees</button>
                        </div>
                        </form>

                    </div>

                    <a class="btn-lg btn-default canceltransaction" href="view/logout.jsp"><i class="fa fa-times"></i> CANCEL TRANSACTION</a>

    </div>
</div>
</body>
</html>
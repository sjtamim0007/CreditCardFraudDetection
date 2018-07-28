<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>The Number26 ATM challenge</title>
    <link rel="icon" href="images/favicon.png">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.5.0/css/font-awesome.min.css">
    <link href='https://fonts.googleapis.com/css?family=Open+Sans' rel='stylesheet' type='text/css'>
    <link rel="stylesheet" href="style.css">
    <style><%@ include file="css/style.css" %></style>
</head>
<body>


    <div class="container-fluid">

        <!-- Nav tabs. These stay hidden -->
        <ul class="nav nav-tabs nav-justified hide" role="tablist">
            <li role="presentation"><a href="#home" aria-controls="home" role="tab" data-toggle="tab">Welcome</a></li>
            <li role="presentation"><a href="#pin" aria-controls="pin" role="tab" data-toggle="tab">Insert PIN</a></li>
            <li role="presentation"><a href="#selectamount" aria-controls="selectamount" role="tab" data-toggle="tab">Select amount</a></li>
            <li role="presentation"><a href="#customamount" aria-controls="customamount" role="tab" data-toggle="tab">Enter amount</a></li>
            <li role="presentation"><a href="#preparing" aria-controls="preparing" role="tab" data-toggle="tab">Preparing</a></li>
            <li role="presentation"><a href="#showmethemoney" aria-controls="showmethemoney" role="tab" data-toggle="tab">Get money</a></li>
            <li role="presentation"><a href="#canceltransaction" aria-controls="canceltransaction" role="tab" data-toggle="tab">Cancel</a></li>
        </ul>

        <!-- Tab panes -->
        <div class="tab-content text-center">

            <!--TAB 1 - welcome-->
            <div role="tabpanel" class="tab-pane active" id="home">

                <h1>Welcome</h1>

                <h2>Please insert your card</h2>

                <div class="slot_wrapper">
                    <div class="slot"></div>
                    <a href="#pin" data-toggle="tab" class="creditcard internal_link">
                        <i class="fa fa-credit-card fa-rotate-90"></i>
                        <i class="fa fa-hand-rock-o hand"></i>
                    </a>
                </div>

            </div>


            <!--TAB 2 - enter PIN-->
            <div role="tabpanel" class="tab-pane" id="pin">

                <h2>Please enter your 4-digit PIN</h2>

                <form class="form-inline" autocomplete="off">
                    <div class="form-group">
                        <input type="password" maxlength="4" autocomplete="off" class="form-control input-lg" id="pinfield">
                    </div>
                    <button type="submit" class="btn btn-lg btn-default">Confirm</button>
                    <button type="reset" class="btn btn-lg btn-link">Reset</button>
                </form>

                <div class="alert alert-danger hide"></div>

                <a href="#home" class="btn btn-lg btn-default backbutton"><i class="fa fa-chevron-left"></i> BACK</a>
                <a class="btn btn-lg btn-default canceltransaction"><i class="fa fa-times"></i> CANCEL TRANSACTION</a>

            </div>


            <!-- TAB 3 - select an option -->
            <div role="tabpanel" class="tab-pane" id="selectamount">

                <h2>Please select an option</h2>

                <div class="row h1">
                    <div class="col-xs-6 text-left"><i class="fa fa-chevron-left"></i> 20</div>
                    <div class="col-xs-6 text-right">50 <i class="fa fa-chevron-right"></i></div>
                    <div class="col-xs-6 text-left"><i class="fa fa-chevron-left"></i> 100</div>
                    <div class="col-xs-6 text-right">200 <i class="fa fa-chevron-right"></i></div>
                    <div class="col-xs-6 text-left"><i class="fa fa-chevron-left"></i> 500</div>
                    <div class="col-xs-6 text-right"><a href="#customamount" class="internal_link">Other amount</a></div>
                </div>

                <a href="#pin" class="btn btn-lg btn-default backbutton"><i class="fa fa-chevron-left"></i> BACK</a>
                <a class="btn btn-lg btn-default canceltransaction"><i class="fa fa-times"></i> CANCEL TRANSACTION</a>

            </div>

            <!--TAB 4 - enter amount-->
            <div role="tabpanel" class="tab-pane" id="customamount">

                <h2>Please enter amount</h2>

                <form class="form-inline" autocomplete="off">
                    <div class="form-group">
                        <input type="text" maxlength="5" autocomplete="off" class="form-control input-lg" id="amount">
                    </div>
                    <button type="submit" class="btn btn-default btn-lg">Confirm</button>
                    <button type="reset" class="btn btn-lg btn-link">Reset</button>
                </form>

                <a href="#selectamount" class="btn btn-lg btn-default backbutton"><i class="fa fa-chevron-left"></i> BACK</a>
                <a class="btn btn-lg btn-default canceltransaction"><i class="fa fa-times"></i> CANCEL TRANSACTION</a>

            </div>

            <!--TAB 5 - please wait-->
            <div role="tabpanel" class="tab-pane" id="preparing">

                <h2><i class="fa fa-spinner fa-spin"></i> Please wait while we process your transaction</h2>

                <img class="backad center-block img-responsive" src="images/ad1.jpg" alt="" />

            </div>

            <!--TAB 6 - get your money and your card-->
            <div role="tabpanel" class="tab-pane" id="showmethemoney">

                <h2>Please get your card and take your money.<br>Thank you for using our ATM.</h2>

                <img class="money center-block img-responsive" src="images/money.gif" alt="" />

            </div>

            <!--TAB 7 - Cancel transaction-->
            <div role="tabpanel" class="tab-pane" id="canceltransaction">

                <h2>Transaction cancelled. Please get your card.</h2>

            </div>


        </div>

    </div>


    <script src="https://code.jquery.com/jquery-1.12.0.min.js"></script>
    <script src="scripts.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>

</body>
</html>
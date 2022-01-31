<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Kredit Kalkulator</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="jquery/jquery/jquery-ui.css">
    <script src="jquery/jquery/jquery.js"></script>
    <script src="jquery/jquery/jquery-ui.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">



    <script type="text/javascript">

    
       
        $(document).ready(function () {

            var flag = 0;
            $("#result").hide()

            $("#calculate").click(function () {
                if ($("#totalLoan").val() === "") {
                    alert("Loan amount is required")

                } else
                    flag++;

                if ($("#months").val() == "" && $("#years").val() === "")
                    alert(" Number of installments either by month either by year is required")
                else flag++;

                if ($("#interest").val() === "")
                    alert("Interest is required")
                else flag++;
                if ($("#interest").val() < 0)
                {
                    alert("There is no such thing as negative interest percentage")
                    flag--
                }





                if (flag == 3)
                {
                    //$("#result").show()

                        $( this ).css({
                            borderStyle: "inset",
                            cursor: "wait"
                        });
                        $( "#result" ).slideDown( 1000, function() {
                            $( this )

                                .filter( ".middle" )
                                .css( "background", "yellow" )
                                .focus();

                        });


                }

                else {
                    $("#totalLoan").val("")
                    $(".totalInstallments").val("")
                    $("#interest").val("")

                }
                interest = parseInt($("#interest").val()) / 100
                monthlyWithInterest = parseInt($("#totalLoan").val()) + parseInt($("#totalLoan").val()) * interest

                totalRata = 0;

                //if both month and year are inputed
                if ($("#months").val() != "" && $("#years").val() != "" && parseInt($("#months").val()) !== 0 && parseInt($("#years").val()) !== 0) {
                    yearToMonth = parseInt($("#years").val()) * 12
                    month = parseInt($("#months").val())
                    yearAndMonth = yearToMonth + month

                    totalRata = monthlyWithInterest / yearAndMonth

                }


                //if year is inputed and month is empty or 0
                else if ($("#years").val() != "" && $("#months").val() == "" || parseInt($("#months").val()) == 0) {
                    totalRata = monthlyWithInterest / (parseInt($("#years").val()) * 12);
                }

                //if month is inputed and year is empty or 0

                else if ($("#months").val() != "" && $("#years").val() == "" || parseInt($("#years").val()) == 0)
                    totalRata = monthlyWithInterest / parseInt($("#months").val())

                withInterest = $("#TotalreturnAmtWithInterest").val((parseInt($("#totalLoan").val()) + parseInt($("#totalLoan").val()) * interest).toFixed(2) + " Euro")

                $("#returnAmt").val(totalRata.toFixed(2) + " Euro")

                $("#calculateAgain").click(function ()
                {
                    location.reload()

                })

            })


        })


    </script>
    <style>
        .display-6.custom {
            font-size: 25px;
        }

        .totalInstallments {
            margin-bottom: 2px;
            margin-left: 4px;
        }


    </style>
    <script src="https://code.jquery.com/jquery-3.5.0.js"></script>



</head>


<body>

<div class="container">
    <br>
    <div class="row text-center">
        <div class="col-sm-12 col-md-12 col-lg-12 col-12">
            <div class="display-6">Bank Loan Calculator</div>
        </div>
    </div>
    <div class="row text-start ">
        <div class="col-sm-7 col-md-7 col-lg-7 col-7"><br>
            <p class="display-6 custom">Insert loan amount</p>
        </div>
        <div class="col-sm-5 col-md-5 col-lg-5 col-5 text-end "><br>
            <input type="number" min="0" placeholder="Insert number" id="totalLoan">
        </div>
    </div>
    <div class="row text-start">
        <div class="col-sm-7 col-md-7 col-lg-7 col-7 "><br>
            <p class="display-6 custom">Insert number of installments by months <i><u>or</u></i> by years</p>
        </div>
        <div class="col-sm-5 col-md-5 col-lg-5 col-5 text-end"><br>
            <input type="number" min="0" placeholder="Number of years" class="totalInstallments" id="years">
            <input type="number" min="0" placeholder="Number of months" class=" totalInstallments" id="months">

        </div>
    </div>
    <div class="row text-start">
        <div class="col-sm-7 col-md-7 col-lg-7 col-7"><br>
            <p class="display-6 custom">Interest percentage</p>
        </div>
        <div class="col-sm-5 col-md-5 col-lg-5 col-5 text-end "><br>
            <input type="text" placeholder="%" id="interest">
        </div>
    </div>
    <div class="row text-center">
        <div class="col-sm-12 col-md-12 col-lg-12 col-12"><br>
            <button class="btn btn-outline-secondary" id="calculate">Calculate</button>
        </div>
    </div>

    <div id="result">
        <div class="row text-start">
            <div class="col-sm-7 col-md-7 col-lg-7 col-7"><br>
                <p class="display-6 custom">Total return amount after interest calculation</p>
            </div>
            <div class="col-sm-5 col-md-5 col-lg-5 col-5 text-end "><br>
                <input type="text" placeholder="" id="TotalreturnAmtWithInterest">
            </div>
        </div>
        <div class="row text-start">
            <div class="col-sm-7 col-md-7 col-lg-7 col-7"><br>
                <p class="display-6 custom">Monthly installment amount</p>
            </div>
            <div class="col-sm-5 col-md-5 col-lg-5 col-5 text-end "><br>
                <input type="text" placeholder="" id="returnAmt">
            </div>
        </div>

        <div class="row">

            <div class="col-sm-12 col-lg-12 col-md-12">
                <button onclick="window.print()" class="btn btn-outline-secondary float-end" id="printbutton1">Print
                    report
                </button>
                <button class="btn btn-outline-secondary float-start" id="calculateAgain">Calculate again
                </button>
            </div>

        </div>


    </div>
    <div class="loader-wrapper">
        <span class="loader"><span class="loader-inner"></span></span>
    </div>
</div>


<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.10.2/dist/umd/popper.min.js"
        integrity="sha384-7+zCNj/IqJ95wo16oMtfsKbZ9ccEh31eOz1HGyDuCQ6wgnyJNSYdrPa03rtR1zdB"
        crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.min.js"
        integrity="sha384-QJHtvGhmr9XOIpI6YVutG+2QOK9T+ZnN4kzFN1RtK3zEFEIsxhlmWl5/YESvpZ13"
        crossorigin="anonymous"></script>


</body>
</html>

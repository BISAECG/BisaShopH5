<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
     <meta name="keywords" content="${html_description}">
    <meta name="description" content="${html_keyWord}">
    <title>${html_title}</title>
    <link href="/resources/ctrl/bootstrap/css/bootstrap.min.css" rel="stylesheet">
    <link href="/resources/ctrl/font-awesome/css/font-awesome.css" rel="stylesheet">
    <link href="/resources/css/public.css" rel="stylesheet">
    <link href="/resources/css/new.css" rel="stylesheet">
    <link href="/resources/css/qa.css" rel="stylesheet">
    <script src="/resources/js/comm/jquery.min.js"></script>
    <script src="/resources/ctrl/bootstrap/js/bootstrap.js"></script>
    <script src="/resources/js/rootFont.js"></script>
    <style>
        .answer span:nth-child(1) {
            margin-left: 0.6rem;
        }
    </style>
</head>

<body>
    <div id="header"></div>
    <script>
        $("#header").load("header.html");
    </script>
    <div class="content">
        <div class="container-full newBanner">
            <div class="row" style="margin: 0;">          
                    <img class="img-responsive center-block" src="/resources/img/news/banner.png">
                    <div  style="left: 15%;">
                        <p>Health information</p>
                        <p><span>Focus on health</span><span>Focus on Bisa health</span></p>
                        <p>Give your family a good care</p>
                        <img class=" img-responsive center-block" src="/resources/img/news/downlogo.png" >
                    </div>            
            </div>
        </div>
        <div class="container">
            <div class="row">
                <div class="col-xs-12 title">
                    <span></span>
                    <span>Health information</span>
                </div>
            </div>
            <div class="row " style="margin: 0;">
                <div class="col-xs-12 box">
                    <p class="question" style="  padding: 0.1rem 0;">
                        <span>Q:</span>
                        <span>ECG waveform disorder</span>
                    </p>
                    <p class="reason">
                        <span></span>
                        <span>Possible causes: </span>
                        <span class="text-left"> poor adhesion of the electrode sheet to the skin, dropping of the
                            electrode sheet due to sweat, repeated use of the electrode sheet.</span>
                    </p>
                    <p class="answer" style="  padding-bottom: 0.1rem;">
                        <span>Remedy: </span>
                        <span> Make sure the chest skin is dry and clean before changing a new electrode sheet.</span>
                    </p>
                </div>
                <div class="col-xs-12 box">
                    <p class="question" style="  padding: 0.1rem 0;">
                        <span>Q:</span>
                        <span>ECG data file name does not show correct date and time (time is use as part of the file
                            name)?</span>
                    </p>
                    <p class="reason">
                        <span>A:</span>
                        <span>Possible causes: </span>
                        <span>When battery power is completely off, the internal clock will be reset to original
                            value.</span>
                    </p>
                    <p class="answer" style="  padding-bottom: 0.1rem;">
                        <span>Remedy: </span>
                        <span>After recharge the PECG device, connect the computer with the PECG via USB cable and
                            re-set the timer in PECG Program.</span>
                    </p>
                </div>
                <div class="col-xs-12 box">
                    <p class="question" style="  padding: 0.1rem 0;">
                        <span>Q:</span>
                        <span>The computer does not detect the flash drive on the PECG after connection?</span>
                    </p>
                    <p class="reason">
                        <span>A:</span>
                        <span>Possible causes: </span>
                        <span>The computer may not have USB driver.</span>
                    </p>
                    <p class="answer" style="  padding-bottom: 0.1rem;">
                        <span>Remedy: </span>
                        <span>Install USB driver in PECG.</span>
                    </p>
                </div>
                <div class="col-xs-12 box">
                    <p class="question" style="  padding: 0.1rem 0;">
                        <span>Q:</span>
                        <span>PECG device cannot connect with computer?</span>
                    </p>
                    <p class="reason">
                        <span>A:</span>
                        <span>Possible causes: </span>
                        <span>USB cable may be damaged or does not have a good contact with computer.</span>
                    </p>
                    <p class="answer" style="  padding-bottom: 0.1rem;">
                        <span>Remedy: </span>
                        <span>Use a new USB cable, pull out the cable from computer and re-connect again.</span>
                    </p>
                </div>
                <div class="col-xs-12 box">
                    <p class="question" style="  padding: 0.1rem 0;">
                        <span>Q:</span>
                        <span>TICK sound from PECG?</span>
                    </p>
                    <p class="reason">
                        <span>A:</span>
                        <span>Possible causes: </span>
                        <span>The battery is at a low power.</span>
                    </p>
                    <p class="answer" style="  padding-bottom: 0.1rem;">
                        <span>Remedy: </span>
                        <span>Recharge the PECG device.</span>
                    </p>
                </div>
                <div class="col-xs-12 box">
                    <p class="question" style="  padding: 0.1rem 0;">
                        <span>Q:</span>
                        <span>Not able to use OTG USB to upload data cable?</span>
                    </p>
                    <p class="reason">
                        <span>A:</span>
                        <span>Possible causes: </span>
                        <span>iPhone does not support OTB USB cable.</span>
                    </p>
                    <p class="answer" style="  padding-bottom: 0.1rem;">
                        <span>Remedy: </span>
                        <span>Suggest to upload the data via computer.</span>
                    </p>
                </div>
                <div class="col-xs-12 box">
                    <p class="question" style="  padding: 0.1rem 0;">
                        <span>Q:</span>
                        <span>Mobile phone cannot connect with PECG device via micro OTG USB cable?</span>
                    </p>
                    <p class="reason">
                        <span>A:</span>
                        <span>Possible causes: </span>
                        <span>Some of smart phone does not support micro USB OTG cable.</span>
                    </p>
                    <p class="answer" style="  padding-bottom: 0.1rem;">
                        <span>Remedy: </span>
                        <span>Use the smart phone which support micro USB OTG cable.</span>
                    </p>
                </div>
                <div class="col-xs-12 box">
                    <p class="question" style="  padding: 0.1rem 0;">
                        <span>Q:</span>
                        <span>Slight red mark appeared, or skin irritation after taking out electrode?</span>
                    </p>
                    <p class="reason">
                        <span>A:</span>
                        <span>Possible causes: </span>
                        <span>Use of electrodes for a long time may cause skin allergic.</span>
                    </p>
                    <p class="answer" style="  padding-bottom: 0.1rem;">
                        <span>Remedy: </span>
                        <span>It is OK if the red mark disappeared in a short period (i.e. a few hours). Otherwise,
                            contact our technical support for other brand of electrode.visit a doctor for
                            consultation.</span>
                    </p>
                </div>
                <div class="col-xs-12">
                    <button class="more">
                        <span>
                            More
                        </span>
                    </button>
                </div>
                <div class="col-xs-12 box dis-n">
                    <p class="question" style="  padding: 0.1rem 0;">
                        <span>Q:</span>
                        <span>Smartphone is unable to connect with PECG with Bluetooth?</span>
                    </p>
                    <p class="reason">
                        <span>A:</span>
                        <span>Possible causes: </span>
                        <span>It may be low power for PECG or Mobile's battery.</span>
                    </p>
                    <p class="answer" style="  padding-bottom: 0.1rem;">
                        <span>Remedy: </span>
                        <span>To ensure PECG is fully charged and reactivate APP and re-connect with PECG
                            afterward.</span>
                    </p>
                </div>
                <div class="col-xs-12 box dis-n">
                    <p class="question" style="  padding: 0.1rem 0;">
                        <span>Q:</span>
                        <span> Smartphone and PECG are mismatching via Bluetooth?</span>
                    </p>
                    <p class="reason">
                        <span>A:</span>
                        <span>Possible causes: </span>
                        <span>Searched a wrong serial number (S/N).</span>
                    </p>
                    <p class="answer" style="  padding-bottom: 0.1rem;">
                        <span>Remedy: </span>
                        <span>Check S/N at the back side of PECG or scan QR code placed in the front side of PECG before
                            pairing.</span>
                    </p>
                </div>
                <div class="col-xs-12 box dis-n">
                    <p class="question" style="  padding: 0.1rem 0;">
                        <span>Q:</span>
                        <span>Cannot install the PECG APP to Smartphone?</span>
                    </p>
                    <p class="reason">
                        <span>A:</span>
                        <span>Possible causes: </span>
                        <span>The smartphone does not meet the minimum requirement of the PECG APP.</span>
                    </p>
                    <p class="answer" style="  padding-bottom: 0.1rem;">
                        <span>Remedy: </span>
                        <span>The minimum requirement for the smartphone is Android 4.3 smartphone with and 5-inch
                            screen size or above.</span>
                    </p>
                </div>
                <div class="col-xs-12 box dis-n">
                    <p class="question" style="  padding: 0.1rem 0;">
                        <span>Q:</span>
                        <span>Can PECG operate with other electronic device at the same time?</span>
                    </p>
                    <p class="reason">
                        <span>A:</span>
                        <span>Possible causes: </span>
                        <span>When you are using it with other electronic devices simultaneously, PECG may be interfered
                            by other devices.</span>
                    </p>
                    <p class="answer" style="  padding-bottom: 0.1rem;">
                        <span>Remedy: </span>
                        <span>We suggested to use it solely.</span>
                    </p>
                </div>
                <div class="col-xs-12 box dis-n">
                    <p class="question" style="  padding: 0.1rem 0;">
                        <span>Q:</span>
                        <span>Emergency contact person does not receive the SMS or email after pressing panic button in
                            PECG device?</span>
                    </p>
                    <p class="reason">
                        <span>A:</span>
                        <span>Possible causes: </span>
                        <span>Problem may be caused by:1.Did not fill up emergency contact information (SMS/email).2.The
                            information were incorrect.3.Your account do not have sufficient amount of money.</span>
                    </p>
                    <p class="answer" style="  padding-bottom: 0.1rem;">
                        <span>Remedy: </span>
                        <span>Please ensure following:1.that all emergency contact information must be completely filled
                            in.2.Emergency contact information are correct (i.e. phone number and area, email
                            address)3.Your account should have enough money for the service.</span>
                    </p>
                </div>
                <div class="col-xs-12 box dis-n">
                    <p class="question" style="  padding: 0.1rem 0;">
                        <span>Q:</span>
                        <span> Do not receive verification code after registration?</span>
                    </p>
                    <p class="reason">
                        <span>A:</span>
                        <span>Possible causes: </span>
                        <span>Problem may be caused by:1.Smartphone does not have internet connection (i.e. WiFi or
                            3G)2.Incorrect country code or area code3.Incorrect phone number4.Version of App is
                            outdated.</span>
                    </p>
                    <p class="answer" style="  padding-bottom: 0.1rem;">
                        <span>Remedy: </span>
                        <span>When register to be a user, please make sure that you have1.Internet connection to our
                            website2.You have the latest version of PECG3.Select the correct country/area code4.Enter
                            the phone number correctly.</span>
                    </p>
                </div>
                <div class="col-xs-12 box dis-n">
                    <p class="question" style="  padding: 0.1rem 0;">
                        <span>Q:</span>
                        <span> Emergency contact person does not receive the SMS or email after pressing panic button in
                            PECG device?</span>
                    </p>
                    <p class="reason">
                        <span>A:</span>
                        <span>Possible causes: </span>
                        <span>User left PECG app.</span>
                    </p>
                    <p class="answer" style="  padding-bottom: 0.1rem;">
                        <span>Remedy: </span>
                        <span>User can hide the screen of PECG Apps but keep PECG app is running under a screen where
                            have a big circle screen.</span>
                    </p>
                </div>
                <div class="col-xs-12 box dis-n">
                    <p class="question" style="  padding: 0.1rem 0;">
                        <span>Q:</span>
                        <span>Can PECG operate under high humidity environment?</span>
                    </p>
                    <p class="reason">
                        <span>A:</span>
                        <span>Possible causes: </span>
                        <span>Read user manual for range of humidity the PECG should be used.</span>
                    </p>
                    <p class="answer" style="  padding-bottom: 0.1rem;">
                        <span>Remedy: </span>
                        <span>PECG can operate under humidity environment (10-95%RH).</span>
                    </p>
                </div>
                <div class="col-xs-12 box dis-n">
                    <p class="question" style="  padding: 0.1rem 0;">
                        <span>Q:</span>
                        <span>Can be PECG used when user have chest injury?</span>
                    </p>
                    <p class="reason">
                        <span>A:</span>
                        <span>Possible causes: </span>
                        <span>Use PECG at the wounded area may affect the recovery (i.e. introduce infection).</span>
                    </p>
                    <p class="answer" style="  padding-bottom: 0.1rem;">
                        <span>Remedy: </span>
                        <span>No recommend to use PECG.</span>
                    </p>
                </div>
                <div class="col-xs-12 box dis-n">
                    <p class="question" style="  padding: 0.1rem 0;">
                        <span>Q:</span>
                        <span>Can PECG operate with pacemaker together?</span>
                    </p>
                    <p class="reason">
                        <span>A:</span>
                        <span>Possible causes: </span>
                        <span>May introduce interference to pace maker.</span>
                    </p>
                    <p class="answer" style="  padding-bottom: 0.1rem;">
                        <span>Remedy: </span>
                        <span>Not recommended to use both PECG and pacemaker together. Please consult doctor or
                            pacemaker's supplier prior to use.</span>
                    </p>
                </div>
            </div>
        </div>
    </div>
    <div id="footer"></div>
    <script>
        $("#footer").load("footer.html");
    </script>
</body>
<script>
    $(document).ready(function () {
        $(".more").click(function () {
            $(".col-xs-12").removeClass("dis-n");
            $(".more").addClass("dis-n")
        })

    })
</script>

</html>
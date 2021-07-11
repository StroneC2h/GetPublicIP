


#---------------------------------------------------------------------------------------#
#########################################################################################
#---------------------------------------------------------------------------------------#


### Script by Pascal Baumgartner - Made in Switzerland ###

### Feel Free to us the Script ###


#---------------------------------------------------------------------------------------#
#########################################################################################
#---------------------------------------------------------------------------------------#





#########################################################################################
#
# Start of Script
#
#########################################################################################




# Variables:

$Hostname = hostname
$TimeDate = Get-Date -Format g



# Get The Public IP over Invoke-WebRequest and store it in $MyIP

$MyIP = Invoke-WebRequest -UseBasicParsing -Uri http://wtfismyip.com/text





#########################################################################################
#
# Send Email
#
#########################################################################################




$to      =  "your@email.com"     #Change to your Resivig Email Adress
$from    =  "your@email.com"     #Change to your Sending Email Adress
$subject =  "IP Notification"
$body    =  "<h1>This is a Automatic Notification of the Public IP.</h1>"
$body    += “ <br> Time: $TimeDate<br><br> Hostname: $Hostname<br><br> Public IP: <b>$MyIP</b>”

# Sender Credentials
$Username = "your@email.com"  #Change to your Username
$Password = "password"     #Change to your Password    

# Create the message
$mail = New-Object System.Net.Mail.Mailmessage $from, $to, $subject, $body
$mail.IsBodyHTML=$true

# Create an SMTP Server Object
$server = "smtp.gmail.com"    #Change to your smtp server adress
$port   = 587
$Smtp = New-Object System.Net.Mail.SMTPClient $server,$port
$Smtp.Credentials = New-Object System.Net.NetworkCredential($Username,$Password)
$Smtp.EnableSsl = $true

# Send send the Mail
$smtp.send($mail)
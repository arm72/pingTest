<#
Q3: Create and save a text file named servers.txt with three lines that reads as follows:

google.com
microsoft.com
www.intel.com

Next, write a PowerShell script that will read the contents of this file and simply output 
a warning message when one of the hostnames in the file does not respond to ping requests.  
In this example, the output should be a single line that reads: WARNING: microsoft.com is down
#>


# read text file containing list of items
$server = get-content .\input-example.txt

#creates an infinite loop, maybe "while ($query -eq true)" could've been used?
while ($true)
	{

	# for loop to count tokens & build array from items in list of text file
	# this for loop includes two conditions if & else
	for ($x=0; $x -lt $server.length; $x++)
		{
		# create "query" variable to hold nested variables "x" & "server"
		$query = ping -n 1 $server[$x]

		if ($query | where-object {$_ -match "100% loss"})
			{
			#write host is preferrable to echo for console-based reasons
			#write-output or write-host is preferrable for streaming pipe socket process substitution
			write-host WARNING: $server[$x] is down
			# this will quit entire 
			exit 0
			}

		else 
			{
			if ($query | where-object {$_ -match "0% loss"})
				{
				# pause interval between each token in array
				start-sleep -m 1
				}
			}
		}

	# pause interval for entire while loop 
	start-sleep -s 60

	}
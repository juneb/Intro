<#
	.SYNOPSIS
		Gets the file encoding of a file.
	
	.DESCRIPTION
		The Get-FileEncoding function determines encoding by looking at Byte Order Mark (BOM).
		Based on port of C# code from http://www.west-wind.com/Weblog/posts/197245.aspx
	
	.PARAMETER Path
		A description of the Path parameter.
	
	.PARAMETER FileInfo
		A description of the FileInfo parameter.
	
	.EXAMPLE
		Get-ChildItem  *.ps1 | select FullName, @{n='Encoding';e={Get-FileEncoding $_.FullName}} | where {$_.Encoding -ne 'ASCII'}
		This command gets ps1 files in current directory where encoding is not ASCII
	
	.EXAMPLE
		Get-ChildItem  *.ps1 | select FullName, @{n='Encoding';e={Get-FileEncoding $_.FullName}} | where {$_.Encoding -ne 'ASCII'} | foreach {(get-content $_.FullName) | set-content $_.FullName -Encoding ASCII}
		Same as previous example but fixes encoding using set-content
		
		
		# Modified by F.RICHARD August 2010
		# add comment + more BOM
		# http://unicode.org/faq/utf_bom.html
		# http://en.wikipedia.org/wiki/Byte_order_mark
		#
		# Do this next line before or add function in Profile.ps1
		# Import-Module .\Get-FileEncoding.ps1
	
	.NOTES
		Additional information about the file.
#>
function Get-FileEncoding
{
	[CmdletBinding(DefaultParameterSetName = 'PathSet')]
	[OutputType([System.Management.Automation.PSCustomObject])]
	param
	(
		[Parameter(ParameterSetName = 'PathSet',
				   Mandatory = $true,
				   ValueFromPipeline = $true)]
		[string[]]$Path,
		
		[Parameter(ParameterSetName = 'FileInfoSet',
				   Mandatory = $true,
				   ValueFromPipeline = $true)]
		[System.IO.FileInfo[]]$FileInfo
	)
	
	BEGIN
	{
		# Begin block
	}
	PROCESS
	{
		if ($Path)
		{
			$FilePaths = dir $Path | foreach FullName
		}
		else #$FileInfo
		{
			$FilePaths = $FileInfo.FullName
		}
		
		if (!($FilePaths)) { throw "No filepaths found." }
		
		foreach ($FilePath in $FilePaths)
		{
			[byte[]]$byte = get-content -Encoding byte -ReadCount 4 -TotalCount 4 -Path $FilePath
			#Write-Host Bytes: $byte[0] $byte[1] $byte[2] $byte[3]
			
			# EF BB BF	(UTF8)
			if ($byte[0] -eq 0xef -and $byte[1] -eq 0xbb -and $byte[2] -eq 0xbf)
			{ $encoding = 'UTF8' }
			
			# FE FF		(UTF-16 Big-Endian)
			elseif ($byte[0] -eq 0xfe -and $byte[1] -eq 0xff)
			{ $encoding = 'Unicode UTF-16 Big-Endian' }
			
			# FF FE		(UTF-16 Little-Endian)
			elseif ($byte[0] -eq 0xff -and $byte[1] -eq 0xfe)
			{ $encoding = 'Unicode UTF-16 Little-Endian' }
			
			# 00 00 FE FF	(UTF32 Big-Endian)
			elseif ($byte[0] -eq 0 -and $byte[1] -eq 0 -and $byte[2] -eq 0xfe -and $byte[3] -eq 0xff)
			{ $encoding = 'UTF32 Big-Endian' }
			
			# FE FF 00 00	(UTF32 Little-Endian)
			elseif ($byte[0] -eq 0xfe -and $byte[1] -eq 0xff -and $byte[2] -eq 0 -and $byte[3] -eq 0)
			{ $encoding = 'UTF32 Little-Endian' }
			
			# 2B 2F 76 (38 | 38 | 2B | 2F)
			elseif ($byte[0] -eq 0x2b -and $byte[1] -eq 0x2f -and $byte[2] -eq 0x76 -and ($byte[3] -eq 0x38 -or $byte[3] -eq 0x39 -or $byte[3] -eq 0x2b -or $byte[3] -eq 0x2f))
			{ $encoding = 'UTF7' }
			
			# F7 64 4C	(UTF-1)
			elseif ($byte[0] -eq 0xf7 -and $byte[1] -eq 0x64 -and $byte[2] -eq 0x4c)
			{ $encoding = 'UTF-1' }
			
			# DD 73 66 73	(UTF-EBCDIC)
			elseif ($byte[0] -eq 0xdd -and $byte[1] -eq 0x73 -and $byte[2] -eq 0x66 -and $byte[3] -eq 0x73)
			{ $encoding = 'UTF-EBCDIC' }
			
			# 0E FE FF	(SCSU)
			elseif ($byte[0] -eq 0x0e -and $byte[1] -eq 0xfe -and $byte[2] -eq 0xff)
			{ $encoding = 'SCSU' }
			
			# FB EE 28 	(BOCU-1)
			elseif ($byte[0] -eq 0xfb -and $byte[1] -eq 0xee -and $byte[2] -eq 0x28)
			{ $encoding = 'BOCU-1' }
			
			# 84 31 95 33	(GB-18030)
			elseif ($byte[0] -eq 0x84 -and $byte[1] -eq 0x31 -and $byte[2] -eq 0x95 -and $byte[3] -eq 0x33)
			{ $encoding = 'GB-18030' }
			
			else
			{ $encoding = 'Unknown' }
			
			[PSCustomObject]@{ "File" = $FilePath; "Encoding" = $encoding }
		}
	}
	END { }
}
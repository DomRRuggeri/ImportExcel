﻿ipmo .\ImportExcel.psd1 -Force

. .\ConvertExcelToImageFile.ps1

$xlFileName = "C:\Temp\testPNG.xlsx"

rm C:\Temp\testPNG.xlsx -ErrorAction Ignore

@"
Region,Item,Cost
North,Pear,1
South,Apple,2
East,Grapes,3
West,Berry,4
"@ | ConvertFrom-Csv | 
    Export-Excel $xlFileName `
        -ConditionalText (New-ConditionalText Apple), (New-ConditionalText Berry -ConditionalTextColor White -BackgroundColor Purple) 

Convert-XlRangeToImage -Path $xlFileName -workSheetname sheet1 -range A1:C5 -Show
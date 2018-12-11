# seperate public and private function definition files
$public = Get-ChildItem -Path $PSScriptRoot -Filter *.ps1 -ErrorAction SilentlyContinue
$private = Get-ChildItem -Path "$PSScriptRoot\Private" -Filter *.ps1 -ErrorAction SilentlyContinue

# import all public functions in this module
foreach($file in @($public + $private))
{
    try
    {
        . $file.FullName
        Write-Verbose -Message "Imported $($file.BaseName)"
    }
    catch [System.Exception]
    {
        Write-Warning -Message "Failed to import function $($file.BaseName): $($_.exception.message)"
    } # end try/catch 
} # end importing each public function

# export public functions
Export-ModuleMember -Function $($public | Select-Object -ExpandProperty BaseName)

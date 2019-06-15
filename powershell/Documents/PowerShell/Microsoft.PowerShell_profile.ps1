# See https://github.com/neilpa/cmd-colors-solarized for detail
# Include the solarized files
$solarized_files = (Join-Path -Path (Split-Path -Parent -Path $PROFILE) -ChildPath $(switch($HOST.UI.RawUI.BackgroundColor.ToString()){'White'{'Set-SolarizedLightColorDefaults.ps1'}'Black'{'Set-SolarizedDarkColorDefaults.ps1'}default{return}}))
foreach ( $solarized_file in $solarized_files ) {
        Unblock-File $solarized_file
        . $solarized_file
}

# Check this guys default's out at some point
# https://github.com/mikemaccana/powershell-profile/

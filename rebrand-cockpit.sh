#!/bin/bash

#code to ignore case restrictions
shopt -s nocasematch
profile=1
logo_dir="Logo-ori"
logo_name="IDSm"

function chooseLogo {
    echo "===================="
    echo "Choose Product Logo"
    echo "1.  IDSm"
    echo "2.  IDSe"
    echo "3.  ISGm"
    echo "4.  ISGe"
    echo "5.  SCEMC LOGVIS"
    echo "6.  SCEMC ANLAB"
    echo "7.  SCEMC SOAR"
    echo "8.  SCEMC VSCAN"
    echo "9.  SCEMC CC"
    echo "10. SCEMC NAS"
    echo "11. IAM"
    echo "12. DCE"


    read -p "Enter your number [1]: " product

    case $product in
        1)
            echo "Rebrand Logo For IDSm"
            logo_name="IDSm"
            ;;
        2)
            echo "Rebrand Logo For IDSe"
            logo_name="IDSe"
            ;;
        3)
            echo "Rebrand Logo For ISGm"
            logo_name="ISGm"
            ;;
        4)
            echo "Rebrand Logo For ISGe"
            logo_name="IDSe"
            ;;
        5)
            echo "Rebrand Logo For SCEMC LOGVIS"
            logo_name="SCEMC-LOGVIS"
            ;;
        6)
            echo "Rebrand Logo For SCEMC ANLAB"
            logo_name="SCEMC-ANLAB"
            ;;
            
        7)
            echo "Rebrand Logo For SCEMC SOAR"
            logo_name="SCEMC-SOAR"
            ;;
        8)
            echo "Rebrand Logo For SCEMC VSCAN"
            logo_name="SCEMC-VSCAN"
            ;;
        9)
            echo "Rebrand Logo For SCEMC CC"
            logo_name="SCEMC-CC"
            ;;
        10)
            echo "Rebrand Logo For SCEMC NAS"
            logo_name="SCEMC-NAS"
            ;;
        11)
            echo "Rebrand Logo For IAM"
            logo_name="IAM"
            ;;
        12)
            echo "Rebrand Logo For DCE"
            logo_name="DCE"
            ;;
            
        *)
            echo "Unknown"
            ;;
    esac                
}

function rebrandStart {
    default_logo_dir=/usr/share/pixmaps/system-logo-white.png
    default_bg_dir=/usr/share/cockpit/branding/default/bg-plain.jpg

    echo "===================="
    echo "===================="
    echo "Stop Cockpit Services.."
#    systemctl stop cockpit

    echo "Start Rebranding..."
    mv $default_logo_dir $default_logo_dir.default
    mv $default_bg_dir $default_bg_dir.default

    echo "Start Change Background.."
    cp ./bg-default.png $default_bg_dir 
    ls /usr/share/pixmaps/

    echo "Start Change Product.."
    cp ./$logo_dir/$logo_name.png $default_logo_dir 
    ls /usr/share/cockpit/branding/default/

    echo "Start Change OS Name.."
    echo "Change opacity CSS"
    sed -i '' -e "s|.66|.0|" /usr/share/cockpit/static/login.css


    echo "/"$logo_dir"/"$logo_name".png"
    echo "Finish Rebranding"
#    systemctl start cockpit
    echo "Delete this Script"
}


#case statement
echo "===================="
echo "Cockpit Rebrand"
echo "1. Original RISS"
echo "2. RISS Powered By XecureZone"

read -p "Enter your number [1]: " profile

case $profile in
    1)
        echo "Original RISS"
        logo_dir="Logo-ori"
        ;;
    2)
        echo "RISS Powered By XecureZone"
        logo_dir="Logo-XZ"
        ;;
    *)
        echo "Unknown"
        ;;
esac
chooseLogo
rebrandStart

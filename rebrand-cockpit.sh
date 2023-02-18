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
    default_login_css_dir=/usr/share/cockpit/static/login.css
    default_favicon_dir=/etc/favicon.png

    echo "===================="
    echo "===================="
    echo "Stop Cockpit Services.."
#    systemctl stop cockpit

    echo "Start Rebranding..."
    cp $default_logo_dir $default_logo_dir.default
    cp $default_bg_dir $default_bg_dir.default
    cp $default_login_css_dir $default_login_css_dir.default
    cp $default_favicon_dir $default_favicon_dir.default

    echo -ne "Start Change Background..\r"
    cp ./bg-default.jpg $default_bg_dir
    echo "Finish Change Background.."

    echo -ne "Start Change Product..\r"
    cp ./$logo_dir/$logo_name.png $default_logo_dir 
    echo "Finish Change Product.."

    echo -ne "Start Change Opacity CSS..\r"
    sed -i -e "s|.66|.0|" $default_login_css_dir
    echo "Finish Change Opacity CSS.."

    echo -ne "Start Change Favicon logo..\r"
    cp ./favicon.png $default_favicon_dir
    echo "Finish Change Favicon logo.."

    echo -ne "Start Change OS Name..\r"
    
    echo "Finish Change OS Name.."

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

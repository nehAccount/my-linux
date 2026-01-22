#!/bin/bash

# Mapiranje tema na odgovarajuće ikone
declare -A theme_to_icon
theme_to_icon=(
    ["Mint-Y"]="Mint-Y"
    ["Mint-Y-Dark"]="Mint-Y"
    ["Mint-Y-Aqua"]="Mint-Y-Aqua"
    ["Mint-Y-Dark-Aqua"]="Mint-Y-Aqua"
    ["Mint-Y-Blue"]="Mint-Y-Blue"
    ["Mint-Y-Dark-Blue"]="Mint-Y-Blue"
    ["Mint-Y-Orange"]="Mint-Y-Orange"
    ["Mint-Y-Dark-Orange"]="Mint-Y-Orange"
    ["Mint-Y-Teal"]="Mint-Y-Teal"
    ["Mint-Y-Dark-Teal"]="Mint-Y-Teal"
)

# Definišemo koje su teme tamne
declare -A dark_themes
dark_themes=(
    ["Mint-Y-Dark"]=1
    ["Mint-Y-Dark-Aqua"]=1
    ["Mint-Y-Dark-Blue"]=1
    ["Mint-Y-Dark-Orange"]=1
    ["Mint-Y-Dark-Teal"]=1
)

# Lista dostupnih tema
available_themes=(
    "Mint-Y"
    "Mint-Y-Dark"
    "Mint-Y-Aqua"
    "Mint-Y-Dark-Aqua"
    "Mint-Y-Blue"
    "Mint-Y-Dark-Blue"
    "Mint-Y-Orange"
    "Mint-Y-Dark-Orange"
    "Mint-Y-Teal"
    "Mint-Y-Dark-Teal"
)

# Funkcija za prikaz menija
show_menu() {
    echo "=== Dostupne teme ==="
    for i in "${!available_themes[@]}"; do
        echo "$((i+1)). ${available_themes[$i]}"
    done
    echo "0. Izlaz"
    echo "=================="
}

# Funkcija za primjenu teme
apply_theme() {
    local theme="$1"
    local icons="${theme_to_icon[$theme]}"
    
    # Provjera da li je tema tamna
    local is_dark="false"
    if [[ -n "${dark_themes[$theme]}" ]]; then
        is_dark="true"
    fi

    echo ""
    echo "Primjenjujem temu: $theme"
    echo "Primjenjujem ikone: $icons"
    echo "Tamna tema: $is_dark"
    echo ""

    # Postavka GTK teme za Cinnamon
    #gsettings set org.cinnamon.desktop.interface gtk-theme "$theme"
    
    # Postavka Cinnamon teme (ovo je važno za desktop tema)
    #gsettings set org.cinnamon.theme name "$theme"
    
    # Postavka GTK teme za GNOME kompatibilnost
    #gsettings set org.gnome.desktop.interface gtk-theme "$theme"
    
    # Primjena GTK 4 teme preko settings.ini
    #local gtk4_config_dir="$HOME/.config/gtk-4.0"
    #local gtk4_config="$gtk4_config_dir/settings.ini"
    
    #mkdir -p "$gtk4_config_dir"
    
#    cat > "$gtk4_config" << EOF
#[Settings]
#gtk-theme-name=$theme
#gtk-icon-theme-name=$icons
#gtk-application-prefer-dark-theme=$is_dark
#EOF
    
    # Postavka ikona za Cinnamon
    #gsettings set org.cinnamon.desktop.interface icon-theme "$icons"
    
    # Postavka ikona za GNOME kompatibilnost
    #gsettings set org.gnome.desktop.interface icon-theme "$icons"
    
    # Primjena teme za prozore (metacity)
    #gsettings set org.cinnamon.desktop.wm.preferences theme "$theme"
    
    # Takođe postavimo preferiranu tamnu temu za Cinnamon interfejs
    #gsettings set org.gnome.desktop.interface color-scheme "prefer-$([ "$is_dark" = "true" ] && echo "dark" || echo "light")"
    
    echo "Tema uspješno primijenjena!"
    echo "Napomena: Za potpunu primjenu GTK 4 teme, restartujte GTK 4 aplikacije."

    # run script to get colors from wallpaper
    #exec-wal
}

# Glavni program
main() {
    while true; do
        show_menu
        read -p "Odaberite temu (0 za izlaz): " choice
        
        case $choice in
            0)
                echo "Izlazim..."
                exit 0
                ;;
            [1-9]|10)
                if [[ $choice -le ${#available_themes[@]} ]]; then
                    index=$((choice-1))
                    selected_theme="${available_themes[$index]}"
                    
                    if [[ -n "${theme_to_icon[$selected_theme]}" ]]; then
                        apply_theme "$selected_theme"
                    else
                        echo "Greška: Odabrana tema nema mapirane ikone!"
                    fi
                else
                    echo "Nevažeći izbor!"
                fi
                ;;
            *)
                echo "Nevažeći unos! Molimo unesite broj iz menija."
                ;;
        esac
        
        echo ""
        #read -p "Pritisnite Enter za nastavak..."
        #clear
        exit 0
    done
}

# Pokreni glavni program
main
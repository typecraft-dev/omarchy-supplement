#!/bin/bash

# Disable notification popups in Omarchy by setting mako default-timeout to 0
set -e

MAKO_CORE_INI="$HOME/.local/share/omarchy/default/mako/core.ini"

if [ -f "$MAKO_CORE_INI" ]; then
    echo "Disabling Mako notification popups in $MAKO_CORE_INI..."
    # Replace default-timeout=... with default-timeout=0
    sed -i 's/default-timeout=[0-9]\+/default-timeout=0/' "$MAKO_CORE_INI"
    
    # Reload mako if it's running
    if command -v makoctl &>/dev/null; then
        echo "Reloading mako..."
        makoctl reload || echo "Mako is not currently running, changes will apply on next start."
    fi
    echo "Notification popups disabled successfully."
else
    echo "Mako core config not found at $MAKO_CORE_INI. Skipping."
fi

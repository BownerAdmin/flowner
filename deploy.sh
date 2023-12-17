#!/bin/bash

# Go to the "workspace" folder
cd /Users/hugofaye/workspace

# Execute the first command
echo "Executing: export FF project"
flutterflow export-code --project casa-qr-admin-bqhkea --dest . --token 47a821ad-34e1-4c1f-b92c-863e57c527e8 --include-assets

# Go to the "flowner" folder
cd flowner

# Modify the "web/index.html" file
# echo "Modifying web/index.html"
# sed -i '' 's|<base href="/">|<base href="/flowner/">|g' web/index.html


# Execute the second command
echo "Executing: flutter pub get && flutter build web"
flutter pub get && flutter build web --release --base-href="/flowner/"

# Change to the "build/web" folder
cd build/web

# Execute the third command
echo "Executing: git add . && git commit -m 'update' && git push"
git add . && git commit -m "update" && git push

echo "Script execution completed."


#!/bin/bash
cat << 'HHTML' > layouts/partials/test.html
1 absURL no slash: {{ "assets" | absURL }}
2 absURL slash: {{ "/assets" | absURL }}
3 relURL no slash: {{ "assets" | relURL }}
4 relURL slash: {{ "/assets" | relURL }}
HHTML
hugo > /dev/null
echo "===== baseURL: https://youngyoung-0.github.io/portfolio/ ====="
grep "absURL" public/index.html | head -n 4
grep "relURL" public/index.html | head -n 4

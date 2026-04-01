import os, glob, re

def replace_in_file(filepath):
    with open(filepath, 'r') as f:
        content = f.read()

    # match {{ "/assets/... | relURL }} -> {{ "assets/... | absURL }}
    content = re.sub(r'\{\{\s*"/assets/([^"]+)"\s*\|\s*relURL\s*\}\}', r'{{ "assets/\1" | absURL }}', content)
    
    # Also fix older ones if any just in case: {{ "assets/... | relURL }} -> {{ "assets/... | absURL }}
    content = re.sub(r'\{\{\s*"assets/([^"]+)"\s*\|\s*relURL\s*\}\}', r'{{ "assets/\1" | absURL }}', content)

    # In list.html: {{ $thumbURL = (printf "/%s" $thumb) | relURL }} -> {{ $thumbURL = $thumb | absURL }}
    content = content.replace('{{ $thumbURL = (printf "/%s" $thumb) | relURL }}', '{{ $thumbURL = $thumb | absURL }}')

    with open(filepath, 'w') as f:
        f.write(content)

for root, _, files in os.walk('layouts'):
    for file in files:
        if file.endswith('.html'):
            replace_in_file(os.path.join(root, file))

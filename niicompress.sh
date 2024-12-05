find . -type f -name "*.nii" -exec sh -c '
  for file; do
    # Get original file size in MB
    original_size=$(stat -c %s "$file")
    original_size_mb=$(echo "scale=2; $original_size/1048576" | bc)

    # Compress the file
    gzip "$file"

    # Get compressed file size in MB
    compressed_size=$(stat -c %s "$file.gz")
    compressed_size_mb=$(echo "scale=2; $compressed_size/1048576" | bc)

    # Output the sizes in MB
    echo "Original: $original_size_mb MB, Compressed: $compressed_size_mb MB -> $file.gz"

    # Optional: Remove original file
    rm "$file"
  done
' sh {} +

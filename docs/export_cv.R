pagedown::chrome_print("docs/index.html")
fs::file_copy(path = "docs/index.pdf", new_path = "docs/rungo_cv.pdf", overwrite = TRUE)
fs::file_copy(path = "docs/index.html", new_path = "docs/rungo_cv.html", overwrite = TRUE)

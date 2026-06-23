# Render the CV and export the downloadable PDF/HTML.
# NOTE: index.html is the hand-written landing page and is NOT generated here.
#       The pagedown CV is built from cv.Rmd -> cv.html -> rungo_cv.pdf.

rmarkdown::render("docs/cv.Rmd")
pagedown::chrome_print("docs/cv.html")
fs::file_copy(path = "docs/cv.pdf", new_path = "docs/rungo_cv.pdf", overwrite = TRUE)
fs::file_copy(path = "docs/cv.html", new_path = "docs/rungo_cv.html", overwrite = TRUE)

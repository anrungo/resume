# Render the CV and export the downloadable PDF/HTML.
# NOTE: index.html is the hand-written landing page and is NOT generated here.
#       The pagedown CV is built from cv.Rmd -> cv.html (+ cv.pdf via chrome_print).
#       The site links to cv.pdf (full CV) and cv.html ("View full CV").

rmarkdown::render("docs/cv.Rmd")
pagedown::chrome_print("docs/cv.html")

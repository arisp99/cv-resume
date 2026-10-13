.PHONY: all cv resume clean

LATEXMK = latexmk
LATEXMK_FLAGS = -lualatex -interaction=nonstopmode -halt-on-error
RESUME_DIR = resume
CV_DIR = cv
RESUME_SRCS = $(shell find $(RESUME_DIR) -name '*.tex')
CV_SRCS = $(shell find $(CV_DIR) -name '*.tex')
COMMON_SRCS = awesome-cv.cls awesome-cv.bbx publications.bib

all: cv resume

cv: cv.pdf

resume: resume.pdf

resume.pdf: resume.tex $(RESUME_SRCS) $(COMMON_SRCS)
	$(LATEXMK) $(LATEXMK_FLAGS) $<

cv.pdf: cv.tex $(CV_SRCS) $(COMMON_SRCS)
	$(LATEXMK) $(LATEXMK_FLAGS) $<

clean:
	$(LATEXMK) -C cv.tex resume.tex

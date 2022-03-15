.PHONY: install, remove, generate, test, generate-html

install-gitlab:
	R -e 'devtools::install_gitlab("microclimate_r/microclim", host="git.sorbus.ibot.cas.cz", auth_token="5N6cg1k2TNczNj85xf15")'

install:
	R -e 'pkg_file <- devtools::build("."); install.packages(pkg_file, repos = NULL, build_vignettes=TRUE)'

remove:
	R -e 'remove.packages("myClim")'

generate:
	for filename in data-raw/mc_data_*.R; do Rscript "$$filename"; done
	$(RM) NAMESPACE
	R -e 'devtools::document()'

generate-html:
	R -e 'pkgdown::build_site(override = list(destination = "../docs"))'

test:
	R --vanilla -e 'testthat::test_dir("tests")'

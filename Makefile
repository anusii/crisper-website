########################################################################
#
# Generic Makefile
#
# Time-stamp: <Monday 2021-08-16 08:20:27 AEST >
#
# Copyright (c) Graham.Williams@togaware.com
#
# License: Creative Commons Attribution-ShareAlike 4.0 International.
#
########################################################################

# App version numbers
#   Major release
#   Minor update
#   Trivial update or bug fix

APP=myapp
VER=0.0.1
DATE=$(shell date +%Y-%m-%d)
DEST=/var/www/wsgi/static
CSS=style.css
HTML=index.html automated_alerts.html dashboards.html data_engine.html \
     exposure_sites.html mobile_contact_tracing_map.html \
     header.html footer.html about_us.html data_sources.html
FAVICON=Assets/favicon.ico

########################################################################
# Supported modules.

INC_BASE    = $(HOME)/.local/share/make
INC_CLEAN   = $(INC_BASE)/clean.mk
INC_R       = $(INC_BASE)/r.mk
INC_KNITR   = $(INC_BASE)/knitr.mk
INC_PANDOC  = $(INC_BASE)/pandoc.mk
INC_GIT     = $(INC_BASE)/git.mk
INC_AZURE   = $(INC_BASE)/azure.mk
INC_LATEX   = $(INC_BASE)/latex.mk
INC_PDF     = $(INC_BASE)/pdf.mk
INC_DOCKER  = $(INC_BASE)/docker.mk
INC_MLHUB   = $(INC_BASE)/mlhub.mk
INC_WEBCAM  = $(INC_BASE)/webcam.mk

ifneq ("$(wildcard $(INC_CLEAN))","")
  include $(INC_CLEAN)
endif
ifneq ("$(wildcard $(INC_R))","")
  include $(INC_R)
endif
ifneq ("$(wildcard $(INC_KNITR))","")
  include $(INC_KNITR)
endif
ifneq ("$(wildcard $(INC_PANDOC))","")
  include $(INC_PANDOC)
endif
ifneq ("$(wildcard $(INC_GIT))","")
  include $(INC_GIT)
endif
ifneq ("$(wildcard $(INC_AZURE))","")
  include $(INC_AZURE)
endif
ifneq ("$(wildcard $(INC_LATEX))","")
  include $(INC_LATEX)
endif
ifneq ("$(wildcard $(INC_PDF))","")
  include $(INC_PDF)
endif
ifneq ("$(wildcard $(INC_DOCKER))","")
  include $(INC_DOCKER)
endif
ifneq ("$(wildcard $(INC_MLHUB))","")
  include $(INC_MLHUB)
endif
ifneq ("$(wildcard $(INC_WEBCAM))","")
  include $(INC_WEBCAM)
endif

define HELP
$(APP):

  install	Install website to $(DEST)

endef
export HELP

help::
	@echo "$$HELP"

install:
	sudo install -m u=rw,g=r,o=r $(HTML) $(CSS) $(DEST)
	sudo install -m u=rw,g=r,o=r $(FAVICON) $(DEST)
	sudo mkdir -p $(DEST)/Assets
	sudo rsync -avzh Assets/ $(DEST)/Assets/
	sudo chmod -R a+rX $(DEST)/Assets

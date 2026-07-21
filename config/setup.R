# Cau hinh dung chung cho ca 3 Part (Statistical_Modeling)
# Duoc goi bang: source(here::here("config", "setup.R")) tu file .Rmd cua tung Part.
#
# Dung goi "here" de xac dinh thu muc goc cua repo (noi co .git) thay vi dua
# vao working directory hien tai: rmarkdown/knitr khi xu ly child document co
# the doi working directory tuy theo trang thai phien R (session cu con sot
# lai opts_knit$root.dir tu luc chay chunk tuong tac se lam sai duong dan
# tuong doi thong thuong). here::here() luon tra ve dung goc repo bat ke
# working directory hien tai la gi, nen moi duong dan doc du lieu trong cac
# Part_X.Rmd nen dung here::here(...) thay vi string tuong doi.

if (!requireNamespace("here", quietly = TRUE)) install.packages("here")

packages <- c(
  "here",        # xac dinh thu muc goc repo, khong phu thuoc working directory
  "tidyverse",   # doc/xu ly du lieu, ggplot2
  "corrplot",    # ma tran tuong quan
  "GGally",      # bieu do cap doi (pairs plot)
  "caret",       # chia train/test, tien ich mo hinh
  "glmnet",      # Ridge, LASSO
  "leaps",       # lua chon bien (tham khao)
  "scales",      # dinh dang truc/nhan bieu do
  "knitr",       # bang bieu, child document
  "kableExtra"   # dinh dang bang cho pdf/html
)

installed <- rownames(installed.packages())
missing_pkgs <- setdiff(packages, installed)
if (length(missing_pkgs) > 0) install.packages(missing_pkgs)

invisible(lapply(packages, library, character.only = TRUE))

set.seed(2026)

theme_set(
  theme_minimal(base_size = 11) +
    theme(
      plot.title = element_text(face = "bold"),
      panel.grid.minor = element_blank()
    )
)

# ---- Ham danh gia mo hinh dung chung cho ca 3 Part ----

rmse <- function(actual, predicted) sqrt(mean((actual - predicted)^2))
mae  <- function(actual, predicted) mean(abs(actual - predicted))
r2_score <- function(actual, predicted) {
  1 - sum((actual - predicted)^2) / sum((actual - mean(actual))^2)
}

# Tong hop RMSE/MAE/R2 cua nhieu mo hinh vao 1 bang de so sanh
compare_models <- function(model_name, actual, predicted) {
  data.frame(
    Model = model_name,
    RMSE  = rmse(actual, predicted),
    MAE   = mae(actual, predicted),
    R2    = r2_score(actual, predicted)
  )
}

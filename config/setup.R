# Cau hinh dung chung cho ca 3 Part (Statistical_Modeling)
# Duoc goi bang: source("config/setup.R") tu file .Rmd cua tung Part,
# hoac source(here::here("config", "setup.R")) neu chay tu thu muc con.

packages <- c(
  "tidyverse",   # doc/xu ly du lieu, ggplot2
  "corrplot",    # ma tran tuong quan
  "GGally",      # bieu do cap doi (pairs plot)
  "caret",       # chia train/test, tien ich mo hinh
  "glmnet",      # Ridge, LASSO
  "pls",         # PCR (hoi quy tren thanh phan chinh)
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

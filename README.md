# Statistical_Modeling — Đồ án kết thúc học phần

Đồ án môn **Mô hình hóa thống kê**, gồm 3 phần (mỗi phần là một `.Rmd`,
được `main.Rmd` gộp lại thành 1 báo cáo PDF duy nhất để nộp).

## Cấu trúc thư mục

```
Statistical_Modeling/
├── main.Rmd                        # File gộp: trang bìa + child cả 3 Part -> render ra 1 PDF/HTML
├── references.bib                  # Tài liệu tham khảo dùng chung
├── config/
│   └── setup.R                     # Cấu hình dùng chung: package, seed, theme, hàm RMSE/MAE/R2
├── Part_1_CommunityCrime/          # Hoạt động 1.1: Dự đoán tỷ lệ tội phạm bạo lực (PCR/OLS/Ridge/LASSO)
│   ├── data/raw/                   # communities.data, communities.names (UCI)
│   ├── data/processed/
│   ├── output/                     # Hình/bảng xuất ra (nếu lưu riêng)
│   └── Part_1_CommunityCrime.Rmd
├── Part_2_SalaryDS/                 # Hoạt động 1.2: Mức lương ngành khoa học dữ liệu
│   ├── data/raw/ds_salaries.csv    # Kaggle "Data Science Job Salaries"
│   ├── output/
│   └── Part_2_SalaryDS.Rmd
└── Part_3_FreeChoice/                # Hoạt động 2: Bộ dữ liệu tự chọn (>= 8 biến, chưa dùng ở Part 1/2)
    ├── data/raw/                    # Đặt file dữ liệu tự chọn vào đây
    ├── output/
    └── Part_3_FreeChoice.Rmd
```

## Cách chạy

1. Mở project tại thư mục gốc `Statistical_Modeling/` (repo có `.git`, package `here` sẽ tự
   nhận diện thư mục gốc này để tìm dữ liệu — không phụ thuộc working directory hiện tại).
2. Cài đặt các package cần thiết (tự động cài khi `source(here::here("config", "setup.R"))`
   nếu thiếu): `here`, `tidyverse`, `corrplot`, `GGally`, `caret`, `glmnet`, `pls`, `leaps`,
   `scales`, `knitr`, `kableExtra`, `psych`.
3. Render toàn bộ báo cáo (3 part gộp thành 1 file):
   ```r
   rmarkdown::render("main.Rmd", output_format = "pdf_document")
   ```
   Cần cài TeX (khuyến nghị `tinytex::install_tinytex()`) để xuất PDF với `xelatex`.
4. Mỗi `Part_X.Rmd` là **child document** (không có YAML riêng) nên không tự render độc lập được;
   phải render qua `main.Rmd`.

**Lỗi thường gặp:** nếu Knit báo `Error in file() : cannot open the connection` khi
`source(...)`, hãy **restart R session** rồi Knit lại (Session cũ có thể đang giữ working
directory bị lệch do trước đó đã chạy chunk tương tác trong 1 file con). Toàn bộ đường dẫn
trong repo đã dùng `here::here(...)` nên về nguyên tắc không phụ thuộc working directory,
nhưng restart session vẫn là cách nhanh nhất để loại bỏ trạng thái cũ nếu gặp lỗi lạ.

## Trạng thái từng Part

- **Part 1 — Communities and Crime**: đã tải sẵn dữ liệu gốc, dựng khung code đầy đủ các bước
  (EDA, tiền xử lý, PCR có kiểm tra KMO/Bartlett + chọn số PC bằng CV, OLS, Ridge, LASSO, so sánh
  RMSE/MAE/R², loadings, quy đổi hệ số PCR về biến gốc). Các phần diễn giải còn đánh dấu `TODO`.
- **Part 2 — Data Science Job Salaries**: đã copy sẵn `ds_salaries.csv`, dựng khung EDA + tiền xử
  lý + mô hình dự đoán lương. Cần bổ sung: gộp nhóm `job_title`, chọn phương pháp so sánh nhóm,
  hoàn thiện mô hình và diễn giải.
- **Part 3 — Bộ dữ liệu tự chọn**: mới có khung sườn (chưa gắn dữ liệu). Cần: chọn đề tài + bộ dữ
  liệu (≥ 8 biến, không trùng Part 1/2), đặt file vào `Part_3_FreeChoice/data/raw/`, rồi điền vào
  các mục còn `TODO` trong `Part_3_FreeChoice.Rmd`.

## Trước khi nộp bài

- Điền trang bìa (`main.Rmd`): tên giảng viên, nhóm, bảng phân công công việc.
- Kiểm tra báo cáo PDF không vượt quá 80 trang (không tính phụ lục).
- Đóng gói theo yêu cầu: `NhomXX-DoAn.pdf` + thư mục mã nguồn (`.R`/`.Rmd`/`.html`) + thư mục dữ liệu.

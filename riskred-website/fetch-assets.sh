#!/usr/bin/env bash
# Run this on your own machine (not in a restricted sandbox) from the
# root of the riskred-website project. It downloads every image and PDF
# referenced from the old Wix site into src/images/ and src/files/.
#
# Usage:
#   chmod +x scripts/fetch-assets.sh
#   ./scripts/fetch-assets.sh

set -e
mkdir -p src/images src/files

img() { # img <wix-media-id> <local-filename>
  echo "Fetching image: $2"
  curl -sL "https://static.wixstatic.com/media/$1" -o "src/images/$2"
}

pdf() { # pdf <riskred-ugd-filename> <local-filename>
  echo "Fetching PDF: $2"
  curl -sL "https://www.riskred.org/_files/ugd/$1" -o "src/files/$2"
}

# --- Site chrome / shared images ---
img "310a66_58e2f956921945d28d119103cbcb62b7.jpg" "site-banner.jpg"
img "310a66_af0cdbcb954c46d5984ff394e2bbcb41.png" "footer-logo.png"
img "89b1d2497b29ccbb7d37be1ec6ef0052.png" "icon-twitter.png"

# --- Home / About photo ---
img "310a66_0bfd327ee4b9483ebf643b2dab3625e2.jpg" "what-we-do.jpg"

# --- Team photos ---
img "310a66_0af22593f72c485d9ad59811ae1cc28a.jpg" "team-bishnu-pandey.jpg"
img "96ab52_c137623a28184bb2ab86ebe3e3ffd2d5~mv2.jpg" "team-rebekah-paci-green.jpg"
img "310a66_ee5e12d43ae7490fb1a301bb2d6f235f.jpg" "team-rob-friedman.jpg"
img "96ab52_cdbdc71a91e44489b932683938d531d8~mv2.jpg" "team-suha-ulgen.jpg"

# --- Portfolio images ---
img "310a66_976cde22290e44539082ed712e72d378.jpg" "portfolio-community-construction.jpg"
img "96ab52_f6314888ca2c42e9977a436634f145f6~mv2.jpg" "portfolio-first-step-app.jpg"
img "96ab52_4ed4a28664e441aa95d1dbab14c26068~mv2.jpg" "portfolio-videos.jpg"
img "96ab52_00fdd637801f45dfa59b058ef14d2e77~mv2.jpg" "portfolio-assessment-survey.jpg"
img "310a66_493cfe0880604a3daf8e99a17caba9dd.jpg" "portfolio-css-framework.jpg"
img "310a66_90e5247cc64c46418daf1b4e28679809.jpg" "portfolio-dreams.jpg"
img "310a66_cad25fec1f6544f78d48b59c1da119a0.jpg" "portfolio-central-asia-assessment.jpg"

# --- Education Material ---
img "96ab52_664b6622d81942a1982c08cbc7e5befa~mv2.jpg" "education-shake-table-demo.jpg"

# --- Nepal Safer Schools / Projects ---
img "310a66_55853f4c494f4476934b81123286e204.jpg" "nepal-photo-1.jpg"
img "310a66_614b5da648f64b11b00dfa9e08ed7abd.jpg" "nepal-broken-school.jpg"
img "310a66_c37ea3b1b84c4739ba4e036931c3b092.jpg" "nepal-boy-studying.jpg"
img "310a66_474bd8b6de3d41efa5ab78ace3da87f5.jpg" "nepal-report-cover.jpg"

# --- Blog thumbnails ---
img "310a66_0e4d64658d624a4b8c133cee43a362c6.jpg" "blog-media-to-inspire.jpg"
img "310a66_4a9a3dc8da3d40199b3bf5024bbe9bfd.jpg" "blog-to-be-an-inspector.jpg"
img "310a66_8cf15c91e76b4fddb8e038c748d0d009.jpg" "blog-stark-contrast.jpg"
img "310a66_fb4fa7a6ddd74342b8f14ed26707b39d.jpg" "blog-school-campin.jpg"
img "310a66_f7ac0112d9ca45f8aff0cb850deb4604.jpg" "blog-routines-and-patterns.jpg"
img "310a66_d6bdad803e1a4ce1b4e8264e2258b162.jpg" "blog-hilltop-school.jpg"
img "310a66_32823af9246e4dd8b2bcf0feca08554d.jpg" "blog-help-not-helpful.jpg"
img "310a66_c5277ec703bd412aa53c7e335ad4905d.jpg" "blog-spit-and-bubblegum.jpg"
img "310a66_d7ec624c188c4327ad251bd0a28a6880.jpg" "blog-monsoons-and-kurtas.jpg"

# --- Publications page images ---
img "96ab52_b1d280c906af494780440e0c387a9c7d~mv2.jpg" "publications-summary-report.jpg"
img "96ab52_c778665c8aa34d9a8bf204cf5ec196c4~mv2.jpg" "publications-report-2.jpg"
img "96ab52_34f6be61deda428ebe5347c4e0784338~mv2.jpg" "publications-report-3.jpg"
img "96ab52_1b72f9179740462b8a92b75ba751196d~mv2.jpg" "publications-css-policy-trends.jpg"

# --- Donate page ---
img "ce4641e9eff9b470c468b4dfc9ff1e82.png" "donate-icon.png"

# ============================================================
# PDFs
# ============================================================

# --- Team CVs ---
pdf "310a66_17e7c5931f284ee085abe2a418bee9f2.pdf" "cv-bishnu-pandey.pdf"
pdf "310a66_e30ee2e0b60d471ab1aa67a7d7a12059.pdf" "cv-rob-friedman.pdf"
pdf "96ab52_2da71fde6b6c4ea9bfed2ffa9c979a69.pdf" "cv-suha-ulgen.pdf"

# --- Portfolio ---
pdf "96ab52_b3f74e6e7ae644b5becee8022f4f3e06.pdf" "portfolio-case-study.pdf"
pdf "96ab52_050caf2ec60f4cefa15be1e66409575a.pdf" "portfolio-brochure.pdf"

# --- Education material ---
pdf "96ab52_7a5a32f03b04451ab7899db8947cd0ba.pdf" "gobag-scavenger-hunt.pdf"
pdf "96ab52_76ed110047c6499c816c35859fa3be33.pdf" "gobag-international-display.pdf"
pdf "96ab52_66e4c9b321e5488cb71cb49befd64ba9.pdf" "ifc-activity-guide-k-6.pdf"
pdf "96ab52_718d336732084d0c8e786525edcd04dd.pdf" "ifc-guidance-for-schools.pdf"
pdf "96ab52_1d582b76a8f14c20a4bbbf16c562e7cf.pdf" "shakeout-2008-full-report.pdf"
pdf "96ab52_53328e7d03134f22bc4227a95b8e885d.pdf" "evidence-basis-earthquake-survival-tips.pdf"
pdf "96ab52_621da4b78caf4ad89733024136c612e9.pdf" "disaster-prevention-full-inclusion.pdf"
pdf "96ab52_d2201ffb0f1745ffabd06cec7fc59786.pdf" "drr-tools-humanitarian-education.pdf"
pdf "96ab52_860f387014194464ae13e6ebaff7464d.pdf" "school-disaster-checklist-english.pdf"
pdf "96ab52_e279335976ab4608b4a658988e9b380d.pdf" "school-disaster-checklist-chinese.pdf"
pdf "96ab52_dd4806d8f16743c692e6061b4d1dd57d.pdf" "school-disaster-response-drill.pdf"
pdf "96ab52_b98aba0a6e9749ae8cb7c1d079276106.pdf" "design-training-workshop.pdf"
pdf "96ab52_41a0eac9aece41e28f8643d92582a941.pdf" "earthquake-safety-schoolchildren-toc.pdf"
pdf "96ab52_7a225e7805954bb0919029ed363cafa3.pdf" "disaster-resiliency-workbook.pdf"

# --- Nepal / Publications ---
pdf "96ab52_62ca9ca3a82f407ba21c0ba1272c6692.pdf" "nepal-safer-schools-report.pdf"
pdf "96ab52_59f988f57926415e8b99acdf6c8e9fb2.pdf" "nepal-causes-of-death-report.pdf"
pdf "96ab52_b3ff3a0cbc5c4eaab805aabf43072250.pdf" "publications-summary-english.pdf"
pdf "96ab52_487e47ddb80a46a7b7476f934194a591.pdf" "publications-summary-nepali.pdf"
pdf "310a66_29af08b40e86416aa1a0ae1c4ef95135.pdf" "publications-nepali-summary-2.pdf"
pdf "310a66_a1342a38679c44ccba8a01341df6eccb.pdf" "publications-summary-nepal.pdf"
pdf "310a66_fc5b91f810fb4825a0069d4ea3895db3.pdf" "publications-full-report-nepal.pdf"

echo ""
echo "Done. Check src/images/ and src/files/ for the downloaded assets."
echo "Some files may fail (renamed/removed on Wix's end since the site was last updated) - check for 0-byte files:"
find src/images src/files -size 0

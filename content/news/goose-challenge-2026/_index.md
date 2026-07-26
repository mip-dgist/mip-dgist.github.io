---
title: "GOOSE 2D Fine-Grained Semantic Segmentation Challenge"
date: 2026-05-20
---

<style>
.page-body {
  --news-navy: #0f2f57;
  --news-blue: #2563eb;
  --news-sky: #38bdf8;
  --news-soft: #eff6ff;
  margin-top: 0 !important;
  margin-bottom: 0 !important;
  padding: 2.5rem 0 3.5rem;
  background:
    radial-gradient(circle at 12% 8%, rgb(56 189 248 / 0.12), transparent 28rem),
    radial-gradient(circle at 88% 22%, rgb(37 99 235 / 0.08), transparent 24rem),
    linear-gradient(180deg, #f7fbff 0%, #ffffff 70%);
}

.page-body > .max-w-prose {
  width: calc(100% - 3rem);
  max-width: 1050px !important;
}

.page-body article {
  position: relative;
  overflow: hidden;
  width: 100%;
  max-width: none !important;
  padding: clamp(1.5rem, 4vw, 3rem);
  border: 1px solid #dbe7f5;
  border-radius: 1.25rem;
  background: #ffffff;
  box-shadow: 0 20px 50px rgb(15 47 87 / 0.1);
}

.page-body article::before {
  content: "";
  position: absolute;
  inset: 0 0 auto;
  height: 5px;
  background: linear-gradient(90deg, var(--news-navy), var(--news-blue), var(--news-sky));
}

.page-body article h1 {
  font-size: clamp(2rem, 4vw, 3.25rem) !important;
  line-height: 1.08 !important;
  margin-bottom: 1.75rem !important;
  letter-spacing: -0.035em;
  color: var(--news-navy);
}

.page-body article h2 {
  margin-top: 1.75rem !important;
  margin-bottom: 0.65rem !important;
  padding-left: 0.75rem;
  border-left: 4px solid var(--news-sky);
  color: var(--news-navy);
}

.page-body article p,
.page-body article ul {
  margin-top: 0.5rem !important;
  margin-bottom: 1rem !important;
}

.page-body article figure {
  margin: 1.5rem 0 !important;
}

.page-body article figure img {
  width: 100%;
  border-radius: 0.75rem;
}

.page-body article figcaption {
  margin-top: 0.5rem;
  text-align: center;
  font-size: 0.875rem;
  color: #64748b;
}

.news-gallery {
  display: grid;
  grid-template-columns: repeat(2, minmax(0, 1fr));
  gap: 1rem;
  margin: 1.5rem 0;
}

.news-gallery figure {
  margin: 0 !important;
  overflow: hidden;
  border: 1px solid #dbeafe;
  border-radius: 0.85rem;
  background: #ffffff;
  box-shadow: 0 10px 24px rgb(15 47 87 / 0.09);
}

.news-gallery img {
  width: 100%;
  height: 320px;
  object-fit: cover;
  border-radius: 0 !important;
  transition: transform 0.3s ease;
}

.news-gallery figure:hover img {
  transform: scale(1.025);
}

.news-gallery figcaption {
  min-height: 3.25rem;
  margin: 0 !important;
  padding: 0.75rem 1rem;
  display: flex;
  align-items: center;
  justify-content: center;
  background: linear-gradient(180deg, #ffffff, #f8fbff);
  color: #475569;
}

.news-highlight {
  margin: 1.25rem 0;
  padding: 1.35rem 1.5rem;
  border: 1px solid rgb(125 211 252 / 0.45);
  border-radius: 0.9rem;
  background: linear-gradient(135deg, var(--news-navy), #1d4ed8 72%, #2563eb);
  color: #ffffff;
  box-shadow: 0 14px 30px rgb(15 47 87 / 0.2);
}

.winner-label {
  display: inline-block;
  margin-bottom: 0.35rem;
  font-size: 0.72rem;
  font-weight: 800;
  letter-spacing: 0.12em;
  color: #bae6fd;
}

.page-body article a {
  color: var(--news-blue);
  font-weight: 600;
}

.media-link {
  display: inline-flex;
  align-items: center;
  padding: 0.5rem 0.8rem;
  border-radius: 0.65rem;
  background: linear-gradient(135deg, var(--news-navy), var(--news-blue));
  color: #ffffff !important;
  font-size: 0.875rem;
  text-decoration: none !important;
  box-shadow: 0 8px 18px rgb(37 99 235 / 0.18);
  transition: box-shadow 0.2s ease, transform 0.2s ease;
}

.media-link:hover {
  transform: translateY(-2px);
  box-shadow: 0 12px 24px rgb(37 99 235 / 0.28);
}

.dark .page-body {
  background: linear-gradient(180deg, #0f172a 0%, #111827 55%);
}

.dark .page-body article {
  border-color: #334155;
  background: #1e293b;
  box-shadow: 0 18px 45px rgb(0 0 0 / 0.25);
}

.dark .page-body article h1 {
  color: #f8fafc;
}

.dark .page-body article h2 {
  color: #93c5fd;
}

.dark .news-highlight {
  border-color: #1e40af;
  background: rgb(30 58 138 / 0.25);
  color: #dbeafe;
}

.dark .news-gallery figure {
  border-color: #334155;
  background: #1e293b;
}

@media (max-width: 640px) {
  .page-body > .max-w-prose {
    width: calc(100% - 2rem);
  }

  .news-gallery {
    grid-template-columns: 1fr;
  }

  .news-gallery img {
    height: auto;
  }
}
</style>

## 1st Place at ICRA 2026 Workshop on Field Robotics

The DGIST–MIT joint research team placed **1st among 56 international teams** in the GOOSE 2D Fine-Grained Semantic Segmentation Challenge at ICRA 2026.

The team was led by **Professor Sung-Hoon Yoon** and included **Jaeil Park, Hyobin Choi, and Sangjin Lee**, with co-advising from **Dr. Hyungtae Lim** of the MIT SPARK Lab.

## Key Achievement

The challenge evaluated semantic segmentation across **64 fine-grained classes** in complex, unstructured outdoor environments. The team combined **DINOv3** with **Mask2Former** to improve robust scene understanding, particularly for rare objects with limited training data.

<div class="news-gallery">
  <figure>
    <img src="icra_challenge.jpg" alt="MIP Lab at the ICRA 2026 GOOSE Challenge">
    <!-- <figcaption>First place at the ICRA 2026 GOOSE Challenge.</figcaption> -->
  </figure>
  <figure>
    <img src="icra_challenge2.jpg" alt="DGIST MIP Lab research team">
    <!-- <figcaption>Professor Sung-Hoon Yoon, Sangjin Lee, Hyobin Choi, and Jaeil Park.</figcaption> -->
  </figure>
</div>

The technology can support autonomous vehicles, disaster-response robots, smart agriculture, and construction-site robots operating in challenging outdoor environments.

## Media Coverage

<a class="media-link" href="https://www.asiae.co.kr/en/article/2026060907515545005" target="_blank" rel="noopener">Read the original article →</a>

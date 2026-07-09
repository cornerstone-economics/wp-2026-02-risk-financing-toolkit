# WP-2026-02. The truncated toolkit: disaster risk finance and the limits of autonomy in the Dutch Caribbean

**Status:** working paper, v0.4.0 (July 2026).
**Series:** Cornerstone Economics Working Papers, [papers.c-economics.com](https://papers.c-economics.com).
**Identifier:** WP-2026-02.
**License:** text CC-BY 4.0, code MIT.

Subtitle: *Sovereign and non-sovereign risk transfer under the Kingdom's financial-supervision architecture.*

## In brief

The central banks of the Dutch Caribbean hold more foreign reserves than they need to defend their currency pegs, while their governments buy almost none of the modern instruments that finance disaster recovery more cheaply. Part of the gap is structural: as autonomous countries within the Kingdom rather than sovereign states, Aruba, Curacao and Sint Maarten cannot tap the pre-agreed emergency credit lines that their independent neighbours use, and they cannot issue catastrophe bonds. Part of the gap is a choice: the layers they can reach, parametric insurance and a self-financed reserve fund, they have barely used. Relying on reserves alone is the most expensive way to carry a risk that cheaper instruments price better. The paper reads the toolkit as a risk-layering stack, shows which layers the Kingdom architecture forecloses and which stay open, reads the Sint Maarten Disaster Reserve Fund and the Aruba public-private-partnership reclassification as one off-balance-sheet instinct with different debt consequences, and draws out actionable implications for the finance ministries, the central banks, and the Kingdom.

## What is in this repository

`paper.qmd` is the master manuscript and `references.bib` holds the citations. `figures/` holds the truncated-toolkit figure and the R script that builds it; the reserve-adequacy chart is generated inline from the manuscript. `_quarto.yml` drives the camera-ready PDF and the web HTML, built and attached to each release by the CI workflow.

## Build

```bash
quarto render paper.qmd
```

Local rendering needs Quarto 1.5+ and R 4.2+ with ggplot2.

## Citation

See `CITATION.cff`. The DOI is minted on Zenodo at release and backfilled here.

## Note on versioning

This is a provisional working paper. The v1.0 release will add a line-by-line statutory review and institutional-pathway interviews; the argument is stable and the empirical spine is in hand. Prior circulation as a working paper follows economics-journal norms and does not foreclose a later journal version.

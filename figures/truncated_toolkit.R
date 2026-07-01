# WP-2026-02 Figure: The truncated toolkit -- risk-layering in the Dutch Caribbean
# Iteration: 2  (fix: y-axis direction labels were clipped; moved to axis title + margin)
library(ggplot2)

# LovelyData palette
blue  <- "#44759e"; orange <- "#f38439"; beige <- "#dee3c8"
green <- "#749c4c"; grey   <- "#605b54"

outdir <- "C:/Users/Rendell CE/Documents/GitHub/knowledge-hub/01-projects/wp-2026-02-reserve-adequacy/figures"

# Risk-layering stack, bottom (frequent/low-severity) -> top (rare/high-severity)
layers <- data.frame(
  idx = 1:6,
  label = c("Budgetary reallocation",
            "Reserves & contingency fund\n(incl. Disaster Reserve Fund)",
            "Contingent credit\n(Cat DDO, IDB CCF)",
            "Parametric insurance\n(CCRIF)",
            "Catastrophe bonds /\ncapital markets",
            "Residual risk"),
  category = c("Retention","Retention","Contingent debt",
               "Risk transfer","Risk transfer","Residual"),
  stringsAsFactors = FALSE)
layers$ymin <- layers$idx - 1
layers$ymax <- layers$idx

catcol <- c("Retention"=green, "Contingent debt"=blue,
            "Risk transfer"=orange, "Residual"=grey)

# Two panels: full standard stack vs the Dutch Caribbean's reachable stack
full <- layers; full$panel <- "Standard risk-layering toolkit"; full$foreclosed <- FALSE
full$fill <- catcol[full$category]

dc <- layers; dc$panel <- "Dutch Caribbean: what the Kingdom leaves open"
dc$foreclosed <- dc$idx %in% c(3, 5)                 # contingent credit + cat bonds
dc$fill <- ifelse(dc$foreclosed, beige, catcol[dc$category])
dc$label[dc$idx == 6] <- "Residual falls to Kingdom\nemergency transfers\n(with conditionality)"

blocks <- rbind(full, dc)
blocks$panel <- factor(blocks$panel,
                       levels = c("Standard risk-layering toolkit",
                                  "Dutch Caribbean: what the Kingdom leaves open"))
blocks$xmin <- 0.6; blocks$xmax <- 1.4
blocks$txtcol <- ifelse(blocks$fill == beige, grey, "white")

fore <- subset(blocks, foreclosed)                    # for the diagonal "cut-out" marks

p <- ggplot(blocks) +
  geom_rect(aes(xmin = xmin, xmax = xmax, ymin = ymin, ymax = ymax, fill = fill),
            colour = "white", linewidth = 1.2) +
  geom_segment(data = fore, aes(x = xmin, y = ymin, xend = xmax, yend = ymax),
               colour = grey, linewidth = 0.5, linetype = "solid") +
  geom_text(aes(x = (xmin + xmax) / 2, y = (ymin + ymax) / 2,
                label = label, colour = txtcol), size = 2.9, lineheight = 0.9) +
  geom_text(data = fore, aes(x = (xmin + xmax) / 2, y = ymin + 0.14,
                label = "foreclosed"), colour = grey, size = 2.5, fontface = "italic") +
  scale_fill_identity() + scale_colour_identity() +
  facet_wrap(~panel) +
  scale_x_continuous(limits = c(0.5, 1.5), breaks = NULL, expand = c(0, 0)) +
  scale_y_continuous(breaks = NULL, expand = expansion(mult = c(0.03, 0.06))) +
  labs(
    title = "The truncated toolkit: risk-layering in the Dutch Caribbean",
    subtitle = "The Kingdom's fiscal architecture forecloses the contingent-credit and capital-market layers, leaving\nreserves and parametric cover -- forcing reliance onto the bottom and the top of the stack.",
    x = NULL,
    y = "more frequent, lower severity        →        rarer, higher severity",
    caption = paste0(
      "Foreclosed layers: contingent credit (Cat DDO, IDB CCF) is closed by non-sovereign multilateral membership; catastrophe bonds by non-sovereign status under the Rijkswet financieel toezicht.\n",
      "Reserves and parametric insurance stay open because they are not debt. Source: author, adapting the World Bank disaster risk-layering framework.")) +
  theme_minimal(base_size = 11) +
  theme(
    plot.background = element_rect(fill = "white", colour = NA),
    panel.background = element_rect(fill = "white", colour = NA),
    panel.grid = element_blank(),
    panel.spacing = unit(1.4, "lines"),
    plot.margin = margin(10, 14, 10, 10),
    strip.text = element_text(face = "bold", size = 11, colour = grey),
    plot.title = element_text(face = "bold", size = 14, colour = grey),
    plot.subtitle = element_text(size = 9.5, colour = grey),
    plot.caption = element_text(size = 6.6, colour = grey, hjust = 0),
    axis.title.y = element_text(size = 8, colour = grey),
    axis.text = element_blank())

ggsave(file.path(outdir, "truncated_toolkit.png"), p,
       width = 10, height = 6.5, dpi = 200, bg = "white")
cat("done\n")

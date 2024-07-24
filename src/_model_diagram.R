palettetown::pokedex(cb = 4)
palettetown::pokepal(9) %>% 
  stringr::str_remove_all("#F8F8F8") %>% #drop white
  purrr::keep(function(x) x!="") %>% 
  scales::show_col()
# bracket
p1 <-
  tibble(x = .99,
         y = .5,
         label = "{_}") %>% 
  
  ggplot(aes(x = x, y = y, label = label)) +
  geom_text(size = 10, hjust = 1, color = "black", family = "Times") +
  scale_x_continuous(expand = c(0, 0), limits = c(0, 1)) +
  ylim(0, 1) +
  theme_void()

##  plain arrow
# save our custom arrow settings
my_arrow <- arrow(angle = 20, length = unit(0.35, "cm"), type = "closed")
p2 <-
  tibble(x    = .68,
         y    = 1,
         xend = .68,
         yend = .25) %>%
  
  ggplot(aes(x = x, xend = xend,
             y = y, yend = yend)) +
  geom_segment(arrow = my_arrow, color = "black") +
  xlim(0, 1) +
  theme_void()
  
# normal density
p3 <-
  tibble(x = seq(from = -3, to = 3, by = .1)) %>% 
  ggplot(aes(x = x, y = (dnorm(x)) / max(dnorm(x)))) +
  geom_area(fill = "steelblue") +
  annotate(geom = "text",
           x = 0, y = .2,
           label = "normal",
           size = 7, color = "black") +
  annotate(geom = "text",
           x = c(0, 1.45), y = .6,
           hjust = c(.5, 0),
           label = c("italic(M)[0]", "italic(S)[0]"), 
           size = 7, color = "black", family = "Times", parse = T) +
  scale_x_continuous(expand = c(0, 0)) +
  theme_void() +
  theme(axis.line.x = element_line(linewidth = 0.5, color = "black"))
  
# normal density
p4 <-
  tibble(x = seq(from = -3, to = 3, by = .1)) %>% 
  ggplot(aes(x = x, y = (dnorm(x)) / max(dnorm(x)))) +
  geom_area(fill = "steelblue") +
  annotate(geom = "text",
           x = 0, y = .2,
           label = "normal",
           size = 7, color = "black") +
  annotate(geom = "text",
           x = c(0, 1.15), y = .6,
           label = c("0", "sigma[beta][1]"), 
           hjust = c(.5, 0),
           size = 7, color = "black", family = "Times", parse = T) +
  scale_x_continuous(expand = c(0, 0)) +
  theme_void() +
  theme(axis.line.x = element_line(linewidth = 0.5, color = "black"))
  
# normal density
p5 <-
  tibble(x = seq(from = -3, to = 3, by = .1)) %>% 
  ggplot(aes(x = x, y = (dnorm(x)) / max(dnorm(x)))) +
  geom_area(fill = "steelblue") +
  annotate(geom = "text",
           x = 0, y = .2,
           label = "normal",
           size = 7, color = "black") +
  annotate(geom = "text",
           x = c(0, 1.15), y = .6,
           label = c("0", "sigma[beta][2]"), 
           hjust = c(.5, 0),
           size = 7, color = "black", family = "Times", parse = T) +
  scale_x_continuous(expand = c(0, 0)) +
  theme_void() +
  theme(axis.line.x = element_line(linewidth = 0.5, color = "black"))
  
# normal density
p6 <-
  tibble(x = seq(from = -3, to = 3, by = .1)) %>% 
  ggplot(aes(x = x, y = (dnorm(x)) / max(dnorm(x)))) +
  geom_area(fill = "steelblue") +
  annotate(geom = "text",
           x = 0, y = .2,
           label = "normal",
           size = 7, color = "black") +
  annotate(geom = "text",
           x = c(0, 0.67), y = .6,
           hjust = c(.5, 0),
           label = c("0", "sigma[beta][1%*%2]"), 
           size = 7, color = "black", family = "Times", parse = T) +
  scale_x_continuous(expand = c(0, 0)) +
  theme_void() +
  theme(axis.line.x = element_line(linewidth = 0.5, color = "black"))

# four annotated arrows
p7 <-
  tibble(x    = c(.05, .34, .64, .945),
         y    = c(1, 1, 1, 1),
         xend = c(.05, .18, .45, .74),
         yend = c(0, 0, 0, 0)) %>%
  ggplot(aes(x = x, xend = xend,
             y = y, yend = yend)) +
  geom_segment(arrow = my_arrow, color = "black") +
  annotate(geom = "text",
           x = c(.025, .23, .30, .52, .585, .81, .91), y = .5,
           label = c("'~'", "'~'", "italic(j)", "'~'", "italic(k)", "'~'", "italic(jk)"),
           size = c(10, 10, 7, 10, 7, 10, 7), 
           color = "black", family = "Times", parse = T) +
  xlim(0, 1) +
  theme_void()

# likelihood formula
p8 <-
  tibble(x = .5,
         y = .25,
         label = "beta[0]+sum()[italic(j)]*beta[1]['['*italic(j)*']']*italic(x)[1]['['*italic(j)*']'](italic(i))+sum()[italic(k)]*beta[2]['['*italic(k)*']']*italic(x)[2]['['*italic(k)*']'](italic(i))+sum()[italic(jk)]*beta[1%*%2]['['*italic(jk)*']']*italic(x)[1%*%2]['['*italic(jk)*']'](italic(i))") %>% 
 
  ggplot(aes(x = x, y = y, label = label)) +
  geom_text(hjust = .5, size = 7, color = "black", parse = T, family = "Times") +
  scale_x_continuous(expand = c(0, 0), limits = c(0, 1)) +
  ylim(0, 1) +
  theme_void()

# half-normal density
p9 <-
  tibble(x = seq(from = 0, to = 3, by = .01)) %>% 
  ggplot(aes(x = x, y = (dnorm(x)) / max(dnorm(x)))) +
  geom_area(fill = "steelblue") +
  annotate(geom = "text",
           x = 1.5, y = .2,
           label = "half-normal",
           size = 7, color = "black") +
  annotate(geom = "text",
           x = 1.5, y = .6,
           label = "0*','*~italic(S)[sigma]", 
           size = 7, color = "black", family = "Times", parse = T) +
  scale_x_continuous(expand = c(0, 0)) +
  theme_void() +
  theme(axis.line.x = element_line(linewidth = 0.5, color = "black"))

# the final normal density
p10 <-
  tibble(x = seq(from = -3, to = 3, by = .1)) %>% 
  ggplot(aes(x = x, y = (dnorm(x)) / max(dnorm(x)))) +
  geom_area(fill = "steelblue") +
  annotate(geom = "text",
           x = 0, y = .2,
           label = "normal",
           size = 7, color = "black") +
  annotate(geom = "text",
           x = c(0, 1.15), y = .6,
           label = c("mu[italic(i)]", "sigma[italic(y)]"), 
           hjust = c(.5, 0),
           size = 7, color = "black", family = "Times", parse = T) +
  scale_x_continuous(expand = c(0, 0)) +
  theme_void() +
  theme(axis.line.x = element_line(linewidth = 0.5, color = "black"))

# an annotated arrow
p11 <-
  tibble(x     = .4,
         y     = .5,
         label = "'='") %>% 
  
  ggplot(aes(x = x, y = y, label = label)) +
  geom_text(size = 10, color = "black", parse = T, family = "Times") +
  geom_segment(x = .5, xend = .5,
               y = 1, yend = .1, 
               arrow = my_arrow, color = "black") +
  xlim(0, 1) +
  theme_void()

# another annotated arrow
p12 <-
  tibble(x     = .49,
         y     = .55,
         label = "'~'") %>% 
  
  ggplot(aes(x = x, y = y, label = label)) +
  geom_text(size = 10, color = "black", parse = T, family = "Times") +
  geom_segment(x = .79, xend = .4,
               y = 1, yend = .2, 
               arrow = my_arrow, color = "black") +
  xlim(0, 1) +
  theme_void()

# the final annotated arrow
p13 <-
  tibble(x     = c(.375, .625),
         y     = c(1/3, 1/3),
         label = c("'~'", "italic(i)")) %>% 
  
  ggplot(aes(x = x, y = y, label = label)) +
  geom_text(size = c(10, 7), 
            color = "black", parse = T, family = "Times") +
  geom_segment(x = .5, xend = .5,
               y = 1, yend = 0, 
               arrow = my_arrow, color = "black") +
  xlim(0, 1) +
  theme_void()

# some text
p14 <-
  tibble(x     = .5,
         y     = .5,
         label = "italic(y[i])") %>% 
  
  ggplot(aes(x = x, y = y, label = label)) +
  geom_text(size = 7, color = "black", parse = T, family = "Times") +
  xlim(0, 1) +
  theme_void()

# define the layout
layout <- c(
  patchwork::area(t = 1, b = 1, l = 6, r = 7),
  patchwork::area(t = 1, b = 1, l = 10, r = 11),
  patchwork::area(t = 1, b = 1, l = 14, r = 15),
  patchwork::area(t = 3, b = 4, l = 1, r = 3),
  patchwork::area(t = 3, b = 4, l = 5, r = 7),
  patchwork::area(t = 3, b = 4, l = 9, r = 11),
  patchwork::area(t = 3, b = 4, l = 13, r = 15),
  patchwork::area(t = 2, b = 3, l = 6, r = 7),
  patchwork::area(t = 2, b = 3, l = 10, r = 11),
  patchwork::area(t = 2, b = 3, l = 14, r = 15),
  patchwork::area(t = 6, b = 7, l = 1, r = 15),
  patchwork::area(t = 5, b = 6, l = 1, r = 15),
  patchwork::area(t = 9, b = 10, l = 10, r = 12),
  patchwork::area(t = 12, b = 13, l = 7, r = 9),
  patchwork::area(t = 8, b = 12, l = 7, r = 9),
  patchwork::area(t = 11, b = 12, l = 7, r = 12),
  patchwork::area(t = 14, b = 14, l = 7, r = 9),
  patchwork::area(t = 15, b = 15, l = 7, r = 9)
)
plot(layout)
# combine and plot!
(p1 + p1 + p1 + p3 + p4 + p5 + p6 + p2 + p2 + p2 + p8 + p7 + p9 + p10 + p11 + p12 + p13 + p14) + 
  plot_layout(design = layout) &
  ylim(0, 1) &
  theme(plot.margin = margin(0, 5.5, 0, 5.5))
ggplot2::ggsave("../data/f_score_model_diag.png", height = 7, width = 10.5)
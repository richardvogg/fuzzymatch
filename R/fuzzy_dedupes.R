

fuzzy_dedupes <- function(vec, find_cutoff=FALSE, cutoff_distance=0.06) {
  wordcount <- vec %>%
    tibble(txt=vec) %>%
    dplyr::count(txt, sort=T)

  words <- wordcount$txt

  # To not replace low frequency words with other low frequency words,
  # we have to find a minimum frequency to make a word a candidate.
  # For now I will manually set this to 3, but some thought should go into this.

  #Find the index of the last string that appears at least 3 times
  t <- Position(function(x) x < 3, wordcount$n) - 1

  out <- sapply(seq_along(words)[-1],function(i) {
    dist2 <- stringdist(words[i],words[1:min(t, i-1)],method='jw',p=0.1)

    best_fit <- which.min(dist2)
    similarity2 <- min(dist2)

    return(c(similarity2,best_fit))
  }
  ) %>%
    t() %>%
    as.data.frame() %>%
    add_row(V1=0,V2=1,.before = 1) %>%
    cbind(wordcount) %>%
    dplyr::rename(distance=V1,best_fit=V2) %>%
    mutate(replacement=txt[best_fit]) %>%
    arrange(distance) %>%
    select(-best_fit,-n)

  if(find_cutoff==TRUE) {return(out)}

  dict <- out %>%
    mutate(replacement=ifelse(distance<=cutoff_distance,replacement,txt)) %>%
    filter(replacement!=txt)

  out_vec <- plyr::mapvalues(vec,from=dict$txt,to=dict$replacement)

  return(out_vec)
}

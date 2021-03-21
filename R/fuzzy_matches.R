
fuzzy_matches <- function(clean_vec, dirty_vec, find_cutoff=FALSE, cutoff_distance=0.06) {
  out <- data.frame(original=dirty_vec)

  distmatrix <- stringdist::stringdistmatrix(tolower(clean_vec),
                                             tolower(dirty_vec),method='jw',p=0.1)
  best_fit <- as.integer(apply(distmatrix,2,which.min))
  similarity <- apply(distmatrix,2,min)

  out$best_fit <- clean_vec[best_fit]
  out$distance <- similarity

  if(find_cutoff==TRUE) {return(out)}

  dict <- out %>%
    mutate(replacement=ifelse(distance<=cutoff_distance,best_fit,original)) %>%
    filter(best_fit!=original)

  out_vec <- plyr::mapvalues(clean_vec, from=dict$original, to=dict$best_fit)

  return(out_vec)
}

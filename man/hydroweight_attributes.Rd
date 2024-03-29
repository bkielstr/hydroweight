% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/hydroweight_attributes.R
\name{hydroweight_attributes}
\alias{hydroweight_attributes}
\title{Generate inverse distance-weighted attributes}
\usage{
hydroweight_attributes(
  loi = NULL,
  loi_attr_col = NULL,
  loi_columns = NULL,
  loi_numeric = NULL,
  loi_numeric_stats = NULL,
  roi = NULL,
  roi_uid = NULL,
  roi_uid_col = NULL,
  distance_weights = NULL,
  remove_region = NULL,
  return_products = TRUE
)
}
\arguments{
\item{loi}{\code{sf} or \code{RasterLayer}. Layer of interest (e.g., land use layer).}

\item{loi_attr_col}{character. A name that will precede the calculated attributes (e.g., loi_mean, loi_median etc.)}

\item{loi_columns}{character. The column names over which to summarize the attributes.}

\item{loi_numeric}{logical. If \code{TRUE}, the \code{loi_columns} being summarized are numeric. If \code{FALSE}, the \code{loi_columns} being summarized are categorical.}

\item{loi_numeric_stats}{character. One or more of c("distwtd_mean", "distwtd_sd", "mean", "sd", "median", "min", "max", "sum", "cell_count"). Those without distwtd_ are simple "lumped" statistics.}

\item{roi}{\code{sf} or \code{RasterLayer}. Region of interest (e.g., catchment boundary). Everything within this region will be used to calculate attributes.}

\item{roi_uid}{character. Unique identifier value for the roi.}

\item{roi_uid_col}{character. Column name that will be assigned to the roi_uid.}

\item{distance_weights}{\code{list}. The distance-weighted rasters output from \code{hydroweight}.}

\item{remove_region}{\code{sf} or \code{RasterLayer}. Regions to remove when summarizing the attributes (e.g., remove lake from catchment)}

\item{return_products}{logical. If \code{TRUE}, a list containing attribute summary table, the \code{roi-} and \code{remove_region}-masked layer (i.e., all cells contributing to attribute calculation), and \code{distance_weights} raster. If \code{FALSE}, attribute summary table only.}
}
\value{
If \code{return_products = TRUE}, a list containing 1) attribute summary table, and 2) a list of return_products of \code{length(distance_weights)} where each list element contains a list of 2 sub-elements: 1) \code{roi-} and \code{remove_region}-masked \code{loi} (i.e., all cells contributing to attribute calculation), and 2) the \code{roi-} and \code{remove_region}-masked \code{distance_weights} raster. If \code{return_products = FALSE}, attribute summary table only.
}
\description{
\code{hydroweight::hydroweight_attributes()} calculates distance-weighted
attributes using distance-weighted rasters generated in \code{hydroweight::hydroweight()},
an attribute layer (\code{loi}, e.g., land use polygon/raster), and a region of interest
(\code{roi}, e.g., a catchment polygon). The function outputs an attribute
summary table or a list that includes the summary table and layers used for calculation.
Summary statistics are calculated as in Peterson et al. 2011 \url{https://doi:10.1111/j.1365-2427.2010.02507.x}).
IMPORTANTLY, this function only produces one instance of the \code{loi} x \code{distance_weights}
summary statistics (i.e., one \code{loi}, one \code{roi}, and one set of \code{distance_weights}).
See https://github.com/bkielstr/hydroweight for workflows.
}
\details{
Spatial layers are aligned to \code{distance_weights} (i.e., identical coordinate reference systems - CRS).
}

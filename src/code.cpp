#include <Rcpp.h>
#include <cmath>
#include <iostream>
using namespace Rcpp;

// [[Rcpp::export(.all_same_num)]]
bool all_same_num(NumericVector x) {
  int n = x.length();
  if (n <= 1) return 1;

  double min = INFINITY, max = -INFINITY;

  NumericVector::iterator it;
  for(it = x.begin(); it != x.end(); ++it) {
    if (*it < min) min = *it;
    if (*it > max) max = *it;
    if (min != max) return 0;
  }
  return 1;
}

// [[Rcpp::export(.all_same_char)]]
bool all_same_chr(CharacterVector x) {
  int n = x.length();
  if (n <= 1) return 1;

  String first = x[1];
  CharacterVector::iterator it;
  for(it = x.begin(); it != x.end(); ++it) {
    if (first != *it) return 0;
  }

  return 1;
}

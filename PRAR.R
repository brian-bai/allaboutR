library(faraway)
data(pima)
smmary(pima)
apply(pima, 2, function(x) sum(is.na(x)))

zero.to.na <- function(ds, vars) {
  for( var in vars){
    ds[[var]][ds[[var]]==0] <-NA
  }
  ds
}

vars <- c("diastolic","glucose","triceps","insulin","bmi")
ds <- zero.to.na(pima, vars)
apply(ds, 2, function(x) sum(is.na(x)))


#reload original data set
rm(pima)
data(pima)
apply(pima, 2, function(x) sum(is.na(x)))

replace.na.value <- function(ds, vars, navalue){
  for( var in vars){
    ds[[var]][ds[[var]]==navalue] <-NA
  }
  ds
}

ds1 <- replace.na.value(pima,  vars, 0)
apply(ds1, 2,function(x) sum(is.na(x)))

#reload original data set
rm(pima)
data(pima)
apply(pima, 2, function(x) sum(is.na(x)))

replace.na.value <- function(navalue){
  function(ds, vars){
      for( var in vars){
        ds[[var]][ds[[var]]==navalue] <-NA
      }
      ds
  }
}


replace.na.zero <- replace.na.value(0)
ds2 <- replace.na.zero(pima,  vars)
apply(ds2, 2, function(x) sum(is.na(x)))

#reload original data set
rm(pima)
data(pima)
apply(pima, 2, function(x) sum(is.na(x)))
replace.na.value1 <- function(navalue){
  function(x){
    x[x==navalue] <- NA
    x
  }
}
replace.na.zero1 <- replace.na.value1(0)
pima[vars] <- replace.na.zero1(pima[vars] )
apply(pima, 2, function(x) sum(is.na(x)))

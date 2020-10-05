# Nempack1
599 R Package Coding Project 1 - Tom Nemeth

### Installation:
To install the package, use remotes::install_github("tan92327/nempack1")

### Usage:

visualise(dt)

Example: 
```
test.table = ggplot2::mpg
visualize(test.table)
```
Outputs:
[Image link](https://imgur.com/a/agiSgM0)

KMEANS(dm, K)

Example:
```
# Create lists to store SS and K values in
mySS_list = list()
myk_list = list()

# Iterate from k = 1 (trivial case) to k = 20
for (k in 1:20) 
{
  # Cluster object
  cl = KMEANS(ztdt, k)
  num = cl$tot.withinss
  mySS_list = c(mySS_list, num)
  myk_list = c(myk_list, k)
}

# Combine lists in data table
mykmeans.dt = data.table(myk_list,mySS_list)

# Create ggplot
library(ggplot2)
ggplot() + geom_point(aes(x = as.numeric(k_list), y = as.numeric(SS_list)), data = kmeans.dt) +
  geom_point(aes(x = as.numeric(myk_list), y = as.numeric(mySS_list)), data = mykmeans.dt, color = "red") +
  scale_x_continuous(name ="Number Components") + scale_y_continuous(name ="Sum of Squares")
```
Outputs:
[Image link](https://imgur.com/a/mz8OvMD)

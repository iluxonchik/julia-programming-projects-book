using RDatasets

RDatasets.datasets()

iris = dataset("datasets", "iris")
names(iris)
head(iris)
tail(iris)
tail(iris, 11)
by(iris, :Species, nrow)

describe(iris)
# NOTE: this one is different from the book. If the book's example is
# followed, Julia complains that describe does not accept keword arguments
describe(iris, :q25, :q75, :first, :last)

using Statistics

# NOTE: deprecation warning
mean(iris[:SepalLength])
median(iris[:SepalLength])
std(iris[:SepalLength])

for x in names(iris)[1:end-1]
    for y in names(iris)[1:end-1]
        println("$x \t $y \t $(cor(iris[x], iris[y]))")
    end
    println("-------------------------------------------------------------------")
end


for x in names(iris)[1:end-1]
    for y in names(iris)[1:end-1]
        println("$x \t $y \t $(cov(iris[x], iris[y]))")
    end
    println("-------------------------------------------------------------------")
end

# getting some random sample from the dataset
rand(iris[:SepalLength])
rand(iris[:SepalLength], 7)

# converting column to an Array
sepal_length = Array(iris[:SepalLength])
# converting the whole dataframe to a matrix
iris_arr = convert(Array, iris[:,:])


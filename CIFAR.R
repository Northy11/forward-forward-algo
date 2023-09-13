library(keras)
cifar <- dataset_cifar10()
x_train <- cifar$train$x
y_train <- cifar$train$y
x_test <- cifar$test$x
y_test <- cifar$test$y
x_train <- array_reshape(x_train, c(nrow(x_train), 32 * 32 * 3)) / 255
x_test <- array_reshape(x_test, c(nrow(x_test), 32 * 32 * 3)) / 255
# Initialize the model parametersAd
n_features <- ncol(x_train)
n_classes <- 10
W <- matrix(rnorm(n_features * n_classes), nrow = n_features)
b <- rep(0, n_classes)

# Define the softmax function
softmax <- function(x) {
  exp(x) / sum(exp(x))
}

# Define the forward-forward algorithm
forward_forward <- function(x, W, b) {
  # Forward pass
  z <- x %*% W + b
  y_pred <- apply(z, 1, softmax)
  
  # Prediction
  class_pred <- apply(y_pred, 1, which.max)
  
  return(list(y_pred = y_pred, class_pred = class_pred))
}

# Test the forward-forward algorithm on the first test image
test_image <- x_test[1, ]
result <- forward_forward(test_image, W, b)
print(result$class_pred)

# Compute the accuracy of the forward-forward algorithm on the test set
y_pred <- matrix(0, nrow = nrow(x_test), ncol = n_classes)
for (i in 1:nrow(x_test)) {
  result <- forward_forward(x_test[i, ], W, b)
  y_pred[i, ] <- result$y_pred
}

class_pred <- apply(y_pred, 1, which.max)
accuracy <- mean(class_pred == y_test)
print(paste("Accuracy:", round(accuracy * 100, 2), "%"))


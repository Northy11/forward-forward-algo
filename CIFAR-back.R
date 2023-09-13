# Load the required libraries
library(keras)
library(tensorflow)

# Load the CIFAR-10 dataset
cifar10 <- dataset_cifar10()
x_train <- cifar10$train$x / 255
y_train <- to_categorical(cifar10$train$y, num_classes = 10)
x_test <- cifar10$test$x / 255
y_test <- to_categorical(cifar10$test$y, num_classes = 10)

# Define the model architecture
model <- keras_model_sequential()
model %>% 
  layer_flatten(input_shape = c(32, 32, 3)) %>% 
  layer_dense(units = 128, activation = "relu") %>% 
  layer_dense(units = 10, activation = "softmax")

# Compile the model
model %>% compile(
  loss = "categorical_crossentropy",
  optimizer = optimizer_sgd(lr = 0.01),
  metrics = "accuracy"
)

# Train the model
history <- model %>% fit(
  x_train, y_train,
  epochs = 10,
  batch_size = 32,
  validation_split = 0.1
)

# Evaluate the model on the test set
metrics <- model %>% evaluate(x_test, y_test, verbose = 0)
print(paste("Test accuracy:", round(metrics[2] * 100, 2), "%"))

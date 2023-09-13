library(keras)

# Load MNIST dataset
mnist <- dataset_mnist()

# Extract train and test data
x_train <- mnist$train$x
x_test <- mnist$test$x

# Reshape input data to 784-dimensional vectors
x_train <- array_reshape(x_train, c(dim(x_train)[1], 784))
x_test <- array_reshape(x_test, c(dim(x_test)[1], 784))

# Normalize input data
x_train <- x_train / 255
x_test <- x_test / 255

# Convert class vectors to binary class matrices
y_train <- to_categorical(mnist$train$y, num_classes = 10)
y_test <- to_categorical(mnist$test$y, num_classes = 10)

# Define model architecture
model <- keras_model_sequential() %>%
  layer_dense(units = 256, activation = 'relu', input_shape = c(784)) %>%
  layer_dense(units = 10, activation = 'softmax')

# Compile model
model %>% compile(
  loss = 'categorical_crossentropy',
  optimizer = 'adam',
  metrics = c('accuracy')
)

# Train model
history <- model %>% fit(
  x_train, y_train,
  epochs = 10,
  batch_size = 128,
  validation_split = 0.2
)

# Evaluate model on test data
score <- model %>% evaluate(x_test, y_test)
cat('Test loss:', score[1], '\n')
cat('Test accuracy:', score[2], '\n')

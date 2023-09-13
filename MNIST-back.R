library(keras)
mnist <- dataset_mnist()
train_images <- mnist$train$x
train_labels <- mnist$train$y
test_images <- mnist$test$x
test_labels <- mnist$test$y

# Flatten the input images
train_images <- array_reshape(train_images, c(nrow(train_images), 784))
test_images <- array_reshape(test_images, c(nrow(test_images), 784))

# Convert the labels to categorical format
train_labels <- to_categorical(train_labels)
test_labels <- to_categorical(test_labels)

# Define the model
model <- keras_model_sequential() %>%
  layer_dense(units = 128, activation = 'relu', input_shape = c(784)) %>%
  layer_dense(units = 10, activation = 'softmax')

# Compile the model
model %>% compile(
  optimizer = 'rmsprop',
  loss = 'categorical_crossentropy',
  metrics = c('accuracy')
)

# Train the model
history <- model %>% fit(
  train_images, train_labels,
  epochs = 5, batch_size = 128,
  validation_split = 0.2
)

# Evaluate the model
test_loss <- model %>% evaluate(test_images, test_labels)
test_acc <- test_loss[[2]]
cat('Test accuracy:', test_acc, '\n')

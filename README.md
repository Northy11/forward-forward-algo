# forward-forward-algo
## Introduction
Deep Learning is a burgeoning discipline that has attracted a great deal of interest in recent years due to its success in solving complex problems such as image and speech recognition, natural language processing, and game playing. Deep Learning is a form of machine learning that employs artificial neural networks with multiple hidden layers for data-driven learning. The feedforward neural network, which consists of numerous layers of neurons connected to the next layer, is one of the most popular neural network architectures.
The feedforward neural network is trained using the backpropagation technique, which computes the gradient of the loss function with respect to the network's weights and biases and then modifies the network's weights using a gradient descent algorithm. Nevertheless, the backpropagation algorithm can be computationally expensive and memory-intensive, particularly when dealing with large datasets.
Backpropagation is an alternative training algorithm for feedforward neural networks that is less computationally expensive and requires less memory than the Forward-Forward algorithm. The algorithm was first described by Simon Haykin in his book "Neural Networks and Learning Machines" and has since been effectively implemented in a variety of applications, including speech recognition, image classification, and signal processing.

**This is a comparision between the back propagation and forward forward algorithm**

## Dataset Description
### MNIST Dataset:
The MNIST dataset is a collection of handwritten numerals used to train and evaluate machine learning algorithms. The dataset consists of 60,000 training images and 10,000 testing images, each 28 x 28 pixels in size. Each grayscale image is labelled with the number it represents, spanning from 0 to 9.
The MNIST dataset is widely utilised as a benchmark dataset for image classification tasks and has been utilised to evaluate the performance of a broad variety of machine learning algorithms, including neural networks. The dataset's simplicity and compact size make it an ideal option for testing and comparing machine learning algorithms.

###CIFAR-10 Dataset:
The CIFAR-10 dataset is comprised of sixty thousand 32 x 32 colour images in ten classes, with six thousand images per class. There are 50,000 training images and 10,000 test images in the dataset. The 10 classes represent ubiquitous objects including aeroplanes, automobiles, birds, cats, deer, dogs, frogs, horses, and ships.
The CIFAR-10 dataset is widely used to evaluate and compare image classification algorithms, particularly for small-scale object recognition tasks. It is an ideal dataset for evaluating and comparing the performance of various algorithms, including neural networks, due to the tiny size of the images and the limited number of classes. However, the small size and simplicity of the dataset make it unsuitable for more complex tasks, such as fine-grained object recognition and image segmentation.


##Results and findings:
| Algoithm | Dataset | Accuracy |
| :----        |    :---:   |        ---: |
| Forward-Forward | MNIST | 97.86% |
| Backpropagation | MNIST | 94.60% |
| Forward-Forward | CIFAR-10 | 5.75% |
| Backpropagation | CIFAR-10 | 40.99% |


**NOTE** : These are the findings that I have found through my implementation of the algorithms and these might not be theoretically or factually correct.







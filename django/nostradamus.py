import os

import numpy as np
import prettytensor as pt
import tensorflow as tf
from dataset import load_cached

dataset = load_cached(cache_path='veg.pkl', in_dir='./veg')
num_classes = dataset.num_classes
class_names = dataset.class_names

# Make tensorflow shut up
os.environ['TF_CPP_MIN_LOG_LEVEL'] = '3'

import inception

inception.maybe_download()
model = inception.Inception()

transfer_len = model.transfer_len
x = tf.placeholder(tf.float32, shape=[None, transfer_len], name='x')
y_true = tf.placeholder(tf.float32, shape=[None, num_classes], name='y_true')
y_true_cls = tf.argmax(y_true, dimension=1)
is_Training = False
x_pretty = pt.wrap(x)

with pt.defaults_scope(activation_fn=tf.nn.relu):
    y_pred, loss = x_pretty. \
        fully_connected(size=4096, name='layer_fc1'). \
        fully_connected(size=2048, name='layer_fc2'). \
        dropout(keep_prob=0.5, phase=is_Training). \
        fully_connected(size=1024, name='layer_fc3'). \
        softmax_classifier(num_classes=num_classes, labels=y_true)

global_step = tf.Variable(initial_value=0, name='global_step', trainable=False)
optimizer = tf.train.AdamOptimizer(learning_rate=(1e-5)).minimize(loss, global_step)
y_pred_cls = tf.argmax(y_pred, dimension=1)
correct_prediction = tf.equal(y_pred_cls, y_true_cls)
accuracy = tf.reduce_mean(tf.cast(correct_prediction, tf.float32))

saver = tf.train.Saver()

save_dir = 'checkpoints/'

if not os.path.exists(save_dir):
    os.makedirs(save_dir)

save_path = os.path.join(save_dir, 'saved')

session = tf.Session()
session.run(tf.global_variables_initializer())


def predict(image_path):
    transfer_value = [model.transfer_values(image_path=image_path)]
    feed_dict = {x: transfer_value}
    classification = session.run(y_pred, feed_dict)
    classification = classification[0]
    joined = zip(classification, dataset.class_names)
    sorted_class_names = [a for (_, a) in sorted(joined, reverse=True)]
    sorted_classification = sorted(classification, reverse=True)
    return np.array(sorted_classification).tolist(), sorted_class_names


# def predict_folder(folder_path):
#     for filename in sorted(os.listdir(folder_path)):
#         if filename.endswith(".jpg"):
#             print(filename)
#             print(predict(os.path.join(folder_path,filename)))

# To restore previously saved model
saver.restore(sess=session, save_path=save_path)

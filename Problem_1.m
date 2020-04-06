import filter_image.*
import get_gradients.*
import build_histogram.*
import create_HOG_features_image.*
import get_block_descriptor.*
import HOG.*

close all;
im = imread('einstein.jpg');
hog1 = HOG(im);

im2 = imread('cr7.jpg');
hog2 = HOG(im2);

im3 = imread('rock.jpg');
hog3 = HOG(im3);
import face_detector.*

template = imread("template.png");
template = im2double(template);

target = imread("target.png");
target = im2double(target);

target2 = imread("target2.jpg");
target2 = rgb2gray(target2);
target2 = im2double(target2);


bounding_boxes = face_detector(target,template);

 NB = [];
    while (size(bounding_boxes,1)>0)
        bounding_boxes = sortrows(bounding_boxes,3);
        temp = bounding_boxes(1,:);
        NB = [NB; temp];
        bounding_boxes(1,:) = [];
        temp_box = [];
        for i=1:size(bounding_boxes)
            temp1 = score(temp, bounding_boxes(i,:));
            if (temp1<0.50)
                temp_box =[temp_box;bounding_boxes(i,:)];
            end
        end
        bounding_boxes = temp_box;
    end

x  = figure;
figure(x)
imshow(target)
hold on
for i =1:size(NB,1)
 figure(x)
 rectangle('Position',[NB(i,2),NB(i,1),50,50],'EdgeColor','red');
 end
    hold off;
    

    

bounding_boxes2 = face_detector(target2,template);

 NB2 = [];
    while (size(bounding_boxes2,1)>0)
        bounding_boxes2 = sortrows(bounding_boxes2,3);
        temp = bounding_boxes2(1,:);
        NB2 = [NB2; temp];
        bounding_boxes2(1,:) = [];
        temp_box = [];
        for i=1:size(bounding_boxes2)
            temp1 = score(temp, bounding_boxes2(i,:));
            if (temp1<0.50)
                temp_box =[temp_box;bounding_boxes2(i,:)];
            end
        end
        bounding_boxes2 = temp_box;
    end

x2  = figure;
figure(x2)
imshow(target2)
hold on
for i =1:size(NB2,1)
 figure(x2)
 rectangle('Position',[NB2(i,2),NB2(i,1),50,50],'EdgeColor','red');
 end
    hold off;
    
    
function [is] =  score(box1,box2)
    area = 50*50;
    b1 = [box1(1), box1(2), 50, 50];
    b2 = [box2(1), box2(2), 50, 50];
    intersection = rectint(b1,b2);
    is = intersection/(area*2-intersection);
end

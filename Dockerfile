FROM tensorflow/tensorflow:latest

RUN pip install keras

# build info
RUN echo "Timestamp:" `date --utc` | tee /image-build-info.txt


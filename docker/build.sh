docker build -t audio-enhance -f Dockerfile ..

docker run --gpus all -it --rm -v C:\work\resemble-enhance-docker\input:/workspace/input -v C:\work\resemble-enhance-docker\output:/workspace/output_enhance audio-enhance bash
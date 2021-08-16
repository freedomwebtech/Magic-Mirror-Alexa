cd /home/pi/sdk_folder
 git clone --single-branch --branch v1.6.2 git://github.com/alexa/apl-core-library.git


cd /home/pi/sdk_folder/apl-core-library
mkdir build
cd build
cmake ..
make

cd /home/pi/sdk_folder/third-party
 wget https://github.com/zaphoyd/websocketpp/archive/0.8.1.tar.gz -O websocketpp-0.8.1.tar.gz
 tar -xvzf websocketpp-0.8.1.tar.gz


cd /home/pi/sdk_folder/third-party
 sudo apt-get -y install libasio-dev --no-install-recommends    


cd /home/pi/sdk_folder/third-party
 curl -sL https://deb.nodesource.com/setup_14.x | sudo -E bash -
 sudo apt-get install -y nodejs


cd /home/pi/sdk_folder
    
git clone git://github.com/alexa/alexa-smart-screen-sdk.git


cd /home/pi/sdk_folder
mkdir ss-build
cd ss-build



cmake -DCMAKE_PREFIX_PATH=/home/pi/sdk_folder/sdk-install \
 -DWEBSOCKETPP_INCLUDE_DIR=/home/pi/sdk_folder/third-party/websocketpp-0.8.1 \
 -DDISABLE_WEBSOCKET_SSL=ON \# -DGSTREAMER_MEDIA_PLAYER=ON \
 -DCMAKE_BUILD_TYPE=DEBUG \
 -DPORTAUDIO=ON -DPORTAUDIO_LIB_PATH=/home/pi/sdk_folder/third-party/portaudio/lib/.libs/libportaudio.a \
 -DPORTAUDIO_INCLUDE_DIR=/home/pi/sdk_folder/third-party/portaudio/include/ \
 -DAPL_CORE=ON \
 -DAPLCORE_INCLUDE_DIR=/home/pi/sdk_folder/apl-core-library/aplcore/include \
 -DAPLCORE_BUILD_INCLUDE_DIR=/home/pi/sdk_folder/apl-core-library/build/aplcore/include \
 -DAPLCORE_LIB_DIR=/home/pi/sdk_folder/apl-core-library/build/aplcore \
 -DAPLCORE_RAPIDJSON_INCLUDE_DIR=/home/pi/sdk_folder/apl-core-library/build/rapidjson-prefix/src/rapidjson/include \
 -DYOGA_INCLUDE_DIR=/home/pi/sdk_folder/apl-core-library/build/yoga-prefix/src/yoga \
 -DYOGA_LIB_DIR=/home/pi/sdk_folder/apl-core-library/build/lib \
  ../alexa-smart-screen-sdk


make

cd /home/pi/sdk_folder/ss-build
 PA_ALSA_PLUGHW=1 ./modules/Alexa/SampleApp/src/SampleApp -C \
 /home/pi/sdk_folder/sdk-build/Integration/AlexaClientSDKConfig.json -C \
 /home/pi/sdk_folder/alexa-smart-screen-sdk/modules/GUI/config/SmartScreenSDKConfig.json -L INFO

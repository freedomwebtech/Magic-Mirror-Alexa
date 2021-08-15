#mkdir sdk_folder
#cd sdk_folder
#mkdir sdk-build sdk-source third-party sdk-install db

#sudo apt-get -y install \
#   git gcc cmake build-essential libsqlite3-dev nghttp2 libnghttp2-dev libfaad-dev \
#   libssl-dev libsoup2.4-dev libgcrypt20-dev libgstreamer-plugins-bad1.0-dev \
#    gstreamer1.0-plugins-good libasound2-dev doxygen


#cd /home/pi/sdk_folder/third-party


#wget https://curl.haxx.se/download/curl-7.67.0.tar.gz

#tar xzf curl-7.67.0.tar.gz
#cd curl-7.67.0
#./configure --with-nghttp2 --prefix=/usr/local --with-ssl

#make && sudo make install
#sudo ldconfig

#cd /home/pi/sdk_folder/third-party
#wget -c http://www.portaudio.com/archives/pa_stable_v190600_20161030.tgz
#tar -zxf pa_stable_v190600_20161030.tgz

#cd portaudio

#./configure --without-jack

#make 


#pip3 install commentjson


#cd /home/pi/sdk_folder/sdk-source

#git clone --single-branch --branch v1.24.0 git://github.com/alexa/avs-device-sdk.git

#cd /home/pi/sdk_folder/sdk-build

#cmake /home/pi/sdk_folder/sdk-source/avs-device-sdk \
# -DGSTREAMER_MEDIA_PLAYER=ON \
# -DPORTAUDIO=ON \
# -DPORTAUDIO_LIB_PATH=/home/pi/sdk_folder/third-party/portaudio/lib/.libs/libportaudio.a \
# -DPORTAUDIO_INCLUDE_DIR=/home/pi/sdk_folder/third-party/portaudio/include \
# -DCMAKE_BUILD_TYPE=DEBUG \
# -DCMAKE_INSTALL_PREFIX=/home/pi/sdk_folder/sdk-install \
# -DRAPIDJSON_MEM_OPTIMIZATION=OFF


#make install


#cp /home/pi/config.json /home/pi/sdk_folder/sdk-source/avs-device-sdk/tools/Install


#cd /home/pi/sdk_folder/sdk-source/avs-device-sdk/tools/Install 
# bash genConfig.sh config.json \
# 123456 \
# /home/pi/sdk_folder/db \
# /home/pi/sdk_folder/sdk-source/avs-device-sdk \
# /home/pi/sdk_folder/sdk-build/Integration/AlexaClientSDKConfig.json \
# -DSDK_CONFIG_MANUFACTURER_NAME="manufacturer name" \
# -DSDK_CONFIG_DEVICE_DESCRIPTION="device description"


#cd /home/pi/sdk_folder/sdk-build
# PA_ALSA_PLUGHW=1 ./SampleApp/src/SampleApp ./Integration/AlexaClientSDKConfig.json DEBUG9


#cd /home/pi/sdk_folder
# git clone --single-branch --branch v1.6.2 git://github.com/alexa/apl-core-library.git


#cd /home/pi/sdk_folder/apl-core-library
#mkdir build
#cd build
#cmake ..
#make

#cd /home/pi/sdk_folder/third-party
# wget https://github.com/zaphoyd/websocketpp/archive/0.8.1.tar.gz -O websocketpp-0.8.1.tar.gz
# tar -xvzf websocketpp-0.8.1.tar.gz


#cd /home/pi/sdk_folder/third-party
# sudo apt-get -y install libasio-dev --no-install-recommends    


#cd /home/pi/sdk_folder/third-party
# curl -sL https://deb.nodesource.com/setup_14.x | sudo -E bash -
# sudo apt-get install -y nodejs


#cd /home/pi/sdk_folder
    
#git clone git://github.com/alexa/alexa-smart-screen-sdk.git



#cd /home/pi/sdk_folder
#mkdir ss-build
#cd ss-build



#cmake -DCMAKE_PREFIX_PATH=/home/pi/sdk_folder/sdk-install \
# -DWEBSOCKETPP_INCLUDE_DIR=/home/pi/sdk_folder/third-party/websocketpp-0.8.1 \
# -DDISABLE_WEBSOCKET_SSL=ON \# -DGSTREAMER_MEDIA_PLAYER=ON \
# -DCMAKE_BUILD_TYPE=DEBUG \
# -DPORTAUDIO=ON -DPORTAUDIO_LIB_PATH=/home/pi/sdk_folder/third-party/portaudio/lib/.libs/libportaudio.a \
# -DPORTAUDIO_INCLUDE_DIR=/home/pi/sdk_folder/third-party/portaudio/include/ \
# -DAPL_CORE=ON \
# -DAPLCORE_INCLUDE_DIR=/home/pi/sdk_folder/apl-core-library/aplcore/include \
# -DAPLCORE_BUILD_INCLUDE_DIR=/home/pi/sdk_folder/apl-core-library/build/aplcore/include \
# -DAPLCORE_LIB_DIR=/home/pi/sdk_folder/apl-core-library/build/aplcore \
# -DAPLCORE_RAPIDJSON_INCLUDE_DIR=/home/pi/sdk_folder/apl-core-library/build/rapidjson-prefix/src/rapidjson/include \
# -DYOGA_INCLUDE_DIR=/home/pi/sdk_folder/apl-core-library/build/yoga-prefix/src/yoga \
# -DYOGA_LIB_DIR=/home/pi/sdk_folder/apl-core-library/build/lib \
#  ../alexa-smart-screen-sdk


#make

#cd /home/pi/sdk_folder/ss-build
# PA_ALSA_PLUGHW=1 ./modules/Alexa/SampleApp/src/SampleApp -C \
# /home/pi/sdk_folder/sdk-build/Integration/AlexaClientSDKConfig.json -C \
# /home/pi/sdk_folder/alexa-smart-screen-sdk/modules/GUI/config/SmartScreenSDKConfig.json -L INFO

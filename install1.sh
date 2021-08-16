mkdir sdk_folder
cd sdk_folder
mkdir sdk-build sdk-source third-party sdk-install db

sudo apt-get -y install \
   git gcc cmake build-essential libsqlite3-dev nghttp2 libnghttp2-dev libfaad-dev \
   libssl-dev libsoup2.4-dev libgcrypt20-dev libgstreamer-plugins-bad1.0-dev \
    gstreamer1.0-plugins-good libasound2-dev doxygen


cd /home/pi/sdk_folder/third-party


wget https://curl.haxx.se/download/curl-7.67.0.tar.gz

tar xzf curl-7.67.0.tar.gz
cd curl-7.67.0
./configure --with-nghttp2 --prefix=/usr/local --with-ssl

make && sudo make install
sudo ldconfig

cd /home/pi/sdk_folder/third-party
wget -c http://www.portaudio.com/archives/pa_stable_v190600_20161030.tgz
tar -zxf pa_stable_v190600_20161030.tgz

cd portaudio

./configure --without-jack

make 


pip3 install commentjson


cd /home/pi/sdk_folder/sdk-source

git clone --single-branch --branch v1.24.0 git://github.com/alexa/avs-device-sdk.git

cd /home/pi/sdk_folder/sdk-build

cmake /home/pi/sdk_folder/sdk-source/avs-device-sdk \
 -DGSTREAMER_MEDIA_PLAYER=ON \
 -DPORTAUDIO=ON \
 -DPORTAUDIO_LIB_PATH=/home/pi/sdk_folder/third-party/portaudio/lib/.libs/libportaudio.a \
 -DPORTAUDIO_INCLUDE_DIR=/home/pi/sdk_folder/third-party/portaudio/include \
 -DCMAKE_BUILD_TYPE=DEBUG \
 -DCMAKE_INSTALL_PREFIX=/home/pi/sdk_folder/sdk-install \
 -DRAPIDJSON_MEM_OPTIMIZATION=OFF


make install


cp /home/pi/config.json /home/pi/sdk_folder/sdk-source/avs-device-sdk/tools/Install


cd /home/pi/sdk_folder/sdk-source/avs-device-sdk/tools/Install 
 bash genConfig.sh config.json \
 123456 \
 /home/pi/sdk_folder/db \
 /home/pi/sdk_folder/sdk-source/avs-device-sdk \
 /home/pi/sdk_folder/sdk-build/Integration/AlexaClientSDKConfig.json \
 -DSDK_CONFIG_MANUFACTURER_NAME="manufacturer name" \
 -DSDK_CONFIG_DEVICE_DESCRIPTION="device description"
sudo apt-get install sox libsox-fmt-all -y
sudo apt-get install swig3.0 python-pyaudio python3-pyaudio sox -y
pip3 install pyaudio
sudo apt-get install npm libasound-dev portaudio19-dev libportaudio2 libportaudiocpp0 ffmpeg libav-tools -y
sudo apt-get install libatlas-base-dev -y

cd ~/MagicMirror/modules
git clone https://github.com/dolanmiu/MMM-awesome-alexa.git



cd MMM-awesome-alexa

npm install --only=prod


cd node_modules

rm -rf snowboy


git clone https://github.com/Kitt-AI/snowboy.git


cd snowboy

rm -rf node_modules
npm install nan --save 
npm install node-pre-gyp@0.12.0 --save 
npm install 
npm run prepublish 
npm install --save-dev electron-rebuild 
npm install nan 
./node_modules/.bin/electron-rebuild


cd ~/MagicMirror/modules/MMM-awesome-alexa

npm run config-helper


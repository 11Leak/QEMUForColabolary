wget https://bin.equinox.io/c/4VmDzA7iaHb/ngrok-stable-linux-amd64.zip
unzip -o ngrok-stable-linux-amd64.zip > /dev/null 2>&1
rm -rf ngrok-stable-linux-amd64.zip
./ngrok authtoken 268tKkixRMBBxHKeBCpS6s72ohm_7UvxkT4VkysGcyKi2JpZN
nohup ./ngrok tcp --region ap 5900 &>/dev/null &
sudo apt-get update && apt-get install qemu -y
sudo apt install qemu-utils -y
sudo apt install qemu-system-x86-xen -y
sudo apt install qemu-system-x86 -y
qemu-img create -f raw MacOSMojave.img 32G
wget -O virtio-win.iso 'https://fedorapeople.org/groups/virt/virtio-win/direct-downloads/archive-virtio/virtio-win-0.1.215-1/virtio-win-0.1.215.iso'
wget -O Mac1014.iso 'https://doc-04-4c-docs.googleusercontent.com/docs/securesc/o9stbanhdcbi24g0odet3h3a3k758v0a/rlqav7e1f2o2hufsdkop3901k26svmok/1653290700000/14876004653649029137/16538395683163831744/1jBiY9deS_d3MVn7Iud00924rBBTz2iL_?e=download&ax=ACxEAsZY5TwYmGAcTz-MFNX0LEZTZRdIPLSPy01J4zkk0CybtV_AlxTmoklJ6qIaNx0DDcTT7072WyjTlVweIj8JYkhNstcJS2MzTPachxjMEleqo5mS9_-pMOk_xR8SJnwxlhfibAIQ2IqRQR9TbQ-Mk1zw6Dl8XYS_kzkc6697RoKmgYd-4qRPLgWxMQ2wL8xUpoDoV0PlC_x_yRXBCBBUI8RYYUNUGZ39yGQDnvElxcWmUWzode6O75Q7JssgpVt8utKP86aBIGJn7oVmN7aaQAKmI1Q19ZE7HsS72RXpfBnVlv5B8PujepOBnbIKvaKZq8O313OkUKf4hEKbE9WvChmxX3oPaGlahqVKAP-ZDCqf-VQIeUcCzQZ2JLMexL930YLdl-mYKTP95M7TSMfZnNzY5Yb0jAJv9VlneeDNsOcauuVLWlSncnDnxet1P42TImI6nqsv7lCpTV4vU6Nd2EvHAwTZh-733hZC0EABYtI_Lr6eDZFDWhvpedHXk8uoKuU-lic70DS2PyJLXka-0JE5aSHD4JuWMcfqXgsmgaE83AzB0jWKRZPsBvBwvbwRrlTlCNnoRxwZBlfABMPjPtW6NXl1LVqFe5LX4Ew2ztoEAHwXYvAbKPQlDZa3nqHPPC_iy52TaHKJqOR1LT9YADG8_MT3fCq7fEwkz98N6LLTiXhQD8egzbJ-hJ0S6j1tGUmkN5NJYXk&authuser=0&nonce=0qco4o4lppguk&user=16538395683163831744&hash=k6u1eeiva76ir3pf5d1sg186aearj3p1'

curl --silent --show-error http://127.0.0.1:4040/api/tunnels | sed -nE 's/.*public_url":"tcp:..([^"]*).*/\1/p'
sudo qemu-system-x86_64 \
  -m 8G \
  -cpu EPYC \
  -boot order=dc \
  -drive file=Mac1014.iso,media=cdrom \
  -drive file=MacOSMojave.img,format=raw,if=virtio \
  -drive file=virtio-win.iso,media=cdrom \
  -device usb-ehci,id=usb,bus=pci.0,addr=0x4 \
  -device usb-tablet \
  -vnc :0 \
  -smp cores=4 \

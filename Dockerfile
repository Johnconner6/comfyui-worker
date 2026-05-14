FROM runpod/worker-comfyui:latest-base

RUN rm -rf /comfyui/models && ln -s /runpod-volume/models /comfyui/models

RUN cd /comfyui/custom_nodes && \
    git clone https://github.com/MoonGoblinDev/Civicomfy.git && \
    git clone https://github.com/chibiace/ComfyUI-Chibi-Nodes.git && \
    git clone https://github.com/pythongosssss/ComfyUI-Custom-Scripts.git && \
    git clone https://github.com/LeonQ8/ComfyUI-Dynamic-Lora-Scheduler.git && \
    git clone https://github.com/yolain/ComfyUI-Easy-Use.git && \
    git clone https://github.com/city96/ComfyUI-GGUF.git && \
    git clone https://github.com/kijai/ComfyUI-KJNodes.git && \
    git clone https://github.com/MadiatorLabs/ComfyUI-RunpodDirect.git && \
    git clone https://github.com/Kosinkadink/ComfyUI-VideoHelperSuite.git && \
    git clone https://github.com/Smirnov75/ComfyUI-mxtoolkit.git && \
    git clone https://github.com/cubiq/ComfyUI_essentials.git && \
    git clone https://github.com/chrisgoringe/cg-use-everywhere.git && \
    git clone https://github.com/WASasquatch/was-node-suite-comfyui.git && \
    git clone https://github.com/kijai/ComfyUI-WanVideoWrapper.git && \
    git clone https://github.com/rgthree/rgthree-comfy.git && \
    git clone https://github.com/PozzettiAndrea/ComfyUI-SAM3.git

RUN find /comfyui/custom_nodes -name requirements.txt | xargs -I{} pip install -r {} -q

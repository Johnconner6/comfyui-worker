FROM runpod/worker-comfyui:latest-base

RUN ln -sfn /runpod-volume/models /comfyui/models

RUN echo '#!/bin/bash\necho "=== VOLUME CHECK ==="\nls -la /runpod-volume 2>/dev/null || echo "runpod-volume NOT mounted"\nls -la /runpod-volume/models 2>/dev/null || echo "models dir NOT found"\necho "=== END VOLUME CHECK ==="' > /volume-check.sh && chmod +x /volume-check.sh && echo '/volume-check.sh' >> /start.sh

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

RUN for d in /comfyui/custom_nodes/*/; do \
    [ -f "$d/requirements.txt" ] && pip install -r "$d/requirements.txt" -q || true; \
    done

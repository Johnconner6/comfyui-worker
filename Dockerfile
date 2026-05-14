FROM runpod/worker-comfyui:latest-base

RUN printf 'comfyui:\n    base_path: /runpod-volume/\n    checkpoints: models/checkpoints/\n    clip: models/clip/\n    clip_vision: models/clip_vision/\n    controlnet: models/controlnet/\n    embeddings: models/embeddings/\n    loras: models/loras/\n    upscale_models: models/upscale_models/\n    vae: models/vae/\n    unet: models/unet/\n    diffusion_models: models/diffusion_models/\n    text_encoders: models/text_encoders/\n    audio_encoders: models/audio_encoders/\n' > /comfyui/extra_model_paths.yaml

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

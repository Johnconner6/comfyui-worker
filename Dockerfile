FROM runpod/worker-comfyui:latest-base

RUN cat > /comfyui/extra_model_paths.yaml << 'EOF'
comfyui:
    base_path: /runpod-volume/
    checkpoints: models/checkpoints/
    clip: models/clip/
    clip_vision: models/clip_vision/
    controlnet: models/controlnet/
    embeddings: models/embeddings/
    loras: models/loras/
    upscale_models: models/upscale_models/
    vae: models/vae/
    unet: models/unet/
    diffusion_models: models/diffusion_models/
    text_encoders: models/text_encoders/
    audio_encoders: models/audio_encoders/
EOF

RUN cd /comfyui/custom_nodes && \
    git clone https://github.com/MoonGoblinDev/Civicomfy.git && \
    git clone https://github.com/chibiace/ComfyUI-Chibi-Nodes.git && \
    git clone https://github.com/pythongosssss/ComfyUI-Custom-Scripts.git && \
    git clone https://github.com/LeonQ8/ComfyUI-Dynamic-Lora-Scheduler.git && \
    git clone https://github.com/yolain/ComfyUI-Easy-Use.git && \
    git clone https://github.com/city96/ComfyUI-GGUF.git && \
    git clone https://github.com/kijai/ComfyUI-KJNodes.git && \
    git clone https://github.com/MadiatorLabs/ComfyUI-RunpodDirect.git && \
    git clone https://github.com/Kosi

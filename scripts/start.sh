export DISPLAY=:99

SIZE=${SCREEN_SIZE:?"1280x1024x16"}

Xvfb :99 -shmem -screen 0 ${SIZE} &
x11vnc -passwd secret -display :99 -N -forever &
# selenium must be started by a non-root user otherwise chrome can't start
su - seleuser -c "start-selenium"

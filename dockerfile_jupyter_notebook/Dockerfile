FROM jupyter/scipy-notebook:latest

USER root

COPY requirements.txt /tmp/

RUN source activate

RUN pip install --requirement /tmp/requirements.txt && \
    fix-permissions $CONDA_DIR && \
    fix-permissions /home/$NB_USER

RUN source deactivate

ENV PYTHONPATH "${PYTHONPATH}:/home/jovyan/work/q_pack"

COPY start.sh .
CMD ./start.sh


# Another way to give root access without password in the compose
    # environment:
    #   GRANT_SUDO: "yes"
    # user:
    #   "root"
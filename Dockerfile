# Install shell programs
FROM continuumio/anaconda3

# Get gcc
RUN apt-get install -y --no-install-recommends cmake build-essential

# Install Python
RUN pip install \
    numpy pyyaml scipy ipython \
    jupyter matplotlib scikit-learn pandas \
    jupyter_nbextensions_configurator \
    jupyter_contrib_nbextensions \
    mpld3

# Jupyter notebook setup
RUN jupyter contrib nbextension install --user
RUN jupyter nbextensions_configurator enable --user
RUN git clone https://github.com/lambdalisue/jupyter-vim-binding $(jupyter --data-dir)/nbextensions/vim_binding

# Expose Ports for Ipython (9999)
EXPOSE 9999

# Logistics
WORKDIR /root

RUN apt-get update

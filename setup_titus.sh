# Basic setup for TITUS...
# Note this is specific for the docker image and expects the folder structure it starts
# in to contain a "larsoft" folder with the products and an "icarusalg" folder with the 
# icarusalg package. In addition, it expects that the folder containing data will have 
# been mounted as "data". 
#
# Basic setup of icarusalg
source larsoft/products/setup
setup mrb
export MRB_PROJECT=icarusalg
source icarusalg/local*/setup
setup icarusalg v09_29_00 -q e20:prof
source gallery-framework/config/setup_evd.sh

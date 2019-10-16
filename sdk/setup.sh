add_path() { if [ -d "$1" ]; then PATH=${PATH//":$1:"/:}; PATH=${PATH/%":$1"/}; PATH=${PATH/#"$1:"/}; PATH="$1${PATH:+":$PATH"}"; fi; }
neuraghe_path=$(pwd)
export PULP_CONFIGS="platform=rtl:pulpChip=nuraghe"
export PULP_VERSIONS=""
export PULP_PIPELINE_HOME=$neuraghe_path/sdk/pkg/sdk/nuraghe-2017.1.3/install
add_path $PULP_PIPELINE_HOME/bin
plpbuildPath=`which plpbuild`
if [ -n "$plpbuildPath" ]; then
  plpbuild --m sdk_utils --m pulp_rules build
  envFile=`plpbuild env`
  source $envFile
fi
echo
echo "Configured for following configurations:"
for config in $PULP_CONFIGS; do
echo "  $config"
done

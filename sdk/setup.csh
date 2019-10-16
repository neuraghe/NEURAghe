alias prepend_path 'set arg2="\!:2";  if ($?\!:1 == 0) setenv \!:1 "$arg2";  if ($?\!:1 && $\!:1 !~ {,*:}"$arg2"{:*,}) setenv \!:1 "$arg2":"$\!:1";'
setenv PULP_CONFIGS "platform=rtl:pulpChip=nuraghe"
setenv PULP_VERSIONS ""
setenv PULP_PIPELINE_HOME /home/nur/nuraghe/sdk/pkg/sdk/nuraghe-2017.1.3/install
prepend_path PATH $PULP_PIPELINE_HOME/bin
if [ -n `which plpbuild` ]; then
  plpbuild --m sdk_utils --m pulp_rules build
  set envFile="`plpbuild --csh env`"
  source $envFile
fi
echo
echo "Configured for following configurations:"
foreach config ($PULP_CONFIGS)
echo "  $config"
end

# Targets
.PHONY: all clean env_subst

env_subst:
	@echo "Substituting environment variables in config files"
	@envsubst < ./config/frps.toml.tpl > ./config/frps.toml
	@envsubst < ./config/frpc.toml.tpl > ./config/frpc.toml
	@echo "Done. Find the generated files in ./config"

clean:
	@echo "Cleaning up"
	@rm -f ./config/frps.toml
	@rm -f ./config/frpc.toml
	@echo "Done cleaning up."


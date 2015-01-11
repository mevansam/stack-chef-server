env_name = File.basename( __FILE__, ".rb")

name env_name
description "Chef '#{env_name}' environment."

env = YAML.load_file(File.expand_path("../../etc/#{env_name}.yml", __FILE__))

override_attributes(
    'env' => {
        'http_proxy' => env['http_proxy'],
        'https_proxy' => env['https_proxy'],
        'domain' => env['domain'],

        # Disables OS firewall if enabled
        'firewall' => false,

        'packages' => {
            'debian' => [ 'build-essential', 'libxml2-dev', 'libxslt-dev', 'liblzma-dev', 'zlib1g-dev' ]
        }
    }
)

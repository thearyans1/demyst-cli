# Demyst
A simple CLI created using Thor, that returns even numbered todos

# build
to use the gem, kindly build the gem locally. Docker container is WIP<bonus point>
```shell
# go to the folder and run
gem build demyst.gemspec
gem install demyst-0.1.0.gem 
```

# run
After installation, you can run the following commands.
```shell
demyst todo 

# OR
demyst todo -n 20

# OR 
demyst todo -n 20 -o json
```

# Options

- The `cli` takes two options, `-n` representing the number of even numbered `todos` to fetch and `-o` or `output` of h the request that will be printed

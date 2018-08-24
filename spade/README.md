# spade
```bash
bash /vagrant/install_dotfiles.sh
bash /vagrant/install_spade.sh
bash /vagrant/install_neo4j.sh
bash /vagrant/install_redis.sh
```

Next, run `./bin/spade debug` to start the spade server. Then, in another pane,
run `./bin/spade control`. In the console, run the following commands to set up
spade:

```
add storage Neo4j /home/vagrant/neo4j-community-2.2.4/data/graph.db
add reporter Audit fileIO=true netIO=true
add reporter LLVM
```

Later, hit control-c on the spade server, navigate to `neo4j-community-2.2.4/`
and run `./bin/neo4j start` to the start the server. Access the database via
`localhost:7474`.

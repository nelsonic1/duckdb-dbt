# DuckDB Install

## Download
Download the CLI a release at: https://github.com/duckdb/duckdb/releases

Ex: duckdb_cli-osx-universal.zip

OR

`curl -LJO https://github.com/duckdb/duckdb/releases/download/\<release-tag\>/duckdb_cli-osx-universal.zip`

## Add the executable to /usr/local/bin:
First unpack the archive and then `cp duckdb /usr/local/bin`
Restart your terminal or `source ~/.zshrc`

## Launching DuckDB:
`cd duckdb`
`duckdb database.duckdb`

## Exit DuckDB
`.quit`

## List tables
`.tables`

OR
`SHOW ALL TABLES`

## Query a table
`SELECT * FROM my_table;`

## Help
`.help`

## Getting Started
https://duckdb.org/docs/api/cli.html#getting-started

## CLI Launch Errors
If you get a message that it cannot be opened you may need to select 'Allow' under System Settings > Privacy & Security > Security
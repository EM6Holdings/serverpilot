# ServerPilot

ServerPilot
===========

Ruby client gem for accessing <a href="http://www.serverpilot.io" target="_blank">ServerPilot</a> API

Install
-------

Install from RubyGems with **gem install ServerPilot** or clone from this github

Project on RubyGems at <a href="https://rubygems.org/gems/ServerPilot" target="_blank">https://rubygems.org/gems/ServerPilot</a>

To create a connection **require 'ServerPilot'**

In your code add something like **sp = Signalfire::ServerPilot.API.new(client_id,key)**
where client_id and key are your API information from ServerPilot.

Functions
---------

Commands are issued such as sp.[verb]_[action]

In use it would look something like:
sp.get_servers 'UXOSIYrdtL4cSGp3'
or using hash params:
sp.post_sysusers {'serverid'=>'UXOSIYrdtL4cSGp3','name'=>'abc123',=>'password'=>'1234'}

This is a list of the ruby functions to call on the server pilot object (e.g sp.get_servers)
and matching ServerPilot API methods. [id] is the identifier of the server, app, database
that you can retrieve via the API. [params] is a hash (Hash.new) of data to send to the
api as JSON

<table width="100%">
<tr>
<td><strong>Ruby Method</strong></td>
<td><strong>Description</strong></td>
<td><strong>Serverpilot API</strong></td>
</tr>
<tr>
<td>[obj].get_servers</td>
<td>Get a list of your servers</td>
<td>GET /servers</td>
</tr>
<tr>
<td>[obj].post_servers</td>
<td>Connect a new server</td>
<td>POST /servers</td>
</tr>
<tr>
<td>[obj].get_servers [id]</td>
<td>Retrieve existing server</td>
<td>GET /servers/:id</td>
</tr>
<tr>
<td>[obj].delete_servers [id]</td>
<td>Delete a server</td>
<td>DELETE /servers/:id</td>
</tr>
<tr>
<td>[obj].post_servers [id] [params]</td>
<td>Update a server</td>
<td>POST /server/:id</td>
</tr>
<tr>
<td>[obj].get_sysusers</td>
<td>List all system users</td>
<td>GET /sysusers</td>
</tr>
<tr>
<td>[obj].post_sysusers [params]</td>
<td>Create new system user</td>
<td>POST /sysusers</td>
</tr>
<tr>
<td>[obj].get_sysusers [id]</td>
<td>Retrieve existing user</td>
<td>GET /sysusers/:id</td>
</tr>
<tr>
<td>[obj].delete_sysusers [id]</td>
<td>Delete a system user</td>
<td>DELETE /sysusers/:id</td>
</tr>
<tr>
<td>[obj].post_sysusers [id] [params]</td>
<td>Update the password of a system user</td>
<td>POST /sysusers/:id</td>
</tr>
<tr>
<td>[obj].get_apps</td>
<td>List all apps</td>
<td>GET /apps</td>
</tr>
<tr>
<td>[obj].post_apps [params]</td>
<td>Create an app</td>
<td>POST /apps</td>
</tr>
<tr>
<td>[obj].get_apps [id]</td>
<td>Retrieve app</td>
<td>GET /apps/:id</td>
</tr>
<tr>
<td>[obj].delete_apps [id]</td>
<td>Delete an app</td>
<td>DELETE /apps/:id</td>
</tr>
<tr>
<td>[obj].post_apps [id] [params]</td>
<td>Update an app</td>
<td>POST /apps/:id</td>
</tr>
<tr>
<td>[obj].post_ssl [id] [params]</td>
<td>Add an SSL</td>
<td>POST /apps/:id/ssl</td>
</tr>
<tr>
<td>[obj].delete_ssl [id]</td>
<td>Delete an SSL</td>
<td>DELETE /apps/:id/ssl</td>
</tr>
<tr>
<td>[obj].get_dbs</td>
<td>Get databases</td>
<td>GET /dbs</td>
</tr>
<tr>
<td>[obj].post_dbs [params]</td>
<td>Create a new database</td>
<td>POST /dbs</td>
</tr>
<tr>
<td>[obj].get_dbs [id]</td>
<td>Retrieve existing db</td>
<td>GET /dbs/:id</td>
</tr>
<tr>
<td>[obj].delete_dbs [id]</td>
<td>Delete a database</td>
<td>DELETE /dbs/:id</td>
</tr>
<tr>
<td>[obj].post_dbs [id] [params]</td>
<td>Update the database user password</td>
<td>POST /dbs/:id</td>
</tr>
<tr>
<td>[obj].get_actions [id]</td>
<td>Get status of action</td>
<td>GET /actions/:id</td>
</tr>
</table>
This is early code and my first ever Ruby Gem so things may possibly break or not be quite
ruby enough....

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'ServerPilot'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install ServerPilot

## Usage

TODO: Write usage instructions here

## Contributing

1. Fork it ( https://github.com/signalfire/ServerPilot/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request

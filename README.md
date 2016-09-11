bloggr
======

<h4>Objective</h4>
Prototype to demo a micro blogging service where users can post messages of up to 150 characters.
<h4>Initial features</h4>
<ol>
  <li>Users should be able to post a message to the timeline.</li>
  <li>Users should be able to see all messages on the timeline.</li>
  <li>Users should be able to delete a message from the timeline.</li>
</ol>
<h4>Technical Configuration</h4>
<ul>
  <li>Rails application</li>
  <li>Languages - Ruby, Haml</li>
  <li>Database - PostgreSQL</li>
</ul>
<h4>Standard setup</h4>

1.  In Terminal, go to your projects directory and clone the project:

        git clone git@github.com:margOnline/bloggr.git

2.  Install gem dependencies:

        bundle install

3.  Create and set up the databases:

        rake db:create:all
        rake db:migrate

4.  Run the tests to make sure they pass with your environment:

        rspec spec

5.  Run the app. Boot your web server of choice. Options include:

    * Foreman:

            foreman start

    * Puma:

            bundle exec puma

    * The Rails default: `rails server`

<h4>Next Steps</h4>
<ol>
  <li>Users will be required to sign up to the service.</li>
  <li>To post a message, users will be required to sign in.</li>
  <li>To delete a message, users will be required to sign in.</li>
  <li>Users can only delete messages that they posted.</li>
  <li>Users can follow other users.</li>
</ol>

#Short blog ideas:
- Dev env container layers + production: immutable challenges
- Microservices
- CD and autoscale examples: with Ajit?
- Ephemeral devops vision

---

#Demystifying Microservices

As functionality increases, software complexity grows. The
      simplest metric to measure the increase of work is lines of code,
      but it is much harder to discern the work it takes to manage an
      ever increasing code base. The danger of using this simple metric
      is that it doesn't measure the work to change existing lines of
      code and does not reward the reduction of lines of code, making
      the code easier to maintain. It is hard to define the impact of
      refactoring software because there can be many different and
      potentially conflicting goals for optimization: speed versus
      maintainability versus instrumentation versus testability versus
      deployability versus dynamic configuration? Every organization
      will answer these questions in a unique way, but when viewing
      software development in context of DevOps, the answer becomes much
      clearer: you optimize for removing friction to deliver value to
      the customer. So the prioritization of all refactoring and
      development work can be aligned to a DevOps goal.<br>

Adopting a DevOps culture breaks down the traditional barriers in
      an engineering organization to accomplish this goal when we
      recognize that refactoring work was siloed, for example:

# software developers worked to refactor functionality into
        modular components to facilitate code reuse and speed development.
# database administrators worked on data design to accomplish
        data reuse, security, and access speed.
# quality and testing teams have evolved like software
        developers in order to reuse base test cases and speed testing
        results.
# operations teams automate their work with configuration
        management, monitoring, logging, and metric systems.

All of these efforts are worthy, but when they are made in
      parallel without a common goal, it will be unlikely to revolutionize engineering value.<br>

DevOps culture is the solution! Because the entire software value
      chain is examined for frictionless life cycle delivery, all of the
      teams can unite to prioritize and coordinate their work under one
      goal. This goal can be unlock new efficiencies across the entire
      engineering organization when adopting microservices delivered by
      containers.

In my previous blog entry about CI/CD, I briefly discussed the challenges of refactoring the monolith:</p>

>Quote

The benefits of allowing each software developer and team iterate
      on their own cadence reduces the need for coordination with other
      teams and removes friction for continuous deployment to the
      customer. This architectural practice is the embodiment of the web
      standards and it has been proven to scale by Amazon (the leading
      retailer and public cloud provider) and Netflix (the leading
      streaming video provider) for many applications, here are some
      references.

Calm is an ideal platform for modeling your applications,
      refactoring application architectures to microservices and
      infrastructures across providers, and managing container clusters.
      Let us show you how!

#Dynamic configuration management

As infrastructure migrates from static and long lived to virtual and
    ephemeral, supporting architectures like DNS, load balancers,
    firewalls, and networks must adapt to continual change, creating a
    management burden for systems that aren't automated or do not scale.
    A DevOps mindset will help guide your evaluation of new and old
    solutions that help with resource inventory, service discovery, and
    dynamic configuration management.
How does one manage an inventory? With a spreadsheet that requires
    manual updates every time a change occurs. One can evolve to an
    accounting system of assets or realize that an inventory is part of
    a larger supply chain of vendors, partners, and customers and adopt
    an enterprise management system which integrates these concerns and
    hopefully integrates with other systems to automate the inventory
    process. As we adopt multiple data centers and clouds for global
    capacity and redundancy, we see a similar evolution in DevOps
    tooling where we can integrate different providers and populations
    of resources.
Configuration management represents an ideal way to automate the
    building of infrastructure and can maintain a resource inventory for
    nodes under its control.
There is more than one way to do things: there are trade offs to
    where you shift the functionality when you remove configuration
    management. The good news is that the Calm blueprint can easily
    serve as a proxy for lightweight requirements of application state
    maintenance and here docs in shell is the easiest manner to drive
    that to configuration files.
You could consider any number of Ruby template libraries, like ERB,
    since that seems to be a language you are familiar with. Despite
    performance concerns, I also think Consul templates might be
    considerable.
As you refactor towards containers, you will see that static
    configuration files are friction on making containers dynamic.
    Therefore, dynamic configuration management (essentially lookups)
    for application configuration are desirable and many people use
    environment variables as their first approach with containers. I'm
    going to blog on this topic.

If you can bootstrap a container (with environment variables) to
    query a data source (a database, registry, LDAP, DNS, Consul,
    Zookeeper, etcd, etc.) you can make a container much more dynamic
    and reusable.

    Let me give you two references that point the way to microservices from our webinar:
    https://calm.io/wp-content/uploads/2016/webinar/deploying_docker_containers_in_production/#/section-2/page-4
    -- see the "Twelve-Factor App" for principles and "12 Fractured
    Apps" counter-examples

Finally, we have a whole new category of lookups/dynamic
    configuration management that has implications on the application
    code base, but really is the logical conclusion of this journey:
    feature flags, which goes by a number of other names like "lighting"
    features. Essentially, you can ship code execution paths that are
    toggled on and off by dynamic configuration management. In this
    manner, given proper instrumentation, you can canary test code in
    production, determine its "health," and revert even faster then
    redeployment.

As you can see, we're beginning to move away from static configuration files.

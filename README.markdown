# HTML5+Hypermedia+Rails Boilerplate

### WIP

This is a boilerplate I'm making for my own projects that I figured would be useful to be open source.

It's supposed to eventually be a simple but complete example of a Rails-served html5 app with a distinct but included hypermedia api.

Not only do I want it to represent technologies that work well together, but also the "best practices" I've decided on after toying around with various directory structures, naming conventions, etc. Certainly not claiming that this is how you should do it, it's just the best way I've come up with so far.

Notable conventions:

* Grape API files are like controllers and represent the relations, representers are like views and represent the resources.
* Grape files go under `app/grape/<curie_shorthand>/<rel_without_curie>.rb`
  * `curie_shorthand` is typically two letters and is the abbreviation of the api for namespacing purposes.
  * `rel_without_curie` is the relation that the grape file is representing excluding the curie prefix.
  * An example from this boilerplate is `sc:courses`, represented in `app/grape/sc/courses.rb', a set of endpoints representing courses that are owned by the object linking to them. Any time a client sees `sc:courses` as a link in a HAL representation it will, if programmed correctly, know what to expect from that href.
  * It's very essential to build your API around the concept of rels, which is sort of like a resource except it's action/change focused rather than object focused.
  * See more discussion of curies and rels in HAL [here](https://groups.google.com/forum/#!topic/hal-discuss/-gE6WmmpGHM)
* ROAR representers go under `app/grape/<curie_shorthand>/representers/<resource_name>.rb`
  * See above for what `curie_shorthand` means.
  * `resource_name` is ever so slightly different from a `rel`, for example, in this boilerplate `courses` is a rel, but both `courses` and `course` are resources. The `courses` resource contains multiple `course` resources nested within.
* Grape should be used for requests which will be loaded from a HAL client (HAL JSON formatted responses only)
  * Try to err on the side of moving too much to the HAL API, anything available here will be available to every HAL client regardless of whether it's the javascript client or some ruby/java/whatever HAL client which comes later. (though this obviously risks YAGNI if you're unsure of your direction)
* Rails should be used for requests which will be loaded from anything else (assets, html files, etc)

### HTML5

(TODO)

I'll be using [Phaser](http://phaser.io) which is a very pleasant, well documented 2d html5 game framework.

### Hypermedia

Discovering the power of hypermedia (read: True REST) APIs has been one of the most exciting things I've run into for years in terms of how much value it lets you invest into your API and how flexible well-implemented clients become.

I've chosen [HAL](http://stateless.co/hal_specification.html) as the mediatype due to its simplicity and flexibility, and therefore [Grape](http://stateless.co/hal_specification.html) will be mounted for the hypermedia API in lieu of more generalized Rails controllers. For easier HAL JSON formatting and a more object oriented approach to views than flat templates, [ROAR](https://github.com/apotonick/roar) will be used.

If you want to use Siren or Collection+JSON (other popular JSON hypermedia formats) you should be able to use the above technologies as well, perhaps with an extra gem thrown in.

For the javascript client, I'll likely go with [hyperagent.js](https://github.com/weluse/hyperagent) which is specific to HAL and lets us traverse the API concisely and with little to no configuration.

### Rails

I picked the most recent Rails version at the time, which happens to be 4.1.6. Rails will only be used for serving the client page and the assets, after that's all loaded it will just be the HAL API doing the communication (see above).

It will have rspec, activerecord, etc.

## Contributing

Don't bother yet, still in heavy construction but please do let me know if you have interest! Eventually it'll be the same pull reuqest dealio as anything else.

## License

MIT

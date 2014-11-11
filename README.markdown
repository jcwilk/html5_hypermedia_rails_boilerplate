# HTML5+Hypermedia+Rails Boilerplate

### WIP

This is a boilerplate I'm making for my own projects that I figured would be useful to be open source.

It's supposed to eventually be a simple but complete example of a Rails-served html5 app with a distinct but included hypermedia api.

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

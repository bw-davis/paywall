# Disney Streaming Take-Home

Welcome to the Disney Streaming take-home interview!

Check out the [prompt](PROMPT.md) to get started.

## README Questions:

The following are some sample questions for you to get started on your README, but feel free to format it in any way you see fit.

1. Describe any important assumptions that you have made in your code.

    I assumed that the sku is configurable on the service.  There would be some variable configured for the release this feature is in that the PM can change the value in the config system and the new value would come from the service in the response.  This could also be done on the client, I've never started a config system from scratch, only used ones that are in place.  In that case I would have that value be set to something like `paywallSku = MyModule.shared.configValues.paywallSku` which would be changed via some configuration system where we would add the config and the value and the version is begins in, then to change we would specify a version (usually the current app store version) and the new value.  Then our code receives that config value and we can update it without a new app release.

1. What edge cases have you considered in your code? What edge cases have you yet to handle?

    I didn't really have time to consider any edge cases.  Ideally I would specify certain values which are necessary to receive from the service.  This is something I actually wouldn't decide and I would get from the PM.  Then during the process of parsing, transforming, and displaying, if something goes wrong, I would fail gracefully with a general 'oops' view and if the user shakes the page it would try the process again.
    
1. What are some things you would like to do if you had more time? Is there anything you would have to change about the design of your current code to do these things? Give a rough outline of how you might implement these ideas.

    To view my submission, open terminal, run `serve.sh disney`, and launch the app.

    Unfortunately I only got the disney paywall to render using hardcoded values in the Model, and fetching the images served from localhost.

    When I start a project, I begin by setting up my view to match mocks and I tend to do so with hardcoded values.  I like to setup my view by setting the frames of all of my subviews.  I have found that this is the easiest way to debug ui issues.  I may have spent more time than I should've trying to get the screen to match what's in the PROMPT file.  I pride myself in making my features match designs exactly, which was quite difficult for me in this case since I didn't have dimensions to go off of.  I ended up resizing the images to about 60% of the original size using Preview.  When I tried to use `imageView.contentMode` & `clipsToBounds` I could never get the images to look right on an iPhone 11.  Using the original size just wasn't an option.  
    
    For parsing I wanted to use `Codable` protocol.  It's not something I have done before so I was trying to learn as I went.  I changed the schema to something I thought would work and began creating a response model that conforms to codable.

    My idea was to parse out the json using `Codable` into a response model, then have a transform that would know whether to transform the model into a `DisneyStreamingPaywallModel` or an `ESPNPaywallModel`.  Each of these would conform to a `PaywallModelProtocol` which would have some necessary properties and methods, specifically a type property which would be a `PaywallType`.  As you can see in code that is an enum for either `disneyStreaming` or `espn`.  

    The VC would know how to present a view that conforms to `PaywallViewProtocol`.  Again that would contain a few necessary properties and methods.  Based on which type of model the VC received, it would create the associated view, and render.  That way when the user shakes the device and data is fetched, whichever type of model is created, the associated view would appear.  This is how I would have accomplished that requirement.

    If I had a little more time I would like to get the parsing done and also get the shake to fetch and reload the view.  If I had another weekend I think I'd do all of the above and finish the assignment completely.  I greatly appreciate the opportunity to work on this project!  I'm sorry I didn't get as far as I wish I did.  I'm planning on finishing it whether I move on to the next round or not.  I always love learning new things!  Please reach out if you have any questions.

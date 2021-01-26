const { environment } = require('@rails/webpacker')
const webpack = require('webpack');


environment.plugins.append('Provide',
    new webpack.ProvidePlugin({
        $: 'jquery',
        jquery: 'jquery',
        Popper: ['popper.js', 'default']
    })
)

module.exports = environment


//<div>
    //<%= #form.collection_check_boxes :tag_ids, Tag.order(name: :asc), :id, :name do |t| %> 
       // <%= #t.check_box %>
       // <%= #t.text  %> 
    //<% #end %> 
//</div> 
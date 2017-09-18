var drag = new Vue({
  el: ".js-draggable",
  props: ['url'],
  data: {
    sections: [],
    url: ''
  },
  mounted: function() {
    this.url = this.$el.attributes['data-url'].value
    this.fetchSections();
  },
  methods: {
    fetchSections: function() {
      $.ajax({
        method: "GET",
        url: this.url + ".json"
      }).done(function(data) {
        this.sections = data.sections;
      }.bind(this))
    }
    // update: function() {
    //   alert('update server!')
    // }
  }
})


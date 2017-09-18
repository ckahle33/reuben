var drag = new Vue({
  el: ".js-draggable",
  props: ['url'],
  data: {
    sections: [],
    url: ''
  },
  computed: {
    orderedSections: function () {
      return _.orderBy(this.sections, 'order')
    }
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
    },
    onDragEnd: function() {
      this.postSectionOrder();
    },
    postSectionOrder: function() {
      var payload = {}
      this.sections.map(function(el, i) { return payload[el['id']] =  { 'order': i } })

      $.ajax({
        method: "PUT",
        url: this.url + '/order' +  ".json",
        data: { 'sections': payload }
      }).done(function(data) {
        console.log(data)
        // a message or green success pulse
      }.bind(this))
    }
  }
})


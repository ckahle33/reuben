if ($('.js-edit-title').length) {
  var vm = new Vue({
    el: ".js-edit-title",
    data: {
      title: "",
      url: "",
      message: "",
      showMessage: true
    },
    mounted: function() {
      // Load Data into Vue Instance
      this.url = this.$el.attributes['data-url'].value;
      this.title = this.$el.attributes['data-title'].value;
    },
    methods: {
      postTitle: function() {
        $.ajax({
          method: "PUT",
          url: this.url + ".json",
          data: { "article": { "title": this.title}}
        }).done(function(data) {
          this.message = data.message;
          // need to clear this timeout
          var to = setTimeout(function() {
            this.showMessage = false;
          }.bind(this), 2000 )
        }.bind(this))
      }
    }

  })
}

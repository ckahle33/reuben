// var app = new Vue({
//   el: "#app",
//   data: {
//     peeps: []
//   },
//   created: function() {
//     this.getPeeps()
//   },
//   methods: {
//     getPeeps: function() {
//       $.ajax({
//         url: '/peeps.json'
//       }).done(function(data) {
//         this.peeps = data;
//       }.bind(this))
//     },
//     fetch: function() {
//       $.ajax({
//         url: '/peeps.json'
//       }).done(function(data) {
//         data.forEach(function(e) {
//           this.peeps.push(e);
//         }.bind(this))
//       }.bind(this))
//     }
//   }
// })



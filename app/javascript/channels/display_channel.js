import consumer from "./consumer"

consumer.subscriptions.create("DisplayChannel", {
  connected() {
    // Called when the subscription is ready for use on the server
  },

  disconnected() {
    // Called when the subscription has been terminated by the server
  },

  received(data) {
    const html = `<p>${data.content.note_name}</p>`;
    const catalogs = document.getElementById('catalog-name');
    const boxs = document.getElementById('trash-btn-icon');
    catalogs.remove(html);
    boxs.remove(html);
  }
});

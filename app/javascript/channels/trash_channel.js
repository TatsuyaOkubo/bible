import consumer from "./consumer"

consumer.subscriptions.create("TrashChannel", {
  connected() {
    // Called when the subscription is ready for use on the server
  },

  disconnected() {
    // Called when the subscription has been terminated by the server
  },

  received(data) {
    const html = `${data.content}`;
    const catalogs = document.getElementById('catalog-name');
    const revival= document.getElementById('revival');
    const erase= document.getElementById('delete-btn');
    catalogs.remove(html);
    revival.remove(html);
    erase.remove(html);
  }
});

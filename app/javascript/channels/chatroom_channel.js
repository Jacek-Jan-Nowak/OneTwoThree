import consumer from "./consumer";

const initChatroomCable = () => {
  const messagesContainer = document.getElementById('messages');
  
  if (messagesContainer) {
    const id = messagesContainer.dataset.chatroomId;
console.log(id)

    consumer.subscriptions.create({ channel: "ChatroomChannel", id: id }, {
      received(data) {
        console.log(typeof(data))
        messagesContainer.insertAdjacentHTML('afterend', data);

      },
    });
  }
}

export { initChatroomCable };
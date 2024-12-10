document.addEventListener('turbo:load', () => {
  scrollChatToBottom();
});

document.addEventListener('turbo:submit-end', (event) => {
  if (event.target.id === 'chat-form') {
    scrollChatToBottom();
    clearMessageField();
  }
});

function scrollChatToBottom() {
  const chatHistoryContainer = document.getElementById(
    'chat-history-container'
  );
  if (chatHistoryContainer) {
    chatHistoryContainer.scrollTop = chatHistoryContainer.scrollHeight;
  }
}

function clearMessageField() {
  const messageField = document.getElementById('message_field');
  if (messageField) {
    messageField.value = '';
  }
}

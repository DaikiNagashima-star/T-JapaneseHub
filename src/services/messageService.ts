import { supabase } from '../lib/supabase';

export async function getMessageThreads() {
  // Placeholder data - replace with actual Supabase query
  return [
    {
      id: '1',
      name: 'John Doe',
      avatar: 'https://api.dicebear.com/7.x/avataaars/svg?seed=John',
      lastMessage: 'Hey, is this still available?',
      lastMessageTime: '2 min ago',
      unreadCount: 2
    }
  ];
}

export async function getMessages() {
  // Placeholder data - replace with actual Supabase query
  return [
    {
      id: '1',
      content: 'Hi, is this still available?',
      time: '10:30 AM',
      isSender: false
    },
    {
      id: '2',
      content: 'Yes, it is! When would you like to view it?',
      time: '10:32 AM',
      isSender: true
    }
  ];
}

export async function sendMessage(content: string) {
  // Placeholder - replace with actual Supabase mutation
  console.log('Sending message:', content);
  return true;
}
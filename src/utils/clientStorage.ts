// Utility functions for client-side storage management
export function getStoredListings() {
  if (typeof window === 'undefined') return null;
  
  try {
    const stored = localStorage.getItem('listings');
    return stored ? JSON.parse(stored) : null;
  } catch (e) {
    console.error('Failed to load listings from storage:', e);
    return null;
  }
}

export function storeListings(listings: any[]) {
  if (typeof window === 'undefined') return;
  
  try {
    localStorage.setItem('listings', JSON.stringify(listings));
  } catch (e) {
    console.error('Failed to save listings to storage:', e);
  }
}
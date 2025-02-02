import { atom } from 'nanostores';
import type { Listing } from '../types/listing';
import { getListings } from '../services/listingService';

// Initialize with empty array, will be populated when component mounts
export const $listings = atom<Listing[]>([]);

export async function loadListings() {
  try {
    const listings = await getListings();
    $listings.set(listings);
  } catch (error) {
    console.error('Failed to load listings:', error);
  }
}

export async function addListing(listing: Listing) {
  $listings.set([listing, ...$listings.get()]);
}
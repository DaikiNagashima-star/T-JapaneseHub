import type { Listing, NewListing } from '../types/listing';
import { supabase } from '../lib/supabase';
import { validateListing } from '../utils/listingValidation';
import { prepareListingData } from '../utils/listingDataTransform';

export async function getListings(category?: string): Promise<Listing[]> {
  try {
    let query = supabase
      .from('listings')
      .select('*')
      .order('created_at', { ascending: false });
    
    if (category && category !== 'all') {
      query = query.eq('category', category);
    }

    const { data, error } = await query;

    if (error) throw error;
    return data || [];
  } catch (error) {
    console.error('Error fetching listings:', error);
    return [];
  }
}

export async function getListing(id: string): Promise<Listing | null> {
  try {
    const { data, error } = await supabase
      .from('listings')
      .select('*')
      .eq('id', id)
      .single();

    if (error) throw error;
    return data;
  } catch (error) {
    console.error('Error fetching listing:', error);
    return null;
  }
}

export async function createListing(listing: NewListing): Promise<Listing | null> {
  try {
    // Validate the listing data
    validateListing(listing);

    // Transform the listing data for database storage
    const listingData = prepareListingData(listing);

    console.log('Creating listing with data:', listingData);

    const { data, error } = await supabase
      .from('listings')
      .insert([listingData])
      .select()
      .single();

    if (error) {
      console.error('Supabase error:', error);
      throw error;
    }

    return data;
  } catch (error) {
    console.error('Error creating listing:', error);
    throw error;
  }
}
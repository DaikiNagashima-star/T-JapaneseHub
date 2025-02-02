import type { NewListing } from '../types/listing';

export function validateListing(listing: NewListing): void {
  // Validate required core fields
  if (!listing.title?.trim()) {
    throw new Error('Title is required');
  }

  if (!listing.description?.trim()) {
    throw new Error('Description is required');
  }

  if (!listing.category) {
    throw new Error('Category is required');
  }

  if (!listing.image?.trim()) {
    throw new Error('Image URL is required');
  }

  // Validate location
  if (!listing.location?.address?.trim()) {
    throw new Error('Location address is required');
  }

  if (typeof listing.location.lat !== 'number' || typeof listing.location.lng !== 'number') {
    throw new Error('Valid location coordinates are required');
  }

  // Validate contact information
  if (!listing.contact?.name?.trim()) {
    throw new Error('Contact name is required');
  }

  if (!listing.contact?.email?.trim()) {
    throw new Error('Contact email is required');
  }

  // Category-specific validation
  if (listing.category === 'house') {
    if (!listing.house_details?.bedrooms) {
      throw new Error('Number of bedrooms is required for house listings');
    }
    if (!listing.house_details?.bathrooms) {
      throw new Error('Number of bathrooms is required for house listings');
    }
    if (!listing.house_details?.petPolicy) {
      throw new Error('Pet policy is required for house listings');
    }
    if (!listing.house_details?.availableDate) {
      throw new Error('Available date is required for house listings');
    }
  }

  if (listing.category === 'market') {
    if (!listing.market_details?.condition) {
      throw new Error('Condition is required for marketplace items');
    }
  }

  if (listing.category === 'job') {
    if (!listing.job_details?.employmentType) {
      throw new Error('Employment type is required for job listings');
    }
    if (!listing.job_details?.experienceLevel) {
      throw new Error('Experience level is required for job listings');
    }
  }
}
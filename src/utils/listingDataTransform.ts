import type { NewListing } from '../types/listing';

export function prepareListingData(listing: NewListing): any {
  // Initialize base listing data
  const listingData: any = {
    category: listing.category,
    title: listing.title.trim(),
    description: listing.description.trim(),
    price: listing.price || null,
    image: listing.image,
    location: listing.location,
    contact: listing.contact,
    created_at: new Date().toISOString(),
    // Initialize arrays with empty defaults
    utilities: [],
    features: [],
    benefits: []
  };

  // Add category-specific fields
  if (listing.category === 'house' && listing.house_details) {
    Object.assign(listingData, {
      bedrooms: listing.house_details.bedrooms,
      bathrooms: listing.house_details.bathrooms,
      pet_policy: listing.house_details.petPolicy,
      available_date: listing.house_details.availableDate,
      utilities: listing.house_details.utilities || [],
      features: listing.house_details.features || []
    });
  }

  if (listing.category === 'market' && listing.market_details) {
    Object.assign(listingData, {
      condition: listing.market_details.condition,
      brand: listing.market_details.brand || null,
      model: listing.market_details.model || null,
      original_price: listing.market_details.originalPrice || null,
      features: listing.market_details.features || []
    });
  }

  if (listing.category === 'job' && listing.job_details) {
    Object.assign(listingData, {
      employment_type: listing.job_details.employmentType,
      experience_level: listing.job_details.experienceLevel,
      benefits: listing.job_details.benefits || [],
      deadline: listing.job_details.deadline || null
    });
  }

  return listingData;
}
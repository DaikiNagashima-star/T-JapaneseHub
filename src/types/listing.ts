// Update the HouseDetails interface
interface HouseDetails {
  bedrooms: string;
  bathrooms: string;
  petPolicy: string;
  availableDate: string;
  utilities?: string[];
  features?: string[];
}

// Update the MarketDetails interface
interface MarketDetails {
  condition: string;
  brand?: string;
  model?: string;
  originalPrice?: number;
  features?: string[];
}

// Update the JobDetails interface
interface JobDetails {
  employmentType: string;
  experienceLevel: string;
  benefits?: string[];
  deadline?: string;
}

export interface Listing {
  id: string;
  category: ListingCategory;
  title: string;
  description: string;
  price?: number;
  image: string;
  location: BaseLocation;
  contact: BaseContact;
  // Category-specific fields
  bedrooms?: string;
  bathrooms?: string;
  pet_policy?: string;
  available_date?: string;
  utilities?: string[];
  features?: string[];
  condition?: string;
  brand?: string;
  model?: string;
  original_price?: number;
  employment_type?: string;
  experience_level?: string;
  benefits?: string[];
  deadline?: string;
  // Metadata
  created_at: string;
  updated_at?: string;
  user_id?: string;
}

export interface NewListing extends Omit<Listing, 'id' | 'created_at' | 'updated_at'> {
  house_details?: HouseDetails;
  market_details?: MarketDetails;
  job_details?: JobDetails;
}
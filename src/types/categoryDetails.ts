// Category-specific interfaces
export interface HouseDetails {
  bedrooms: string;
  bathrooms: string;
  petPolicy: string;
  availableDate: string;
  utilities?: string[];
  features?: string[];
}

export interface MarketDetails {
  condition: string;
  brand?: string;
  model?: string;
  originalPrice?: number;
  features?: string[];
}

export interface JobDetails {
  employmentType: string;
  experienceLevel: string;
  benefits?: string[];
  deadline?: string;
}
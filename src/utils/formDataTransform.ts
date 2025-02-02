export function extractHouseDetails(formData: FormData) {
  return {
    bedrooms: formData.get('bedrooms') as string,
    bathrooms: formData.get('bathrooms') as string,
    petPolicy: formData.get('petPolicy') as string,
    availableDate: formData.get('availableDate') as string,
    utilities: Array.from(formData.getAll('utilities')),
    features: Array.from(formData.getAll('features'))
  };
}

export function extractMarketDetails(formData: FormData) {
  return {
    condition: formData.get('condition') as string,
    brand: formData.get('brand') as string,
    model: formData.get('model') as string,
    originalPrice: formData.get('originalPrice') ? Number(formData.get('originalPrice')) : undefined,
    features: Array.from(formData.getAll('features'))
  };
}

export function extractJobDetails(formData: FormData) {
  return {
    employmentType: formData.get('employmentType') as string,
    experienceLevel: formData.get('experienceLevel') as string,
    benefits: Array.from(formData.getAll('benefits')),
    deadline: formData.get('deadline') as string
  };
}
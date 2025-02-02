import { z } from 'zod';

const configSchema = z.object({
  apiKey: z.string().min(1, 'Google Maps API key is required')
});

const config = {
  apiKey: import.meta.env.PUBLIC_GOOGLE_MAPS_API_KEY
};

export const googleMapsConfig = configSchema.parse(config);
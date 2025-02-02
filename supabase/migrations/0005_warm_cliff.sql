/*
  # Initialize Listings Table
  
  1. Schema
    - Creates the listings table with proper constraints
    - Adds RLS policies for security
  
  2. Security
    - Enables RLS
    - Sets up policies for CRUD operations
*/

-- Safely drop and recreate the table
DROP TABLE IF EXISTS public.listings;

-- Create the listings table
CREATE TABLE public.listings (
  id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
  category text NOT NULL,
  title text NOT NULL,
  description text NOT NULL,
  price numeric,
  image text NOT NULL,
  location jsonb NOT NULL,
  contact jsonb NOT NULL,
  amenities text[],
  created_at timestamptz DEFAULT now(),
  user_id uuid REFERENCES auth.users(id),
  CONSTRAINT valid_category CHECK (category IN ('house', 'market', 'job', 'others'))
);

-- Enable RLS
ALTER TABLE listings ENABLE ROW LEVEL SECURITY;

-- Create policies
CREATE POLICY "Anyone can view listings"
  ON listings FOR SELECT
  TO public
  USING (true);

CREATE POLICY "Authenticated users can create listings"
  ON listings FOR INSERT
  TO authenticated
  WITH CHECK (auth.uid() = user_id);

CREATE POLICY "Users can update own listings"
  ON listings FOR UPDATE
  TO authenticated
  USING (auth.uid() = user_id)
  WITH CHECK (auth.uid() = user_id);

CREATE POLICY "Users can delete own listings"
  ON listings FOR DELETE
  TO authenticated
  USING (auth.uid() = user_id);

-- Insert initial data
INSERT INTO public.listings (
  category,
  title,
  description,
  price,
  image,
  location,
  contact,
  amenities
) VALUES
(
  'house',
  'Private Furnished Room in North York',
  'PRIVATE, FURNISHED and a BRIGHT room on the 2nd floor in a townhouse at the major intersection of DON MILLS and EGLINTON.',
  799,
  'https://images.unsplash.com/photo-1522708323590-d24dbb6b0267?w=300&h=200&fit=crop',
  '{"address": "Don Mills and Eglinton, North York, Ontario", "lat": 43.7289, "lng": -79.3440}',
  '{"name": "Property Manager", "email": "contact@example.com", "phone": "555-0123"}',
  ARRAY['Furnished', 'Internet', 'Laundry']
);
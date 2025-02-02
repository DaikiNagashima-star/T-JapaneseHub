/*
  # Enhanced Listings Table Schema
  
  1. Table Structure
    - Enum type for categories
    - Strong validation constraints
    - JSON schema validation
    - Automatic timestamps
  
  2. Changes
    - Drops existing enum if exists
    - Creates new enum type
    - Adds enhanced constraints
    - Updates trigger for timestamps
    - Adds performance indexes
*/

-- Drop existing enum if exists
DROP TYPE IF EXISTS listing_category CASCADE;

-- Create enum for listing categories
CREATE TYPE listing_category AS ENUM ('house', 'market', 'job', 'others');

-- Drop existing table
DROP TABLE IF EXISTS public.listings;

-- Create the listings table
CREATE TABLE public.listings (
  -- Core fields
  id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
  title text NOT NULL CHECK (char_length(title) >= 3),
  description text NOT NULL CHECK (char_length(description) >= 10),
  category listing_category NOT NULL,
  
  -- Optional fields with constraints
  price numeric CHECK (price IS NULL OR price >= 0),
  image text NOT NULL CHECK (image ~ '^https?://'),
  amenities text[],
  
  -- JSON fields with schema validation
  location jsonb NOT NULL CHECK (
    jsonb_typeof(location->'address') = 'string' AND
    jsonb_typeof(location->'lat') = 'number' AND
    jsonb_typeof(location->'lng') = 'number'
  ),
  contact jsonb NOT NULL CHECK (
    jsonb_typeof(contact->'name') = 'string' AND
    jsonb_typeof(contact->'email') = 'string' AND
    (contact->>'email' ~ '^[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,}$')
  ),
  
  -- Metadata
  created_at timestamptz NOT NULL DEFAULT now(),
  updated_at timestamptz NOT NULL DEFAULT now(),
  user_id uuid REFERENCES auth.users(id),
  
  -- Additional constraints
  CONSTRAINT title_length CHECK (char_length(title) <= 200),
  CONSTRAINT description_length CHECK (char_length(description) <= 5000)
);

-- Add updated_at trigger
CREATE OR REPLACE FUNCTION update_updated_at()
RETURNS TRIGGER AS $$
BEGIN
  NEW.updated_at = now();
  RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER update_listings_updated_at
  BEFORE UPDATE ON listings
  FOR EACH ROW
  EXECUTE FUNCTION update_updated_at();

-- Enable RLS
ALTER TABLE listings ENABLE ROW LEVEL SECURITY;

-- Drop existing policies if they exist
DO $$ 
BEGIN
  DROP POLICY IF EXISTS "Anyone can view listings" ON listings;
  DROP POLICY IF EXISTS "Authenticated users can create listings" ON listings;
  DROP POLICY IF EXISTS "Users can update own listings" ON listings;
  DROP POLICY IF EXISTS "Users can delete own listings" ON listings;
END $$;

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

-- Create indexes
CREATE INDEX idx_listings_category ON listings(category);
CREATE INDEX idx_listings_created_at ON listings(created_at DESC);
CREATE INDEX idx_listings_user_id ON listings(user_id);
CREATE INDEX idx_listings_price ON listings(price) WHERE price IS NOT NULL;
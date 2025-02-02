/*
  # Fix listings table constraints

  1. Changes
    - Adjust description length constraint to be more permissive
    - Fix check constraints for required fields
    
  2. Security
    - Maintain RLS policies
    - Keep existing security measures
*/

-- Update the listings table constraints
ALTER TABLE public.listings
DROP CONSTRAINT IF EXISTS listings_description_check,
ADD CONSTRAINT listings_description_check 
  CHECK (char_length(description) >= 3);

-- Ensure the table exists and has proper constraints
DO $$ 
BEGIN
  IF NOT EXISTS (SELECT FROM pg_tables WHERE schemaname = 'public' AND tablename = 'listings') THEN
    CREATE TABLE public.listings (
      id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
      category listing_category NOT NULL,
      title text NOT NULL CHECK (char_length(title) >= 3),
      description text NOT NULL CHECK (char_length(description) >= 3),
      price numeric CHECK (price IS NULL OR price >= 0),
      image text NOT NULL CHECK (image ~ '^https?://'),
      location jsonb NOT NULL,
      contact jsonb NOT NULL,
      amenities text[],
      created_at timestamptz NOT NULL DEFAULT now(),
      updated_at timestamptz NOT NULL DEFAULT now(),
      user_id uuid REFERENCES auth.users(id)
    );

    -- Enable RLS
    ALTER TABLE listings ENABLE ROW LEVEL SECURITY;
  END IF;
END $$;
/*
  # Create listings table

  1. New Tables
    - `listings`
      - `id` (uuid, primary key)
      - `category` (text with check constraint)
      - `title` (text)
      - `description` (text)
      - `price` (numeric, optional)
      - `image` (text)
      - `location` (jsonb)
      - `contact` (jsonb)
      - `amenities` (text array)
      - `created_at` (timestamptz)
      - `user_id` (uuid, foreign key to auth.users)

  2. Security
    - Enable RLS
    - Add policies for CRUD operations
*/

-- Drop existing table if it exists
DROP TABLE IF EXISTS public.listings;

-- Create the listings table
CREATE TABLE public.listings (
  id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
  category text NOT NULL CHECK (category IN ('house', 'market', 'job', 'others')),
  title text NOT NULL,
  description text NOT NULL,
  price numeric,
  image text NOT NULL,
  location jsonb NOT NULL,
  contact jsonb NOT NULL,
  amenities text[],
  created_at timestamptz DEFAULT now(),
  user_id uuid REFERENCES auth.users(id)
);

-- Enable RLS
ALTER TABLE listings ENABLE ROW LEVEL SECURITY;

-- Policies
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
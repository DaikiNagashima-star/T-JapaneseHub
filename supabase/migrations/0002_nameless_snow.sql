/*
  # Seed initial listings data

  1. Data
    - Adds sample listings for testing
    - Includes different categories: house, market, job, others
    - Each listing has complete data structure including location and contact info

  2. Notes
    - All listings are publicly readable
    - No user_id is set since this is sample data
*/

INSERT INTO public.listings (
  category,
  title,
  description,
  price,
  image,
  location,
  contact,
  amenities,
  created_at
) VALUES
(
  'house',
  'Private Furnished Room in North York',
  'PRIVATE, FURNISHED and a BRIGHT room on the 2nd floor in a townhouse at the major intersection of DON MILLS and EGLINTON. (North York, Ontario).',
  799,
  'https://images.unsplash.com/photo-1522708323590-d24dbb6b0267?w=300&h=200&fit=crop',
  '{"address": "Don Mills and Eglinton, North York, Ontario", "lat": 43.7289, "lng": -79.3440}',
  '{"name": "Property Manager", "email": "contact@example.com", "phone": "555-0123"}',
  ARRAY['Furnished', 'Internet', 'Laundry', 'Utilities Included', 'Public Transportation'],
  NOW()
),
(
  'market',
  'MacBook Pro M2 - Like New',
  'MacBook Pro M2 (2023) in excellent condition.',
  1599,
  'https://images.unsplash.com/photo-1517336714731-489689fd1ca8?w=300&h=200&fit=crop',
  '{"address": "Downtown Toronto, ON", "lat": 43.6532, "lng": -79.3832}',
  '{"name": "Sarah Chen", "email": "sarah@example.com", "phone": "555-0124"}',
  ARRAY['Original Box', 'Warranty', 'Accessories Included'],
  NOW() - INTERVAL '1 hour'
),
(
  'job',
  'Senior Full Stack Developer',
  'We are looking for a Senior Full Stack Developer to join our growing team.',
  NULL,
  'https://images.unsplash.com/photo-1498050108023-c5249f4df085?w=300&h=200&fit=crop',
  '{"address": "Toronto, ON (Hybrid)", "lat": 43.6547, "lng": -79.3907}',
  '{"name": "HR Team", "email": "careers@example.com"}',
  ARRAY['Remote Options', 'Health Benefits', 'Professional Development'],
  NOW() - INTERVAL '3 hours'
);
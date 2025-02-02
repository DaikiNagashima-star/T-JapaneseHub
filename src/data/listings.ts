export const listings = [
  {
    id: '1',
    category: 'house',
    title: 'Private Furnished Room in North York',
    description: `PRIVATE, FURNISHED and a BRIGHT room on the 2nd floor in a townhouse at the major intersection of DON MILLS and EGLINTON. (North York, Ontario).

Key Features:
• Very safe and convenient location
• No Lease Agreement Required
• Month to month OR for as long as the stay is
• Bus stop across the street
• 15 minutes by bus to Don Mills station

Included Utilities:
• Heat, Hydro, Water
• Fast speed Internet
• Laundry

House Rules:
• No pets, no guests
• No parties, no smoking
• No drugs`,
    price: 799,
    image: 'https://images.unsplash.com/photo-1522708323590-d24dbb6b0267?w=300&h=200&fit=crop',
    location: {
      address: 'Don Mills and Eglinton, North York, Ontario',
      lat: 43.7289,
      lng: -79.3440
    },
    contact: {
      name: 'Property Manager',
      email: 'contact@example.com',
      phone: '555-0123'
    },
    amenities: [
      'Furnished',
      'Internet',
      'Laundry',
      'Utilities Included',
      'Public Transportation'
    ],
    createdAt: '2 hours ago'
  },
  {
    id: '2',
    category: 'market',
    title: 'MacBook Pro M2 - Like New',
    description: `MacBook Pro M2 (2023) in excellent condition.

Specifications:
• M2 Pro chip
• 16GB RAM
• 512GB SSD
• Only 3 months old
• Battery cycle count: 23
• Includes original box and charger

Reason for selling:
• Upgrading to a different system for work requirements

Condition:
• Like new, no scratches or dents
• Screen protector applied since day one
• Keyboard cover included`,
    price: 1599,
    image: 'https://images.unsplash.com/photo-1517336714731-489689fd1ca8?w=300&h=200&fit=crop',
    location: {
      address: 'Downtown Toronto, ON',
      lat: 43.6532,
      lng: -79.3832
    },
    contact: {
      name: 'Sarah Chen',
      email: 'sarah@example.com',
      phone: '555-0124'
    },
    amenities: [
      'Original Box',
      'Warranty',
      'Accessories Included'
    ],
    createdAt: '1 hour ago'
  },
  {
    id: '3',
    category: 'job',
    title: 'Senior Full Stack Developer',
    description: `We're looking for a Senior Full Stack Developer to join our growing team.

Requirements:
• 5+ years of experience with React and Node.js
• Experience with TypeScript and GraphQL
• Strong understanding of cloud services (AWS/Azure)
• Excellent problem-solving skills

Benefits:
• Competitive salary ($120k-$150k)
• Remote work options
• Health and dental insurance
• 4 weeks vacation
• Professional development budget`,
    image: 'https://images.unsplash.com/photo-1498050108023-c5249f4df085?w=300&h=200&fit=crop',
    location: {
      address: 'Toronto, ON (Hybrid)',
      lat: 43.6547,
      lng: -79.3907
    },
    contact: {
      name: 'HR Team',
      email: 'careers@example.com'
    },
    amenities: [
      'Remote Options',
      'Health Benefits',
      'Professional Development'
    ],
    createdAt: '3 hours ago'
  },
  {
    id: '4',
    category: 'others',
    title: 'Piano Lessons - All Levels',
    description: `Professional piano lessons for all ages and skill levels.

Teaching Experience:
• 15+ years of teaching experience
• Royal Conservatory certified
• Specializing in classical and contemporary

Lesson Details:
• 30, 45, or 60-minute sessions
• Flexible scheduling
• Both online and in-person options
• Group lessons available

Rates:
• 30 min: $40
• 45 min: $55
• 60 min: $70`,
    price: 40,
    image: 'https://images.unsplash.com/photo-1520523839897-bd0b52f945a0?w=300&h=200&fit=crop',
    location: {
      address: 'Mississauga, ON',
      lat: 43.5890,
      lng: -79.6441
    },
    contact: {
      name: 'Professor Williams',
      email: 'music@example.com',
      phone: '555-0125'
    },
    amenities: [
      'Flexible Schedule',
      'Online Options',
      'Group Classes'
    ],
    createdAt: '5 hours ago'
  }
];
<?php
namespace Database\Seeders\Tables;

use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;

class CountriesSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        /**
         * Command :
         * artisan seed:generate --table-mode --tables=activities,activity_files,activity_participants,attributes,attribute_options,attribute_values,core_config,countries,country_states,email_attachments,email_templates,emails,groups,lead_pipeline_stages,lead_pipelines,lead_products,lead_sources,lead_stages,leads,organizations,persons,products,quote_items,quotes,roles,tags,workflows
         *
         */

        DB::table("countries")->truncate();

        $dataTables = [
            [
            'id' => 1,
            'code' => 'AF',
            'name' => 'Afghanistan',
            ],
            [
            'id' => 2,
            'code' => 'AX',
            'name' => 'Åland Islands',
            ],
            [
            'id' => 3,
            'code' => 'AL',
            'name' => 'Albania',
            ],
            [
            'id' => 4,
            'code' => 'DZ',
            'name' => 'Algeria',
            ],
            [
            'id' => 5,
            'code' => 'AS',
            'name' => 'American Samoa',
            ],
            [
            'id' => 6,
            'code' => 'AD',
            'name' => 'Andorra',
            ],
            [
            'id' => 7,
            'code' => 'AO',
            'name' => 'Angola',
            ],
            [
            'id' => 8,
            'code' => 'AI',
            'name' => 'Anguilla',
            ],
            [
            'id' => 9,
            'code' => 'AQ',
            'name' => 'Antarctica',
            ],
            [
            'id' => 10,
            'code' => 'AG',
            'name' => 'Antigua & Barbuda',
            ],
            [
            'id' => 11,
            'code' => 'AR',
            'name' => 'Argentina',
            ],
            [
            'id' => 12,
            'code' => 'AM',
            'name' => 'Armenia',
            ],
            [
            'id' => 13,
            'code' => 'AW',
            'name' => 'Aruba',
            ],
            [
            'id' => 14,
            'code' => 'AU',
            'name' => 'Australia',
            ],
            [
            'id' => 15,
            'code' => 'AT',
            'name' => 'Austria',
            ],
            [
            'id' => 16,
            'code' => 'AZ',
            'name' => 'Azerbaijan',
            ],
            [
            'id' => 17,
            'code' => 'BS',
            'name' => 'Bahamas',
            ],
            [
            'id' => 18,
            'code' => 'BH',
            'name' => 'Bahrain',
            ],
            [
            'id' => 19,
            'code' => 'BD',
            'name' => 'Bangladesh',
            ],
            [
            'id' => 20,
            'code' => 'BB',
            'name' => 'Barbados',
            ],
            [
            'id' => 21,
            'code' => 'BY',
            'name' => 'Belarus',
            ],
            [
            'id' => 22,
            'code' => 'BE',
            'name' => 'Belgium',
            ],
            [
            'id' => 23,
            'code' => 'BZ',
            'name' => 'Belize',
            ],
            [
            'id' => 24,
            'code' => 'BJ',
            'name' => 'Benin',
            ],
            [
            'id' => 25,
            'code' => 'BM',
            'name' => 'Bermuda',
            ],
            [
            'id' => 26,
            'code' => 'BT',
            'name' => 'Bhutan',
            ],
            [
            'id' => 27,
            'code' => 'BO',
            'name' => 'Bolivia',
            ],
            [
            'id' => 28,
            'code' => 'BA',
            'name' => 'Bosnia & Herzegovina',
            ],
            [
            'id' => 29,
            'code' => 'BW',
            'name' => 'Botswana',
            ],
            [
            'id' => 30,
            'code' => 'BV',
            'name' => 'Bouvet Island',
            ],
            [
            'id' => 31,
            'code' => 'BR',
            'name' => 'Brazil',
            ],
            [
            'id' => 32,
            'code' => 'IO',
            'name' => 'British Indian Ocean Territory',
            ],
            [
            'id' => 33,
            'code' => 'BN',
            'name' => 'Brunei',
            ],
            [
            'id' => 34,
            'code' => 'BG',
            'name' => 'Bulgaria',
            ],
            [
            'id' => 35,
            'code' => 'BF',
            'name' => 'Burkina Faso',
            ],
            [
            'id' => 36,
            'code' => 'BI',
            'name' => 'Burundi',
            ],
            [
            'id' => 37,
            'code' => 'CV',
            'name' => 'Cabo Verde',
            ],
            [
            'id' => 38,
            'code' => 'KH',
            'name' => 'Cambodia',
            ],
            [
            'id' => 39,
            'code' => 'CM',
            'name' => 'Cameroon',
            ],
            [
            'id' => 40,
            'code' => 'CA',
            'name' => 'Canada',
            ],
            [
            'id' => 41,
            'code' => 'KY',
            'name' => 'Cayman Islands',
            ],
            [
            'id' => 42,
            'code' => 'CF',
            'name' => 'Central African Republic',
            ],
            [
            'id' => 43,
            'code' => 'TD',
            'name' => 'Chad',
            ],
            [
            'id' => 44,
            'code' => 'CL',
            'name' => 'Chile',
            ],
            [
            'id' => 45,
            'code' => 'CN',
            'name' => 'China',
            ],
            [
            'id' => 46,
            'code' => 'CX',
            'name' => 'Christmas Island',
            ],
            [
            'id' => 47,
            'code' => 'CC',
            'name' => 'Cocos (Keeling) Islands',
            ],
            [
            'id' => 48,
            'code' => 'CO',
            'name' => 'Colombia',
            ],
            [
            'id' => 49,
            'code' => 'KM',
            'name' => 'Comoros',
            ],
            [
            'id' => 50,
            'code' => 'CD',
            'name' => 'Congo - Kinshasa',
            ],
            [
            'id' => 51,
            'code' => 'CG',
            'name' => 'Congo - Brazzaville',
            ],
            [
            'id' => 52,
            'code' => 'CK',
            'name' => 'Cook Islands',
            ],
            [
            'id' => 53,
            'code' => 'CR',
            'name' => 'Costa Rica',
            ],
            [
            'id' => 54,
            'code' => 'CI',
            'name' => "Côte d’Ivoire",
            ],
            [
            'id' => 55,
            'code' => 'HR',
            'name' => 'Croatia',
            ],
            [
            'id' => 56,
            'code' => 'CU',
            'name' => 'Cuba',
            ],
            [
            'id' => 57,
            'code' => 'CW',
            'name' => 'Curaçao',
            ],
            [
            'id' => 58,
            'code' => 'CY',
            'name' => 'Cyprus',
            ],
            [
            'id' => 59,
            'code' => 'CZ',
            'name' => 'Czechia',
            ],
            [
            'id' => 60,
            'code' => 'DK',
            'name' => 'Denmark',
            ],
            [
            'id' => 61,
            'code' => 'DJ',
            'name' => 'Djibouti',
            ],
            [
            'id' => 62,
            'code' => 'DM',
            'name' => 'Dominica',
            ],
            [
            'id' => 63,
            'code' => 'DO',
            'name' => 'Dominican Republic',
            ],
            [
            'id' => 64,
            'code' => 'EC',
            'name' => 'Ecuador',
            ],
            [
            'id' => 65,
            'code' => 'EG',
            'name' => 'Egypt',
            ],
            [
            'id' => 66,
            'code' => 'SV',
            'name' => 'El Salvador',
            ],
            [
            'id' => 67,
            'code' => 'GQ',
            'name' => 'Equatorial Guinea',
            ],
            [
            'id' => 68,
            'code' => 'ER',
            'name' => 'Eritrea',
            ],
            [
            'id' => 69,
            'code' => 'EE',
            'name' => 'Estonia',
            ],
            [
            'id' => 70,
            'code' => 'SZ',
            'name' => 'Eswatini',
            ],
            [
            'id' => 71,
            'code' => 'ET',
            'name' => 'Ethiopia',
            ],
            [
            'id' => 72,
            'code' => 'FK',
            'name' => 'Falkland Islands',
            ],
            [
            'id' => 73,
            'code' => 'FO',
            'name' => 'Faroe Islands',
            ],
            [
            'id' => 74,
            'code' => 'FJ',
            'name' => 'Fiji',
            ],
            [
            'id' => 75,
            'code' => 'FI',
            'name' => 'Finland',
            ],
            [
            'id' => 76,
            'code' => 'FR',
            'name' => 'France',
            ],
            [
            'id' => 77,
            'code' => 'GF',
            'name' => 'French Guiana',
            ],
            [
            'id' => 78,
            'code' => 'PF',
            'name' => 'French Polynesia',
            ],
            [
            'id' => 79,
            'code' => 'TF',
            'name' => 'French Southern Territories',
            ],
            [
            'id' => 80,
            'code' => 'GA',
            'name' => 'Gabon',
            ],
            [
            'id' => 81,
            'code' => 'GM',
            'name' => 'Gambia',
            ],
            [
            'id' => 82,
            'code' => 'GE',
            'name' => 'Georgia',
            ],
            [
            'id' => 83,
            'code' => 'DE',
            'name' => 'Germany',
            ],
            [
            'id' => 84,
            'code' => 'GH',
            'name' => 'Ghana',
            ],
            [
            'id' => 85,
            'code' => 'GI',
            'name' => 'Gibraltar',
            ],
            [
            'id' => 86,
            'code' => 'GR',
            'name' => 'Greece',
            ],
            [
            'id' => 87,
            'code' => 'GL',
            'name' => 'Greenland',
            ],
            [
            'id' => 88,
            'code' => 'GD',
            'name' => 'Grenada',
            ],
            [
            'id' => 89,
            'code' => 'GP',
            'name' => 'Guadeloupe',
            ],
            [
            'id' => 90,
            'code' => 'GU',
            'name' => 'Guam',
            ],
            [
            'id' => 91,
            'code' => 'GT',
            'name' => 'Guatemala',
            ],
            [
            'id' => 92,
            'code' => 'GG',
            'name' => 'Guernsey',
            ],
            [
            'id' => 93,
            'code' => 'GN',
            'name' => 'Guinea',
            ],
            [
            'id' => 94,
            'code' => 'GW',
            'name' => 'Guinea-Bissau',
            ],
            [
            'id' => 95,
            'code' => 'GY',
            'name' => 'Guyana',
            ],
            [
            'id' => 96,
            'code' => 'HT',
            'name' => 'Haiti',
            ],
            [
            'id' => 97,
            'code' => 'HM',
            'name' => 'Heard & McDonald Islands',
            ],
            [
            'id' => 98,
            'code' => 'HN',
            'name' => 'Honduras',
            ],
            [
            'id' => 99,
            'code' => 'HK',
            'name' => 'Hong Kong SAR China',
            ],
            [
            'id' => 100,
            'code' => 'HU',
            'name' => 'Hungary',
            ],
            [
            'id' => 101,
            'code' => 'IS',
            'name' => 'Iceland',
            ],
            [
            'id' => 102,
            'code' => 'IN',
            'name' => 'India',
            ],
            [
            'id' => 103,
            'code' => 'ID',
            'name' => 'Indonesia',
            ],
            [
            'id' => 104,
            'code' => 'IR',
            'name' => 'Iran',
            ],
            [
            'id' => 105,
            'code' => 'IQ',
            'name' => 'Iraq',
            ],
            [
            'id' => 106,
            'code' => 'IE',
            'name' => 'Ireland',
            ],
            [
            'id' => 107,
            'code' => 'IM',
            'name' => 'Isle of Man',
            ],
            [
            'id' => 108,
            'code' => 'IL',
            'name' => 'Israel',
            ],
            [
            'id' => 109,
            'code' => 'IT',
            'name' => 'Italy',
            ],
            [
            'id' => 110,
            'code' => 'JM',
            'name' => 'Jamaica',
            ],
            [
            'id' => 111,
            'code' => 'JP',
            'name' => 'Japan',
            ],
            [
            'id' => 112,
            'code' => 'JE',
            'name' => 'Jersey',
            ],
            [
            'id' => 113,
            'code' => 'JO',
            'name' => 'Jordan',
            ],
            [
            'id' => 114,
            'code' => 'KZ',
            'name' => 'Kazakhstan',
            ],
            [
            'id' => 115,
            'code' => 'KE',
            'name' => 'Kenya',
            ],
            [
            'id' => 116,
            'code' => 'KI',
            'name' => 'Kiribati',
            ],
            [
            'id' => 117,
            'code' => 'KP',
            'name' => 'Korea - North',
            ],
            [
            'id' => 118,
            'code' => 'KR',
            'name' => 'Korea - South',
            ],
            [
            'id' => 119,
            'code' => 'XK',
            'name' => 'Kosovo',
            ],
            [
            'id' => 120,
            'code' => 'KW',
            'name' => 'Kuwait',
            ],
            [
            'id' => 121,
            'code' => 'KG',
            'name' => 'Kyrgyzstan',
            ],
            [
            'id' => 122,
            'code' => 'LA',
            'name' => 'Laos',
            ],
            [
            'id' => 123,
            'code' => 'LV',
            'name' => 'Latvia',
            ],
            [
            'id' => 124,
            'code' => 'LB',
            'name' => 'Lebanon',
            ],
            [
            'id' => 125,
            'code' => 'LS',
            'name' => 'Lesotho',
            ],
            [
            'id' => 126,
            'code' => 'LR',
            'name' => 'Liberia',
            ],
            [
            'id' => 127,
            'code' => 'LY',
            'name' => 'Libya',
            ],
            [
            'id' => 128,
            'code' => 'LI',
            'name' => 'Liechtenstein',
            ],
            [
            'id' => 129,
            'code' => 'LT',
            'name' => 'Lithuania',
            ],
            [
            'id' => 130,
            'code' => 'LU',
            'name' => 'Luxembourg',
            ],
            [
            'id' => 131,
            'code' => 'MO',
            'name' => 'Macao SAR China',
            ],
            [
            'id' => 132,
            'code' => 'MK',
            'name' => 'North Macedonia',
            ],
            [
            'id' => 133,
            'code' => 'MG',
            'name' => 'Madagascar',
            ],
            [
            'id' => 134,
            'code' => 'MW',
            'name' => 'Malawi',
            ],
            [
            'id' => 135,
            'code' => 'MY',
            'name' => 'Malaysia',
            ],
            [
            'id' => 136,
            'code' => 'MV',
            'name' => 'Maldives',
            ],
            [
            'id' => 137,
            'code' => 'ML',
            'name' => 'Mali',
            ],
            [
            'id' => 138,
            'code' => 'MT',
            'name' => 'Malta',
            ],
            [
            'id' => 139,
            'code' => 'MH',
            'name' => 'Marshall Islands',
            ],
            [
            'id' => 140,
            'code' => 'MQ',
            'name' => 'Martinique',
            ],
            [
            'id' => 141,
            'code' => 'MR',
            'name' => 'Mauritania',
            ],
            [
            'id' => 142,
            'code' => 'MU',
            'name' => 'Mauritius',
            ],
            [
            'id' => 143,
            'code' => 'YT',
            'name' => 'Mayotte',
            ],
            [
            'id' => 144,
            'code' => 'MX',
            'name' => 'Mexico',
            ],
            [
            'id' => 145,
            'code' => 'FM',
            'name' => 'Micronesia',
            ],
            [
            'id' => 146,
            'code' => 'MD',
            'name' => 'Moldova',
            ],
            [
            'id' => 147,
            'code' => 'MC',
            'name' => 'Monaco',
            ],
            [
            'id' => 148,
            'code' => 'MN',
            'name' => 'Mongolia',
            ],
            [
            'id' => 149,
            'code' => 'ME',
            'name' => 'Montenegro',
            ],
            [
            'id' => 150,
            'code' => 'MS',
            'name' => 'Montserrat',
            ],
            [
            'id' => 151,
            'code' => 'MA',
            'name' => 'Morocco',
            ],
            [
            'id' => 152,
            'code' => 'MZ',
            'name' => 'Mozambique',
            ],
            [
            'id' => 153,
            'code' => 'MM',
            'name' => 'Myanmar',
            ],
            [
            'id' => 154,
            'code' => 'NA',
            'name' => 'Namibia',
            ],
            [
            'id' => 155,
            'code' => 'NR',
            'name' => 'Nauru',
            ],
            [
            'id' => 156,
            'code' => 'NP',
            'name' => 'Nepal',
            ],
            [
            'id' => 157,
            'code' => 'NL',
            'name' => 'Netherlands',
            ],
            [
            'id' => 158,
            'code' => 'NC',
            'name' => 'New Caledonia',
            ],
            [
            'id' => 159,
            'code' => 'NZ',
            'name' => 'New Zealand',
            ],
            [
            'id' => 160,
            'code' => 'NI',
            'name' => 'Nicaragua',
            ],
            [
            'id' => 161,
            'code' => 'NE',
            'name' => 'Niger',
            ],
            [
            'id' => 162,
            'code' => 'NG',
            'name' => 'Nigeria',
            ],
            [
            'id' => 163,
            'code' => 'NU',
            'name' => 'Niue',
            ],
            [
            'id' => 164,
            'code' => 'NF',
            'name' => 'Norfolk Island',
            ],
            [
            'id' => 165,
            'code' => 'MP',
            'name' => 'Northern Mariana Islands',
            ],
            [
            'id' => 166,
            'code' => 'NO',
            'name' => 'Norway',
            ],
            [
            'id' => 167,
            'code' => 'OM',
            'name' => 'Oman',
            ],
            [
            'id' => 168,
            'code' => 'PK',
            'name' => 'Pakistan',
            ],
            [
            'id' => 169,
            'code' => 'PW',
            'name' => 'Palau',
            ],
            [
            'id' => 170,
            'code' => 'PS',
            'name' => 'Palestinian Territories',
            ],
            [
            'id' => 171,
            'code' => 'PA',
            'name' => 'Panama',
            ],
            [
            'id' => 172,
            'code' => 'PG',
            'name' => 'Papua New Guinea',
            ],
            [
            'id' => 173,
            'code' => 'PY',
            'name' => 'Paraguay',
            ],
            [
            'id' => 174,
            'code' => 'PE',
            'name' => 'Peru',
            ],
            [
            'id' => 175,
            'code' => 'PH',
            'name' => 'Philippines',
            ],
            [
            'id' => 176,
            'code' => 'PN',
            'name' => 'Pitcairn Islands',
            ],
            [
            'id' => 177,
            'code' => 'PL',
            'name' => 'Poland',
            ],
            [
            'id' => 178,
            'code' => 'PT',
            'name' => 'Portugal',
            ],
            [
            'id' => 179,
            'code' => 'PR',
            'name' => 'Puerto Rico',
            ],
            [
            'id' => 180,
            'code' => 'QA',
            'name' => 'Qatar',
            ],
            [
            'id' => 181,
            'code' => 'RE',
            'name' => 'Réunion',
            ],
            [
            'id' => 182,
            'code' => 'RO',
            'name' => 'Romania',
            ],
            [
            'id' => 183,
            'code' => 'RU',
            'name' => 'Russia',
            ],
            [
            'id' => 184,
            'code' => 'RW',
            'name' => 'Rwanda',
            ],
            [
            'id' => 185,
            'code' => 'BL',
            'name' => 'Saint Barthélemy',
            ],
            [
            'id' => 186,
            'code' => 'SH',
            'name' => 'Saint Helena',
            ],
            [
            'id' => 187,
            'code' => 'KN',
            'name' => 'Saint Kitts & Nevis',
            ],
            [
            'id' => 188,
            'code' => 'LC',
            'name' => 'Saint Lucia',
            ],
            [
            'id' => 189,
            'code' => 'MF',
            'name' => 'Saint Martin',
            ],
            [
            'id' => 190,
            'code' => 'PM',
            'name' => 'Saint Pierre & Miquelon',
            ],
            [
            'id' => 191,
            'code' => 'VC',
            'name' => 'Saint Vincent & Grenadines',
            ],
            [
            'id' => 192,
            'code' => 'WS',
            'name' => 'Samoa',
            ],
            [
            'id' => 193,
            'code' => 'SM',
            'name' => 'San Marino',
            ],
            [
            'id' => 194,
            'code' => 'ST',
            'name' => 'Sao Tome & Principe',
            ],
            [
            'id' => 195,
            'code' => 'SA',
            'name' => 'Saudi Arabia',
            ],
            [
            'id' => 196,
            'code' => 'SN',
            'name' => 'Senegal',
            ],
            [
            'id' => 197,
            'code' => 'RS',
            'name' => 'Serbia',
            ],
            [
            'id' => 198,
            'code' => 'SC',
            'name' => 'Seychelles',
            ],
            [
            'id' => 199,
            'code' => 'SL',
            'name' => 'Sierra Leone',
            ],
            [
            'id' => 200,
            'code' => 'SG',
            'name' => 'Singapore',
            ],
            [
            'id' => 201,
            'code' => 'SX',
            'name' => 'Sint Maarten',
            ],
            [
            'id' => 202,
            'code' => 'SK',
            'name' => 'Slovakia',
            ],
            [
            'id' => 203,
            'code' => 'SI',
            'name' => 'Slovenia',
            ],
            [
            'id' => 204,
            'code' => 'SB',
            'name' => 'Solomon Islands',
            ],
            [
            'id' => 205,
            'code' => 'SO',
            'name' => 'Somalia',
            ],
            [
            'id' => 206,
            'code' => 'ZA',
            'name' => 'South Africa',
            ],
            [
            'id' => 207,
            'code' => 'GS',
            'name' => 'South Georgia & South Sandwich Islands',
            ],
            [
            'id' => 208,
            'code' => 'SS',
            'name' => 'South Sudan',
            ],
            [
            'id' => 209,
            'code' => 'ES',
            'name' => 'Spain',
            ],
            [
            'id' => 210,
            'code' => 'LK',
            'name' => 'Sri Lanka',
            ],
            [
            'id' => 211,
            'code' => 'SD',
            'name' => 'Sudan',
            ],
            [
            'id' => 212,
            'code' => 'SR',
            'name' => 'Suriname',
            ],
            [
            'id' => 213,
            'code' => 'SJ',
            'name' => 'Svalbard & Jan Mayen',
            ],
            [
            'id' => 214,
            'code' => 'SE',
            'name' => 'Sweden',
            ],
            [
            'id' => 215,
            'code' => 'CH',
            'name' => 'Switzerland',
            ],
            [
            'id' => 216,
            'code' => 'SY',
            'name' => 'Syria',
            ],
            [
            'id' => 217,
            'code' => 'TW',
            'name' => 'Taiwan',
            ],
            [
            'id' => 218,
            'code' => 'TJ',
            'name' => 'Tajikistan',
            ],
            [
            'id' => 219,
            'code' => 'TZ',
            'name' => 'Tanzania',
            ],
            [
            'id' => 220,
            'code' => 'TH',
            'name' => 'Thailand',
            ],
            [
            'id' => 221,
            'code' => 'TL',
            'name' => 'Timor-Leste',
            ],
            [
            'id' => 222,
            'code' => 'TG',
            'name' => 'Togo',
            ],
            [
            'id' => 223,
            'code' => 'TK',
            'name' => 'Tokelau',
            ],
            [
            'id' => 224,
            'code' => 'TO',
            'name' => 'Tonga',
            ],
            [
            'id' => 225,
            'code' => 'TT',
            'name' => 'Trinidad & Tobago',
            ],
            [
            'id' => 226,
            'code' => 'TN',
            'name' => 'Tunisia',
            ],
            [
            'id' => 227,
            'code' => 'TR',
            'name' => 'Turkey',
            ],
            [
            'id' => 228,
            'code' => 'TM',
            'name' => 'Turkmenistan',
            ],
            [
            'id' => 229,
            'code' => 'TC',
            'name' => 'Turks & Caicos Islands',
            ],
            [
            'id' => 230,
            'code' => 'TV',
            'name' => 'Tuvalu',
            ],
            [
            'id' => 231,
            'code' => 'UG',
            'name' => 'Uganda',
            ],
            [
            'id' => 232,
            'code' => 'UA',
            'name' => 'Ukraine',
            ],
            [
            'id' => 233,
            'code' => 'AE',
            'name' => 'United Arab Emirates',
            ],
            [
            'id' => 234,
            'code' => 'GB',
            'name' => 'United Kingdom',
            ],
            [
            'id' => 235,
            'code' => 'US',
            'name' => 'United States',
            ],
            [
            'id' => 236,
            'code' => 'UM',
            'name' => 'United States Minor Outlying Islands',
            ],
            [
            'id' => 237,
            'code' => 'UY',
            'name' => 'Uruguay',
            ],
            [
            'id' => 238,
            'code' => 'UZ',
            'name' => 'Uzbekistan',
            ],
            [
            'id' => 239,
            'code' => 'VU',
            'name' => 'Vanuatu',
            ],
            [
            'id' => 240,
            'code' => 'VA',
            'name' => 'Vatican City',
            ],
            [
            'id' => 241,
            'code' => 'VE',
            'name' => 'Venezuela',
            ],
            [
            'id' => 242,
            'code' => 'VN',
            'name' => 'Vietnam',
            ],
            [
            'id' => 243,
            'code' => 'VG',
            'name' => 'British Virgin Islands',
            ],
            [
            'id' => 244,
            'code' => 'VI',
            'name' => 'U.S. Virgin Islands',
            ],
            [
            'id' => 245,
            'code' => 'WF',
            'name' => 'Wallis & Futuna',
            ],
            [
            'id' => 246,
            'code' => 'EH',
            'name' => 'Western Sahara',
            ],
            [
            'id' => 247,
            'code' => 'YE',
            'name' => 'Yemen',
            ],
            [
            'id' => 248,
            'code' => 'ZM',
            'name' => 'Zambia',
            ],
            [
            'id' => 249,
            'code' => 'ZW',
            'name' => 'Zimbabwe',
            ],
        ];

        DB::table("countries")->insert($dataTables);

    }
}